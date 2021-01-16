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
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

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
 define('AUTH_KEY',         '>[5F16d;QoBv.M+Pzk3f-)qh#@O29]Bj9cqt $4cw-V|j$|qKg $|4 L4U~l,]JU');
 define('SECURE_AUTH_KEY',  '.m||i<WMQ>$S>!eugO/F%}5kLvnyV 0cUfq^;Reek4{I;jS?Kb&PH@,o-FDwZcVA');
 define('LOGGED_IN_KEY',    'a4QcZ9X?0z*ie#J)`*v)5HCJsTec2nrwB|DxDrcX4J @c~MtXnZ_x-2V<+s4lf|+');
 define('NONCE_KEY',        'D|wbH1aVF*SxJUPi<iVK#Fq~OW[{_5h-f=v1gyc=U1gOQUIO1];b&EKNME<CrPWK');
 define('AUTH_SALT',        'Eq+e,8O)D)=vyv5t+DGPI^1wCE`u~ LLZ%90H-bt2T4&1Ng!#HZ)s-Ua<fJ-39=,');
 define('SECURE_AUTH_SALT', 'elTXei*jU%] |gw~y^Xb-l/1>%z-v1~UqR4e`<Pi=`+ mQ|ErHDJyC1)u$wMyP.-');
 define('LOGGED_IN_SALT',   'z-Vj~6^RmTTc#]=ng|[-(M+!b3|J3Ou)>QKCQ_m$+h}Kq9FCN&+t[w(g%}OkOpq&');
 define('NONCE_SALT',       '{m:aVemDX_Q!@L$Wq;JbhR!=dwxJ/O6|F ui&(zH_Z^_m}[K,irO-jt[bI)*8:<X');
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );

define('FS_METHOD', 'direct');
