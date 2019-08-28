<?php
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package The_Hot_Pickle
 */

?>
<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="https://gmpg.org/xfn/11">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a50a4c009f.js"></script>
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>

<div id="page" class="site">
	<!-- <div class="container-fluid"> -->
		<header id="masthead" class="site-header">
			<div id="hero" class="hero">
				<div class="align_header_block">
					<img src="<?php echo get_template_directory_uri(); ?>/images/Logo.png" alt="" class="logo">
					<div class="heading">
						<p>for the love of</p>
						<h1>HOT FOOD</h1>
						<nav>
							<ul>
								<li>
									<a href="#">
										<p>STORE</p>
									</a>
								</li>
								<li>
									<a href="#">
										<p>DISCUSSION</p>
									</a>
								</li>
							</ul>
						</nav>
					</div>
			   	</div>
			</div>
		</header><!-- #masthead -->
		<div id="content" class="site-content">
			
