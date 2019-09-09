<?php
namespace WpAssetCleanUp\OptimiseAssets;

use WpAssetCleanUp\FileSystem;
use WpAssetCleanUp\CleanUp;
use WpAssetCleanUp\Main;
use WpAssetCleanUp\Menu;
use WpAssetCleanUp\MetaBoxes;
use WpAssetCleanUp\Misc;
use WpAssetCleanUp\Preloads;

/**
 * Class OptimizeJs
 * @package WpAssetCleanUp
 */
class OptimizeJs
{
	/**
	 * @var float|int
	 */
	public static $cachedJsAssetsFileExpiresIn = 28800; // 8 hours in seconds (60 * 60 * 8)

	/**
	 *
	 */
	public function init()
	{
		add_action('wp_print_footer_scripts', array($this, 'prepareOptimizeList'), PHP_INT_MAX);
		add_action('wp_loaded', array($this, 'alterHtmlSource'), 1);
	}

	/**
	 *
	 */
	public function prepareOptimizeList()
	{
		// At this time, the only optimization for JS files is minification
		if (! MinifyJs::isMinifyJsEnabled()) {
			return;
		}

		global $wp_scripts;

		$jsOptimizeList = array();

		$wpScriptsList = array_unique(array_merge($wp_scripts->done, $wp_scripts->queue));

		// [Start] Collect for caching
		foreach ($wpScriptsList as $handle) {
			if (! isset($wp_scripts->registered[$handle])) { continue; }

			$value = $wp_scripts->registered[$handle];
			$optimizeValues = $this->maybeOptimizeIt($value);

			if ( ! empty( $optimizeValues ) ) {
				$jsOptimizeList[] = $optimizeValues;
			}
		}

		wp_cache_add('wpacu_js_optimize_list', $jsOptimizeList);
		// [End] Collect for caching
	}

	/**
	 * @param $value
	 *
	 * @return array
	 */
	public function maybeOptimizeIt($value)
	{
		global $wp_version;

		$src = isset($value->src) ? $value->src : false;

		if (! $src || MinifyJs::skipMinify($src, $value->handle)) {
			return array();
		}

		$fileVer = $dbVer = (isset($value->ver) && $value->ver) ? $value->ver : $wp_version;

		$handleDbStr = md5($value->handle);

		$transientName = 'wpacu_js_optimize_'.$handleDbStr;

		$savedValues = get_transient( $transientName );

			if ( $savedValues ) {
				$savedValuesArray = json_decode( $savedValues, ARRAY_A );

				if ( $savedValuesArray['ver'] !== $dbVer ) {
					// New File Version? Delete transient as it will be re-added to the database with the new version
					delete_transient( $transientName );
				} else {
					$localPathToJsOptimized = str_replace( '//', '/', ABSPATH . $savedValuesArray['optimize_uri'] );

					// Do not load any minified JS file (from the database transient cache) if it doesn't exist
					// It will fallback to the original JS file
					if ( isset( $savedValuesArray['source_uri'] ) && file_exists( $localPathToJsOptimized ) ) {
						return array(
							$savedValuesArray['source_uri'],
							$savedValuesArray['optimize_uri']
						);
					}
				}
			}

		if (strpos($src, '/wp-includes/') === 0) {
			$src = site_url() . $src;
		}

		$localAssetPath = OptimizeCommon::getLocalAssetPath($src, 'js');

		if (! file_exists($localAssetPath)) {
			return array();
		}

		$assetHref = $value->src;

		$posLastSlash   = strrpos($assetHref, '/');
		$pathToAssetDir = substr($assetHref, 0, $posLastSlash);

		$parseUrl = parse_url($pathToAssetDir);

		if (isset($parseUrl['scheme']) && $parseUrl['scheme'] !== '') {
			$pathToAssetDir = str_replace(
				array('http://'.$parseUrl['host'], 'https://'.$parseUrl['host']),
				'',
				$pathToAssetDir
			);
		} elseif (strpos($pathToAssetDir, '//') === 0) {
			$pathToAssetDir = str_replace(
				array('//'.$parseUrl['host'], '//'.$parseUrl['host']),
				'',
				$pathToAssetDir
			);
		}

		$jsContent = FileSystem::file_get_contents($localAssetPath);
		$jsContent = self::maybeDoJsFixes($jsContent, $pathToAssetDir . '/'); // Minify it and save it to /wp-content/cache/js/min/

		$jsContent = MinifyJs::applyMinification($jsContent);

		// Relative path to the new file
		// Save it to /wp-content/cache/js/{OptimizeCommon::$optimizedSingleFilesDir}/
		if ($fileVer !== $wp_version) {
			$fileVer = trim(str_replace(' ', '_', preg_replace('/\s+/', ' ', $fileVer)));
			$fileVer = (strlen($fileVer) > 50) ? substr(md5($fileVer), 0, 20) : $fileVer; // don't end up with too long filenames
		}

		$newFilePathUri  = self::getRelPathJsCacheDir() . OptimizeCommon::$optimizedSingleFilesDir . '/' . $value->handle . '-v' . $fileVer;

		$sha1File = @sha1_file($localAssetPath);

		if ($sha1File) {
			$newFilePathUri .= '-'.$sha1File;
		}

		$newFilePathUri .= '.js';

		$newLocalPath    = WP_CONTENT_DIR . $newFilePathUri; // Ful Local path
		$newLocalPathUrl = WP_CONTENT_URL . $newFilePathUri; // Full URL path

		if ($jsContent) {
			$jsContent = '/*! ' . str_replace(ABSPATH, '/', $localAssetPath) . ' */' . "\n" . $jsContent;
		}

		$saveFile = @file_put_contents($newLocalPath, $jsContent);

		if (! $saveFile || ! $jsContent) {
			// Fallback to the original JS if the minified version can't be created or updated
			return array();
		}

		$saveValues = array(
			'source_uri'   => OptimizeCommon::getHrefRelPath($value->src),
			'optimize_uri' => OptimizeCommon::getHrefRelPath($newLocalPathUrl),
			'ver'          => $dbVer
		);

		// Add / Re-add (with new version) transient
		set_transient($transientName, json_encode($saveValues));

		return array(
			OptimizeCommon::getHrefRelPath($value->src),
			OptimizeCommon::getHrefRelPath($newLocalPathUrl)
		);
	}

