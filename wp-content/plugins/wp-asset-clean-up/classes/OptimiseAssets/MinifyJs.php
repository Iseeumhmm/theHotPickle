<?php
namespace WpAssetCleanUp\OptimiseAssets;

use WpAssetCleanUp\CleanUp;
use WpAssetCleanUp\Main;
use WpAssetCleanUp\Menu;
use WpAssetCleanUp\MetaBoxes;
use MatthiasMullie\Minify;

/**
 * Class MinifyJs
 * @package WpAssetCleanUp\OptimiseAssets
 */
class MinifyJs
{
	/**
	 * 1: Basic
	 * 2: Minify via https://github.com/matthiasmullie/minify
	 *
	 * @var int
	 */
	public static $minType = 2;

	/**
	 * @param $jsContent
	 *
	 * @return string|string[]|null
	 */
	public static function applyMinification($jsContent)
	{
		if (self::$minType === 2) {
			$minifier = new Minify\JS($jsContent);
			return trim($minifier->minify());
		}

		$jsContent = preg_replace(array("/\s+\n/", "/\n\s+/", '/ +/'), array("\n", "\n ", ' '), $jsContent);

		// Going line by line
		$jsContentsLines = explode( "\n", $jsContent );

		$jsContent = '';

		foreach ( $jsContentsLines as $jsLineIndex => $jsContentLine ) {
			$jsContentLine = trim( $jsContentLine );

			if (strpos(trim($jsContentLine), '//') === 0) {
				continue;
			}

			$appendNewLine = true;
			$mergeDelimiter = '';

			if (strpos($jsContentLine, '//') !== false) {
				$appendNewLine = true;
			}

			// When to keep the new line
			elseif ( strpos( $jsContentLine, '/*' ) !== false
			         || strpos( $jsContentLine, '*/' ) !== false
			         || strpos( $jsContentLine, '*' ) === 0
			         || in_array(substr( trim( $jsContentLine ),
					- 1 ), array('}', ')')) // Later, consider a solution to skip this from having a new line added
			) {
				$appendNewLine = true;
			} else {
				$mergeDelimiter = in_array(
					substr( trim( $jsContentLine ), - 1 ),
					array( '{', '}', ';', ',' )
				) ? '' : ' ';
			}

			$jsContent .= self::basicReplacementOnLine($jsContentLine) . ($appendNewLine ? "\n" : $mergeDelimiter);
		}

		/*
		 * Step 1: Make sure content between quotes (could be message alerts, plain text) is not replaced
		 *         It will be replaced later on
		 */
		preg_match_all("/(\"(.*?)\")|('(.*?)')/", $jsContent,$matchesBetweenQuotes);

		$wpacuSpaceDel = '@[wpacu-plugin-space-del]@';

		if (isset($matchesBetweenQuotes[0]) && ! empty($matchesBetweenQuotes[0])) {
			foreach ($matchesBetweenQuotes[0] as $matchBetweenQuotes) {
				if (strpos($matchBetweenQuotes, ' ') !== false) {
					$newMatch  = str_replace( ' ', $wpacuSpaceDel, $matchBetweenQuotes );
					$jsContent = str_replace( $matchBetweenQuotes, $newMatch, $jsContent );
				}
			}
		}

		// Source: https://github.com/Letractively/samstyle-php-framework/blob/master/sp.php
		$regex = array(
			"`^([\t\s]+)`sm" => '',
			"`^\/\*(.*?)\*\/`sm" => '',
			"`([\n;]+)\/\*(.+?)\*\/`ism" => '$1',
			"`([\n;\s]+)//(.+?)[\n\r]`ism" => "$1\n",
			"`(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+`ism" => "\n",

			"/}\);\n}\)/" => '});})',

			"/([{|;|,]+)(\n+)('|\"|var|if|else|for|this|return|ready|jQuery|\\$|})/i" => '$1 $3',

			'/} else {/i' => '}else{',
			'/if \(/i' => 'if('

			);

		$jsContent = preg_replace(array_keys($regex), array_values($regex), $jsContent);

		$newReps = array(
			";\n" => ';',
			//",\n" => ',',
			"}\n}" => '}}'
		);

		$jsContent = str_replace(array_keys($newReps), array_values($newReps), $jsContent);

		/*
		 * Step: Make sure content between quotes (could be message alerts, plain text) is not replaced
		 * Restore the spacing between quotes
		 */
		$jsContent = str_replace($wpacuSpaceDel, ' ', $jsContent);

		// Remove whitespaces before and after the content
		return trim($jsContent);
	}

