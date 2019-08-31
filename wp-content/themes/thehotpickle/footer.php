<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package The_Hot_Pickle
 */

?>

	</div><!-- #content -->

	<footer id="colophon" class="site-footer">
	<div class="text-center my-5">
		<p>© The Hot Pickle <?php echo date("Y"); ?></p>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="<?php echo get_template_directory_uri(); ?>/js/script.js" type="application/javascript"></script>
	<script>
		let hero = document.getElementById('hero');
		let welcome = document.getElementById('welcome');
		if ( welcome ) {
			hero.style.backgroundImage="url('<?php echo get_template_directory_uri(); ?>/images/Hero.jpg')";
		} else {
			Object.assign(hero.style,{backgroundImage:"url('<?php echo get_template_directory_uri(); ?>/images/Hero.jpg')", height:"47.5vw", marginBottom:"10rem"});
		}
	</script>
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
