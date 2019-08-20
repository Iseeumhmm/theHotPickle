    
<?php
    add_action( 'wp_enqueue_scripts', 'my_theme_enqueue_styles' );
    function my_theme_enqueue_styles() {
        wp_enqueue_style( 'parent-style', get_template_directory_uri() . '/style.css' );
    }


    add_filter( 'bbp_verify_nonce_request_url', 'my_bbp_verify_nonce_request_url', 999, 1 );
    function my_bbp_verify_nonce_request_url( $requested_url )
    {
        return 'http://localhost:8888/thehotpickle' . $_SERVER['REQUEST_URI'];
    }

    /**
 * CUSTOM ABOUT ME POST TYPE
 */

function about_me_init() {
    // set up about me labels
    $labels = array(
        'name' => 'About Me',
        'singular_name' => 'About Me',
        'add_new' => 'Add New About Me',
        'add_new_item' => 'New About Me',
        'edit_item' => 'Edit About Me',
        'new_item' => 'New About Me',
        'all_items' => 'All About Me',
        'view_item' => 'View About Me',
        'search_items' => 'Search About Me',
        'not_found' =>  'No About Me Found',
        'not_found_in_trash' => 'No About Me found in Trash', 
        'parent_item_colon' => '',
        'menu_name' => 'About Me',
    );
    
    // register post type
    $args = array(
        'labels' => $labels,
        'public' => true,
        'has_archive' => true,
        'show_ui' => true,
        'capability_type' => 'post',
        'hierarchical' => false,
        'rewrite' => array('slug' => 'about-me'),
        'query_var' => true,
        'menu_icon' => 'dashicons-admin-users',
        'show_in_rest' => true, 
        'supports' => array(
			'title',
            'custom-fields',
            'editor'
        )
    );
    register_post_type( 'about-me', $args );
    
}
add_action( 'init', 'about_me_init' );


?>