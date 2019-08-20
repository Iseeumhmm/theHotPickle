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
            <script>
                function play(){
                    var audio = document.getElementById("audio");
                    audio.play();
                }
            </script>  

            

            <div class="container">
                <div class="row d-flex space-between">
                    <div class="col-md-8 side-bar">
                        <i class="fas fa-volume-down fa-3x speaker" onclick="play()"></i><p style="position: relative; bottom: .45rem; left: 1rem; display: inline-block;">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style="font-style: italic; font-weight: bold;">noun</span></p>
                        <audio id="audio" src="<?php echo get_site_url(); ?>/wp-content/uploads/2019/08/thehotpickle.mp3" ></audio>
                        <div class="row definition-container">
                            <div class="col-3 definition-column d-flex justify-content-center">
                                <img class="definition-image" src="<?php echo get_site_url(); ?>/wp-content/uploads/2019/08/hot_dills.jpg"/></figure>
                            </div>
                            <div class="col mx-2 definition-column d-flex align-items-center">
                                <p class="definition-body">A place where pickle and hot food addicts can indulge their bad selves and connect with others alike.</p>
                            </div>
                        </div>
                        <?php if ( have_posts() ) : while ( have_posts() ) : the_post();
                        the_content();
                        endwhile; else: ?>
                        <p>Sorry, no posts matched your criteria.</p>
                        <?php endif; ?>
                    </div>
                    <div class="col-md-4 side-bar">
                        <h2 class="text-center mt-0">Welcome</h2>
                        <?php $wpb_all_query = new WP_Query(array('post_type'=>'about-me', 'post_status'=>'publish', 'posts_per_page'=>-1)); ?>
                        <?php if ( $wpb_all_query->have_posts() ) : ?>
                        <?php $wpb_all_query->the_post(); ?>
                        <?php echo the_content();?>
                        <?php endif ?>
                    </div>
                </div>
            </div>

            
		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_footer();
