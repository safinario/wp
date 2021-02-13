<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp' );

/** MySQL database username */
define( 'DB_USER', 'wp' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wp' );

/** MySQL hostname */
define( 'DB_HOST', 'dbwp.cmnquc9utfqr.eu-central-1.rds.amazonaws.com' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '(o3T>/Wn7YH+<=|chRj25+($nCy~/m+M-[u,7=yfl{] :[Xjk9c!>sM|84Lb{sY@');
define('SECURE_AUTH_KEY',  ':yqLuyNcd_X]?lq+Qh:rG~|Y](hw6bl*Dr~o+wGF%-AQv0Tat?TxBgYr*@8cGu2z');
define('LOGGED_IN_KEY',    '(rR+V5Wgi[lgqRxZ=2Zbtkoxu|I3ye,)2$~XY(+:xldpcw*Q-&v8mqg=X#[ZWF::');
define('NONCE_KEY',        'aKv[$Z}VVGp#LS18mg_D#+~a%;l/-~PzN&|Y8@Eo3k{^KeLm=p1@}`ZQL;MIg?I+');
define('AUTH_SALT',        'L^8M/FI;;?IM$E&~wLiy$YB<[,dO-YbFi*8,I?CxHhZr-f??Q#e7ngFJvd-2:%`|');
define('SECURE_AUTH_SALT', 'H`U$;`N?lRTB~23e)HI!9F75|g6YWV?Us!gyq/ *x0r?0wt+1VMX*T0@Q4O>P-{|');
define('LOGGED_IN_SALT',   'bRRlQOG7u$4kbq;Fe(tgo=5&#+vS Js>DI/2rdgy?,KP!Vvvez@qMcNxz7vtm&K3');
define('NONCE_SALT',       '{(+|Yop4=d 9VjN:CME_T.[@1eJ(H9mt^<,]3VVB6>!H>JQgK#+MGWV;S>{{S8q:');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
