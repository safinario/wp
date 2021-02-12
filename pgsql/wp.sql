--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: field(anyelement, anyarray); Type: FUNCTION; Schema: public; Owner: wp
--

CREATE FUNCTION public.field(anyelement, VARIADIC anyarray) RETURNS bigint
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT rownum
FROM (SELECT ROW_NUMBER() OVER () AS rownum, elem
	FROM unnest($2) elem) numbered
WHERE numbered.elem = $1
UNION ALL
SELECT 0
$_$;


ALTER FUNCTION public.field(anyelement, VARIADIC anyarray) OWNER TO wp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: wp_commentmeta; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_commentmeta (
    meta_id bigint DEFAULT nextval(('wp_commentmeta_seq'::text)::regclass) NOT NULL,
    comment_id bigint DEFAULT '0'::bigint NOT NULL,
    meta_key character varying(255) DEFAULT NULL::character varying,
    meta_value text
);


ALTER TABLE public.wp_commentmeta OWNER TO wp;

--
-- Name: wp_commentmeta_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_commentmeta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_commentmeta_seq OWNER TO wp;

--
-- Name: wp_comments; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_comments (
    "comment_ID" bigint DEFAULT nextval(('wp_comments_seq'::text)::regclass) NOT NULL,
    "comment_post_ID" bigint DEFAULT '0'::bigint NOT NULL,
    comment_author text NOT NULL,
    comment_author_email character varying(100) DEFAULT ''::character varying NOT NULL,
    comment_author_url character varying(200) DEFAULT ''::character varying NOT NULL,
    comment_author_ip character varying(100) DEFAULT ''::character varying NOT NULL,
    comment_date timestamp without time zone DEFAULT now() NOT NULL,
    comment_date_gmt timestamp without time zone DEFAULT timezone('gmt'::text, now()) NOT NULL,
    comment_content text NOT NULL,
    comment_karma integer DEFAULT 0 NOT NULL,
    comment_approved character varying(20) DEFAULT '1'::character varying NOT NULL,
    comment_agent character varying(255) DEFAULT ''::character varying NOT NULL,
    comment_type character varying(20) DEFAULT 'comment'::character varying NOT NULL,
    comment_parent bigint DEFAULT '0'::bigint NOT NULL,
    user_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.wp_comments OWNER TO wp;

--
-- Name: wp_comments_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_comments_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_comments_seq OWNER TO wp;

--
-- Name: wp_links; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_links (
    link_id bigint DEFAULT nextval(('wp_links_seq'::text)::regclass) NOT NULL,
    link_url character varying(255) DEFAULT ''::character varying NOT NULL,
    link_name character varying(255) DEFAULT ''::character varying NOT NULL,
    link_image character varying(255) DEFAULT ''::character varying NOT NULL,
    link_target character varying(25) DEFAULT ''::character varying NOT NULL,
    link_description character varying(255) DEFAULT ''::character varying NOT NULL,
    link_visible character varying(20) DEFAULT 'Y'::character varying NOT NULL,
    link_owner bigint DEFAULT '1'::bigint NOT NULL,
    link_rating integer DEFAULT 0 NOT NULL,
    link_updated timestamp without time zone DEFAULT now() NOT NULL,
    link_rel character varying(255) DEFAULT ''::character varying NOT NULL,
    link_notes text NOT NULL,
    link_rss character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.wp_links OWNER TO wp;

--
-- Name: wp_links_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_links_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_links_seq OWNER TO wp;

--
-- Name: wp_options; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_options (
    option_id bigint DEFAULT nextval(('wp_options_seq'::text)::regclass) NOT NULL,
    option_name character varying(191) DEFAULT ''::character varying NOT NULL,
    option_value text NOT NULL,
    autoload character varying(20) DEFAULT 'yes'::character varying NOT NULL
);


ALTER TABLE public.wp_options OWNER TO wp;

--
-- Name: wp_options_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_options_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_options_seq OWNER TO wp;

--
-- Name: wp_postmeta; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_postmeta (
    meta_id bigint DEFAULT nextval(('wp_postmeta_seq'::text)::regclass) NOT NULL,
    post_id bigint DEFAULT '0'::bigint NOT NULL,
    meta_key character varying(255) DEFAULT NULL::character varying,
    meta_value text
);


ALTER TABLE public.wp_postmeta OWNER TO wp;

--
-- Name: wp_postmeta_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_postmeta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_postmeta_seq OWNER TO wp;

--
-- Name: wp_posts; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_posts (
    "ID" bigint DEFAULT nextval(('wp_posts_seq'::text)::regclass) NOT NULL,
    post_author bigint DEFAULT '0'::bigint NOT NULL,
    post_date timestamp without time zone DEFAULT now() NOT NULL,
    post_date_gmt timestamp without time zone DEFAULT timezone('gmt'::text, now()) NOT NULL,
    post_content text NOT NULL,
    post_title text NOT NULL,
    post_excerpt text NOT NULL,
    post_status character varying(20) DEFAULT 'publish'::character varying NOT NULL,
    comment_status character varying(20) DEFAULT 'open'::character varying NOT NULL,
    ping_status character varying(20) DEFAULT 'open'::character varying NOT NULL,
    post_password character varying(255) DEFAULT ''::character varying NOT NULL,
    post_name character varying(200) DEFAULT ''::character varying NOT NULL,
    to_ping text NOT NULL,
    pinged text NOT NULL,
    post_modified timestamp without time zone DEFAULT now() NOT NULL,
    post_modified_gmt timestamp without time zone DEFAULT timezone('gmt'::text, now()) NOT NULL,
    post_content_filtered text NOT NULL,
    post_parent bigint DEFAULT '0'::bigint NOT NULL,
    guid character varying(255) DEFAULT ''::character varying NOT NULL,
    menu_order integer DEFAULT 0 NOT NULL,
    post_type character varying(20) DEFAULT 'post'::character varying NOT NULL,
    post_mime_type character varying(100) DEFAULT ''::character varying NOT NULL,
    comment_count bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.wp_posts OWNER TO wp;

--
-- Name: wp_posts_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_posts_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_posts_seq OWNER TO wp;

--
-- Name: wp_term_relationships; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_term_relationships (
    object_id bigint DEFAULT 0 NOT NULL,
    term_taxonomy_id bigint DEFAULT 0 NOT NULL,
    term_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.wp_term_relationships OWNER TO wp;

--
-- Name: wp_term_taxonomy; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_term_taxonomy (
    term_taxonomy_id bigint DEFAULT nextval(('wp_term_taxonomy_seq'::text)::regclass) NOT NULL,
    term_id bigint DEFAULT 0 NOT NULL,
    taxonomy character varying(32) DEFAULT ''::character varying NOT NULL,
    description text NOT NULL,
    parent bigint DEFAULT 0 NOT NULL,
    count bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.wp_term_taxonomy OWNER TO wp;

--
-- Name: wp_term_taxonomy_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_term_taxonomy_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_term_taxonomy_seq OWNER TO wp;

--
-- Name: wp_termmeta; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_termmeta (
    meta_id bigint DEFAULT nextval(('wp_termmeta_seq'::text)::regclass) NOT NULL,
    term_id bigint DEFAULT '0'::bigint NOT NULL,
    meta_key character varying(255) DEFAULT NULL::character varying,
    meta_value text
);


ALTER TABLE public.wp_termmeta OWNER TO wp;

--
-- Name: wp_termmeta_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_termmeta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_termmeta_seq OWNER TO wp;

--
-- Name: wp_terms; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_terms (
    term_id bigint DEFAULT nextval(('wp_terms_seq'::text)::regclass) NOT NULL,
    name character varying(200) DEFAULT ''::character varying NOT NULL,
    slug character varying(200) DEFAULT ''::character varying NOT NULL,
    term_group integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.wp_terms OWNER TO wp;

--
-- Name: wp_terms_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_terms_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_terms_seq OWNER TO wp;

--
-- Name: wp_usermeta; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_usermeta (
    umeta_id bigint DEFAULT nextval(('wp_usermeta_seq'::text)::regclass) NOT NULL,
    user_id bigint DEFAULT '0'::bigint NOT NULL,
    meta_key character varying(255) DEFAULT NULL::character varying,
    meta_value text
);


ALTER TABLE public.wp_usermeta OWNER TO wp;

--
-- Name: wp_usermeta_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_usermeta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_usermeta_seq OWNER TO wp;

--
-- Name: wp_users; Type: TABLE; Schema: public; Owner: wp
--

CREATE TABLE public.wp_users (
    "ID" bigint DEFAULT nextval(('wp_users_seq'::text)::regclass) NOT NULL,
    user_login character varying(60) DEFAULT ''::character varying NOT NULL,
    user_pass character varying(255) DEFAULT ''::character varying NOT NULL,
    user_nicename character varying(50) DEFAULT ''::character varying NOT NULL,
    user_email character varying(100) DEFAULT ''::character varying NOT NULL,
    user_url character varying(100) DEFAULT ''::character varying NOT NULL,
    user_registered timestamp without time zone DEFAULT now() NOT NULL,
    user_activation_key character varying(255) DEFAULT ''::character varying NOT NULL,
    user_status integer DEFAULT 0 NOT NULL,
    display_name character varying(250) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.wp_users OWNER TO wp;

--
-- Name: wp_users_seq; Type: SEQUENCE; Schema: public; Owner: wp
--

CREATE SEQUENCE public.wp_users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wp_users_seq OWNER TO wp;

--
-- Data for Name: wp_commentmeta; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_commentmeta (meta_id, comment_id, meta_key, meta_value) FROM stdin;
\.


--
-- Data for Name: wp_comments; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_comments ("comment_ID", "comment_post_ID", comment_author, comment_author_email, comment_author_url, comment_author_ip, comment_date, comment_date_gmt, comment_content, comment_karma, comment_approved, comment_agent, comment_type, comment_parent, user_id) FROM stdin;
1	1	A WordPress Commenter	wapuu@wordpress.example	https://wordpress.org/		2021-02-11 13:55:35	2021-02-11 13:55:35	Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.	0	post-trashed		comment	0	0
2	23	Bob	bob@yes.net.ua		127.0.0.1	2021-02-11 14:08:33	2021-02-11 14:08:33	WTF!!!	0	0	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:85.0) Gecko/20100101 Firefox/85.0	comment	0	0
\.


--
-- Data for Name: wp_links; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_links (link_id, link_url, link_name, link_image, link_target, link_description, link_visible, link_owner, link_rating, link_updated, link_rel, link_notes, link_rss) FROM stdin;
\.


--
-- Data for Name: wp_options; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_options (option_id, option_name, option_value, autoload) FROM stdin;
1	siteurl	http://localhost	yes
2	home	http://localhost	yes
5	users_can_register	0	yes
7	start_of_week	1	yes
8	use_balanceTags	0	yes
9	use_smilies	1	yes
10	require_name_email	1	yes
11	comments_notify	1	yes
12	posts_per_rss	10	yes
13	rss_use_excerpt	0	yes
14	mailserver_url	mail.example.com	yes
15	mailserver_login	login@example.com	yes
16	mailserver_pass	password	yes
17	mailserver_port	110	yes
18	default_category	1	yes
19	default_comment_status	open	yes
20	default_ping_status	open	yes
22	posts_per_page	10	yes
23	date_format	F j, Y	yes
24	time_format	g:i a	yes
25	links_updated_date_format	F j, Y g:i a	yes
26	comment_moderation	0	yes
27	moderation_notify	1	yes
30	hack_file	0	yes
31	blog_charset	UTF-8	yes
32	moderation_keys		no
33	active_plugins	a:0:{}	yes
34	category_base		yes
35	ping_sites	http://rpc.pingomatic.com/	yes
36	comment_max_links	2	yes
37	gmt_offset	0	yes
38	default_email_category	1	yes
39	recently_edited		no
42	comment_registration	0	yes
43	html_type	text/html	yes
44	use_trackback	0	yes
45	default_role	subscriber	yes
46	db_version	49752	yes
47	uploads_use_yearmonth_folders	1	yes
48	upload_path		yes
50	default_link_category	2	yes
51	show_on_front	posts	yes
52	tag_base		yes
53	show_avatars	1	yes
54	avatar_rating	G	yes
55	upload_url_path		yes
56	thumbnail_size_w	150	yes
57	thumbnail_size_h	150	yes
58	thumbnail_crop	1	yes
59	medium_size_w	300	yes
60	medium_size_h	300	yes
61	avatar_default	mystery	yes
62	large_size_w	1024	yes
63	large_size_h	1024	yes
64	image_default_link_type	none	yes
65	image_default_size		yes
66	image_default_align		yes
67	close_comments_for_old_posts	0	yes
68	close_comments_days_old	14	yes
69	thread_comments	1	yes
70	thread_comments_depth	5	yes
71	page_comments	0	yes
72	comments_per_page	50	yes
73	default_comments_page	newest	yes
74	comment_order	asc	yes
75	sticky_posts	a:0:{}	yes
79	uninstall_plugins	a:0:{}	no
80	timezone_string		yes
81	page_for_posts	0	yes
82	page_on_front	0	yes
83	default_post_format	0	yes
84	link_manager_enabled	0	yes
85	finished_splitting_shared_terms	1	yes
86	site_icon	0	yes
87	medium_large_size_w	768	yes
88	medium_large_size_h	0	yes
90	show_comments_cookies_opt_in	1	yes
91	admin_email_lifespan	1628603735	yes
92	disallowed_keys		no
93	comment_previously_approved	1	yes
94	auto_plugin_theme_update_emails	a:0:{}	no
95	auto_update_core_dev	enabled	yes
96	auto_update_core_minor	enabled	yes
97	auto_update_core_major	enabled	yes
98	initial_db_version	49752	yes
6	admin_email	nahuiblad@yahoo.com	yes
49	blog_public	0	yes
21	default_pingback_flag	0	yes
89	wp_page_for_privacy_policy	3	yes
28	permalink_structure		yes
40	template	twentytwenty	yes
41	stylesheet	twentytwenty	yes
3	blogname		yes
4	blogdescription	Se7ven Deadly Sins	yes
76	widget_categories	a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:1;}s:12:"_multiwidget";i:1;}	yes
121	_site_transient_update_core	O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-5.6.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-5.6.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-5.6.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-5.6.1-new-bundled.zip";s:7:"partial";s:0:"";s:8:"rollback";s:0:"";}s:7:"current";s:5:"5.6.1";s:7:"version";s:5:"5.6.1";s:11:"php_version";s:6:"5.6.20";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"5.6";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1613118320;s:15:"version_checked";s:5:"5.6.1";s:12:"translations";a:0:{}}	no
123	_site_transient_update_plugins	O:8:"stdClass":4:{s:12:"last_checked";i:1613118320;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.1.8";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.1.8.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:5:"1.7.2";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip";s:5:"icons";a:2:{s:2:"2x";s:64:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855";s:2:"1x";s:64:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855";}s:7:"banners";a:1:{s:2:"1x";s:66:"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855";}s:11:"banners_rtl";a:0:{}}}}	no
126	_site_transient_update_themes	O:8:"stdClass":5:{s:12:"last_checked";i:1613118321;s:7:"checked";a:3:{s:14:"twentynineteen";s:3:"1.9";s:12:"twentytwenty";s:3:"1.6";s:15:"twentytwentyone";s:3:"1.1";}s:8:"response";a:0:{}s:9:"no_update";a:3:{s:14:"twentynineteen";a:6:{s:5:"theme";s:14:"twentynineteen";s:11:"new_version";s:3:"1.9";s:3:"url";s:44:"https://wordpress.org/themes/twentynineteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentynineteen.1.9.zip";s:8:"requires";s:5:"4.9.6";s:12:"requires_php";s:5:"5.2.4";}s:12:"twentytwenty";a:6:{s:5:"theme";s:12:"twentytwenty";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/themes/twentytwenty/";s:7:"package";s:58:"https://downloads.wordpress.org/theme/twentytwenty.1.6.zip";s:8:"requires";s:3:"4.7";s:12:"requires_php";s:5:"5.2.4";}s:15:"twentytwentyone";a:6:{s:5:"theme";s:15:"twentytwentyone";s:11:"new_version";s:3:"1.1";s:3:"url";s:45:"https://wordpress.org/themes/twentytwentyone/";s:7:"package";s:61:"https://downloads.wordpress.org/theme/twentytwentyone.1.1.zip";s:8:"requires";s:3:"5.3";s:12:"requires_php";s:3:"5.6";}}s:12:"translations";a:0:{}}	no
29	rewrite_rules		yes
127	auth_key	!mzB<11nV$@t36&j<(-u+cev(v&!Cg#lM&T?7-f!NW;lK,@nY}3doq~0&NK2(?4z	no
99	wp_user_roles	a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}	yes
101	widget_search	a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}	yes
102	widget_recent-posts	a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}	yes
103	widget_recent-comments	a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}	yes
104	widget_archives	a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}	yes
108	widget_pages	a:1:{s:12:"_multiwidget";i:1;}	yes
105	widget_meta	a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}	yes
109	widget_calendar	a:1:{s:12:"_multiwidget";i:1;}	yes
128	auth_salt	Rr(LX~pIYUwJ.:*T|Eo,VvNg;rxrIj8@TU)x)4(J!&J:J/KdWSv yJel%u,#05xI	no
110	widget_media_audio	a:1:{s:12:"_multiwidget";i:1;}	yes
111	widget_media_image	a:1:{s:12:"_multiwidget";i:1;}	yes
112	widget_media_gallery	a:1:{s:12:"_multiwidget";i:1;}	yes
113	widget_media_video	a:1:{s:12:"_multiwidget";i:1;}	yes
114	nonce_key	U}627|Yx?D.}.^Co *mySteQ1iv_Rhg,3_&]8`IJPMm|OD=nIfOV+U1sAxa!C?_4	no
115	nonce_salt	CP 5@J8+br96=3zs5>`Z]1DLgq/(cawXRQSZV]d|!Uz+42{5b* bQ_;[iXFGGROf	no
116	widget_tag_cloud	a:1:{s:12:"_multiwidget";i:1;}	yes
117	widget_nav_menu	a:1:{s:12:"_multiwidget";i:1;}	yes
118	widget_custom_html	a:1:{s:12:"_multiwidget";i:1;}	yes
129	logged_in_key	Sqc/GJDX@A%u/&}nKn*(^n1xS}j.0{.F{Th/?.<>X_jBKah{1bpC#Vai4Q:p%Pt>	no
120	recovery_keys	a:0:{}	yes
130	logged_in_salt	f|-YF9(z:aENX]HAx~MUf[Ef8aPv1/} 80s5/JalNbClY4]RKZcSOluqZrDIb<!s	no
131	_site_transient_timeout_browser_e3567f14d075da4ddb60594415626fbf	1613656591	no
132	_site_transient_browser_e3567f14d075da4ddb60594415626fbf	a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:13:"88.0.4324.150";s:8:"platform";s:5:"Linux";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}	no
133	_site_transient_timeout_php_check_9236ad8f2e178e4ce7b4ef5302b7fae9	1613656592	no
134	_site_transient_php_check_9236ad8f2e178e4ce7b4ef5302b7fae9	a:5:{s:19:"recommended_version";s:3:"7.4";s:15:"minimum_version";s:6:"5.6.20";s:12:"is_supported";b:1;s:9:"is_secure";b:1;s:13:"is_acceptable";b:1;}	no
100	fresh_site	0	yes
107	cron	a:4:{i:1613138164;a:6:{s:30:"wp_site_health_scheduled_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1613138191;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1613138192;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}	yes
106	sidebars_widgets	a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:1:{i:0;s:12:"categories-2";}s:9:"sidebar-2";a:0:{}s:13:"array_version";i:3;}	yes
136	_transient_timeout_dash_v2_88ae138922fe95674369b1cb3d215a2b	1613094992	no
137	_transient_dash_v2_88ae138922fe95674369b1cb3d215a2b	<div class="rss-widget"><p><strong>RSS Error:</strong> XML or PCRE extensions not loaded!</p></div><div class="rss-widget"><p><strong>RSS Error:</strong> XML or PCRE extensions not loaded!</p></div>	no
138	can_compress_scripts	1	no
139	_site_transient_timeout_community-events-1aecf33ab8525ff212ebdffbb438372e	1613094993	no
140	_site_transient_community-events-1aecf33ab8525ff212ebdffbb438372e	a:4:{s:9:"sandboxed";b:0;s:5:"error";N;s:8:"location";a:1:{s:2:"ip";s:9:"127.0.0.0";}s:6:"events";a:0:{}}	no
141	widget_rss	a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}	yes
142	widget_text	a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}	yes
148	category_children	a:0:{}	yes
143	theme_mods_twentytwentyone	a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1613052001;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}}}}	yes
144	theme_mods_twentynineteen	a:3:{s:18:"custom_css_post_id";i:-1;s:18:"nav_menu_locations";a:0:{}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1613052004;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}	yes
149	current_theme	Twenty Twenty	yes
150	theme_switched		yes
145	theme_mods_twentytwenty	a:7:{s:18:"custom_css_post_id";i:-1;s:18:"nav_menu_locations";a:0:{}s:39:"cover_template_overlay_background_color";s:7:"#3d94f7";s:33:"cover_template_overlay_text_color";s:7:"#0a0a0a";s:30:"cover_template_overlay_opacity";i:75;s:16:"background_color";s:6:"00b52a";s:24:"accent_accessible_colors";a:2:{s:7:"content";a:5:{s:4:"text";s:7:"#000000";s:6:"accent";s:7:"#690621";s:10:"background";s:7:"#00b52a";s:7:"borders";s:7:"#009923";s:9:"secondary";s:7:"#0c2612";}s:13:"header-footer";a:4:{s:4:"text";s:7:"#000000";s:6:"accent";s:7:"#cd2653";s:9:"secondary";s:7:"#6d6d6d";s:7:"borders";s:7:"#dcd7ca";}}}	yes
159	finished_updating_comment_type	1	yes
161	auto_updater.lock	1613118320	no
162	_site_transient_timeout_theme_roots	1613120120	no
163	_site_transient_theme_roots	a:3:{s:14:"twentynineteen";s:7:"/themes";s:12:"twentytwenty";s:7:"/themes";s:15:"twentytwentyone";s:7:"/themes";}	no
\.


