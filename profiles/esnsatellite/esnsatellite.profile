<?php
/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *  An array of modules to be enabled.
 */
function esnsatellite_profile_modules() {
  return array(
  // Required core modules.
  'block', 'filter', 'help', 'node', 'system', 'user', 'watchdog',
  // Enable optional core modules.
  'color', 'comment', 'menu', 'taxonomy',
  // More optional core modules.
  'help', 'throttle', 'search', 'statistics',
  // CCK does not need to be enabled.
  // 'cck',
  // Third party modules.
  'event', 'iconify', 'image', 'imagefield', 'imce',
  'img_assist', 'link', 'menutree', 'pathauto', 'signup',
  'simplemenu', 'tinymce', 'views',
  );
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 * An array with keys 'name' and 'description' describing this profile.
 */
function esnsatellite_profile_details() {
   return array(
      'name' => st('ESN Satellite 2.0'),
      'description' => st('Select this profile to install ESN Satellite. <b>This is the
                           recommended choice</b>.')
   );
}

/**
 * Perform any final installation tasks for this profile.
 *
 * @return
 *   An optional HTML string to display to the user on the final installation
 *   screen.
 */
function esnsatellite_profile_final() {
  // Set up Admin User
  install_add_user('admin', 'admin', 'admin@admin.com', $roles = array(), $status = 1);
  $user = user_authenticate('admin', 'admin');

  // Theme Install
  // --------
  install_default_theme('esntheme'); // Theme Stuff
  install_admin_theme('garland');

  // Define a node type, 'news'.
  $node_type = array(
   'type' => 'news',
   'name' => st('News'),
   'module' => 'node',
   'description' => st('All your ESN related news. Posting as news will put the news item into a news page and promote a teaser (short version of your news with a small image) to your front page. Use this for all dynamic content on your site.'),
   'custom' => TRUE,
   'modified' => TRUE,
   'locked' => FALSE,
   'has_title' => TRUE,
   'has_body' => TRUE,
   'orig_type' => 'news',
   'is_new' => TRUE,
  );
  node_type_save((object) $node_type);
  // News should be published and promoted to front page by default.
  // News should create new revisions by default.
  variable_set('node_options_news', array('status', 'revision', 'promote'));
  // If comments can be enabled, enable them for news.
  variable_set('comment_news', COMMENT_NODE_READ_WRITE);

}


// Functions from crud.inc. 
/**
 * Set the permission for a certain role
 */
function install_set_permissions($rid, $perms) {
  db_query('DELETE FROM {permission} WHERE rid = %d', $rid);
  db_query("INSERT INTO {permission} (rid, perm) VALUES (%d, '%s')", $rid, implode(', ', $perms));
}


/**
 * Add a user
 */
function install_add_user($username, $password, $email, $roles = array(), $status = 1) {
  user_save(
    new stdClass(),
    array(
      'name' => $username, 
      'pass' => $password,
      'mail' => $email,
      'roles' => $roles,
      'status' => $status
    )
  );
}

/**
 * Add a role to the roles table.
 */
function install_add_role($name) {
  db_query("INSERT INTO {role} (name) VALUES ('%s')", $name);
  return install_get_rid($name);
}
/**
* Set default theme
* @param        $theme  Unique string that is the name of theme
*/
function install_default_theme($theme) {
  install_enable_theme($theme);
  variable_set('theme_default', $theme);
}

/**
* Set admin theme
* @param        $theme  Unique string that is the name of theme
*/
function install_admin_theme($theme) {
  variable_set('admin_theme', $theme);
}

/**
 * Enable theme
 * @param        $theme  Unique string that is the name of theme
 */
function install_enable_theme($theme) {
  system_theme_data();
  db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' and name = '%s'", $theme);
  system_initialize_theme_blocks($theme);
}


?>
