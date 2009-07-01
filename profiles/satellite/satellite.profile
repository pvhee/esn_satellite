<?php

/**
 * Satellite Installation Profile
 * @author Youth Agora
 */

/**
 * Satellite version.
 */
define('YOUTHAGORA_TEMPLATE_VERSION',  '3.0-ESN');

/**
 * SQL Dump File for the installation profile.
 * 
 * This uses a modified version of the demo module allowing custom sql files for import.
 * You need to specify the location of the SQL file here. The demo module will also
 * look for a .info file with the same name in the same location.
 */
define('YOUTHAGORA_DUMP_FILE_MINIMAL',  'profiles/satellite/database/template.sql');
define('YOUTHAGORA_DUMP_FILE_FULL',     'profiles/satellite/database/development.sql');

/**
 * Address of the settings page the user is redirected to after installation.
 */
define('YOUTHAGORA_SETTINGS_PAGE',      'node/244/edit');

/**
 * Return an array of the modules to be enabled when this profile is installed.
 * 
 * We enable the demo module for mysql dump import, and the
 * ya_requirements to check for requirements for installation of the Youth Agora
 * template.
 *
 * @return
 *   An array of modules to enable.
 */
function satellite_profile_modules() {
  return array('demo', 'ya_requirements');
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile,
 *   and optional 'language' to override the language selection for
 *   language-specific profiles.
 */
function satellite_profile_details() {
	
  return array(
    'name' => 'ESN Satellite',
    'description' => 'Select this profile to install the ESN Satellite.',
  );
}

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function satellite_profile_task_list() {
  // This is the only profile method that is invoked before the first page is
  // displayed during the install sequence.  Use this opportunity to theme the
  // install experience.
  global $conf;
  $conf['site_name'] = 'ESN Satellite';
}

/**
 * Implementation of hook_profile_tasks(). 
 * 
 * Perfom a redirect after installation to the settings page.
 */
function satellite_profile_tasks(&$task, $url) {
  if($task == 'profile') {
    // skip task 'finished', and instead rewrite it here pointing to the correct settings page as the first page to visit
    drupal_set_title(st('@drupal installation complete', array('@drupal' => drupal_install_profile_name())));
    $messages = drupal_set_message();
    $output = '<p>'. st('Congratulations, @drupal has been successfully installed.', array('@drupal' => drupal_install_profile_name())) .'</p>';
    $output .= '<p>'. (isset($messages['error']) ? st('Please review the messages above before continuing on to <a href="@url">your new site</a>.', array('@url' => url(YOUTHAGORA_SETTINGS_PAGE))) : st('You may now visit <a href="@url">your new site</a> to continue with the configuration.', array('@url' => url(YOUTHAGORA_SETTINGS_PAGE)))) .'</p>';
    $task = 'done';
    return $output;
  }
}

/**
 * Implementation of hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function satellite_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {

    // the filesystem configuration
    $form['filesystem'] = array(
      '#title' => t('File System'),
      '#type' => 'fieldset',
    );
    $form['filesystem']['file_directory_path'] = array(
      '#type' => 'textfield',
      '#title' => t('File system path'),
      '#default_value' => 'sites/default/files',
      '#maxlength' => 255,
      '#description' => t('A file system path where the files will be stored. This directory must exist and be writable by Drupal. If the download method is set to public, this directory must be relative to the Drupal installation directory and be accessible over the web. If the download method is set to private, this directory should not be accessible over the web. Changing this location will modify all download paths and may cause unexpected problems on an existing site.'),
      '#required' => TRUE,
      '#after_build' => array('system_check_directory'),
    );
    $form['filesystem']['file_directory_temp'] = array(
      '#type' => 'textfield',
      '#title' => t('Temporary directory'),
      '#default_value' => '/tmp',
      '#maxlength' => 255,
      '#description' => t('A file system path where uploaded files will be stored during previews.'),
      '#required' => TRUE,
      '#after_build' => array('system_check_directory'),
    );

    /**
     * Do not give the option to install different dump files.
     */

    // the dump configuration
    // $form['dump'] = array(
    //   '#type' => 'fieldset',
    //   '#title' => st('Database information'),
    //   '#description' => st('Which configuration would you like to install?')
    // );
    

    // $form['dump']['file'] = array(
    //   '#type' => 'radios',
    //   '#options' => array(
    //     YOUTHAGORA_DUMP_FILE_FULL => st('A demo site. Use this to try out this website template.'),
    //     // YOUTHAGORA_DUMP_FILE_MINIMAL => st('A site with minimal content. Use this for building your site upon.')
    //   ),
    //   '#default_value' => YOUTHAGORA_DUMP_FILE_FULL, 
    // );

    $form['#submit'][] = 'satellite_form_submit';
  }
}


/**
 * Submit handler for the "install_configure" form.
 */
function satellite_form_submit($form, &$form_state) {   
  // Define the constant YOUTHAGORA_DUMP_FILE that will be used in the (modified) demo module
  // define('YOUTHAGORA_DUMP_FILE', $form_state['values']['file']);
  
  /**
   * Do not give the option to install different dump files
   */
  define('YOUTHAGORA_DUMP_FILE', YOUTHAGORA_DUMP_FILE_FULL);
  
  // Restore the database dump using the demo module and our constant YOUTHAGORA_DUMP_FILE
  module_load_include('inc', 'demo', 'demo.admin');
  demo_reset('', FALSE);

  // Store the Satellite version in the database
  variable_set('ya_satellite_version', YOUTHAGORA_TEMPLATE_VERSION);
  
  // all the other configuration, will overwrite the database
  if ($form_state['values']['file_directory_path']) {
    variable_set('file_directory_path', $form_state['values']['file_directory_path']);
  }
    
  if ($form_state['values']['file_directory_temp']) {
    variable_set('file_directory_temp', $form_state['values']['file_directory_temp']);
  }
  
  // Hmmm... have to call the proper submit handler ourselves? 
  install_configure_form_submit($form, $form_state);
}


