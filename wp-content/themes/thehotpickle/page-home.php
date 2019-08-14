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
                <h1 class="text-center pb-3">The Hot Pickle</h1>
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
            </div>

            <?php if ( have_posts() ) : while ( have_posts() ) : the_post();
            the_content();
            endwhile; else: ?>
            <p>Sorry, no posts matched your criteria.</p>
            <?php endif; ?>
		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_footer();
