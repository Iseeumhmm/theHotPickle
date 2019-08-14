    
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

?>