--
-- Data for Name: wp_postmeta; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_postmeta (meta_id, post_id, meta_key, meta_value) FROM stdin;
1	2	_wp_page_template	default
2	3	_wp_page_template	default
3	6	_customize_draft_post_name	create-your-website-with-blocks
4	6	_customize_changeset_uuid	96218702-6f05-4b5a-8d34-8b6d07aeb1b8
5	7	_customize_draft_post_name	about
6	7	_customize_changeset_uuid	96218702-6f05-4b5a-8d34-8b6d07aeb1b8
7	8	_customize_draft_post_name	contact
8	8	_customize_changeset_uuid	96218702-6f05-4b5a-8d34-8b6d07aeb1b8
9	9	_customize_draft_post_name	blog
10	9	_customize_changeset_uuid	96218702-6f05-4b5a-8d34-8b6d07aeb1b8
12	11	_wp_attached_file	2021/02/2020-landscape-1.png
13	11	_wp_attachment_metadata	a:5:{s:5:"width";i:1200;s:6:"height";i:769;s:4:"file";s:28:"2021/02/2020-landscape-1.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}
14	11	_starter_content_theme	twentytwenty
15	11	_customize_draft_post_name	the-new-umoma-opens-its-doors
16	12	_thumbnail_id	11
17	12	_customize_draft_post_name	the-new-umoma-opens-its-doors
18	12	_customize_changeset_uuid	96218702-6f05-4b5a-8d34-8b6d07aeb1b8
19	13	_wp_attached_file	2021/02/2020-landscape-1-1.png
20	13	_wp_attachment_metadata	a:5:{s:5:"width";i:1200;s:6:"height";i:769;s:4:"file";s:30:"2021/02/2020-landscape-1-1.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}
21	13	_starter_content_theme	twentytwenty
22	13	_customize_draft_post_name	the-new-umoma-opens-its-doors
23	14	_thumbnail_id	13
24	14	_customize_draft_post_name	the-new-umoma-opens-its-doors
25	14	_customize_changeset_uuid	7c5c5640-00f4-4b23-ad3b-4d9428cdde5d
26	15	_customize_draft_post_name	about
27	15	_customize_changeset_uuid	7c5c5640-00f4-4b23-ad3b-4d9428cdde5d
28	16	_customize_draft_post_name	contact
29	16	_customize_changeset_uuid	7c5c5640-00f4-4b23-ad3b-4d9428cdde5d
30	17	_customize_draft_post_name	blog
31	17	_customize_changeset_uuid	7c5c5640-00f4-4b23-ad3b-4d9428cdde5d
32	18	_wp_trash_meta_status	publish
33	18	_wp_trash_meta_time	1613052016
34	20	_wp_trash_meta_status	publish
35	20	_wp_trash_meta_time	1613052020
36	10	_customize_restore_dismissed	1
37	21	_wp_trash_meta_status	publish
38	21	_wp_trash_meta_time	1613052047
39	1	_wp_trash_meta_status	publish
40	1	_wp_trash_meta_time	1613052083
41	1	_wp_desired_post_slug	hello-world
42	1	_wp_trash_meta_comments_status	a:1:{i:1;s:1:"1";}
43	23	_edit_lock	1613051987:1
45	25	_wp_trash_meta_status	publish
46	25	_wp_trash_meta_time	1613052212
47	26	_wp_trash_meta_status	publish
48	26	_wp_trash_meta_time	1613052244
49	27	_wp_trash_meta_status	publish
50	27	_wp_trash_meta_time	1613052249
51	28	_wp_trash_meta_status	publish
52	28	_wp_trash_meta_time	1613052252
53	29	_wp_trash_meta_status	publish
54	29	_wp_trash_meta_time	1613052283
\.


--
-- Data for Name: wp_posts; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_posts ("ID", post_author, post_date, post_date_gmt, post_content, post_title, post_excerpt, post_status, comment_status, ping_status, post_password, post_name, to_ping, pinged, post_modified, post_modified_gmt, post_content_filtered, post_parent, guid, menu_order, post_type, post_mime_type, comment_count) FROM stdin;
2	1	2021-02-11 13:55:35	2021-02-11 13:55:35	<!-- wp:paragraph -->\n<p>This is an example page. It's different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>Hi there! I'm a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href="http://localhost/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->	Sample Page		publish	closed	open		sample-page			2021-02-11 13:55:35	2021-02-11 13:55:35		0	http://localhost/?page_id=2	0	page		0
3	1	2021-02-11 13:55:35	2021-02-11 13:55:35	<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->	Privacy Policy		draft	closed	open		privacy-policy			2021-02-11 13:55:35	2021-02-11 13:55:35		0	http://localhost/?page_id=3	0	page		0
5	1	2021-02-11 13:56:32	2021-02-11 13:56:32.444224		Auto Draft		auto-draft	open	open					2021-02-11 13:56:32	2021-02-11 13:56:32.444224		0	http://localhost/?p=5	0	post		0
1	1	2021-02-11 13:55:35	2021-02-11 13:55:35	<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->	Hello world!		trash	open	open		hello-world__trashed			2021-02-11 14:01:23	2021-02-11 14:01:23		0	http://localhost/?p=1	0	post		1
7	1	2021-02-11 13:56:46	2021-02-11 13:56:35.866752	<!-- wp:paragraph -->\n<p>You might be an artist who would like to introduce yourself and your work here or maybe you&rsquo;re a business with a mission to describe.</p>\n<!-- /wp:paragraph -->	About		auto-draft	closed	closed					2021-02-11 13:56:35	2021-02-11 13:56:35.866752		0	http://localhost/?page_id=7	0	page		0
8	1	2021-02-11 13:56:46	2021-02-11 13:56:35.869811	<!-- wp:paragraph -->\n<p>This is a page with some basic contact information, such as an address and phone number. You might also try a plugin to add a contact form.</p>\n<!-- /wp:paragraph -->	Contact		auto-draft	closed	closed					2021-02-11 13:56:35	2021-02-11 13:56:35.869811		0	http://localhost/?page_id=8	0	page		0
9	1	2021-02-11 13:56:46	2021-02-11 13:56:35.872752		Blog		auto-draft	closed	closed					2021-02-11 13:56:35	2021-02-11 13:56:35.872752		0	http://localhost/?page_id=9	0	page		0
6	1	2021-02-11 13:56:46	2021-02-11 13:56:35.861064	\n\t\t\t\t\t<!-- wp:heading {"align":"wide","fontSize":"gigantic","style":{"typography":{"lineHeight":"1.1"}}} -->\n\t\t\t\t\t<h2 class="alignwide has-text-align-wide has-gigantic-font-size" style="line-height:1.1">Create your website with blocks</h2>\n\t\t\t\t\t<!-- /wp:heading -->\n\n\t\t\t\t\t<!-- wp:spacer -->\n\t\t\t\t\t<div style="height:100px" aria-hidden="true" class="wp-block-spacer"></div>\n\t\t\t\t\t<!-- /wp:spacer -->\n\n\t\t\t\t\t<!-- wp:columns {"verticalAlignment":"center","align":"wide","className":"is-style-twentytwentyone-columns-overlap"} -->\n\t\t\t\t\t<div class="wp-block-columns alignwide are-vertically-aligned-center is-style-twentytwentyone-columns-overlap"><!-- wp:column {"verticalAlignment":"center"} -->\n\t\t\t\t\t<div class="wp-block-column is-vertically-aligned-center"><!-- wp:image {"align":"full","sizeSlug":"large"} -->\n\t\t\t\t\t<figure class="wp-block-image alignfull size-large"><img src="http://localhost/wp-content/themes/twentytwentyone/assets/images/roses-tremieres-hollyhocks-1884.jpg" alt="&#8220;Roses Tremieres&#8221; by Berthe Morisot"/></figure>\n\t\t\t\t\t<!-- /wp:image -->\n\n\t\t\t\t\t<!-- wp:spacer -->\n\t\t\t\t\t<div style="height:100px" aria-hidden="true" class="wp-block-spacer"></div>\n\t\t\t\t\t<!-- /wp:spacer -->\n\n\t\t\t\t\t<!-- wp:image {"align":"full","sizeSlug":"large","className":"is-style-twentytwentyone-image-frame"} -->\n\t\t\t\t\t<figure class="wp-block-image alignfull size-large is-style-twentytwentyone-image-frame"><img src="http://localhost/wp-content/themes/twentytwentyone/assets/images/in-the-bois-de-boulogne.jpg" alt="&#8220;In the Bois de Boulogne&#8221; by Berthe Morisot"/></figure>\n\t\t\t\t\t<!-- /wp:image --></div>\n\t\t\t\t\t<!-- /wp:column -->\n\n\t\t\t\t\t<!-- wp:column {"verticalAlignment":"center"} -->\n\t\t\t\t\t<div class="wp-block-column is-vertically-aligned-center"><!-- wp:spacer -->\n\t\t\t\t\t<div style="height:100px" aria-hidden="true" class="wp-block-spacer"></div>\n\t\t\t\t\t<!-- /wp:spacer -->\n\n\t\t\t\t\t<!-- wp:image {"sizeSlug":"large","className":"alignfull size-full is-style-twentytwentyone-border"} -->\n\t\t\t\t\t<figure class="wp-block-image size-large alignfull size-full is-style-twentytwentyone-border"><img src="http://localhost/wp-content/themes/twentytwentyone/assets/images/young-woman-in-mauve.jpg" alt="&#8220;Young Woman in Mauve&#8221; by Berthe Morisot"/></figure>\n\t\t\t\t\t<!-- /wp:image --></div>\n\t\t\t\t\t<!-- /wp:column --></div>\n\t\t\t\t\t<!-- /wp:columns -->\n\n\t\t\t\t\t<!-- wp:spacer {"height":50} -->\n\t\t\t\t\t<div style="height:50px" aria-hidden="true" class="wp-block-spacer"></div>\n\t\t\t\t\t<!-- /wp:spacer -->\n\n\t\t\t\t\t<!-- wp:columns {"verticalAlignment":"top","align":"wide"} -->\n\t\t\t\t\t<div class="wp-block-columns alignwide are-vertically-aligned-top"><!-- wp:column {"verticalAlignment":"top"} -->\n\t\t\t\t\t<div class="wp-block-column is-vertically-aligned-top"><!-- wp:heading {"level":3} -->\n\t\t\t\t\t<h3>Add block patterns</h3>\n\t\t\t\t\t<!-- /wp:heading -->\n\n\t\t\t\t\t<!-- wp:paragraph -->\n\t\t\t\t\t<p>Block patterns are pre-designed groups of blocks. To add one, select the Add Block button [+] in the toolbar at the top of the editor. Switch to the Patterns tab underneath the search bar, and choose a pattern.</p>\n\t\t\t\t\t<!-- /wp:paragraph --></div>\n\t\t\t\t\t<!-- /wp:column -->\n\n\t\t\t\t\t<!-- wp:column {"verticalAlignment":"top"} -->\n\t\t\t\t\t<div class="wp-block-column is-vertically-aligned-top"><!-- wp:heading {"level":3} -->\n\t\t\t\t\t<h3>Frame your images</h3>\n\t\t\t\t\t<!-- /wp:heading -->\n\n\t\t\t\t\t<!-- wp:paragraph -->\n\t\t\t\t\t<p>Twenty Twenty-One includes stylish borders for your content. With an Image block selected, open the &quot;Styles&quot; panel within the Editor sidebar. Select the &quot;Frame&quot; block style to activate it.</p>\n\t\t\t\t\t<!-- /wp:paragraph --></div>\n\t\t\t\t\t<!-- /wp:column -->\n\n\t\t\t\t\t<!-- wp:column {"verticalAlignment":"top"} -->\n\t\t\t\t\t<div class="wp-block-column is-vertically-aligned-top"><!-- wp:heading {"level":3} -->\n\t\t\t\t\t<h3>Overlap columns</h3>\n\t\t\t\t\t<!-- /wp:heading -->\n\n\t\t\t\t\t<!-- wp:paragraph -->\n\t\t\t\t\t<p>Twenty Twenty-One also includes an overlap style for column blocks. With a Columns block selected, open the &quot;Styles&quot; panel within the Editor sidebar. Choose the &quot;Overlap&quot; block style to try it out.</p>\n\t\t\t\t\t<!-- /wp:paragraph --></div>\n\t\t\t\t\t<!-- /wp:column --></div>\n\t\t\t\t\t<!-- /wp:columns -->\n\n\t\t\t\t\t<!-- wp:spacer -->\n\t\t\t\t\t<div style="height:100px" aria-hidden="true" class="wp-block-spacer"></div>\n\t\t\t\t\t<!-- /wp:spacer -->\n\n\t\t\t\t\t<!-- wp:cover {"overlayColor":"green","contentPosition":"center center","align":"wide","className":"is-style-twentytwentyone-border"} -->\n\t\t\t\t\t<div class="wp-block-cover alignwide has-green-background-color has-background-dim is-style-twentytwentyone-border"><div class="wp-block-cover__inner-container"><!-- wp:spacer {"height":20} -->\n\t\t\t\t\t<div style="height:20px" aria-hidden="true" class="wp-block-spacer"></div>\n\t\t\t\t\t<!-- /wp:spacer -->\n\n\t\t\t\t\t<!-- wp:paragraph {"fontSize":"huge"} -->\n\t\t\t\t\t<p class="has-huge-font-size">Need help?</p>\n\t\t\t\t\t<!-- /wp:paragraph -->\n\n\t\t\t\t\t<!-- wp:spacer {"height":75} -->\n\t\t\t\t\t<div style="height:75px" aria-hidden="true" class="wp-block-spacer"></div>\n\t\t\t\t\t<!-- /wp:spacer -->\n\n\t\t\t\t\t<!-- wp:columns -->\n\t\t\t\t\t<div class="wp-block-columns"><!-- wp:column -->\n\t\t\t\t\t<div class="wp-block-column"><!-- wp:paragraph -->\n\t\t\t\t\t<p><a href="https://wordpress.org/support/article/twenty-twenty-one/">Read the Theme Documentation</a></p>\n\t\t\t\t\t<!-- /wp:paragraph --></div>\n\t\t\t\t\t<!-- /wp:column -->\n\n\t\t\t\t\t<!-- wp:column -->\n\t\t\t\t\t<div class="wp-block-column"><!-- wp:paragraph -->\n\t\t\t\t\t<p><a href="https://wordpress.org/support/theme/twentytwentyone/">Check out the Support Forums</a></p>\n\t\t\t\t\t<!-- /wp:paragraph --></div>\n\t\t\t\t\t<!-- /wp:column --></div>\n\t\t\t\t\t<!-- /wp:columns -->\n\n\t\t\t\t\t<!-- wp:spacer {"height":20} -->\n\t\t\t\t\t<div style="height:20px" aria-hidden="true" class="wp-block-spacer"></div>\n\t\t\t\t\t<!-- /wp:spacer --></div></div>\n\t\t\t\t\t<!-- /wp:cover -->	Create your website with blocks		auto-draft	closed	closed					2021-02-11 13:56:35	2021-02-11 13:56:35.861064		0	http://localhost/?page_id=6	0	page		0
11	1	2021-02-11 13:56:56	2021-02-11 13:56:56.978289		The New UMoMA Opens its Doors		auto-draft	open	closed					2021-02-11 13:56:56	2021-02-11 13:56:56.978289		0	http://localhost/wp-content/uploads/2021/02/2020-landscape-1.png	0	attachment	image/png	0
12	1	2021-02-11 13:56:56	2021-02-11 13:56:56.987067	<!-- wp:group {"align":"wide"} --><div class="wp-block-group alignwide"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center"} --><h2 class="has-text-align-center">The premier destination for modern art in Northern Sweden. Open from 10 AM to 6 PM every day during the summer months.</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:columns {"align":"wide"} --><div class="wp-block-columns alignwide"><!-- wp:column --><div class="wp-block-column"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-1.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>Works and Days</h3><!-- /wp:heading --><!-- wp:paragraph --><p>August 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-3.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>Theatre of Operations</h3><!-- /wp:heading --><!-- wp:paragraph --><p>October 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --><!-- wp:column --><div class="wp-block-column"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-2.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>The Life I Deserve</h3><!-- /wp:heading --><!-- wp:paragraph --><p>August 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-4.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>From Signac to Matisse</h3><!-- /wp:heading --><!-- wp:paragraph --><p>October 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --></div><!-- /wp:columns --><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-landscape-2.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:group {"align":"wide"} --><div class="wp-block-group alignwide"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center","textColor":"accent"} --><h2 class="has-accent-color has-text-align-center">&#8220;Cyborgs, as the philosopher Donna Haraway established, are not reverent. They do not remember the cosmos.&#8221;</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:paragraph {"dropCap":true} --><p class="has-drop-cap">With seven floors of striking architecture, UMoMA shows exhibitions of international contemporary art, sometimes along with art historical retrospectives. Existential, political and philosophical issues are intrinsic to our programme. As visitor you are invited to guided tours artist talks, lectures, film screenings and other events with free admission</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>The exhibitions are produced by UMoMA in collaboration with artists and museums around the world and they often attract international attention. UMoMA has received a Special Commendation from the European Museum of the Year, and was among the top candidates for the Swedish Museum of the Year Award as well as for the Council of Europe Museum Prize.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p></p><!-- /wp:paragraph --><!-- wp:group {"customBackgroundColor":"#ffffff","align":"wide"} --><div class="wp-block-group alignwide has-background" style="background-color:#ffffff"><div class="wp-block-group__inner-container"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center"} --><h2 class="has-text-align-center">Become a Member and Get Exclusive Offers!</h2><!-- /wp:heading --><!-- wp:paragraph {"align":"center"} --><p class="has-text-align-center">Members get access to exclusive exhibits and sales. Our memberships cost $99.99 and are billed annually.</p><!-- /wp:paragraph --><!-- wp:button {"align":"center"} --><div class="wp-block-button aligncenter"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Join the Club</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div></div><!-- /wp:group --><!-- wp:gallery {"ids":[39,38],"align":"wide"} --><figure class="wp-block-gallery alignwide columns-2 is-cropped"><ul class="blocks-gallery-grid"><li class="blocks-gallery-item"><figure><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-2.png" alt="" data-id="39" data-full-url="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-2.png" data-link="assets/images/2020-square-2/" class="wp-image-39"/></figure></li><li class="blocks-gallery-item"><figure><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-1.png" alt="" data-id="38" data-full-url="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-1.png" data-link="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-1/" class="wp-image-38"/></figure></li></ul></figure><!-- /wp:gallery -->	The New UMoMA Opens its Doors		auto-draft	closed	closed					2021-02-11 13:56:56	2021-02-11 13:56:56.987067		0	http://localhost/?page_id=12	0	page		0
10	1	2021-02-11 13:56:57	2021-02-11 13:56:57.00641	{\n    "nav_menus_created_posts": {\n        "starter_content": true,\n        "value": [\n            6,\n            7,\n            8,\n            9,\n            11,\n            12\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu[-1]": {\n        "starter_content": true,\n        "value": {\n            "name": "Primary"\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-1]": {\n        "starter_content": true,\n        "value": {\n            "type": "custom",\n            "title": "Home",\n            "url": "http://localhost/",\n            "position": 0,\n            "nav_menu_term_id": -1,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:35"\n    },\n    "nav_menu_item[-2]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 7,\n            "position": 1,\n            "nav_menu_term_id": -1,\n            "title": "About"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:35"\n    },\n    "nav_menu_item[-3]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 9,\n            "position": 2,\n            "nav_menu_term_id": -1,\n            "title": "Blog"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:35"\n    },\n    "nav_menu_item[-4]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 8,\n            "position": 3,\n            "nav_menu_term_id": -1,\n            "title": "Contact"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:35"\n    },\n    "twentytwentyone::nav_menu_locations[primary]": {\n        "starter_content": true,\n        "value": -1,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:35"\n    },\n    "nav_menu[-5]": {\n        "starter_content": true,\n        "value": {\n            "name": "Primary"\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-5]": {\n        "starter_content": true,\n        "value": {\n            "type": "custom",\n            "title": "Home",\n            "url": "http://localhost/",\n            "position": 0,\n            "nav_menu_term_id": -5,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-6]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 7,\n            "position": 1,\n            "nav_menu_term_id": -5,\n            "title": "About"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-7]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 9,\n            "position": 2,\n            "nav_menu_term_id": -5,\n            "title": "Blog"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-8]": {\n        "starter_content": true,\n        "value": {\n            "type": "post_type",\n            "object": "page",\n            "object_id": 8,\n            "position": 3,\n            "nav_menu_term_id": -5,\n            "title": "Contact"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "twentytwentyone::nav_menu_locations[footer]": {\n        "starter_content": true,\n        "value": -5,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:35"\n    },\n    "show_on_front": {\n        "starter_content": true,\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:35"\n    },\n    "page_on_front": {\n        "starter_content": true,\n        "value": 12,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "page_for_posts": {\n        "starter_content": true,\n        "value": 9,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:35"\n    },\n    "old_sidebars_widgets_data": {\n        "value": {\n            "wp_inactive_widgets": [],\n            "sidebar-1": [\n                "text-2"\n            ],\n            "sidebar-2": [\n                "text-3"\n            ]\n        },\n        "type": "global_variable",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "widget_text[2]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjE1OiJBYm91dCBUaGlzIFNpdGUiO3M6NDoidGV4dCI7czo4NToiVGhpcyBtYXkgYmUgYSBnb29kIHBsYWNlIHRvIGludHJvZHVjZSB5b3Vyc2VsZiBhbmQgeW91ciBzaXRlIG9yIGluY2x1ZGUgc29tZSBjcmVkaXRzLiI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30=",\n            "title": "About This Site",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "73fe3f325324906890e39abdfc5f41b5"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "sidebars_widgets[sidebar-1]": {\n        "starter_content": true,\n        "value": [\n            "text-2"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "widget_text[3]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance":  ""YTo0OntzOjU6InRpdGxlIjtzOjc6IkZpbmQgVXMiO3M6NDoidGV4dCI7czoxNjg6IjxzdHJvbmc+QWRkcmVzczwvc3Ryb25nPgoxMjMgTWFpbiBTdHJlZXQKTmV3IFlvcmssIE5ZIDEwMDAxCgo8c3Ryb25nPkhvdXJzPC9zdHJvbmc+Ck1vbmRheSZuZGFzaDtGcmlkYXk6IDk6MDBBTSZuZGFzaDs1OjAwUE0KU2F0dXJkYXkgJmFtcDsgU3VuZGF5OiAxMTowMEFNJm5kYXNoOzM6MDBQTSI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30" =",\n            "title": "Find Us",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "3ead7321a894ec52fac6625d45fe5748"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "sidebars_widgets[sidebar-2]": {\n        "starter_content": true,\n        "value": [\n            "text-3"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "twentytwenty::nav_menu_locations[primary]": {\n        "starter_content": true,\n        "value": -1,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "twentytwenty::nav_menu_locations[expanded]": {\n        "starter_content": true,\n        "value": -5,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu[-9]": {\n        "starter_content": true,\n        "value": {\n            "name": "Social Links Menu"\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-9]": {\n        "starter_content": true,\n        "value": {\n            "title": "Yelp",\n            "url": "https://www.yelp.com",\n            "position": 0,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-10]": {\n        "starter_content": true,\n        "value": {\n            "title": "Facebook",\n            "url": "https://www.facebook.com/wordpress",\n            "position": 1,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-11]": {\n        "starter_content": true,\n        "value": {\n            "title": "Twitter",\n            "url": "https://twitter.com/wordpress",\n            "position": 2,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-12]": {\n        "starter_content": true,\n        "value": {\n            "title": "Instagram",\n            "url": "https://www.instagram.com/explore/tags/wordcamp/",\n            "position": 3,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "nav_menu_item[-13]": {\n        "starter_content": true,\n        "value": {\n            "title": "Email",\n            "url": "mailto:wordpress@example.com",\n            "position": 4,\n            "nav_menu_term_id": -9,\n            "object_id": 0\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    },\n    "twentytwenty::nav_menu_locations[social]": {\n        "starter_content": true,\n        "value": -9,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 13:56:57"\n    }\n}			auto-draft	closed	closed		96218702-6f05-4b5a-8d34-8b6d07aeb1b8			2021-02-11 13:56:57	2021-02-11 13:56:57		0	http://localhost/?p=10	0	customize_changeset		0
13	1	2021-02-11 14:00:08	2021-02-11 14:00:08.660618		The New UMoMA Opens its Doors		auto-draft	open	closed					2021-02-11 14:00:08	2021-02-11 14:00:08.660618		0	http://localhost/wp-content/uploads/2021/02/2020-landscape-1-1.png	0	attachment	image/png	0
14	1	2021-02-11 14:00:08	2021-02-11 14:00:08.667397	<!-- wp:group {"align":"wide"} --><div class="wp-block-group alignwide"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center"} --><h2 class="has-text-align-center">The premier destination for modern art in Northern Sweden. Open from 10 AM to 6 PM every day during the summer months.</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:columns {"align":"wide"} --><div class="wp-block-columns alignwide"><!-- wp:column --><div class="wp-block-column"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-1.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>Works and Days</h3><!-- /wp:heading --><!-- wp:paragraph --><p>August 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-3.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>Theatre of Operations</h3><!-- /wp:heading --><!-- wp:paragraph --><p>October 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --><!-- wp:column --><div class="wp-block-column"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-2.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>The Life I Deserve</h3><!-- /wp:heading --><!-- wp:paragraph --><p>August 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-three-quarters-4.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:heading {"level":3} --><h3>From Signac to Matisse</h3><!-- /wp:heading --><!-- wp:paragraph --><p>October 1 -- December 1</p><!-- /wp:paragraph --><!-- wp:button {"className":"is-style-outline"} --><div class="wp-block-button is-style-outline"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Read More</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div><!-- /wp:column --></div><!-- /wp:columns --><!-- wp:image {"align":"full","id":37,"sizeSlug":"full"} --><figure class="wp-block-image alignfull size-full"><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-landscape-2.png" alt="" class="wp-image-37"/></figure><!-- /wp:image --><!-- wp:group {"align":"wide"} --><div class="wp-block-group alignwide"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center","textColor":"accent"} --><h2 class="has-accent-color has-text-align-center">&#8220;Cyborgs, as the philosopher Donna Haraway established, are not reverent. They do not remember the cosmos.&#8221;</h2><!-- /wp:heading --></div></div><!-- /wp:group --><!-- wp:paragraph {"dropCap":true} --><p class="has-drop-cap">With seven floors of striking architecture, UMoMA shows exhibitions of international contemporary art, sometimes along with art historical retrospectives. Existential, political and philosophical issues are intrinsic to our programme. As visitor you are invited to guided tours artist talks, lectures, film screenings and other events with free admission</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>The exhibitions are produced by UMoMA in collaboration with artists and museums around the world and they often attract international attention. UMoMA has received a Special Commendation from the European Museum of the Year, and was among the top candidates for the Swedish Museum of the Year Award as well as for the Council of Europe Museum Prize.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p></p><!-- /wp:paragraph --><!-- wp:group {"customBackgroundColor":"#ffffff","align":"wide"} --><div class="wp-block-group alignwide has-background" style="background-color:#ffffff"><div class="wp-block-group__inner-container"><!-- wp:group --><div class="wp-block-group"><div class="wp-block-group__inner-container"><!-- wp:heading {"align":"center"} --><h2 class="has-text-align-center">Become a Member and Get Exclusive Offers!</h2><!-- /wp:heading --><!-- wp:paragraph {"align":"center"} --><p class="has-text-align-center">Members get access to exclusive exhibits and sales. Our memberships cost $99.99 and are billed annually.</p><!-- /wp:paragraph --><!-- wp:button {"align":"center"} --><div class="wp-block-button aligncenter"><a class="wp-block-button__link" href="https://make.wordpress.org/core/2019/09/27/block-editor-theme-related-updates-in-wordpress-5-3/">Join the Club</a></div><!-- /wp:button --></div></div><!-- /wp:group --></div></div><!-- /wp:group --><!-- wp:gallery {"ids":[39,38],"align":"wide"} --><figure class="wp-block-gallery alignwide columns-2 is-cropped"><ul class="blocks-gallery-grid"><li class="blocks-gallery-item"><figure><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-2.png" alt="" data-id="39" data-full-url="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-2.png" data-link="assets/images/2020-square-2/" class="wp-image-39"/></figure></li><li class="blocks-gallery-item"><figure><img src="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-1.png" alt="" data-id="38" data-full-url="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-1.png" data-link="http://localhost/wp-content/themes/twentytwenty/assets/images/2020-square-1/" class="wp-image-38"/></figure></li></ul></figure><!-- /wp:gallery -->	The New UMoMA Opens its Doors		auto-draft	closed	closed					2021-02-11 14:00:08	2021-02-11 14:00:08.667397		0	http://localhost/?page_id=14	0	page		0
15	1	2021-02-11 14:00:08	2021-02-11 14:00:08.670372	<!-- wp:paragraph -->\n<p>You might be an artist who would like to introduce yourself and your work here or maybe you&rsquo;re a business with a mission to describe.</p>\n<!-- /wp:paragraph -->	About		auto-draft	closed	closed					2021-02-11 14:00:08	2021-02-11 14:00:08.670372		0	http://localhost/?page_id=15	0	page		0
16	1	2021-02-11 14:00:08	2021-02-11 14:00:08.672686	<!-- wp:paragraph -->\n<p>This is a page with some basic contact information, such as an address and phone number. You might also try a plugin to add a contact form.</p>\n<!-- /wp:paragraph -->	Contact		auto-draft	closed	closed					2021-02-11 14:00:08	2021-02-11 14:00:08.672686		0	http://localhost/?page_id=16	0	page		0
17	1	2021-02-11 14:00:08	2021-02-11 14:00:08.67483		Blog		auto-draft	closed	closed					2021-02-11 14:00:08	2021-02-11 14:00:08.67483		0	http://localhost/?page_id=17	0	page		0
18	1	2021-02-11 14:00:16	2021-02-11 14:00:16	{\n    "widget_text[2]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjE1OiJBYm91dCBUaGlzIFNpdGUiO3M6NDoidGV4dCI7czo4NToiVGhpcyBtYXkgYmUgYSBnb29kIHBsYWNlIHRvIGludHJvZHVjZSB5b3Vyc2VsZiBhbmQgeW91ciBzaXRlIG9yIGluY2x1ZGUgc29tZSBjcmVkaXRzLiI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30=",\n            "title": "About This Site",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "73fe3f325324906890e39abdfc5f41b5"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "sidebars_widgets[sidebar-1]": {\n        "starter_content": true,\n        "value": [\n            "text-2"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "widget_text[3]": {\n        "starter_content": true,\n        "value": {\n            "encoded_serialized_instance":  ""YTo0OntzOjU6InRpdGxlIjtzOjc6IkZpbmQgVXMiO3M6NDoidGV4dCI7czoxNjg6IjxzdHJvbmc+QWRkcmVzczwvc3Ryb25nPgoxMjMgTWFpbiBTdHJlZXQKTmV3IFlvcmssIE5ZIDEwMDAxCgo8c3Ryb25nPkhvdXJzPC9zdHJvbmc+Ck1vbmRheSZuZGFzaDtGcmlkYXk6IDk6MDBBTSZuZGFzaDs1OjAwUE0KU2F0dXJkYXkgJmFtcDsgU3VuZGF5OiAxMTowMEFNJm5kYXNoOzM6MDBQTSI7czo2OiJmaWx0ZXIiO2I6MTtzOjY6InZpc3VhbCI7YjoxO30" =",\n            "title": "Find Us",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "3ead7321a894ec52fac6625d45fe5748"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "sidebars_widgets[sidebar-2]": {\n        "starter_content": true,\n        "value": [\n            "text-3"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "nav_menus_created_posts": {\n        "starter_content": true,\n        "value": [\n            13,\n            14,\n            15,\n            16,\n            17\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "nav_menu[-1]": {\n        "value": {\n            "name": "Primary",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-1]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 0,\n            "type": "custom",\n            "title": "Home",\n            "url": "http://localhost/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -1,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-2]": {\n        "value": {\n            "object_id": 15,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "post_type",\n            "title": "About",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "About",\n            "nav_menu_term_id": -1,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-3]": {\n        "value": {\n            "object_id": 17,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "post_type",\n            "title": "Blog",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Blog",\n            "nav_menu_term_id": -1,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-4]": {\n        "value": {\n            "object_id": 16,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "post_type",\n            "title": "Contact",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Contact",\n            "nav_menu_term_id": -1,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "twentytwenty::nav_menu_locations[primary]": {\n        "starter_content": true,\n        "value": -1,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "nav_menu[-5]": {\n        "value": {\n            "name": "Primary",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-5]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 0,\n            "type": "custom",\n            "title": "Home",\n            "url": "http://localhost/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-6]": {\n        "value": {\n            "object_id": 15,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "post_type",\n            "title": "About",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "About",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-7]": {\n        "value": {\n            "object_id": 17,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "post_type",\n            "title": "Blog",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Blog",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-8]": {\n        "value": {\n            "object_id": 16,\n            "object": "page",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "post_type",\n            "title": "Contact",\n            "url": "",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "Contact",\n            "nav_menu_term_id": -5,\n            "_invalid": false,\n            "type_label": "Page"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "twentytwenty::nav_menu_locations[expanded]": {\n        "starter_content": true,\n        "value": -5,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "nav_menu[-9]": {\n        "value": {\n            "name": "Social Links Menu",\n            "description": "",\n            "parent": 0,\n            "auto_add": false\n        },\n        "type": "nav_menu",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-9]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 0,\n            "type": "custom",\n            "title": "Yelp",\n            "url": "https://www.yelp.com",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -9,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-10]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 1,\n            "type": "custom",\n            "title": "Facebook",\n            "url": "https://www.facebook.com/wordpress",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -9,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-11]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 2,\n            "type": "custom",\n            "title": "Twitter",\n            "url": "https://twitter.com/wordpress",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -9,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-12]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 3,\n            "type": "custom",\n            "title": "Instagram",\n            "url": "https://www.instagram.com/explore/tags/wordcamp/",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -9,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "nav_menu_item[-13]": {\n        "value": {\n            "object_id": 0,\n            "object": "",\n            "menu_item_parent": 0,\n            "position": 4,\n            "type": "custom",\n            "title": "Email",\n            "url": "mailto:wordpress@example.com",\n            "target": "",\n            "attr_title": "",\n            "description": "",\n            "classes": "",\n            "xfn": "",\n            "status": "publish",\n            "original_title": "",\n            "nav_menu_term_id": -9,\n            "_invalid": false,\n            "type_label": "Custom Link"\n        },\n        "type": "nav_menu_item",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    },\n    "twentytwenty::nav_menu_locations[social]": {\n        "starter_content": true,\n        "value": -9,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "show_on_front": {\n        "starter_content": true,\n        "value": "page",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "page_on_front": {\n        "starter_content": true,\n        "value": 14,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "page_for_posts": {\n        "starter_content": true,\n        "value": 17,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:08"\n    },\n    "blogdescription": {\n        "value": "Se7ven Deadly Sins",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:16"\n    }\n}			trash	closed	closed		7c5c5640-00f4-4b23-ad3b-4d9428cdde5d			2021-02-11 14:00:16	2021-02-11 14:00:16		0	http://localhost/?p=18	0	customize_changeset		0
25	1	2021-02-11 14:03:32	2021-02-11 14:03:32	{\n    "widget_categories[2]": {\n        "value": {\n            "encoded_serialized_instance": "YTo0OntzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJjb3VudCI7aTowO3M6MTI6ImhpZXJhcmNoaWNhbCI7aTowO3M6ODoiZHJvcGRvd24iO2k6MTt9",\n            "title": "",\n            "is_widget_customizer_js_value": true,\n            "instance_hash_key": "9a2ca4ce393e08cfd37f3c49bf40451a"\n        },\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:03:32"\n    },\n    "sidebars_widgets[sidebar-1]": {\n        "value": [\n            "categories-2"\n        ],\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:03:32"\n    }\n}			trash	closed	closed		3f6293b1-2b13-4d27-a162-ddbb13efbe65			2021-02-11 14:03:32	2021-02-11 14:03:32		0	http://localhost/?p=25	0	customize_changeset		0
20	1	2021-02-11 14:00:20	2021-02-11 14:00:20	{\n    "blogname": {\n        "value": "",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:20"\n    }\n}			trash	closed	closed		6eb19f12-2433-4aa8-9576-5acf02ed94fd			2021-02-11 14:00:20	2021-02-11 14:00:20		0	http://localhost/?p=20	0	customize_changeset		0
21	1	2021-02-11 14:00:47	2021-02-11 14:00:47	{\n    "blogdescription": {\n        "value": "Se7ven Deadly Sins",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:00:47"\n    }\n}			trash	closed	closed		74ef2100-b37a-45e9-936a-0de58574abe0			2021-02-11 14:00:47	2021-02-11 14:00:47		0	http://localhost/?p=21	0	customize_changeset		0
22	1	2021-02-11 14:01:23	2021-02-11 14:01:23	<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->	Hello world!		inherit	closed	closed		1-revision-v1			2021-02-11 14:01:23	2021-02-11 14:01:23		1	http://localhost/?p=22	0	revision		0
28	1	2021-02-11 14:04:12	2021-02-11 14:04:12	{\n    "twentytwenty::cover_template_overlay_opacity": {\n        "value": "75",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:04:12"\n    }\n}			trash	closed	closed		ba03c7b7-e89a-4e46-a5b4-392c97bcbf56			2021-02-11 14:04:12	2021-02-11 14:04:12		0	http://localhost/?p=28	0	customize_changeset		0
23	1	2021-02-11 14:01:25	2021-02-11 14:01:25.351574	<!-- wp:heading {"level":4} -->\n<h4>Something's working...</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->	WTF		publish	open	open		wtf			2021-02-11 14:02:10	2021-02-11 14:02:10		0	http://localhost/?p=23	0	post		0
24	1	2021-02-11 14:02:10	2021-02-11 14:02:10	<!-- wp:heading {"level":4} -->\n<h4>Something's working...</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->	WTF		inherit	closed	closed		23-revision-v1			2021-02-11 14:02:10	2021-02-11 14:02:10		23	http://localhost/?p=24	0	revision		0
26	1	2021-02-11 14:04:04	2021-02-11 14:04:04	{\n    "twentytwenty::cover_template_overlay_background_color": {\n        "value": "#3d94f7",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:04:04"\n    }\n}			trash	closed	closed		86101d36-2697-48b2-85e8-6bf80e8db5c9			2021-02-11 14:04:04	2021-02-11 14:04:04		0	http://localhost/?p=26	0	customize_changeset		0
27	1	2021-02-11 14:04:09	2021-02-11 14:04:09	{\n    "twentytwenty::cover_template_overlay_text_color": {\n        "value": "#0a0a0a",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:04:09"\n    }\n}			trash	closed	closed		7cb8cb48-12e3-418e-9774-84e5bdcf1b0f			2021-02-11 14:04:09	2021-02-11 14:04:09		0	http://localhost/?p=27	0	customize_changeset		0
29	1	2021-02-11 14:04:43	2021-02-11 14:04:43	{\n    "twentytwenty::background_color": {\n        "value": "#00b52a",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:04:43"\n    },\n    "twentytwenty::accent_accessible_colors": {\n        "value": {\n            "content": {\n                "text": "#000000",\n                "accent": "#690621",\n                "background": "#00b52a",\n                "borders": "#009923",\n                "secondary": "#0c2612"\n            },\n            "header-footer": {\n                "text": "#000000",\n                "accent": "#cd2653",\n                "secondary": "#6d6d6d",\n                "borders": "#dcd7ca"\n            }\n        },\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2021-02-11 14:04:43"\n    }\n}			trash	closed	closed		6a14b324-04c5-4570-8e22-d6a7fd8c1f94			2021-02-11 14:04:43	2021-02-11 14:04:43		0	http://localhost/?p=29	0	customize_changeset		0
\.


--
-- Data for Name: wp_term_relationships; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_term_relationships (object_id, term_taxonomy_id, term_order) FROM stdin;
1	1	0
23	1	0
\.


--
-- Data for Name: wp_term_taxonomy; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_term_taxonomy (term_taxonomy_id, term_id, taxonomy, description, parent, count) FROM stdin;
1	1	category		0	1
\.


--
-- Data for Name: wp_termmeta; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_termmeta (meta_id, term_id, meta_key, meta_value) FROM stdin;
\.


--
-- Data for Name: wp_terms; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_terms (term_id, name, slug, term_group) FROM stdin;
1	Uncategorized	uncategorized	0
\.


--
-- Data for Name: wp_usermeta; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_usermeta (umeta_id, user_id, meta_key, meta_value) FROM stdin;
1	1	nickname	safinario
2	1	first_name	
3	1	last_name	
4	1	description	
5	1	rich_editing	true
6	1	syntax_highlighting	true
7	1	comment_shortcuts	false
10	1	show_admin_bar_front	true
11	1	locale	
14	1	dismissed_wp_pointers	
12	1	wp_capabilities	a:1:{s:13:"administrator";b:1;}
13	1	wp_user_level	10
9	1	use_ssl	0
15	1	show_welcome_panel	1
16	1	session_tokens	a:1:{s:64:"323c3100b5fdb5a4bbad7f5208f9f7c70d0528e806c74a16c7699c2b53373f08";a:4:{s:10:"expiration";i:1613224591;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:105:"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36";s:5:"login";i:1613051791;}}
17	1	wp_dashboard_quick_press_last_post_id	5
18	1	community-events-location	a:1:{s:2:"ip";s:9:"127.0.0.0";}
19	1	wp_user-settings	libraryContent=browse
20	1	wp_user-settings-time	1613051989
8	1	admin_color	light
\.


--
-- Data for Name: wp_users; Type: TABLE DATA; Schema: public; Owner: wp
--

COPY public.wp_users ("ID", user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_activation_key, user_status, display_name) FROM stdin;
1	safinario	$P$B5egXNt/t0fp4bzgi35t3pej6DP6Fp0	safinario	nahuiblad@yahoo.com	http://localhost	2021-02-11 13:55:35		0	safinario
\.


--
-- Name: wp_commentmeta_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_commentmeta_seq', 1, false);


--
-- Name: wp_comments_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_comments_seq', 2, true);


--
-- Name: wp_links_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_links_seq', 1, false);


--
-- Name: wp_options_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_options_seq', 165, true);


--
-- Name: wp_postmeta_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_postmeta_seq', 54, true);


--
-- Name: wp_posts_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_posts_seq', 29, true);


--
-- Name: wp_term_taxonomy_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_term_taxonomy_seq', 1, true);


--
-- Name: wp_termmeta_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_termmeta_seq', 1, false);


--
-- Name: wp_terms_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_terms_seq', 2, true);


--
-- Name: wp_usermeta_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_usermeta_seq', 20, true);


--
-- Name: wp_users_seq; Type: SEQUENCE SET; Schema: public; Owner: wp
--

SELECT pg_catalog.setval('public.wp_users_seq', 1, true);


--
-- Name: wp_commentmeta wp_commentmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_commentmeta
    ADD CONSTRAINT wp_commentmeta_pkey PRIMARY KEY (meta_id);


--
-- Name: wp_comments wp_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_comments
    ADD CONSTRAINT wp_comments_pkey PRIMARY KEY ("comment_ID");


--
-- Name: wp_links wp_links_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_links
    ADD CONSTRAINT wp_links_pkey PRIMARY KEY (link_id);


--
-- Name: wp_options wp_options_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_options
    ADD CONSTRAINT wp_options_pkey PRIMARY KEY (option_id);


--
-- Name: wp_postmeta wp_postmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_postmeta
    ADD CONSTRAINT wp_postmeta_pkey PRIMARY KEY (meta_id);


--
-- Name: wp_posts wp_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_posts
    ADD CONSTRAINT wp_posts_pkey PRIMARY KEY ("ID");


--
-- Name: wp_term_relationships wp_term_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_term_relationships
    ADD CONSTRAINT wp_term_relationships_pkey PRIMARY KEY (object_id, term_taxonomy_id);


--
-- Name: wp_term_taxonomy wp_term_taxonomy_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_term_taxonomy
    ADD CONSTRAINT wp_term_taxonomy_pkey PRIMARY KEY (term_taxonomy_id);


--
-- Name: wp_termmeta wp_termmeta_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_termmeta
    ADD CONSTRAINT wp_termmeta_pkey PRIMARY KEY (meta_id);


--
-- Name: wp_terms wp_terms_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_terms
    ADD CONSTRAINT wp_terms_pkey PRIMARY KEY (term_id);


--
-- Name: wp_usermeta wp_usermeta_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_usermeta
    ADD CONSTRAINT wp_usermeta_pkey PRIMARY KEY (umeta_id);


--
-- Name: wp_users wp_users_pkey; Type: CONSTRAINT; Schema: public; Owner: wp
--

ALTER TABLE ONLY public.wp_users
    ADD CONSTRAINT wp_users_pkey PRIMARY KEY ("ID");


--
-- Name: wp_commentmeta_comment_id; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_commentmeta_comment_id ON public.wp_commentmeta USING btree (comment_id);


--
-- Name: wp_commentmeta_meta_key; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_commentmeta_meta_key ON public.wp_commentmeta USING btree (meta_key);


--
-- Name: wp_comments_comment_approved_date_gmt; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_comments_comment_approved_date_gmt ON public.wp_comments USING btree (comment_approved, comment_date_gmt);


--
-- Name: wp_comments_comment_author_email; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_comments_comment_author_email ON public.wp_comments USING btree (comment_author_email);


--
-- Name: wp_comments_comment_date_gmt; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_comments_comment_date_gmt ON public.wp_comments USING btree (comment_date_gmt);


--
-- Name: wp_comments_comment_parent; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_comments_comment_parent ON public.wp_comments USING btree (comment_parent);


--
-- Name: wp_comments_comment_post_ID; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX "wp_comments_comment_post_ID" ON public.wp_comments USING btree ("comment_post_ID");


--
-- Name: wp_links_link_visible; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_links_link_visible ON public.wp_links USING btree (link_visible);


--
-- Name: wp_options_autoload; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_options_autoload ON public.wp_options USING btree (autoload);


--
-- Name: wp_options_option_name; Type: INDEX; Schema: public; Owner: wp
--

CREATE UNIQUE INDEX wp_options_option_name ON public.wp_options USING btree (option_name);


--
-- Name: wp_postmeta_meta_key; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_postmeta_meta_key ON public.wp_postmeta USING btree (meta_key);


--
-- Name: wp_postmeta_post_id; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_postmeta_post_id ON public.wp_postmeta USING btree (post_id);


--
-- Name: wp_posts_post_author; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_posts_post_author ON public.wp_posts USING btree (post_author);


--
-- Name: wp_posts_post_name; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_posts_post_name ON public.wp_posts USING btree (post_name);


--
-- Name: wp_posts_post_parent; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_posts_post_parent ON public.wp_posts USING btree (post_parent);


--
-- Name: wp_posts_type_status_date; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_posts_type_status_date ON public.wp_posts USING btree (post_type, post_status, post_date, "ID");


--
-- Name: wp_term_relationships_term_taxonomy_id; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_term_relationships_term_taxonomy_id ON public.wp_term_relationships USING btree (term_taxonomy_id);


--
-- Name: wp_term_taxonomy_taxonomy; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_term_taxonomy_taxonomy ON public.wp_term_taxonomy USING btree (taxonomy);


--
-- Name: wp_term_taxonomy_term_id_taxonomy; Type: INDEX; Schema: public; Owner: wp
--

CREATE UNIQUE INDEX wp_term_taxonomy_term_id_taxonomy ON public.wp_term_taxonomy USING btree (term_id, taxonomy);


--
-- Name: wp_termmeta_meta_key; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_termmeta_meta_key ON public.wp_termmeta USING btree (meta_key);


--
-- Name: wp_termmeta_term_id; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_termmeta_term_id ON public.wp_termmeta USING btree (term_id);


--
-- Name: wp_terms_name; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_terms_name ON public.wp_terms USING btree (name);


--
-- Name: wp_terms_slug; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_terms_slug ON public.wp_terms USING btree (slug);


--
-- Name: wp_usermeta_meta_key; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_usermeta_meta_key ON public.wp_usermeta USING btree (meta_key);


--
-- Name: wp_usermeta_user_id; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_usermeta_user_id ON public.wp_usermeta USING btree (user_id);


--
-- Name: wp_users_user_email; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_users_user_email ON public.wp_users USING btree (user_email);


--
-- Name: wp_users_user_login_key; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_users_user_login_key ON public.wp_users USING btree (user_login);


--
-- Name: wp_users_user_nicename; Type: INDEX; Schema: public; Owner: wp
--

CREATE INDEX wp_users_user_nicename ON public.wp_users USING btree (user_nicename);


--
-- PostgreSQL database dump complete
--