	/**
	 * @param $htmlSource
	 *
	 * @return mixed
	 */
	public static function updateHtmlSourceOriginalToOptimizedJs($htmlSource)
	{
		$jsOptimizeList = wp_cache_get('wpacu_js_optimize_list');

		if (empty($jsOptimizeList)) {
			return $htmlSource;
		}

		preg_match_all('#<script[^>]*src(|\s+)=(|\s+)[^>]*(>)#Usmi', OptimizeCommon::cleanerHtmlSource($htmlSource), $matchesSourcesFromTags, PREG_SET_ORDER);

		foreach ($matchesSourcesFromTags as $matches) {
			$scriptSourceTag = $matches[0];

			if (strip_tags($scriptSourceTag) !== '') {
				// Hmm? Not a valid tag... Skip it...
				continue;
			}

			foreach ($jsOptimizeList as $listValues) {
				// If the minified files are deleted (e.g. /wp-content/cache/ is cleared)
				// do not replace the JS file path to avoid breaking the website
				if (! file_exists(rtrim(ABSPATH, '/') . $listValues[1])) {
					continue;
				}

				$sourceUrl   = site_url() . $listValues[0];
				$optimizeUrl = site_url() . $listValues[1];

				if ($scriptSourceTag !== str_ireplace($sourceUrl, $optimizeUrl, $scriptSourceTag)) {
					$newLinkSourceTag = self::updateOriginalToOptimizedTag($scriptSourceTag, $sourceUrl, $optimizeUrl);
					$htmlSource = str_replace($scriptSourceTag, $newLinkSourceTag, $htmlSource);
					break;
				}
			}
		}

		return $htmlSource;
	}

	/**
	 * @param $scriptSourceTag
	 * @param $sourceUrl
	 * @param $optimizeUrl
	 *
	 * @return mixed
	 */
	public static function updateOriginalToOptimizedTag($scriptSourceTag, $sourceUrl, $optimizeUrl)
	{
		$newScriptSourceTag = str_replace($sourceUrl, $optimizeUrl, $scriptSourceTag);

		// Needed in case it's added to the Combine JS exceptions list
		if (CombineJs::proceedWithJsCombine()) {
			$newScriptSourceTag = str_ireplace('<script ', '<script data-wpacu-script-src-before="'.$sourceUrl.'" ', $newScriptSourceTag);
		}

		// Strip ?ver=
		$toStrip = Misc::extractBetween($newScriptSourceTag, '?ver=', '>');

		if (in_array(substr($toStrip, -1), array('"', "'"))) {
			$toStrip = '?ver='. trim(trim($toStrip, '"'), "'");
			$newScriptSourceTag = str_replace($toStrip, '', $newScriptSourceTag);
		}

		global $wp_version;

		$newScriptSourceTag = str_replace('.js&#038;ver='.$wp_version, '.js', $newScriptSourceTag);
		$newScriptSourceTag = str_replace('.js&#038;ver=', '.js?ver=', $newScriptSourceTag);

		return $newScriptSourceTag;
	}

