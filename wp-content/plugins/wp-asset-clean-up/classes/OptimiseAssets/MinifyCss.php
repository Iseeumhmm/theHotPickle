<?php
namespace WpAssetCleanUp\OptimiseAssets;

use WpAssetCleanUp\CleanUp;
use WpAssetCleanUp\Main;
use WpAssetCleanUp\Menu;
use WpAssetCleanUp\MetaBoxes;
use MatthiasMullie\Minify;

/**
 * Class MinifyCss
 * @package WpAssetCleanUp\OptimiseAssets
 */
class MinifyCss
{
	/**
	 * 1: Basic
	 * 2: Minify via https://github.com/matthiasmullie/minify
	 *
	 * @var int
	 */
	public static $minType = 2;

	/**
	 * @param $cssContent
	 *
	 * @return string|string[]|null
	 */
	public static function applyMinification($cssContent)
	{
		if (self::$minType === 2) {
			$minifier = new Minify\CSS($cssContent);
			return trim($minifier->minify());
		}

		// Replace multiple whitespace with only one
		$cssContent = preg_replace( '/\s+/', ' ', $cssContent );

		// Remove comment blocks, everything between /* and */, except the ones preserved with /*! ... */ or /** ... */
		$cssContent = preg_replace( '~/\*(?![!|*])(.*?)\*/~', '', $cssContent );

		// Remove ; before }
		$cssContent = preg_replace( '/;(?=\s*})/', '', $cssContent );

		// Remove space after , : ; { } */ >
		$cssContent = preg_replace( '/(,|:|;|{|}|\*\/|>) /', '$1', $cssContent );

		// Remove space before , ; { } >
		$cssContent = preg_replace( '/ ([,;{}>])/', '$1', $cssContent );

		// Strip units such as px,em,pt etc. if value is 0 (converts 0px to 0)
		$cssContent = preg_replace( '/([: ])(\.?)0(%|em|ex|px|in|cm|mm|pt|pc)/i', '${1}0', $cssContent );

		// Strip leading 0 on decimal values (converts 0.5px into .5px)
		$cssContent = preg_replace( '/([: ])0\.(\d+)(%|em|ex|px|in|cm|mm|pt|pc)/i', '${1}.${2}${3}', $cssContent );

		// Converts #ff000 to #f00
		$cssContent = preg_replace("/#([0-9a-fA-F])\\1([0-9a-fA-F])\\2([0-9a-fA-F])\\3/", '#$1$2$3', $cssContent);

		// No empty @font-face
		$cssContent = preg_replace('/@font-face(|\s+){(|\s+)}/i', '', $cssContent);

		$strReps = array(
			// Converts things such as "margin:0 0 0 0;" to "margin:0;"
			':0 0 0 0;' => ':0;'
			);

		$cssContent = str_replace(array_keys($strReps), array_values($strReps), $cssContent);

		// Remove whitespaces before and after the content
		return trim($cssContent);
	}

	/**
	 * @param $src
	 * @param string $handle
	 *
	 * @return bool
	 */
	public static function skipMinify($src, $handle = '')
	{
		// Things like WP Fastest Cache Toolbar CSS shouldn't be minified and take up space on the server
		if ($handle !== '' && in_array($handle, Main::instance()->skipAssets['styles'])) {
			return true;
		}

		// Some of these files (e.g. from Oxygen, WooCommerce) are already minified
		$regExps = array(
			'#/wp-content/plugins/wp-asset-clean-up(.*?).min.css#',

			// Formidable Forms
			'#/wp-content/plugins/formidable/css/formidableforms.css#',

			// Oxygen
			//'#/wp-content/plugins/oxygen/component-framework/oxygen.css#',

			// WooCommerce
			'#/wp-content/plugins/woocommerce/assets/css/woocommerce-layout.css#',
			'#/wp-content/plugins/woocommerce/assets/css/woocommerce.css#',
			'#/wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen.css#',
			'#/wp-content/plugins/woocommerce/assets/css/blocks/style.css#',
			'#/wp-content/plugins/woocommerce/packages/woocommerce-blocks/build/style.css#',

			// Other libraries from the core that end in .min.css
			'#/wp-includes/css/(.*?).min.css#',

			// Files within /wp-content/uploads/ or /wp-content/cache/
			// Could belong to plugins such as "Elementor, "Oxygen" etc.
			'#/wp-content/uploads/(.*?).css#',
			'#/wp-content/cache/(.*?).css#'

			);

		if (Main::instance()->settings['minify_loaded_css_exceptions'] !== '') {
			$loadedCssExceptionsPatterns = trim(Main::instance()->settings['minify_loaded_css_exceptions']);

			if (strpos($loadedCssExceptionsPatterns, "\n")) {
				// Multiple values (one per line)
				foreach (explode("\n", $loadedCssExceptionsPatterns) as $loadedCssExceptionPattern) {
					$regExps[] = '#'.trim($loadedCssExceptionPattern).'#';
				}
			} else {
				// Only one value?
				$regExps[] = '#'.trim($loadedCssExceptionsPatterns).'#';
			}
		}

		foreach ($regExps as $regExp) {
			if ( preg_match( $regExp, $src ) ) {
				return true;
			}
		}

		return false;
	}

