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
	<script src="https://kit.fontawesome.com/a50a4c009f.js"></script>
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div id="page" class="site">

	<header id="masthead" class="site-header">
		<div class="nav-container">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="logo">
				<a href="<?php echo get_site_url() ?>/"><img class="logo-image" src="<?php echo get_template_directory_uri()?>/images/logo_pepper.png" alt="Logo"></a>
				</div>
				<button class="navbar-toggler mr-md-7" data-toggle="collapse" data-target="#navbarMenu">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarMenu">
					<div class="navbar-nav ml-auto navbar-mobile-center">
						<ul class="navbar-nav ml-auto">
							<?php if( is_user_logged_in() ) { ?>
							<!-- <li class="nav-item">
								<a href="<?php echo get_site_url() ?>/news-post" class="nav-link">Store</a>
							</li>
							<li class="nav-item">
								<a href="<?php echo get_site_url() ?>/my-profile" class="nav-link">Discussion Board</a>
							</li> -->
							<?php  } ?>
							<li class="nav-item">
								<a href="<?php echo get_site_url() ?>/store" class="nav-link">Store</a>
							</li>
							<li class="nav-item">
								<a href="<?php echo get_site_url() ?>/" class="nav-link">Blog</a>
							</li>
							<li class="nav-item">
								<a href="<?php echo get_site_url() ?>discussion" class="nav-link">Discussion</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header><!-- #masthead -->

	<div id="content" class="site-content">