	/**
	 *
	 */
	public function alterHtmlSource()
	{
		if (is_admin()) { // don't apply any changes if not in the front-end view (e.g. Dashboard view)
			return;
		}

		ob_start(static function($htmlSource) {
			// Do not do any optimization if "Test Mode" is Enabled
			if (! Menu::userCanManageAssets() && Main::instance()->settings['test_mode']) {
				return $htmlSource;
			}

			// There has to be at least one "<script", otherwise, it could be a feed request or something similar (not page, post, homepage etc.)
			if (stripos($htmlSource, '<script') === false) {
				return $htmlSource;
			}

			// Are there any assets unloaded where their "children" are ignored?
			// Since they weren't dequeued the WP way (to avoid unloading the "children"), they will be stripped here
			if (! Main::instance()->preventAssetsSettings()) {
				$ignoreChild = Main::instance()->getIgnoreChildren();

				if (isset($ignoreChild['scripts']) && ! empty($ignoreChild['scripts'])) {
					foreach ($ignoreChild['scripts'] as $scriptSrc) {
						$htmlSource = CleanUp::cleanScriptTagFromHtmlSource($scriptSrc, $htmlSource);
					}
				}
			}

			/*
			 * The JavaScript files only get cached if they are minified
			 * #minifying
			 * STEP 2: Load minify-able caching list and replace the original source URLs with the new cached ones
			 */
			if (MinifyJs::isMinifyJsEnabled()) {
				// 'wpacu_js_optimize_list' caching list is also checked; if it's empty, no minification is made
				$htmlSource = self::updateHtmlSourceOriginalToOptimizedJs($htmlSource);
			}

			if (! Main::instance()->preventAssetsSettings()) {
				$preloads = Preloads::instance()->getPreloads();

				if (isset($preloads['scripts']) && ! empty($preloads['scripts'])) {
					$htmlSource = Preloads::appendPreloadsForScriptsToHead($htmlSource);
				}

				$htmlSource = str_replace(Preloads::DEL_SCRIPTS_PRELOADS, '', $htmlSource);
			}

			$proceedWithCombineOnThisPage = true;

			// If "Do not combine JS on this page" is checked in "Asset CleanUp Options" side meta box
			// Works for posts, pages and custom post types
			if (defined('WPACU_CURRENT_PAGE_ID') && WPACU_CURRENT_PAGE_ID > 0) {
				$pageOptions = MetaBoxes::getPageOptions( WPACU_CURRENT_PAGE_ID );

				// 'no_js_optimize' refers to avoid the combination of JS files
				if ( isset( $pageOptions['no_js_optimize'] ) && $pageOptions['no_js_optimize'] ) {
					$proceedWithCombineOnThisPage = false;
				}
			}

			if ($proceedWithCombineOnThisPage) {
				$htmlSource = CombineJs::doCombine($htmlSource);
			}

			if (! Main::instance()->preventAssetsSettings() && Main::instance()->settings['minify_loaded_js'] && Main::instance()->settings['minify_loaded_js_inline']) {
				$htmlSource = MinifyJs::minifyInlineScriptTags($htmlSource);
			}

			// Final cleanups
			$htmlSource = preg_replace('#<script(\s+|)data-wpacu-script-src-before=(["\'])' . '(.*)' . '(\1)#Usmi', '<script ', $htmlSource);
			$htmlSource = preg_replace('#<script(\s+|)data-wpacu-script-handle=(["\'])'     . '(.*)' . '(\1)#Usmi', '<script ', $htmlSource);
			$htmlSource = preg_replace('#<script data-wpacu-to-be-preloaded-basic=\'1\' data-wpacu-script-handle=(["\'])' . '(.*)' . '(\1)#Usmi', '<script data-wpacu-to-be-preloaded-basic=\'1\' ', $htmlSource);

			return $htmlSource;
		});
	}

