-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 27, 2019 at 03:47 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thehotpickle`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-08-12 09:13:01', '2019-08-12 13:13:01', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8888/TheHotPickle', 'yes'),
(2, 'home', 'http://localhost:8888/TheHotPickle', 'yes'),
(3, 'blogname', 'The Hot Pickle', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'iseeumhmm@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:19:\"bbpress/bbpress.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:78:\"/Applications/MAMP/htdocs/TheHotPickle/wp-content/themes/thehotpickle/page.php\";i:1;s:0:\"\";}', 'no'),
(40, 'template', 'thehotpickle', 'yes'),
(41, 'stylesheet', 'thehotpickle-child', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '300', 'yes'),
(59, 'thumbnail_size_h', '300', 'yes'),
(60, 'thumbnail_crop', '', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', '', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', 'America/Toronto', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '95', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'wp_user_roles', 'a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:13:\"bbp_keymaster\";a:2:{s:4:\"name\";s:9:\"Keymaster\";s:12:\"capabilities\";a:0:{}}s:13:\"bbp_spectator\";a:2:{s:4:\"name\";s:9:\"Spectator\";s:12:\"capabilities\";a:0:{}}s:11:\"bbp_blocked\";a:2:{s:4:\"name\";s:7:\"Blocked\";s:12:\"capabilities\";a:0:{}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'en_CA', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:7:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";i:6;s:18:\"bbp_views_widget-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'cron', 'a:6:{i:1566922382;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1566954782;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1566997981;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1566998003;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1566998004;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'recovery_keys', 'a:0:{}', 'yes'),
(121, 'theme_mods_twentynineteen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1565615618;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(142, 'can_compress_scripts', '1', 'no'),
(143, 'current_theme', 'The Hot Pickle Child', 'yes'),
(144, 'theme_mods_thehotpickle', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1565663623;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:7:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";i:6;s:18:\"bbp_views_widget-2\";}}}}', 'yes'),
(145, 'theme_switched', '', 'yes'),
(151, 'new_admin_email', 'iseeumhmm@gmail.com', 'yes'),
(156, 'category_children', 'a:0:{}', 'yes'),
(172, 'recently_activated', 'a:1:{s:31:\"what-the-file/what-the-file.php\";i:1565669072;}', 'yes'),
(173, 'widget_bbp_login_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(174, 'widget_bbp_views_widget', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(175, 'widget_bbp_search_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(176, 'widget_bbp_forums_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(177, 'widget_bbp_topics_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(178, 'widget_bbp_replies_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(179, 'widget_bbp_stats_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(180, '_bbp_private_forums', 'a:0:{}', 'yes'),
(181, '_bbp_hidden_forums', 'a:0:{}', 'yes'),
(182, '_bbp_db_version', '250', 'yes'),
(185, 'rewrite_rules', 'a:196:{s:9:\"forums/?$\";s:25:\"index.php?post_type=forum\";s:39:\"forums/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=forum&feed=$matches[1]\";s:34:\"forums/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=forum&feed=$matches[1]\";s:26:\"forums/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=forum&paged=$matches[1]\";s:9:\"topics/?$\";s:25:\"index.php?post_type=topic\";s:39:\"topics/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=topic&feed=$matches[1]\";s:34:\"topics/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=topic&feed=$matches[1]\";s:26:\"topics/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=topic&paged=$matches[1]\";s:28:\"forums/forum/([^/]+)/edit/?$\";s:34:\"index.php?forum=$matches[1]&edit=1\";s:28:\"forums/topic/([^/]+)/edit/?$\";s:34:\"index.php?topic=$matches[1]&edit=1\";s:28:\"forums/reply/([^/]+)/edit/?$\";s:34:\"index.php?reply=$matches[1]&edit=1\";s:32:\"forums/topic-tag/([^/]+)/edit/?$\";s:38:\"index.php?topic-tag=$matches[1]&edit=1\";s:47:\"forums/user/([^/]+)/topics/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_tops=1&paged=$matches[2]\";s:48:\"forums/user/([^/]+)/replies/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_reps=1&paged=$matches[2]\";s:50:\"forums/user/([^/]+)/favorites/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_favs=1&paged=$matches[2]\";s:54:\"forums/user/([^/]+)/subscriptions/page/?([0-9]{1,})/?$\";s:59:\"index.php?bbp_user=$matches[1]&bbp_subs=1&paged=$matches[2]\";s:29:\"forums/user/([^/]+)/topics/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_tops=1\";s:30:\"forums/user/([^/]+)/replies/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_reps=1\";s:32:\"forums/user/([^/]+)/favorites/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_favs=1\";s:36:\"forums/user/([^/]+)/subscriptions/?$\";s:41:\"index.php?bbp_user=$matches[1]&bbp_subs=1\";s:27:\"forums/user/([^/]+)/edit/?$\";s:37:\"index.php?bbp_user=$matches[1]&edit=1\";s:22:\"forums/user/([^/]+)/?$\";s:30:\"index.php?bbp_user=$matches[1]\";s:40:\"forums/view/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?bbp_view=$matches[1]&paged=$matches[2]\";s:27:\"forums/view/([^/]+)/feed/?$\";s:47:\"index.php?bbp_view=$matches[1]&feed=$matches[2]\";s:22:\"forums/view/([^/]+)/?$\";s:30:\"index.php?bbp_view=$matches[1]\";s:34:\"forums/search/page/?([0-9]{1,})/?$\";s:27:\"index.php?paged=$matches[1]\";s:16:\"forums/search/?$\";s:20:\"index.php?bbp_search\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:11:\"about-me/?$\";s:28:\"index.php?post_type=about-me\";s:41:\"about-me/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=about-me&feed=$matches[1]\";s:36:\"about-me/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?post_type=about-me&feed=$matches[1]\";s:28:\"about-me/page/([0-9]{1,})/?$\";s:46:\"index.php?post_type=about-me&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:38:\"forums/forum/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:48:\"forums/forum/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:68:\"forums/forum/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"forums/forum/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"forums/forum/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"forums/forum/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:27:\"forums/forum/(.+?)/embed/?$\";s:38:\"index.php?forum=$matches[1]&embed=true\";s:31:\"forums/forum/(.+?)/trackback/?$\";s:32:\"index.php?forum=$matches[1]&tb=1\";s:51:\"forums/forum/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?forum=$matches[1]&feed=$matches[2]\";s:46:\"forums/forum/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?forum=$matches[1]&feed=$matches[2]\";s:39:\"forums/forum/(.+?)/page/?([0-9]{1,})/?$\";s:45:\"index.php?forum=$matches[1]&paged=$matches[2]\";s:46:\"forums/forum/(.+?)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?forum=$matches[1]&cpage=$matches[2]\";s:35:\"forums/forum/(.+?)(?:/([0-9]+))?/?$\";s:44:\"index.php?forum=$matches[1]&page=$matches[2]\";s:40:\"forums/topic/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"forums/topic/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"forums/topic/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"forums/topic/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"forums/topic/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"forums/topic/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"forums/topic/([^/]+)/embed/?$\";s:38:\"index.php?topic=$matches[1]&embed=true\";s:33:\"forums/topic/([^/]+)/trackback/?$\";s:32:\"index.php?topic=$matches[1]&tb=1\";s:53:\"forums/topic/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?topic=$matches[1]&feed=$matches[2]\";s:48:\"forums/topic/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?topic=$matches[1]&feed=$matches[2]\";s:41:\"forums/topic/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?topic=$matches[1]&paged=$matches[2]\";s:48:\"forums/topic/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?topic=$matches[1]&cpage=$matches[2]\";s:37:\"forums/topic/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?topic=$matches[1]&page=$matches[2]\";s:29:\"forums/topic/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"forums/topic/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"forums/topic/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"forums/topic/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"forums/topic/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"forums/topic/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:40:\"forums/reply/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"forums/reply/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"forums/reply/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"forums/reply/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"forums/reply/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"forums/reply/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"forums/reply/([^/]+)/embed/?$\";s:38:\"index.php?reply=$matches[1]&embed=true\";s:33:\"forums/reply/([^/]+)/trackback/?$\";s:32:\"index.php?reply=$matches[1]&tb=1\";s:41:\"forums/reply/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?reply=$matches[1]&paged=$matches[2]\";s:48:\"forums/reply/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?reply=$matches[1]&cpage=$matches[2]\";s:37:\"forums/reply/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?reply=$matches[1]&page=$matches[2]\";s:29:\"forums/reply/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"forums/reply/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"forums/reply/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"forums/reply/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"forums/reply/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"forums/reply/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:57:\"forums/topic-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?topic-tag=$matches[1]&feed=$matches[2]\";s:52:\"forums/topic-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?topic-tag=$matches[1]&feed=$matches[2]\";s:33:\"forums/topic-tag/([^/]+)/embed/?$\";s:42:\"index.php?topic-tag=$matches[1]&embed=true\";s:45:\"forums/topic-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?topic-tag=$matches[1]&paged=$matches[2]\";s:27:\"forums/topic-tag/([^/]+)/?$\";s:31:\"index.php?topic-tag=$matches[1]\";s:42:\"forums/search/([^/]+)/page/?([0-9]{1,})/?$\";s:50:\"index.php?bbp_search=$matches[1]&paged=$matches[2]\";s:24:\"forums/search/([^/]+)/?$\";s:32:\"index.php?bbp_search=$matches[1]\";s:36:\"about-me/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"about-me/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"about-me/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"about-me/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"about-me/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"about-me/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"about-me/([^/]+)/embed/?$\";s:41:\"index.php?about-me=$matches[1]&embed=true\";s:29:\"about-me/([^/]+)/trackback/?$\";s:35:\"index.php?about-me=$matches[1]&tb=1\";s:49:\"about-me/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?about-me=$matches[1]&feed=$matches[2]\";s:44:\"about-me/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?about-me=$matches[1]&feed=$matches[2]\";s:37:\"about-me/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?about-me=$matches[1]&paged=$matches[2]\";s:44:\"about-me/([^/]+)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?about-me=$matches[1]&cpage=$matches[2]\";s:33:\"about-me/([^/]+)(?:/([0-9]+))?/?$\";s:47:\"index.php?about-me=$matches[1]&page=$matches[2]\";s:25:\"about-me/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"about-me/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"about-me/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"about-me/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"about-me/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"about-me/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=95&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(196, 'theme_mods_thehotpickle-child', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1565663604;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:7:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";i:6;s:18:\"bbp_views_widget-2\";}}}}', 'yes'),
(198, 'recovery_mode_email_last_sent', '1565662601', 'yes'),
(212, 'whatthefile-install-date', '2019-08-13', 'no'),
(430, '_site_transient_timeout_theme_roots', '1566921197', 'no'),
(431, '_site_transient_theme_roots', 'a:2:{s:18:\"thehotpickle-child\";s:7:\"/themes\";s:12:\"thehotpickle\";s:7:\"/themes\";}', 'no'),
(432, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/en_CA/wordpress-5.2.2.zip\";s:6:\"locale\";s:5:\"en_CA\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/en_CA/wordpress-5.2.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.2\";s:7:\"version\";s:5:\"5.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1566919397;s:15:\"version_checked\";s:5:\"5.2.2\";s:12:\"translations\";a:0:{}}', 'no'),
(433, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1566919397;s:7:\"checked\";a:2:{s:18:\"thehotpickle-child\";s:5:\"1.0.0\";s:12:\"thehotpickle\";s:5:\"1.0.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(434, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1566919398;s:7:\"checked\";a:4:{s:19:\"akismet/akismet.php\";s:5:\"4.1.2\";s:19:\"bbpress/bbpress.php\";s:6:\"2.5.14\";s:9:\"hello.php\";s:5:\"1.7.2\";s:31:\"what-the-file/what-the-file.php\";s:5:\"1.5.4\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:7:\"bbpress\";s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:6:\"2.5.14\";s:7:\"updated\";s:19:\"2017-07-18 19:28:29\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/translation/plugin/bbpress/2.5.14/en_CA.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:4:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:19:\"bbpress/bbpress.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/bbpress\";s:4:\"slug\";s:7:\"bbpress\";s:6:\"plugin\";s:19:\"bbpress/bbpress.php\";s:11:\"new_version\";s:6:\"2.5.14\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/bbpress/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/bbpress.2.5.14.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:60:\"https://ps.w.org/bbpress/assets/icon-256x256.png?rev=1534011\";s:2:\"1x\";s:51:\"https://ps.w.org/bbpress/assets/icon.svg?rev=978290\";s:3:\"svg\";s:51:\"https://ps.w.org/bbpress/assets/icon.svg?rev=978290\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:62:\"https://ps.w.org/bbpress/assets/banner-1544x500.png?rev=567403\";s:2:\"1x\";s:61:\"https://ps.w.org/bbpress/assets/banner-772x250.png?rev=478663\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/bbpress/assets/banner-1544x500-rtl.png?rev=1534011\";s:2:\"1x\";s:66:\"https://ps.w.org/bbpress/assets/banner-772x250-rtl.png?rev=1534011\";}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:31:\"what-the-file/what-the-file.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/what-the-file\";s:4:\"slug\";s:13:\"what-the-file\";s:6:\"plugin\";s:31:\"what-the-file/what-the-file.php\";s:11:\"new_version\";s:5:\"1.5.4\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/what-the-file/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/what-the-file.1.5.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/what-the-file/assets/icon-256x256.png?rev=1223609\";s:2:\"1x\";s:66:\"https://ps.w.org/what-the-file/assets/icon-128x128.png?rev=1223609\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/what-the-file/assets/banner-772x250.jpg?rev=685200\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 2, '_wp_trash_meta_status', 'publish'),
(4, 2, '_wp_trash_meta_time', '1565615687'),
(5, 2, '_wp_desired_post_slug', 'sample-page'),
(6, 6, '_edit_lock', '1566920493:1'),
(11, 38, '_wp_attached_file', '2019/08/thehotpickle.mp3'),
(12, 38, '_wp_attachment_metadata', 'a:16:{s:10:\"dataformat\";s:3:\"mp3\";s:8:\"channels\";i:2;s:11:\"sample_rate\";i:44100;s:7:\"bitrate\";d:129055.26859504133;s:11:\"channelmode\";s:6:\"stereo\";s:12:\"bitrate_mode\";s:3:\"vbr\";s:8:\"lossless\";b:0;s:15:\"encoder_options\";s:3:\"VBR\";s:17:\"compression_ratio\";d:0.09145072887970615;s:10:\"fileformat\";s:3:\"mp3\";s:8:\"filesize\";i:51269;s:9:\"mime_type\";s:10:\"audio/mpeg\";s:6:\"length\";i:3;s:16:\"length_formatted\";s:4:\"0:03\";s:4:\"text\";s:3:\"M4A\";s:16:\"encoder_settings\";s:13:\"Lavf57.71.100\";}'),
(13, 49, '_wp_attached_file', '2019/08/hot_dills.jpg'),
(14, 49, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:600;s:6:\"height\";i:899;s:4:\"file\";s:21:\"2019/08/hot_dills.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"hot_dills-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"hot_dills-200x300.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(15, 61, '_edit_lock', '1565660315:1'),
(16, 63, '_edit_last', '1'),
(17, 63, '_edit_lock', '1565698348:1'),
(18, 63, '_bbp_last_active_time', '2019-08-12 21:07:51'),
(19, 63, '_bbp_forum_subforum_count', '0'),
(20, 63, '_bbp_reply_count', '0'),
(21, 63, '_bbp_total_reply_count', '0'),
(22, 63, '_bbp_topic_count', '0'),
(23, 63, '_bbp_total_topic_count', '0'),
(24, 63, '_bbp_topic_count_hidden', '0'),
(25, 63, '_bbp_last_topic_id', '0'),
(26, 63, '_bbp_last_reply_id', '0'),
(27, 63, '_bbp_last_active_id', '0'),
(28, 65, '_edit_last', '1'),
(29, 65, '_edit_lock', '1565659291:1'),
(30, 65, '_bbp_forum_id', '65'),
(31, 65, '_bbp_topic_id', '65'),
(32, 65, '_bbp_author_ip', '::1'),
(33, 65, '_bbp_last_active_time', '2019-08-12 21:22:11'),
(34, 65, '_bbp_reply_count', '0'),
(35, 65, '_bbp_reply_count_hidden', '0'),
(36, 65, '_bbp_last_active_id', '65'),
(37, 65, '_bbp_voice_count', '1'),
(38, 69, '_edit_last', '1'),
(39, 69, '_edit_lock', '1565698292:1'),
(40, 69, '_bbp_last_active_time', '2019-08-12 21:41:36'),
(41, 69, '_bbp_forum_subforum_count', '0'),
(42, 69, '_bbp_reply_count', '0'),
(43, 69, '_bbp_total_reply_count', '0'),
(44, 69, '_bbp_topic_count', '0'),
(45, 69, '_bbp_total_topic_count', '0'),
(46, 69, '_bbp_topic_count_hidden', '1'),
(47, 69, '_bbp_last_topic_id', '0'),
(48, 69, '_bbp_last_reply_id', '0'),
(49, 69, '_bbp_last_active_id', '0'),
(50, 61, '_wp_trash_meta_status', 'publish'),
(51, 61, '_wp_trash_meta_time', '1565665522'),
(52, 61, '_wp_desired_post_slug', 'forum'),
(53, 71, '_bbp_forum_id', '69'),
(54, 71, '_bbp_topic_id', '71'),
(55, 71, '_bbp_author_ip', '::1'),
(56, 71, '_bbp_last_reply_id', '0'),
(57, 71, '_bbp_last_active_id', '71'),
(58, 71, '_bbp_last_active_time', '2019-08-13 00:08:27'),
(59, 71, '_bbp_reply_count', '0'),
(60, 71, '_bbp_reply_count_hidden', '0'),
(61, 71, '_bbp_voice_count', '1'),
(62, 65, '_wp_trash_meta_status', 'publish'),
(63, 65, '_wp_trash_meta_time', '1565669398'),
(64, 65, '_wp_desired_post_slug', 'carolina-reaper'),
(65, 71, '_wp_trash_meta_status', 'publish'),
(66, 71, '_wp_trash_meta_time', '1565669401'),
(67, 71, '_wp_desired_post_slug', 'carolina-reapers'),
(68, 77, '_edit_last', '1'),
(69, 77, '_edit_lock', '1566263423:1'),
(70, 78, '_wp_attached_file', '2019/08/IMG_6711-2.jpg'),
(71, 78, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:22:\"2019/08/IMG_6711-2.jpg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"IMG_6711-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"IMG_6711-2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"IMG_6711-2-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:24:\"IMG_6711-2-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"2.2\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:13:\"iPhone 8 Plus\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1541590585\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:4:\"2.87\";s:3:\"iso\";s:3:\"100\";s:13:\"shutter_speed\";s:17:\"0.016666666666667\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(72, 77, '_wp_trash_meta_status', 'publish'),
(73, 77, '_wp_trash_meta_time', '1566263580'),
(74, 77, '_wp_desired_post_slug', 'about'),
(75, 80, '_edit_lock', '1566329256:1'),
(76, 82, '_wp_attached_file', '2019/08/thats_hot.m4a'),
(77, 82, '_wp_attachment_metadata', 'a:17:{s:10:\"dataformat\";s:3:\"mp4\";s:5:\"codec\";s:19:\"ISO/IEC 14496-3 AAC\";s:11:\"sample_rate\";d:44100;s:8:\"channels\";i:2;s:15:\"bits_per_sample\";i:16;s:8:\"lossless\";b:0;s:11:\"channelmode\";s:6:\"stereo\";s:7:\"bitrate\";d:347617.7285864425;s:17:\"compression_ratio\";d:0.2463277555176038;s:10:\"fileformat\";s:3:\"mp4\";s:8:\"filesize\";i:120039;s:9:\"mime_type\";s:9:\"audio/mp4\";s:6:\"length\";i:3;s:16:\"length_formatted\";s:4:\"0:03\";s:17:\"created_timestamp\";i:1566348032;s:6:\"artist\";s:0:\"\";s:5:\"album\";s:0:\"\";}'),
(78, 83, '_edit_lock', '1566676142:1'),
(79, 84, '_edit_lock', '1566848972:1'),
(82, 86, '_edit_lock', '1566920823:1'),
(85, 1, '_wp_trash_meta_status', 'publish'),
(86, 1, '_wp_trash_meta_time', '1566679106'),
(87, 1, '_wp_desired_post_slug', 'hello-world'),
(88, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(89, 86, '_edit_last', '1'),
(92, 84, '_edit_last', '1'),
(99, 86, '_wp_old_date', '2019-08-24'),
(102, 84, '_wp_old_date', '2019-08-24'),
(110, 93, '_wp_attached_file', '2019/08/Vinegar.jpg'),
(111, 93, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:400;s:6:\"height\";i:510;s:4:\"file\";s:19:\"2019/08/Vinegar.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:19:\"Vinegar-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:19:\"Vinegar-235x300.jpg\";s:5:\"width\";i:235;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(114, 86, '_thumbnail_id', '93'),
(119, 94, '_wp_attached_file', '2019/08/buffalo-wings.jpg'),
(120, 94, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:680;s:6:\"height\";i:614;s:4:\"file\";s:25:\"2019/08/buffalo-wings.jpg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"buffalo-wings-300x271.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:271;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:25:\"buffalo-wings-300x271.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:271;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(123, 84, '_thumbnail_id', '94'),
(124, 95, '_edit_lock', '1566919771:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-08-12 09:13:01', '2019-08-12 13:13:01', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world__trashed', '', '', '2019-08-24 16:38:26', '2019-08-24 20:38:26', '', 0, 'http://localhost:8888/TheHotPickle/?p=1', 0, 'post', '', 1),
(2, 1, '2019-08-12 09:13:01', '2019-08-12 13:13:01', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost:8888/TheHotPickle/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'trash', 'closed', 'open', '', 'sample-page__trashed', '', '', '2019-08-12 09:14:47', '2019-08-12 13:14:47', '', 0, 'http://localhost:8888/TheHotPickle/?page_id=2', 0, 'page', '', 0),
(3, 1, '2019-08-12 09:13:01', '2019-08-12 13:13:01', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost:8888/TheHotPickle.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2019-08-12 09:13:01', '2019-08-12 13:13:01', '', 0, 'http://localhost:8888/TheHotPickle/?page_id=3', 0, 'page', '', 0),
(5, 1, '2019-08-12 09:14:47', '2019-08-12 13:14:47', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost:8888/TheHotPickle/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2019-08-12 09:14:47', '2019-08-12 13:14:47', '', 2, 'http://localhost:8888/TheHotPickle/2019/08/12/2-revision-v1/', 0, 'revision', '', 0),
(6, 1, '2019-08-12 09:14:57', '2019-08-12 13:14:57', '<!-- wp:heading {\"level\":1} -->\n<h1>WELCOME</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>to a place where pickle and hot food enthusiasts can share tips and tricks about pickling and growing hot peppers.  Share your recipes, pictures and stories in the forum and pickup some supplies and seeds in the store.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2019-08-24 16:09:30', '2019-08-24 20:09:30', '', 0, 'http://localhost:8888/TheHotPickle/?page_id=6', 0, 'page', '', 0),
(7, 1, '2019-08-12 09:14:57', '2019-08-12 13:14:57', '', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 09:14:57', '2019-08-12 13:14:57', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(8, 1, '2019-08-12 09:53:21', '2019-08-12 13:53:21', '<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 09:53:21', '2019-08-12 13:53:21', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2019-08-12 10:12:53', '2019-08-12 14:12:53', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:audio {\"id\":10} -->\n<figure class=\"wp-block-audio\"><audio controls src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\"></audio></figure>\n<!-- /wp:audio -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:12:53', '2019-08-12 14:12:53', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2019-08-12 10:27:43', '2019-08-12 14:27:43', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:file {\"id\":12,\"href\":\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\"} -->\n<div class=\"wp-block-file\"><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\">piano2-CoolEdit-1</a><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\" class=\"wp-block-file__button\" download>Download</a></div>\n<!-- /wp:file -->\n\n<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:audio {\"id\":10} -->\n<figure class=\"wp-block-audio\"><audio controls src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\"></audio></figure>\n<!-- /wp:audio -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:27:43', '2019-08-12 14:27:43', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2019-08-12 10:29:29', '2019-08-12 14:29:29', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:file {\"id\":12,\"href\":\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\"} -->\n<div class=\"wp-block-file\"><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\">piano2-CoolEdit-1</a><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\" class=\"wp-block-file__button\" download>Download</a></div>\n<!-- /wp:file -->\n\n<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\"></a>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:29:29', '2019-08-12 14:29:29', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(15, 1, '2019-08-12 10:29:36', '2019-08-12 14:29:36', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:file {\"id\":12,\"href\":\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\"} -->\n<div class=\"wp-block-file\"><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\">piano2-CoolEdit-1</a><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\" class=\"wp-block-file__button\" download>Download</a></div>\n<!-- /wp:file -->\n\n<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\">Listen</a>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:29:36', '2019-08-12 14:29:36', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2019-08-12 10:33:03', '2019-08-12 14:33:03', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:file {\"id\":12,\"href\":\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\"} -->\n<div class=\"wp-block-file\"><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\">piano2-CoolEdit-1</a><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\" class=\"wp-block-file__button\" download>Download</a></div>\n<!-- /wp:file -->\n\n<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<audio src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\">Listen</audio>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:33:03', '2019-08-12 14:33:03', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(17, 1, '2019-08-12 10:34:00', '2019-08-12 14:34:00', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:file {\"id\":12,\"href\":\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\"} -->\n<div class=\"wp-block-file\"><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\">piano2-CoolEdit-1</a><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\" class=\"wp-block-file__button\" download>Download</a></div>\n<!-- /wp:file -->\n\n<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<a target=\"_blank\" href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" rel=\"noopener noreferrer\">Listen</a>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:34:00', '2019-08-12 14:34:00', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2019-08-12 10:35:59', '2019-08-12 14:35:59', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:file {\"id\":12,\"href\":\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\"} -->\n<div class=\"wp-block-file\"><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\">piano2-CoolEdit-1</a><a href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit-1.mp3\" class=\"wp-block-file__button\" download>Download</a></div>\n<!-- /wp:file -->\n\n<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<a target=\"_blank\" href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" rel=\"noopener noreferrer\">🔈</a>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:35:59', '2019-08-12 14:35:59', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(19, 1, '2019-08-12 10:36:07', '2019-08-12 14:36:07', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>T͟Hē-hät-pik(ə)l</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<a target=\"_blank\" href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" rel=\"noopener noreferrer\">🔈</a>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:36:07', '2019-08-12 14:36:07', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2019-08-12 10:37:16', '2019-08-12 14:37:16', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<a target=\"_blank\" href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" rel=\"noopener noreferrer\">🔈 T͟Hē-hät-pik(ə)l </a>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:37:16', '2019-08-12 14:37:16', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(21, 1, '2019-08-12 10:46:58', '2019-08-12 14:46:58', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n  <div id=\"play-btn\"></div>\n<a target=\"_blank\" href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" rel=\"noopener noreferrer\">🔈 T͟Hē-hät-pik(ə)l </a>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:46:58', '2019-08-12 14:46:58', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(22, 1, '2019-08-12 10:53:18', '2019-08-12 14:53:18', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n                 }\n </script>  \n<input type=\"button\" value=\"PLAY\"  onclick=\"play()\">\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n<div id=\"play-btn\"></div>\n<a target=\"_blank\" href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" rel=\"noopener noreferrer\">🔈 T͟Hē-hät-pik(ə)l </a>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:53:18', '2019-08-12 14:53:18', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2019-08-12 10:55:10', '2019-08-12 14:55:10', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n<div type=\"button\" id=\"play-btn\" onclick=\"play()\"/>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n<div id=\"play-btn\"></div>\n<a target=\"_blank\" href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" rel=\"noopener noreferrer\">🔈 T͟Hē-hät-pik(ə)l </a>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:55:10', '2019-08-12 14:55:10', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2019-08-12 10:55:43', '2019-08-12 14:55:43', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n<div id=\"play-btn\" onclick=\"play()\"/>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n<a target=\"_blank\" href=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" rel=\"noopener noreferrer\">🔈 T͟Hē-hät-pik(ə)l </a>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:55:43', '2019-08-12 14:55:43', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2019-08-12 10:56:19', '2019-08-12 14:56:19', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \nT͟Hē-hät-pik(ə)l\n<div id=\"play-btn\" onclick=\"play()\"/>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 10:56:19', '2019-08-12 14:56:19', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2019-08-12 11:16:00', '2019-08-12 15:16:00', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \nT͟Hē-hät-pik(ə)l\n<i class=\"fas fa-volume-down\"></i>\n<div id=\"play-btn\" onclick=\"play()\"/>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:16:00', '2019-08-12 15:16:00', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2019-08-12 11:16:38', '2019-08-12 15:16:38', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \nT͟Hē-hät-pik(ə)l\n<i class=\"fas fa-volume-down\" onclick=\"play()\"></i>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:16:38', '2019-08-12 15:16:38', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2019-08-12 11:17:48', '2019-08-12 15:17:48', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \nT͟Hē-hät-pik(ə)l\n<i class=\"fas fa-volume-down\" style=\"color: blue;\" onclick=\"play()\"></i>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:17:48', '2019-08-12 15:17:48', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2019-08-12 11:18:31', '2019-08-12 15:18:31', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \nT͟Hē-hät-pik(ə)l\n<i class=\"fas fa-volume-down\" style=\"color: #188FEB;\" onclick=\"play()\"></i>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:18:31', '2019-08-12 15:18:31', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2019-08-12 11:19:05', '2019-08-12 15:19:05', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \nT͟Hē-hät-pik(ə)l\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 3rem;\" onclick=\"play()\"></i>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:19:05', '2019-08-12 15:19:05', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2019-08-12 11:19:28', '2019-08-12 15:19:28', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\">T͟Hē-hät-pik(ə)l</i>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:19:28', '2019-08-12 15:19:28', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2019-08-12 11:19:56', '2019-08-12 15:19:56', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i>T͟Hē-hät-pik(ə)l\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:19:56', '2019-08-12 15:19:56', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2019-08-12 11:21:01', '2019-08-12 15:21:01', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .5rem;\">T͟Hē-hät-pik(ə)l</p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:21:01', '2019-08-12 15:21:01', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2019-08-12 11:21:21', '2019-08-12 15:21:21', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem; display: inline-block;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .5rem;\">T͟Hē-hät-pik(ə)l</p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:21:21', '2019-08-12 15:21:21', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2019-08-12 11:21:38', '2019-08-12 15:21:38', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .5rem; display: inline-block;\">T͟Hē-hät-pik(ə)l</p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:21:38', '2019-08-12 15:21:38', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2019-08-12 11:22:04', '2019-08-12 15:22:04', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">T͟Hē-hät-pik(ə)l</p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:22:04', '2019-08-12 15:22:04', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(37, 1, '2019-08-12 11:22:24', '2019-08-12 15:22:24', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/</p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/piano2-CoolEdit.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:22:24', '2019-08-12 15:22:24', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(38, 1, '2019-08-12 11:28:36', '2019-08-12 15:28:36', '', 'thehotpickle', '', 'inherit', 'open', 'closed', '', 'thehotpickle', '', '', '2019-08-12 11:28:36', '2019-08-12 15:28:36', '', 6, 'http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3', 0, 'attachment', 'audio/mpeg', 0),
(39, 1, '2019-08-12 11:29:07', '2019-08-12 15:29:07', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/</p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:29:07', '2019-08-12 15:29:07', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2019-08-12 11:31:07', '2019-08-12 15:31:07', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ <span style=\"font-style: italic;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:31:07', '2019-08-12 15:31:07', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2019-08-12 11:31:27', '2019-08-12 15:31:27', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ <span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:31:27', '2019-08-12 15:31:27', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(42, 1, '2019-08-12 11:31:53', '2019-08-12 15:31:53', '<!-- wp:paragraph -->\n<p>The Hot Pickle</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:31:53', '2019-08-12 15:31:53', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(43, 1, '2019-08-12 11:32:53', '2019-08-12 15:32:53', '<!-- wp:paragraph -->\n<p><strong>The Hot Pickle</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:32:53', '2019-08-12 15:32:53', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(44, 1, '2019-08-12 11:37:45', '2019-08-12 15:37:45', '<!-- wp:paragraph -->\n<p><strong>The Hot Pickle</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>A meeting place for pickle and hot food addicts can indulge in their bad selves and connect with others who are like kind. </p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:37:45', '2019-08-12 15:37:45', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2019-08-12 11:38:17', '2019-08-12 15:38:17', '<!-- wp:paragraph -->\n<p><strong>The Hot Pickle</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>A meeting place where pickle and hot food addicts can indulge in their bad selves and connect with others of like kind. </p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:38:17', '2019-08-12 15:38:17', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2019-08-12 11:39:41', '2019-08-12 15:39:41', '<!-- wp:paragraph -->\n<p><strong>The Hot Pickle</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>A meeting place where pickle and hot food addicts can indulge their bad selves and connect with others of  like kind. </p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 11:39:41', '2019-08-12 15:39:41', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(47, 1, '2019-08-12 13:51:54', '2019-08-12 17:51:54', '<!-- wp:paragraph -->\n<p><strong>The Hot Pickle</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph {\"className\":\"definition-body\"} -->\n<p class=\"definition-body\">A meeting place where pickle and hot food addicts can indulge their bad selves and connect with others of  like kind. </p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 13:51:54', '2019-08-12 17:51:54', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(48, 1, '2019-08-12 13:52:54', '2019-08-12 17:52:54', '<!-- wp:paragraph -->\n<p><strong>The Hot Pickle</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph {\"className\":\"definition-body\"} -->\n<p class=\"definition-body\">A meeting place where pickle and hot food addicts can indulge their bad selves and connect with others alike. </p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 13:52:54', '2019-08-12 17:52:54', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(49, 1, '2019-08-12 13:57:47', '2019-08-12 17:57:47', '', 'hot_dills', '', 'inherit', 'open', 'closed', '', 'hot_dills', '', '', '2019-08-12 13:57:47', '2019-08-12 17:57:47', '', 6, 'http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/hot_dills.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2019-08-12 14:01:05', '2019-08-12 18:01:05', '<!-- wp:paragraph -->\n<p><strong>The Hot Pickle</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n <script>\n  function play(){\n       var audio = document.getElementById(\"audio\");\n       audio.play();\n  }\n </script>  \n\n<i class=\"fas fa-volume-down fa-3x\" style=\"color: #188FEB; font-size: 2rem;\" onclick=\"play()\"></i><p style=\"position: relative; bottom: .45rem; left: 1rem; display: inline-block;\">/T͟Hē-hät-pik(ə)l/ &nbsp;<span style=\"font-style: italic; font-weight: bold;\">noun</span></p>\n<audio id=\"audio\" src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thehotpickle.mp3\" ></audio>\n\n\n<!-- /wp:html -->\n\n<!-- wp:html -->\n<div class=\"container\">\n  <div class=\"row\">\n    <div class=\"col-sm-6\">\n      <p class=\"definition-body\">A meeting place where pickle and hot food addicts can indulge their bad selves and connect with others alike. </p>\n    </div>\n    <div class=\"col-sm-6\">\n    </div>\n  </div>\n</div>\n<!-- /wp:html -->\n\n<!-- wp:image {\"id\":49} -->\n<figure class=\"wp-block-image\"><img src=\"<?php echo wp_upload_dir(); ?&gt;/2019/08/hot_dills.jpg\" alt=\"\" class=\"wp-image-49\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 14:01:05', '2019-08-12 18:01:05', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(51, 1, '2019-08-12 14:13:39', '2019-08-12 18:13:39', '<!-- wp:paragraph -->\n<p><strong>The Hot Pickle</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"container\">\n  <div class=\"row\">\n    <div class=\"col-sm-6\">\n      <p class=\"definition-body\">A meeting place where pickle and hot food addicts can indulge their bad selves and connect with others alike. </p>\n    </div>\n    <div class=\"col-sm-6\">\n    </div>\n  </div>\n</div>\n<!-- /wp:html -->\n\n<!-- wp:image {\"id\":49} -->\n<figure class=\"wp-block-image\"><img src=\"<phpcode&gt;<?php echo wp_upload_dir(); ?&gt;</phpcode&gt;/2019/08/hot_dills.jpg\" alt=\"\" class=\"wp-image-49\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 14:13:39', '2019-08-12 18:13:39', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2019-08-12 14:20:35', '2019-08-12 18:20:35', '', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 14:20:35', '2019-08-12 18:20:35', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2019-08-12 15:02:03', '2019-08-12 19:02:03', '<!-- wp:html -->\n<h1>Ever wonder why you crave vinegar and salt? </h1>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>You\'re not alone.  It turns out that </p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 15:02:03', '2019-08-12 19:02:03', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2019-08-12 15:02:24', '2019-08-12 19:02:24', '<!-- wp:html -->\n<h2>Ever wonder why you crave vinegar and salt? </h2>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>You\'re not alone.  It turns out that </p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 15:02:24', '2019-08-12 19:02:24', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2019-08-12 15:16:15', '2019-08-12 19:16:15', '<!-- wp:html -->\n<h2>Why do I crave vinegar and salt?</h2>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>You\'re not alone.  It turns out that </p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 15:16:15', '2019-08-12 19:16:15', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2019-08-12 15:25:02', '2019-08-12 19:25:02', '<!-- wp:html -->\n<h2>Why do I crave anything pickled?</h2>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  My mouth is watering...</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 15:25:02', '2019-08-12 19:25:02', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2019-08-12 15:30:47', '2019-08-12 19:30:47', '<!-- wp:html -->\n<h2>Why do I crave anything pickled?</h2>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  Now that makes my mouth water... </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A quick google search will render results claiming the need for vinegar being related to low stomach acid and blame the need for sodium on dehydration.  I can\'t confirm either of these notions as being true however I can attest to the fact that after drinking the juice from the pickle jar my wedding ring is significantly harder to get off.  I\'m pretty sure at this point I\'m retaining plenty of fluid.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 15:30:47', '2019-08-12 19:30:47', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(58, 1, '2019-08-12 15:33:21', '2019-08-12 19:33:21', '<!-- wp:html -->\n<h2>Why do I crave anything pickled?</h2>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  Now that makes my mouth water... </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A quick google search will render results claiming the need for vinegar being related to low stomach acid and blame the need for sodium on dehydration.  I can\'t confirm either of these notions as being true however I can attest to the fact that after drinking the juice from the pickle jar my wedding ring is significantly harder to get off.  I\'m pretty sure at this point I\'m retaining plenty of fluid.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It\'s just damn tasty, bottom line.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<h2>What?  It\'s not hot enough?</h2>\n<!-- /wp:html -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 15:33:21', '2019-08-12 19:33:21', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2019-08-12 15:39:25', '2019-08-12 19:39:25', '<!-- wp:html -->\n<h2>Why do I crave anything pickled?</h2>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  Now that makes my mouth water... </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A quick google search will render results claiming the need for vinegar being related to low stomach acid and blame the need for sodium on dehydration.  I can\'t confirm either of these notions as being true however I can attest to the fact that after drinking the juice from the pickle jar my wedding ring is significantly harder to get off.  I\'m pretty sure at this point I\'m retaining plenty of fluid.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It\'s just damn tasty, bottom line.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<h2>What?  It\'s not hot enough either?</h2>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>How many times have you sat and watched people frantically chug their beer to wash down the scorching heat of buffalo hot wings made with Franks Red Hot?   This stuff is like ketchup right?  Oh the sweet hum you saver after eating mango habanero wings or maybe something a little hotter.  I\'m with you.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 15:39:25', '2019-08-12 19:39:25', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2019-08-12 15:42:33', '2019-08-12 19:42:33', '<!-- wp:html -->\n<h2>Why do I crave anything pickled?</h2>\n\n\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  Now that makes my mouth water... </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A quick google search will render results claiming the need for vinegar being related to low stomach acid and blame the need for sodium on dehydration.  I can\'t confirm either of these notions as being true however I can attest to the fact that after drinking the juice from the pickle jar my wedding ring is significantly harder to get off.  I\'m pretty sure at this point I\'m retaining plenty of fluid.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It\'s just damn tasty, bottom line.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<h2>What?  It\'s not hot enough either?</h2>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>How many times have you sat and watched people frantically chug their beer to wash down the scorching heat of buffalo hot wings made with Franks Red Hot?   This stuff is like ketchup right?  Oh the sweet hum you saver after eating mango habanero wings or maybe something a little hotter.  I\'m with you.  I recently grew my own Carolina Reapers and I\'m currently looking forward to a harvest of Ghost, Habanero and Scotch Bonnet peppers.  I\'ve been trying to perfect my wing recipe for years and I think I\'m getting close.  That\'s what this website is all about.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-12 15:42:33', '2019-08-12 19:42:33', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/12/6-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2019-08-12 21:05:45', '2019-08-13 01:05:45', '', 'Forum', '', 'trash', 'closed', 'closed', '', 'forum__trashed', '', '', '2019-08-12 23:05:22', '2019-08-13 03:05:22', '', 0, 'http://localhost:8888/TheHotPickle/?page_id=61', 0, 'page', '', 0),
(62, 1, '2019-08-12 21:05:45', '2019-08-13 01:05:45', '', 'Forum', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2019-08-12 21:05:45', '2019-08-13 01:05:45', '', 61, 'http://localhost:8888/TheHotPickle/2019/08/12/61-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2019-08-12 21:07:51', '2019-08-13 01:07:51', 'Share some tips, tricks and photos.', 'Pepper Growing', '', 'publish', 'closed', 'open', '', 'recipes', '', '', '2019-08-13 08:14:50', '2019-08-13 12:14:50', '', 0, 'http://localhost:8888/TheHotPickle/?post_type=forum&#038;p=63', 0, 'forum', '', 0),
(64, 1, '2019-08-12 21:07:51', '2019-08-13 01:07:51', 'Share your recipes.', 'Recipes', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2019-08-12 21:07:51', '2019-08-13 01:07:51', '', 63, 'http://localhost:8888/TheHotPickle/2019/08/12/63-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2019-08-12 21:22:11', '2019-08-13 01:22:11', 'Hottest Pepper', 'Carolina Reaper', '', 'trash', 'closed', 'open', '', 'carolina-reaper__trashed', '', '', '2019-08-13 00:09:58', '2019-08-13 04:09:58', '', 0, 'http://localhost:8888/TheHotPickle/?post_type=topic&#038;p=65', 0, 'topic', '', 0),
(66, 1, '2019-08-12 21:22:11', '2019-08-13 01:22:11', 'Hottest Pepper', 'Carolina Reaper', '', 'inherit', 'closed', 'closed', '', '65-revision-v1', '', '', '2019-08-12 21:22:11', '2019-08-13 01:22:11', '', 65, 'http://localhost:8888/TheHotPickle/2019/08/12/65-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2019-08-12 21:31:02', '2019-08-13 01:31:02', '<!-- wp:paragraph -->\n<p>[bbp-topic-index]&nbsp;</p>\n<!-- /wp:paragraph -->', 'Forum', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2019-08-12 21:31:02', '2019-08-13 01:31:02', '', 61, 'http://localhost:8888/TheHotPickle/2019/08/12/61-revision-v1/', 0, 'revision', '', 0),
(68, 1, '2019-08-12 21:31:19', '2019-08-13 01:31:19', '', 'Forum', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2019-08-12 21:31:19', '2019-08-13 01:31:19', '', 61, 'http://localhost:8888/TheHotPickle/2019/08/12/61-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2019-08-12 21:41:36', '2019-08-13 01:41:36', 'The real hot pickles.', 'Pickling Recipes', '', 'publish', 'closed', 'open', '', 'pickling-recipes', '', '', '2019-08-13 08:13:52', '2019-08-13 12:13:52', '', 0, 'http://localhost:8888/TheHotPickle/?post_type=forum&#038;p=69', 0, 'forum', '', 0),
(70, 1, '2019-08-12 21:41:36', '2019-08-13 01:41:36', 'The real hot pickle.', 'Pickling Recipes', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-08-12 21:41:36', '2019-08-13 01:41:36', '', 69, 'http://localhost:8888/TheHotPickle/2019/08/12/69-revision-v1/', 0, 'revision', '', 0),
(71, 1, '2019-08-13 00:08:27', '2019-08-13 04:08:27', 'zvsfgasfgsf', 'Carolina Reapers', '', 'trash', 'closed', 'closed', '', 'carolina-reapers__trashed', '', '', '2019-08-13 00:10:01', '2019-08-13 04:10:01', '', 69, 'http://localhost:8888/TheHotPickle/forums/topic/carolina-reapers/', 0, 'topic', '', 0),
(72, 1, '2019-08-13 00:10:01', '2019-08-13 04:10:01', 'zvsfgasfgsf', 'Carolina Reapers', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2019-08-13 00:10:01', '2019-08-13 04:10:01', '', 71, 'http://localhost:8888/TheHotPickle/2019/08/13/71-revision-v1/', 0, 'revision', '', 0),
(73, 1, '2019-08-13 08:13:52', '2019-08-13 12:13:52', 'The real hot pickles.', 'Pickling Recipes', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2019-08-13 08:13:52', '2019-08-13 12:13:52', '', 69, 'http://localhost:8888/TheHotPickle/2019/08/13/69-revision-v1/', 0, 'revision', '', 0),
(74, 1, '2019-08-13 08:14:50', '2019-08-13 12:14:50', 'Share some tips, tricks and photos.', 'Pepper Growing', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2019-08-13 08:14:50', '2019-08-13 12:14:50', '', 63, 'http://localhost:8888/TheHotPickle/2019/08/13/63-revision-v1/', 0, 'revision', '', 0),
(75, 1, '2019-08-13 22:50:39', '2019-08-14 02:50:39', '<!-- wp:html -->\n<h2>Why do I crave anything pickled?</h2>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  Now that makes my mouth water... </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A quick google search will render results claiming the need for vinegar being related to low stomach acid and blame the need for sodium on dehydration.  I can\'t confirm either of these notions as being true however I can attest to the fact that after drinking the juice from the pickle jar my wedding ring is significantly harder to get off.  I\'m pretty sure at this point I\'m retaining plenty of fluid.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It\'s just damn tasty, bottom line.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<h2>It\'s not hot enough?</h2>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>How many times have you sat and watched people frantically chug their beer to wash down the scorching heat of buffalo hot wings made with Franks Red Hot?   This stuff is like ketchup right?  Oh the sweet hum you saver after eating mango habanero wings or maybe something a little hotter.  I\'m with you.  I recently grew my own Carolina Reapers and I\'m currently looking forward to a harvest of Ghost, Habanero and Scotch Bonnet peppers.  I\'ve been trying to perfect my wing recipe for years and I think I\'m getting close.  That\'s what this website is all about.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-13 22:50:39', '2019-08-14 02:50:39', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/13/6-revision-v1/', 0, 'revision', '', 0),
(77, 1, '2019-08-19 21:00:24', '2019-08-20 01:00:24', '<img class=\"alignnone size-medium wp-image-78\" src=\"<?php echo get_template_directory_uri() ?>/uploads/2019/08/IMG_6711-2-300x300.jpg\" alt=\"\" width=\"300\" height=\"300\" />', 'About', '', 'trash', 'closed', 'closed', '', 'about__trashed', '', '', '2019-08-19 21:13:00', '2019-08-20 01:13:00', '', 0, 'http://localhost:8888/TheHotPickle/?post_type=about-me&#038;p=77', 0, 'about-me', '', 0),
(78, 1, '2019-08-19 20:59:22', '2019-08-20 00:59:22', '', 'IMG_6711-2', '', 'inherit', 'open', 'closed', '', 'img_6711-2', '', '', '2019-08-19 20:59:22', '2019-08-20 00:59:22', '', 77, 'http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/IMG_6711-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(80, 1, '2019-08-19 21:15:06', '2019-08-20 01:15:06', '<!-- wp:html -->\n<div class=\"wp-block-image\"><figure class=\"alignleft is-resized\"><img src=\"http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/IMG_6711-2-1024x1024.jpg\" alt=\"\" style=\"border-radius: 10px;\" class=\"wp-image-78\" width=\"122\" height=\"122\"/></figure></div> \n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Hello! I\'m Rick, a self confessed pickle junkie.</p>\n<!-- /wp:paragraph -->', 'About', '', 'publish', 'closed', 'closed', '', 'about', '', '', '2019-08-19 22:05:53', '2019-08-20 02:05:53', '', 0, 'http://localhost:8888/TheHotPickle/?post_type=about-me&#038;p=80', 0, 'about-me', '', 0),
(81, 1, '2019-08-20 15:30:26', '2019-08-20 19:30:26', '<!-- wp:html -->\n<h2>Why do I crave pickles and hot stuff?</h2>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  Now that makes my mouth water... </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A quick google search will render results claiming the need for vinegar being related to low stomach acid and blame the need for sodium on dehydration.  I can\'t confirm either of these notions as being true however I can attest to the fact that after drinking the juice from the pickle jar my wedding ring is significantly harder to get off.  I\'m pretty sure at this point I\'m retaining plenty of fluid.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It\'s just damn tasty, bottom line.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<h2>It\'s not hot enough?</h2>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p>How many times have you sat and watched people frantically chug their beer to wash down the scorching heat of buffalo hot wings made with Franks Red Hot?   This stuff is like ketchup right?  Oh the sweet hum you saver after eating mango habanero wings or maybe something a little hotter.  I\'m with you.  I recently grew my own Carolina Reapers and I\'m currently looking forward to a harvest of Ghost, Habanero and Scotch Bonnet peppers.  I\'ve been trying to perfect my wing recipe for years and I think I\'m getting close.  That\'s what this website is all about.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-20 15:30:26', '2019-08-20 19:30:26', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/20/6-revision-v1/', 0, 'revision', '', 0),
(82, 1, '2019-08-22 10:53:37', '2019-08-22 14:53:37', '\"thats_hot\".', 'thats_hot', '', 'inherit', 'open', 'closed', '', 'thats_hot', '', '', '2019-08-22 10:53:51', '2019-08-22 14:53:51', '', 0, 'http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/thats_hot.m4a', 0, 'attachment', 'audio/mpeg', 0),
(83, 1, '2019-08-24 15:51:22', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2019-08-24 15:51:22', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/TheHotPickle/?p=83', 0, 'post', '', 0),
(84, 2, '2019-08-20 15:52:01', '2019-08-20 19:52:01', '<!-- wp:paragraph -->\n<p>How many times have you sat and watched people frantically chug their beer to wash down the scorching heat of buffalo hot wings made with Franks Red Hot?   This stuff is like ketchup right?  Oh the sweet hum you saver after eating mango habanero wings or maybe something a little hotter.  I\'m with you.  I recently grew my own Carolina Reapers and I\'m currently looking forward to a harvest of Ghost, Habanero and Scotch Bonnet peppers.  I\'ve been trying to perfect my wing recipe for years and I think I\'m getting close.  That\'s what this website is all about.</p>\n<!-- /wp:paragraph -->', 'Not Hot Enough', '', 'publish', 'open', 'open', '', 'not-hot-enough', '', '', '2019-08-26 09:20:39', '2019-08-26 13:20:39', '', 0, 'http://localhost:8888/TheHotPickle/?p=84', 0, 'post', '', 0),
(85, 1, '2019-08-24 15:52:01', '2019-08-24 19:52:01', '<!-- wp:paragraph -->\n<p>How many times have you sat and watched people frantically chug their beer to wash down the scorching heat of buffalo hot wings made with Franks Red Hot?   This stuff is like ketchup right?  Oh the sweet hum you saver after eating mango habanero wings or maybe something a little hotter.  I\'m with you.  I recently grew my own Carolina Reapers and I\'m currently looking forward to a harvest of Ghost, Habanero and Scotch Bonnet peppers.  I\'ve been trying to perfect my wing recipe for years and I think I\'m getting close.  That\'s what this website is all about.</p>\n<!-- /wp:paragraph -->', 'Not Hot Enough', '', 'inherit', 'closed', 'closed', '', '84-revision-v1', '', '', '2019-08-24 15:52:01', '2019-08-24 19:52:01', '', 84, 'http://localhost:8888/TheHotPickle/2019/08/24/84-revision-v1/', 0, 'revision', '', 0),
(86, 2, '2019-08-22 15:52:39', '2019-08-22 19:52:39', '<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  Now that makes my mouth water... </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A quick google search will render results claiming the need for vinegar being related to low stomach acid and blame the need for sodium on dehydration.  I can\'t confirm either of these notions as being true however I can attest to the fact that after drinking the juice from the pickle jar my wedding ring is significantly harder to get off.  I\'m pretty sure at this point I\'m retaining plenty of fluid.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It\'s just damn tasty, bottom line.</p>\n<!-- /wp:paragraph -->', 'Craving vinegar?', '', 'publish', 'open', 'open', '', 'craving-vinegar', '', '', '2019-08-26 09:07:18', '2019-08-26 13:07:18', '', 0, 'http://localhost:8888/TheHotPickle/?p=86', 0, 'post', '', 0),
(87, 1, '2019-08-24 15:52:39', '2019-08-24 19:52:39', '<!-- wp:paragraph -->\n<p>Is it the crunch of a crisp dill or maybe it\'s the salty, spicy goodness of a pickled jalapeño.  To be honest for me it goes back as far as I can remember.   I can fondly recall drinking malt vinegar out of the jug in the fridge as a young boy and my mother giving me the oddest look of concern.  You can keep your cake and sweets, I\'ll take a whole sliced cucumber drenched with a mixture of balsamic and white vinegar sprinkled generously with kosher salt.  Now that makes my mouth water... </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>A quick google search will render results claiming the need for vinegar being related to low stomach acid and blame the need for sodium on dehydration.  I can\'t confirm either of these notions as being true however I can attest to the fact that after drinking the juice from the pickle jar my wedding ring is significantly harder to get off.  I\'m pretty sure at this point I\'m retaining plenty of fluid.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>It\'s just damn tasty, bottom line.</p>\n<!-- /wp:paragraph -->', 'Craving vinegar?', '', 'inherit', 'closed', 'closed', '', '86-revision-v1', '', '', '2019-08-24 15:52:39', '2019-08-24 19:52:39', '', 86, 'http://localhost:8888/TheHotPickle/2019/08/24/86-revision-v1/', 0, 'revision', '', 0),
(88, 1, '2019-08-24 15:55:56', '2019-08-24 19:55:56', '<!-- wp:heading {\"level\":1} -->\n<h1>WELCOME</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>to a place where pickle and hot food enthusiasts can <br>\nshare tips and tricks about pickling and growing hot  <br>\npeppers.  Share your recipes, pictures and stories in the <br>\nforum and pickup some supplies and seeds in the store.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-24 15:55:56', '2019-08-24 19:55:56', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/24/6-revision-v1/', 0, 'revision', '', 0),
(89, 1, '2019-08-24 16:09:30', '2019-08-24 20:09:30', '<!-- wp:heading {\"level\":1} -->\n<h1>WELCOME</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>to a place where pickle and hot food enthusiasts can share tips and tricks about pickling and growing hot peppers.  Share your recipes, pictures and stories in the forum and pickup some supplies and seeds in the store.</p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2019-08-24 16:09:30', '2019-08-24 20:09:30', '', 6, 'http://localhost:8888/TheHotPickle/2019/08/24/6-revision-v1/', 0, 'revision', '', 0),
(90, 1, '2019-08-24 16:38:26', '2019-08-24 20:38:26', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-08-24 16:38:26', '2019-08-24 20:38:26', '', 1, 'http://localhost:8888/TheHotPickle/2019/08/24/1-revision-v1/', 0, 'revision', '', 0),
(93, 1, '2019-08-26 08:51:52', '2019-08-26 12:51:52', '', 'Vinegar', '', 'inherit', 'open', 'closed', '', 'vinegar', '', '', '2019-08-26 08:51:52', '2019-08-26 12:51:52', '', 86, 'http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/Vinegar.jpg', 0, 'attachment', 'image/jpeg', 0),
(94, 1, '2019-08-26 09:20:34', '2019-08-26 13:20:34', '', 'buffalo-wings', '', 'inherit', 'open', 'closed', '', 'buffalo-wings', '', '', '2019-08-26 09:20:34', '2019-08-26 13:20:34', '', 84, 'http://localhost:8888/TheHotPickle/wp-content/uploads/2019/08/buffalo-wings.jpg', 0, 'attachment', 'image/jpeg', 0),
(95, 1, '2019-08-27 11:31:47', '2019-08-27 15:31:47', '', 'Coming Soon', '', 'publish', 'closed', 'closed', '', 'coming-soon', '', '', '2019-08-27 11:31:47', '2019-08-27 15:31:47', '', 0, 'http://localhost:8888/TheHotPickle/?page_id=95', 0, 'page', '', 0),
(96, 1, '2019-08-27 11:31:47', '2019-08-27 15:31:47', '', 'Coming Soon', '', 'inherit', 'closed', 'closed', '', '95-revision-v1', '', '', '2019-08-27 11:31:47', '2019-08-27 15:31:47', '', 95, 'http://localhost:8888/TheHotPickle/2019/08/27/95-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'reapers', 'reapers', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(71, 2, 0),
(84, 1, 0),
(86, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(2, 2, 'topic-tag', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'iseeumhmm'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:2:{s:13:\"administrator\";b:1;s:13:\"bbp_keymaster\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"75dbb9ae639ac4e78a88e9ef9d9475f5441c9a955ef5529ff9751727d97d4ff3\";a:4:{s:10:\"expiration\";i:1567092690;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36\";s:5:\"login\";i:1566919890;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '76'),
(18, 1, 'wp_user-settings', 'libraryContent=browse&editor=html'),
(19, 1, 'wp_user-settings-time', '1566262820'),
(20, 2, 'nickname', 'Rick Heffren'),
(21, 2, 'first_name', 'Rick'),
(22, 2, 'last_name', 'Heffren'),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'syntax_highlighting', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'fresh'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'locale', ''),
(31, 2, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(32, 2, 'wp_user_level', '10'),
(33, 2, 'dismissed_wp_pointers', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'iseeumhmm', '$P$BYf2pix9f2uE13EfZxWYtEjaLadyjV1', 'iseeumhmm', 'iseeumhmm@gmail.com', '', '2019-08-12 13:13:01', '', 0, 'iseeumhmm'),
(2, 'Rick Heffren', '$P$BXHYw2Xo5JTFHwszMm5s2TNodC424U0', 'rick-heffren', 'rheffren@gmail.com', '', '2019-08-24 20:47:48', '', 0, 'Rick Heffren');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
