<?php

/**
 * Implementation of THEMEHOOK_settings() function.
 *
 * @param $saved_settings
 *   array An array of saved settings for this theme.
 * @return
 *   array A form array.
 */
function conference_settings($saved_settings) {
	/*
   * The default values for the theme variables. Make sure $defaults exactly
   * matches the $defaults in the template.php file.
   */
		$defaults = array(
			'garland_happy' => 1, 
			'garland_shoes' => 0);
		
		// Merge the saved variables and their default values
		$settings = array_merge($defaults, $saved_settings);
	

	//	$form['organiser'] = array(
	//		'#type' => 'fieldset', 
	//		'#title' => t('Organiser information'), 
	//		'#description' => t('Information about the conference organiser.'), 
	//		'#attributes' => array(
	//			'class' => 'theme-settings-bottom'));
	



	// Check for a new uploaded logo, and use that instead.
	if ($file = file_save_upload('org_logo_upload', array(
		'file_validate_is_image' => array()))) {
		$parts = pathinfo($file->filename);
		$filename = ($key) ? str_replace('/', '_', $key) . '_logo.' . $parts['extension'] : 'logo.' . $parts['extension'];
		
		// The image was saved using file_save_upload() and was added to the
		// files table as a temporary file. We'll make a copy and let the garbage
		// collector delete the original upload.
		if (file_copy($file, $filename, FILE_EXISTS_REPLACE)) {
			$_POST['default_org_logo'] = 0;
			$_POST['org_logo_path'] = $file->filepath;
			$_POST['toggle_logo'] = 1;
		}
	}
	

	$form['org_logo'] = array(
		'#type' => 'fieldset', 
		'#title' => t('Organiser logo image settings'), 
		'#description' => t('If toggled on, the following logo will be displayed.'), 
		'#attributes' => array(
			'class' => 'theme-settings-bottom'));
	$form['org_logo']["default_org_logo"] = array(
		'#type' => 'checkbox', 
		'#title' => t('Use the default logo'), 
		'#default_value' => $settings['default_org_logo'], 
		'#tree' => FALSE, 
		'#description' => t('Check here if you want the theme to use the logo supplied with it.'));
	$form['org_logo']['org_logo_path'] = array(
		'#type' => 'textfield', 
		'#title' => t('Path to custom logo'), 
		'#default_value' => $settings['org_logo_path'], 
		'#description' => t('The path to the file you would like to use as your logo file instead of the default logo.'));
	
	$form['org_logo']['org_logo_upload'] = array(
		'#type' => 'file', 
		'#title' => t('Upload logo image'), 
		'#maxlength' => 40, 
		'#description' => t("If you don't have direct file access to the server, use this field to upload your logo."));
	

	// Return the additional form widgets
	return $form;
}