	/**
	 * @return string
	 */
	public static function getRelPathJsCacheDir()
	{
		return OptimizeCommon::getRelPathPluginCacheDir().'js/'; // keep trailing slash at the end
	}

	/**
	 * @param $scriptSrcs
	 * @param $htmlSource
	 *
	 * @return array
	 */
	public static function getScriptTagsFromSrcs($scriptSrcs, $htmlSource)
	{
		$scriptTags = array();

		$cleanerHtmlSource = OptimizeCommon::cleanerHtmlSource($htmlSource);

		foreach ($scriptSrcs as $scriptSrc) {
			$scriptSrc = str_replace('{site_url}', '', $scriptSrc);

			preg_match_all('#<script[^>]*src(|\s+)=(|\s+)[^>]*'. preg_quote($scriptSrc, '/'). '.*(>)(.*|)</script>#Usmi', $cleanerHtmlSource, $matchesFromSrc, PREG_SET_ORDER);

			if (isset($matchesFromSrc[0][0]) && strip_tags($matchesFromSrc[0][0]) === '') {
				$scriptTags[] = trim($matchesFromSrc[0][0]);
			}
		}

		return $scriptTags;
	}

	/**
	 * @param $strFind
	 * @param $strReplaceWith
	 * @param $string
	 *
	 * @return mixed
	 */
	public static function strReplaceOnce($strFind, $strReplaceWith, $string)
	{
		if ( strpos($string, $strFind) === false ) {
			return $string;
		}

		$occurrence = strpos($string, $strFind);
		return substr_replace($string, $strReplaceWith, $occurrence, strlen($strFind));
	}

	/**
	 * @param $jsContent
	 * @param $appendBefore
	 *
	 * @return mixed
	 */
	public static function maybeDoJsFixes($jsContent, $appendBefore)
	{
		// Relative URIs for CSS Paths
		// For code such as:
		// $(this).css("background", "url('../images/image-1.jpg')");
		$jsContent = str_replace(
			array('url("../', "url('../", 'url(../'),
			array('url("'.$appendBefore.'../', "url('".$appendBefore.'../', 'url('.$appendBefore.'../'),
			$jsContent
		);

		$jsContent = trim($jsContent);

		if (substr($jsContent, -1) !== ';') {
			$jsContent .= "\n" . ';'; // add semicolon as the last character
		}

		return $jsContent;
	}

