<?php
/**
 * Block theme controller by ESN Webteam
 * 
 * Block theme controller: you can specify custom theme 
 * for each block. The priority is:
 * 
 * 		- check for blocks/{module}-{delta}.tpl.php
 * 		- if not, check for blocks/{module}.tpl.php
 * 		- if not, use the blocks/default.tpl.php
 * 		- etc...
 */

$valid_filename = '/^([a-zA-Z0-9_-]+)$/';
$theme_dir = dirname(__FILE__).DIRECTORY_SEPARATOR.'blocks'.DIRECTORY_SEPARATOR;
$block_default = $theme_dir.'default.tpl.php';
	
if(preg_match($valid_filename, $block->module) && preg_match($valid_filename, $block->delta)) {

	$block_module = $theme_dir.$block->module.'.tpl.php';
	$block_module_delta = $theme_dir.$block->module.'-'.$block->delta.'.tpl.php';
	$block_module_region = $theme_dir.$block->module.'-'.$block->region.'.tpl.php';
	$block_module_delta_region = $theme_dir.$block->module.'-'.$block->delta.'-'.$block->region.'.tpl.php';
	
	if (file_exists($block_module_delta_region)) {
		include($block_module_delta_region);
	} elseif (file_exists($block_module_delta)) {
		include($block_module_delta);
	} elseif (file_exists($block_module_region)) {
		include($block_module_region);
	} elseif (file_exists($block_module)) {
		include($block_module);
	} else {
		include($block_default);
	}
}
?>