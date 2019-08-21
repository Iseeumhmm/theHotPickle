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
	<style>
        .banner {
            background-image: url('<?php echo get_template_directory_uri(); ?>/images/banner.jpg')
        }
    </style>
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div id="page" class="site">
	<div class="container">
		<header id="masthead" class="site-header">
			<div class="banner">
				<div class="header-bar">
					<ul class="nav_upper">
						<li class="">
							<a href="http://store.thehotpickle.ca" class="nav-link">Store</a>
						</li>
						<li class="">
							<a href="<?php echo get_site_url() ?>/" class="nav-link">Blog</a>
						</li>
						<li class="">
							<a href="<?php echo get_site_url() ?>discussion" class="nav-link">Discussion</a>
						</li>
					</ul>
				</div>
				<div class="logo">
					<a href="<?php echo get_site_url() ?>/"><img class="logo-image" src="<?php echo get_template_directory_uri()?>/images/logo_pepper.png" alt="Logo"></a>
				</div>
			</div>
		</header><!-- #masthead -->
		<div id="content" class="site-content">
			