	/**
	 * @param $jsContentLine
	 *
	 * @return mixed
	 */
	public static function basicReplacementOnLine($jsContentLine)
	{
		// Regular Expression in the line? Don't make any changes
		if (   strpos($jsContentLine, 'RegExp') !== false
		    || preg_match('/\=\s\//', $jsContentLine)) {
			return $jsContentLine;
		}

		$repsOne = array(
			// Remove space before & after colons
			' :' => ':',
			': ' => ':',

			// Remove space before & after equal signs
			' =' => '=',
			'= ' => '=',

			"' ? '" => "'?'",
			') {'   => '){',
			') !'   => ')!'
		);
		$jsContentLine = str_replace(array_keys($repsOne), array_values($repsOne), $jsContentLine);

		$repsTwo = array(
			"{ '" => "{'",
			"' }" => "'}",
			", '" => ",'",
			' || ' => '||',

			'=true;' => '=!0;',
			':true;' => ':!0;',
			'(true)' => '(!0)',
			'(true,' => '(!0,',
			'return true;' => 'return !0;',
			'return true}' => 'return !0}',

			'=false;' => '=!1;',
			':false;' => ':!1;',
			'(false)' => '(!1)',
			'(false,' => '(!1,',
			'return false;' => 'return !1;',
			'return false}' => 'return !1}',

			);

		$jsContentLine = str_ireplace(array_keys($repsTwo), array_values($repsTwo), $jsContentLine);

		$repsThree = array(
			'; '  => ';',
			'{ '  => '{',
			'} '  => '}',
			'( '  => '(',

			', '  => ',',
			//' + ' => '+'

			);

		$jsContentLine = str_ireplace(array_keys($repsThree), array_values($repsThree), $jsContentLine);

		return $jsContentLine;
	}

