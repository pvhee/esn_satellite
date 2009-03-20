<?php

/**
 * SQL Dump File for the installation profile.
 * 
 * This uses a modified version of the demo module allowing custom sql files for import.
 * You need to specify the location of the SQL file here. The demo module will also
 * look for a .info file with the same name in the same location.
 */
define('YOUTHAGORA_DUMP_FILE', 'profiles/satellite/database/demo_site.sql');

/**
 * Satellite Installation Profile
 * @author Youth Agora
 */

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
  // $conf['theme_settings'] = array(
  //   'default_logo' => 0,
  //   'logo_path' => 'profiles/satellite/ESN.jpg');
  $conf['site_name'] = 'ESN Satellite';

	// return array(
	// 	'database' => st('DB Dump')
	// 	// 'report' => st('Set up Master Template')
	// );
}

function satellite_profile_tasks(&$task, $url) {
	// switch($task) {
	// 	case 'profile':
	// 	
	// 	
	// 	
	// }
	// if($task == 'profile') {
	// 	require_once 'profiles/default/default.profile';
	// 	default_profile_tasks($task, $url);
	// 	
	// 	// custom stuff
	// 	
	// 	// return control to the installer
	// 	$task = 'profile-finished';
	// }
	// else if($task == 'database') {
	// 	
	// }
}

// function master_database_form($form_state, $ur) {
// 	$form['#action'] = $url;
// 	$form['#redirect'] = FALSE;
// 
// }


/**
 * Implementation of hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function satellite_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    $form['#submit'][] = 'satellite_form_submit';
  }
}

/**
 * Submit handler for the "install_configure" form.
 */
function satellite_form_submit($form, &$form_state) {
  // Restore the database dump using the demo module and our constant YOUTHAGORA_DUMP_FILE
  module_load_include('inc', 'demo', 'demo.admin');
  demo_reset();

  // Hmmm... have to call the proper submit handler ourselves? 
  install_configure_form_submit($form, $form_state);
}
