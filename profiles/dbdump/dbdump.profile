<?php
/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *  An array of modules to be enabled.
 */
function dbdump_profile_modules() {
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 * An array with keys 'name' and 'description' describing this profile.
 */
function dbdump_profile_details() {
   return array(
      'name' => st('ESN Satellite 2.0'),
      'description' => st('Select this profile to install ESN Satellite using a DATABASE DUMP. <b>This is the
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
function dbdump_profile_final() {	
	$lines = file('./profiles/dbdump/satellite.sql'); // set to the .sql file
	$str = "";
	$ctr = $fail = 0;
	foreach ($lines as $line) {
		if(substr($line, 0, 2) == "--") { continue; } // skip comment lines
		$str .= trim($line);
		if(substr($str, -1, 1) == ";") { // MySQL end of command reached
			$str = substr($str, 0, strlen(trim($str)) - 1); // remove ";"
			if(strlen($str) > 0) {
				// Note: modify to omit table structure, or omit structure in dump
				// Note: $str should be tested for validity; some entries seem to be invalid in dump
				(mysql_query($str) ? $ctr++ : $fail++); // Could prob use db_query
				$str = "";
			}
		}
	}
}


?>
