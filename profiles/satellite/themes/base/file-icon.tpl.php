<?php

/**
 * Theme file icon according to mime type
 * an 'icons' directory should be placed inside your default files direcotry
 * containing the file icons. Icon names should follow their Mime sub-type.
 * Apart from the two generic types 'image' & 'text'
 */

// Check if directory icons in current theme exists otherwise, no point, right
$icon_ext = '.png'; //Change your supported format png for example
$path     = path_to_theme().'/icons';

if( !is_dir($path) ) {
	return;
}
//Get filemime type act accordingly
$mime       = explode('/', $file->filemime);
$type       = $mime[0];
$sub_type   = $mime[1];
$output     = '';
$defult_icn = $path.'/default'.$icon_ext;
$attributes = array('class' => 'file_icon');
switch($type) {
	case 'image':
		$img_path = $path.'/image'.$icon_ext;
		if( is_file($img_path) ){
			$output .= theme_image($img_path, $file->filename, $file->description, $attributes);
		}
		else if( is_file($defult_icn) ) {
			$output .= theme_image($defult_icn, $file->filename, $file->description, $attributes);
		}
		break;
	case 'text':
		$txt_path = $path.'/text'.$icon_ext;
		if( is_file($txt_path) ){
			$output .= theme_image($txt_path, $file->filename, $file->description, $attributes);
		}
		else if( is_file($defult_icn) ) {
			$output .= theme_image($defult_icn, $file->filename, $file->description, $attributes);
		}
		break;
	case 'application':
		$app_path = $path.'/'.$sub_type.$icon_ext;
		if( is_file($app_path) ){
			$output .= theme_image($app_path, $file->filename, $file->description, $attributes);
		}
		else if( is_file($defult_icn) ) {
			$output .= theme_image($defult_icn, $file->filename, $file->description, $attributes);
		}
		break;
	default:
		if( is_file($defult_icn) ) {
			$output .= theme_image($defult_icn, $file->filename, $file->description, $attributes);
		}
		break;
}

echo $output;


?>