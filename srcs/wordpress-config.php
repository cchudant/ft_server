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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'bICI88tGcv4Ta#Kz$fZ9gJyve');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ')Wu,Mv-@(+/3L%5;,BST^WHTL}/ZmRv1r9uyhjf{aIzbn`Rau7?>;0>pw5=< r|?');
define('SECURE_AUTH_KEY',  '#85O3R1Xg=9l7?=.|%z:YQ<x|.FB-,zKMqnqB9#_|0FF|TqaT/npg-_DX:l%n|#N');
define('LOGGED_IN_KEY',    'vbOWHDz-+jQo3X=idH#Na=IUl_1-p+99}znB9OSQnt0f8Acz,1dX(!Yk0hw1Et`Q');
define('NONCE_KEY',        '}&+b]J@NKf*M=xS,5[_aG=B$v|j4cKt2|hp!(98*2JhBa*a@P|]iYRze1X.L|/iM');
define('AUTH_SALT',        '{wR5X<|km5yb7cws~0Uu?<<(7YDnVW]W.{{#+k|6hCONJ:Qa@OXK3nf>_7s+P1-4');
define('SECURE_AUTH_SALT', 'cm%{>l}y.rk_Q^zL3U*c/j+KQY6)Vr[2n6R+l Q8cpCvJ%}i?P7r=0cY69TejXeH');
define('LOGGED_IN_SALT',   'O%!h?#pdO,{WK!H%myUG0W,Eyvw:&UtD>][1&T }sj[=p*r2FkzXV/1ua EWGjOc');
define('NONCE_SALT',       'vD*s$N~z@mc)lIXpb]2g~{iBV|--<JvDf$QtNfSm>gC;< pJq)V!Tn-k>6#6Ogmq');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