	/**
	 * @param string $returnType
	 * 'list' - will return the list of plugins that have JS optimization enabled
	 * 'if_enabled' - will stop when it finds the first one (any order) and return true
	 * @return array|bool
	 */
	public static function isOptimizeJsEnabledByOtherParty($returnType = 'list')
	{
		$pluginsToCheck = array(
			'autoptimize/autoptimize.php'            => 'Autoptimize',
			'wp-rocket/wp-rocket.php'                => 'WP Rocket',
			'wp-fastest-cache/wpFastestCache.php'    => 'WP Fastest Cache',
			'w3-total-cache/w3-total-cache.php'      => 'W3 Total Cache',
			'sg-cachepress/sg-cachepress.php'        => 'SG Optimizer',
			'fast-velocity-minify/fvm.php'           => 'Fast Velocity Minify',
			'litespeed-cache/litespeed-cache.php'    => 'LiteSpeed Cache',
			'swift-performance-lite/performance.php' => 'Swift Performance Lite',
			'breeze/breeze.php'                      => 'Breeze – WordPress Cache Plugin'
		);

		$jsOptimizeEnabledIn = array();

		foreach ($pluginsToCheck as $plugin => $pluginTitle) {
			// "Autoptimize" check
			if ($plugin === 'autoptimize/autoptimize.php' && Misc::isPluginActive($plugin) && get_option('autoptimize_js')) {
				$jsOptimizeEnabledIn[] = $pluginTitle;

				if ($returnType === 'if_enabled') { return true; }
			}

			// "WP Rocket" check
			if ($plugin === 'wp-rocket/wp-rocket.php' && Misc::isPluginActive($plugin)) {
				if (function_exists('get_rocket_option')) {
					$wpRocketMinifyJs = get_rocket_option('minify_js');
					$wpRocketMinifyConcatenateJs = get_rocket_option('minify_concatenate_js');
				} else {
					$wpRocketSettings  = get_option('wp_rocket_settings');
					$wpRocketMinifyJs = isset($wpRocketSettings['minify_js']) ? $wpRocketSettings['minify_js'] : false;
					$wpRocketMinifyConcatenateJs = isset($wpRocketSettings['minify_concatenate_js']) ? $wpRocketSettings['minify_concatenate_js'] : false;
				}

				if ($wpRocketMinifyJs || $wpRocketMinifyConcatenateJs) {
					$jsOptimizeEnabledIn[] = $pluginTitle;

					if ($returnType === 'if_enabled') { return true; }
				}
			}

			// "WP Fastest Cache" check
			if ($plugin === 'wp-fastest-cache/wpFastestCache.php' && Misc::isPluginActive($plugin)) {
				$wpfcOptionsJson = get_option('WpFastestCache');
				$wpfcOptions = @json_decode($wpfcOptionsJson, ARRAY_A);

				if (isset($wpfcOptions['wpFastestCacheMinifyJs']) || isset($wpfcOptions['wpFastestCacheCombineJs'])) {
					$jsOptimizeEnabledIn[] = $pluginTitle;

					if ($returnType === 'if_enabled') { return true; }
				}
			}

			// "W3 Total Cache" check
			if ($plugin === 'w3-total-cache/w3-total-cache.php' && Misc::isPluginActive($plugin)) {
				$w3tcConfigMaster = Misc::getW3tcMasterConfig();
				$w3tcEnableJs = (int)trim(Misc::extractBetween($w3tcConfigMaster, '"minify.js.enable":', ','), '" ');

				if ($w3tcEnableJs === 1) {
					$jsOptimizeEnabledIn[] = $pluginTitle;

					if ($returnType === 'if_enabled') { return true; }
				}
			}

			// "SG Optimizer" check
			if ($plugin === 'sg-cachepress/sg-cachepress.php' && Misc::isPluginActive($plugin)) {
				if (class_exists('\SiteGround_Optimizer\Options\Options') && method_exists('\SiteGround_Optimizer\Options\Options', 'is_enabled')) {
					if (@\SiteGround_Optimizer\Options\Options::is_enabled( 'siteground_optimizer_optimize_javascript')) {
						$jsOptimizeEnabledIn[] = $pluginTitle;

						if ($returnType === 'if_enabled') { return true; }
					}
				}
			}

			// "Fast Velocity Minify" check
			if ($plugin === 'fast-velocity-minify/fvm.php' && Misc::isPluginActive($plugin)) {
				// It's enough if it's active due to its configuration
				$jsOptimizeEnabledIn[] = $pluginTitle;

				if ($returnType === 'if_enabled') { return true; }
			}

			// "LiteSpeed Cache" check
			if ($plugin === 'litespeed-cache/litespeed-cache.php' && Misc::isPluginActive($plugin) && ($liteSpeedCacheConf = apply_filters('litespeed_cache_get_options', get_option('litespeed-cache-conf')))) {
				if ( (isset($liteSpeedCacheConf['js_minify']) && $liteSpeedCacheConf['js_minify'])
				     || (isset($liteSpeedCacheConf['js_combine']) && $liteSpeedCacheConf['js_combine']) ) {
					$jsOptimizeEnabledIn[] = $pluginTitle;

					if ($returnType === 'if_enabled') { return true; }
				}
			}

			// "Swift Performance Lite" check
			if ($plugin === 'swift-performance-lite/performance.php' && Misc::isPluginActive($plugin)
			    && class_exists('Swift_Performance_Lite') && method_exists('Swift_Performance_Lite', 'check_option')) {
				if ( @\Swift_Performance_Lite::check_option('merge-scripts', 1) ) {
					$jsOptimizeEnabledIn[] = $pluginTitle;
				}

				if ($returnType === 'if_enabled') { return true; }
			}

			// "Breeze – WordPress Cache Plugin"
			if ($plugin === 'breeze/breeze.php' && Misc::isPluginActive($plugin)) {
				$breezeBasicSettings    = get_option('breeze_basic_settings');
				$breezeAdvancedSettings = get_option('breeze_advanced_settings');

				if (isset($breezeBasicSettings['breeze-minify-js'], $breezeAdvancedSettings['breeze-group-js'])
				    && $breezeBasicSettings['breeze-minify-js'] && $breezeAdvancedSettings['breeze-group-js']) {
					$jsOptimizeEnabledIn[] = $pluginTitle;

					if ($returnType === 'if_enabled') { return true; }
				}
			}
		}

		if ($returnType === 'if_enabled') { return false; }

		return $jsOptimizeEnabledIn;
	}

	}
