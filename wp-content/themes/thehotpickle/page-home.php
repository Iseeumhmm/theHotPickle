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
		<main id="main" class="site-main">
			<div class="welcome_alignment_block">
				<?php while ( have_posts() ) : the_post(); ?> 
				<div class="welcome_message">
					<?php the_content(); ?> 
					<?php endwhile;
					wp_reset_query(); 
					?>
				</div><!-- .entry-content-page -->
			</div>

			<div class="hard_line"></div>
			<div class="container-fluid">
					<?php 
						// the query
						$wpb_all_query = new WP_Query(array('post_type'=>'post', 'post_status'=>'publish', 'posts_per_page'=>-1)); ?>
						
						<?php if ( $wpb_all_query->have_posts() ) : ?>
							<!-- the loop -->
						<?php 
							$columnSwitch = "flex-row-reverse"; 
							$flexAlignment = "";
						?>
				<?php while ( $wpb_all_query->have_posts() ) : $wpb_all_query->the_post(); ?>
					<div class="posts row <?php echo $columnSwitch; ?>">
						<div class="col-md-3 image-container <?php echo $flexAlignment; ?>">
							<?php
								$featured_img_url = get_the_post_thumbnail_url(get_the_ID(),'full'); 
								echo '<a href="'.esc_url($featured_img_url).'">'; 
								echo '<img src="' . $featured_img_url . '" class="image"></img>';
								echo '</a>';
								if ( $columnSwitch == "flex-row-reverse" ) {
									$columnSwitch = "";
									$flexAlignment = "";
								} else {
									$columnSwitch = "flex-row-reverse";
									$flexAlignment = "justify-content-start";
								}
							?>
						</div>
						<div class="col-md-9">
							<!-- <li><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></li> -->
							<h1><?php echo the_title(); ?></h1>
							<p class="author"><?php the_date(); ?>&nbsp;-&nbsp;<?php the_author(); ?></p>
							<span class="content"><?php the_content(); ?></span>
						</div>
					</div>

					<?php endwhile; ?>
					<!-- end of the loop -->
					<?php wp_reset_postdata(); ?>
				
				<?php else : ?>
					<p><?php _e( 'Sorry, no posts matched your criteria.' ); ?></p>
				<?php endif; ?>
			</div>
		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_footer();
