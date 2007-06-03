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
  // Third party modules.
  // 'cck',
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

?>