	/**
	 * @param $src
	 * @param string $handle
	 *
	 * @return bool
	 */
	public static function skipMinify($src, $handle = '')
	{
		// Things like WP Fastest Cache Toolbar JS shouldn't be minified and take up space on the server
		if ($handle !== '' && in_array($handle, Main::instance()->skipAssets['scripts'])) {
			return true;
		}

		$regExps = array(
			'#/wp-content/plugins/wp-asset-clean-up(.*?).min.js#',

			// Other libraries from the core that end in .min.js
			'#/wp-includes/(.*?).min.js#',

			// jQuery library
			'#/wp-includes/js/jquery/jquery.js#',

			// Files within /wp-content/uploads/
			// Files within /wp-content/uploads/ or /wp-content/cache/
			// Could belong to plugins such as "Elementor, "Oxygen" etc.
			'#/wp-content/uploads/(.*?).js#',
			'#/wp-content/cache/(.*?).js#',

			// Elementor .min.js
			'#/wp-content/plugins/elementor/assets/(.*?).min.js#',

			// WooCommerce Assets
			'#/wp-content/plugins/woocommerce/assets/js/(.*?).min.js#'

			);

		if (Main::instance()->settings['minify_loaded_js_exceptions'] !== '') {
			$loadedJsExceptionsPatterns = trim(Main::instance()->settings['minify_loaded_js_exceptions']);

			if (strpos($loadedJsExceptionsPatterns, "\n")) {
				// Multiple values (one per line)
				foreach (explode("\n", $loadedJsExceptionsPatterns) as $loadedJsExceptionPattern) {
					$regExps[] = '#'.trim($loadedJsExceptionPattern).'#';
				}
			} else {
				// Only one value?
				$regExps[] = '#'.trim($loadedJsExceptionsPatterns).'#';
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
	public static function minifyInlineScriptTags($htmlSource)
	{
		if (stripos($htmlSource, '<script') === false) {
			return $htmlSource; // no SCRIPT tags, hmm
		}

		$domTag = new \DOMDocument();
		libxml_use_internal_errors(true);
		$domTag->loadHTML($htmlSource);

		$scriptTagsObj = $domTag->getElementsByTagName( 'script' );

		if ($scriptTagsObj === null) {
			return $htmlSource;
		}

		$skipTagsContaining = array_map( static function ( $toMatch ) {
			return preg_quote($toMatch, '/');
		}, array(
			'/* <![CDATA[ */', // added via wp_localize_script()
			'window._wpemojiSettings', // Emoji
			'wpacu-google-fonts-async-load',
			'wpacu-preload-async-css-fallback',
			'document.body.prepend(wpacuLinkTag',
			'var wc_product_block_data = JSON.parse( decodeURIComponent('
		));

		foreach ($scriptTagsObj as $scriptTagObj) {
			// Does it have the "src" attribute? Skip it as it's not an inline SCRIPT tag
			if (isset($scriptTagObj->attributes) && $scriptTagObj->attributes !== null) {
				foreach ($scriptTagObj->attributes as $attrObj) {
					if ($attrObj->nodeName === 'src') {
						continue 2;
					}
				}
			}

			$originalTag = CleanUp::getOuterHTML($scriptTagObj);

			// No need to use extra resources as the tag is already minified
			if (preg_match('/('.implode('|', $skipTagsContaining).')/', $originalTag)) {
				continue;
			}

			$originalTagContents = (isset($scriptTagObj->nodeValue) && trim($scriptTagObj->nodeValue) !== '') ? $scriptTagObj->nodeValue : false;

			if ($originalTagContents) {
				$minifier       = new Minify\JS($originalTagContents);
				$newTagContents = trim($minifier->minify());

				$htmlSource = str_ireplace('>'.$originalTagContents.'</script', '>'.$newTagContents.'</script', $htmlSource);

				libxml_clear_errors();
			}
		}

		return $htmlSource;
	}

	/**
	 * @return bool
	 */
	public static function isMinifyJsEnabled()
	{
		// Request Minify On The Fly
		// It will preview the page with JS minified
		// Only if the admin is logged-in as it uses more resources (CPU / Memory)
		if (array_key_exists('wpacu_js_minify', $_GET) && Menu::userCanManageAssets()) {
			return true;
		}

		if ( array_key_exists('wpacu_no_js_minify', $_GET) || // not on query string request (debugging purposes)
		     is_admin() || // not for Dashboard view
		     (! Main::instance()->settings['minify_loaded_js']) || // Minify JS has to be Enabled
		     (Main::instance()->settings['test_mode'] && ! Menu::userCanManageAssets()) ) { // Does not trigger if "Test Mode" is Enabled
			return false;
		}

		if (defined('WPACU_CURRENT_PAGE_ID') && WPACU_CURRENT_PAGE_ID > 0 && is_singular()) {
			// If "Do not minify JS on this page" is checked in "Asset CleanUp: Options" side meta box
			$pageOptions = MetaBoxes::getPageOptions( WPACU_CURRENT_PAGE_ID );

			if ( isset( $pageOptions['no_js_minify'] ) && $pageOptions['no_js_minify'] ) {
				return false;
			}
		}

		if (OptimizeJs::isOptimizeJsEnabledByOtherParty('if_enabled')) {
			return false;
		}

		return true;
	}
}