	/**
	 * @param $htmlSource
	 *
	 * @return mixed|string
	 */
	public static function minifyInlineStyleTags($htmlSource)
	{
		if (stripos($htmlSource, '<style') === false) {
			return $htmlSource; // no STYLE tags
		}

		$domTag = new \DOMDocument();
		libxml_use_internal_errors(true);
		$domTag->loadHTML($htmlSource);

		$styleTagsObj = $domTag->getElementsByTagName( 'style' );

		if ($styleTagsObj === null) {
			return $htmlSource;
		}

		$skipTagsContaining = array(
			'astra-theme-css-inline-css',
			'astra-edd-inline-css',
			'et-builder-module-design-cached-inline-styles',
			'fusion-stylesheet-inline-css',
			'data-wpacu-inline-css-file'
		);

		foreach ($styleTagsObj as $styleTagObj) {
			$originalTag = CleanUp::getOuterHTML($styleTagObj);

			// No need to use extra resources as the tag is already minified
			if (preg_match('('.implode('|', $skipTagsContaining).')', $originalTag)) {
				continue;
			}

			$originalTagContents = (isset($styleTagObj->nodeValue) && trim($styleTagObj->nodeValue) !== '') ? $styleTagObj->nodeValue : false;

			if ($originalTagContents) {
				$newTagContents = self::applyMinification($originalTagContents);

				$htmlSource = str_ireplace('>'.$originalTagContents.'</style', '>'.$newTagContents.'</style', $htmlSource);

				libxml_clear_errors();
			}
		}

		return $htmlSource;
	}

	/**
	 * @return bool
	 */
	public static function isMinifyCssEnabled()
	{
		if (defined('WPACU_IS_MINIFY_CSS_ENABLED')) {
			return WPACU_IS_MINIFY_CSS_ENABLED;
		}

		// Request Minify On The Fly
		// It will preview the page with CSS minified
		// Only if the admin is logged-in as it uses more resources (CPU / Memory)
		if (array_key_exists('wpacu_css_minify', $_GET) && Menu::userCanManageAssets()) {
			self::isMinifyCssEnabledChecked(true);
			return true;
		}

		if ( array_key_exists('wpacu_no_css_minify', $_GET) || // not on query string request (debugging purposes)
		     is_admin() || // not for Dashboard view
		     (! Main::instance()->settings['minify_loaded_css']) || // Minify CSS has to be Enabled
		     (Main::instance()->settings['test_mode'] && ! Menu::userCanManageAssets()) ) { // Does not trigger if "Test Mode" is Enabled
			self::isMinifyCssEnabledChecked(false);
			return false;
		}

		if (defined('WPACU_CURRENT_PAGE_ID') && WPACU_CURRENT_PAGE_ID > 0 && is_singular()) {
			// If "Do not minify CSS on this page" is checked in "Asset CleanUp: Options" side meta box
			$pageOptions = MetaBoxes::getPageOptions( WPACU_CURRENT_PAGE_ID );

			if ( isset( $pageOptions['no_css_minify'] ) && $pageOptions['no_css_minify'] ) {
				self::isMinifyCssEnabledChecked(false);
				return false;
			}
		}

		if (OptimizeCss::isOptimizeCssEnabledByOtherParty('if_enabled')) {
			self::isMinifyCssEnabledChecked(false);
			return false;
		}

		return true;
	}

	/**
	 * @param $value
	 */
	public static function isMinifyCssEnabledChecked($value)
	{
		if (! defined('WPACU_IS_MINIFY_ENABLED')) {
			define('WPACU_IS_MINIFY_ENABLED', $value);
		}
	}
}
