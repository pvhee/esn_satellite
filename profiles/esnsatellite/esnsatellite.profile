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

  // Include files necessary for CCK content type import.
  include_once('./'. drupal_get_path('module', 'node') .'/content_types.inc');
  include_once('./'. drupal_get_path('module', 'content') .'/content_admin.inc');

  // Create a News content type via CCK import.
  $values = array();
  $values['type_name'] ='<create>';
  $values['macro'] = <<<CONTENT_TYPE_DEF
  \$content[type]  = array (
  'name' => 'News',
  'type' => 'news',
  'description' => 'All your ESN related news. Posting as news will put the news item into a news page and promote a teaser (short version of your news with a small image) to your front page. Use this for all dynamic content on your site.',
  'title_label' => 'Title',
  'body_label' => 'Body',
  'min_word_count' => '10',
  'help' => 'Put here the content of your news item. You have to write at least 10 words.',
  'node_options' => 
  array (
    'status' => true,
    'promote' => true,
    'sticky' => false,
    'revision' => false,
  ),
  'comment' => '2',
  'upload' => '1',
  'event_nodeapi' => 'never',
  'signup_form' => false,
  'old_type' => 'news',
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
    'label' => 'Image',
    'weight' => '-2',
    'max_resolution' => 0,
    'image_path' => 'images-news',
    'custom_alt' => 1,
    'custom_title' => 1,
    'description' => 'Add an image. This will make your post visually more attractive.',
    'group' => false,
    'required' => '1',
    'multiple' => '0',
    'field_name' => 'field_image',
    'field_type' => 'image',
    'module' => 'imagefield',
  ),
  1 => 
  array (
    'widget_type' => 'text',
    'label' => 'Summary',
    'weight' => '-1',
    'rows' => '10',
    'description' => 'A brief description of the news content, max. 500 characters. Tip: You can easily copy and paste the first rows from the news body.',
    'default_value_widget' => 
    array (
      'field_summary' => 
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
    'max_length' => '500',
    'allowed_values' => '',
    'allowed_values_php' => '',
    'field_name' => 'field_summary',
    'field_type' => 'text',
    'module' => 'text',
  ),
);
CONTENT_TYPE_DEF;
drupal_execute("content_copy_import_form", $values);

  // Create a Partner content type via CCK import.
  $values = array();
  $values['type_name'] ='<create>';
  $values['macro'] = <<<CONTENT_TYPE_DEF
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
CONTENT_TYPE_DEF;
drupal_execute("content_copy_import_form", $values);

$newnode = new stdClass();
$newnode->title = 'Welcome to ESN Satellite 2.0';
$newnode->summary = '<p>Welcome to ESN Satellite 2.0, the free website template by the ESN International Webteam.</p>';
$newnode->body = '<p>ESN Satellite is the free website template for ESN sections, developed and maintained by the ESN International Webteam.</p>
<p><strong><a href="http://galaxy.esn.org/index.php/downloads/add">Get your Satellite now!</a><br> <a href="http://video.google.com/videoplay?docid=-1165840751291490364&amp;hl=en">Watch the Galaxy AGM 2007 movie in Google Video</a></strong></p>
<p>ESN Satellite is... </p>
<ul>
<li><strong>beautiful</strong>: a fresh, complete ESN looking design</li>
<li><strong>easy</strong>: if you can use webmail, you can master a Satellite</li>
<li><strong>unified</strong>: local, national and international websites share the same looks</li>

<li><strong>tailored</strong> to the needs of ESN sections</li>
<li><strong>high quality</strong> based on the widely adopted and solid Drupal  platform</li>
<li><strong>free </strong>for all sections, national boards and ESN event organizers </li>
<li><strong>part of the ESN Galaxy</strong></li>
</ul>';
$newnode->uid = 1;
$newnode->type = 'news';
$newnode->status = 1;
$newnode->promote = 1;
node_save($newnode);
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
