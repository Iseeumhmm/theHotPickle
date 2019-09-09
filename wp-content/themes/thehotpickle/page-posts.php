<?php
/**
 * Template Name: My Template
 * Template Post Type: post, page, product
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package The_Hot_Pickle
 */

get_header();
?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main site_posts">
		<?php
		while ( have_posts() ) :
			the_post();

			get_template_part( 'template-parts/content', 'page' );

            // If comments are open or we have at least one comment, load up the comment template.
            echo '<div class="comments">';
                if ( comments_open() || get_comments_number() ) :
                    comments_template();
                endif;
            echo '</div>';


		endwhile; // End of the loop.
		?>

		</main><!-- #main -->
	</div><!-- #primary -->
<?php

get_footer();
