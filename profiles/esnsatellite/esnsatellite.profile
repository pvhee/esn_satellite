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
  'block', 'filter', 'help', 'node', 'poll', 'system', 'user', 'watchdog',
  // Enable optional core modules.
  'color', 'comment', 'menu', 'taxonomy',
  // Enable CCK modules. CCK is 'content', CCK export is 'content_copy'.
  'content', 'content_copy', 'fieldgroup', 'nodereference', 'number', 'optionwidgets', 'text', 'userreference',
  // More optional core modules.
  'help', 'throttle', 'search', 'statistics',
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

  // Create content type: News.
  // http://api.drupal.org/api/file/developer/hooks/node.php/5/source
  $node_type = array(
   'name' => st('News'),
   // AP: This is undocumented.
   'type' => 'news',
   'module' => 'node',
   'description' => st('All your ESN related news. Posting as news will put the news item into a news page and promote a teaser (short version of your news with a small image) to your front page. Use this for all dynamic content on your site.'),
   'has_title' => TRUE,
   'title_label' => st('Title'),
   'has_body' => TRUE,
   'body_label' => st('Body'),
   'min_word_count' => 10,
   'locked' => FALSE,
   // AP: the following are undocumented.
   'custom' => TRUE,
   'modified' => TRUE,
   'orig_type' => 'news',
   'is_new' => TRUE,
  );
  node_type_save((object) $node_type);
  // News should be published and promoted to front page by default.
  // News should create new revisions by default.
  variable_set('node_options_news', array('status', 'revision', 'promote'));
  // If comments can be enabled, enable them for news.
  variable_set('comment_news', COMMENT_NODE_READ_WRITE);

  // Include files necessary for CCK content type import.
  include_once './'. drupal_get_path('module', 'node') .'/content_types.inc';
  include_once('./'. drupal_get_path('module', 'content') .'/content_admin.inc');

  // Create a Partner content type via CCK import.
  $values = array();
  $values['type_name'] ='<create>';
  $values['macro'] = <<<TOPICS
    \$content[type]  = array (
      'name' => 'Partner',
      'type' => 'partner',
      'description' => 'A partner from your ESN section, e.g. giving you ESN card discounts or sponsoring your section. Partners are grouped together and fetched in the ESN Galaxy.',
      'title_label' => 'Title',
      'body_label' => 'Body',
      'min_word_count' => '0',
      'help' => '',
      'node_options' => 
      array (
        'status' => true,
        'promote' => false,
        'sticky' => false,
        'revision' => false,
      ),
      'comment' => '0',
      'upload' => '1',
      'event_nodeapi' => 'never',
      'signup_form' => false,
      'old_type' => 'partner',
      'orig_type' => '',
      'module' => 'node',
      'custom' => '1',
      'modified' => '1',
      'locked' => '0',
    );
    \$content[fields]  = array (
      0 => 
        array (
          'widget_type' => 'image',
          'label' => 'Logo',
          'weight' => '-3',
          'max_resolution' => 0,
          'image_path' => 'images-partner',
          'custom_alt' => 1,
          'custom_title' => 1,
          'description' => 'Put here the logo of your partner.',
          'group' => false,
          'required' => '1',
          'multiple' => '0',
          'field_name' => 'field_logo',
          'field_type' => 'image',
          'module' => 'imagefield',
        ),
      1 => 
        array (
    'widget_type' => 'text',
    'label' => 'Short Description',
    'weight' => '-1',
    'rows' => '7',
    'description' => '',
    'default_value_widget' => 
    array (
      'field_shortdescription' => 
      array (
        0 => 
        array (
          'value' => '',
        ),
      ),
    ),
    'default_value_php' => '',
    'group' => false,
    'required' => '1',
    'multiple' => '0',
    'text_processing' => '0',
    'max_length' => '',
    'allowed_values' => '',
    'allowed_values_php' => '',
    'field_name' => 'field_shortdescription',
    'field_type' => 'text',
    'module' => 'text',
  ),
  2 => 
  array (
    'widget_type' => 'link',
    'label' => 'Partner website',
    'weight' => '1',
    'description' => 'Put here the website of your partner.',
    'default_value_widget' => 
    array (
      'field_logolink' => 
      array (
        0 => 
        array (
          'url' => '',
          'title' => '',
        ),
      ),
    ),
    'default_value_php' => '',
    'group' => false,
    'required' => '0',
    'multiple' => '0',
    'title' => 'optional',
    'display' => 
    array (
      'url_cutoff' => '80',
    ),
    'attributes' => 
    array (
      'target' => 'default',
      'rel' => 0,
      'class' => '',
    ),
    'field_name' => 'field_logolink',
    'field_type' => 'link',
    'module' => 'link',
  ),
);
drupal_execute("content_copy_import_form", $values);


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
