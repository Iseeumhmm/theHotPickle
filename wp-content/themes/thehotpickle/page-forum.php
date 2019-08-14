<?php
/**
 * The template for displaying all pages
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site may use a
 * different template.
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package The_Hot_Pickle
 */

get_header();
?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main padding_main-x">
        <?php echo do_shortcode('[bbp-forum-index]'); ?> 

        <?php echo do_shortcode('[bbp-register]'); ?> 

		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_footer();
