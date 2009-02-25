<?php

/**
 * Intercept page template variables
 *
 * @param $vars
 *   A sequential array of variables passed to the theme function.
 */
function base_preprocess_page(&$vars) {
  
  // Hook into color.module
  if (module_exists('color')) {
    _color_page_alter($vars);
  }

}


/**
 * Sets the body-tag class attribute.
 *
 * Adds 'sidebar-left', 'sidebar-right' or 'sidebars' classes as needed.
 */
function base_body_class($left_top, $left, $left_bottom, $right_top, $right, $right_top) {
  $class = '';

  if (($left_top != '' || $left != '' || $left_bottom != '') && ($right_top != '' || $right != '' || $right_bottom != '')) {
    $class = 'sidebars';
  }
  else {
    if ($left_top != '' || $left != '' || $left_bottom != '') {
      $class = 'sidebar-left';
    }
    if ($right_top != '' || $right != '' || $right_bottom != '') {
      $class = 'sidebar-right';
    }
  }
  
  if (drupal_is_front_page()) {
    $class .= ' frontpage ';  
  }
  
  if (isset($class)) {
    print ' class="'. $class .'"';
  }
}

/**
 * Implementation of hook_theme()
 */
function base_theme($existing, $type, $theme, $path) {
  
  return array(
    'file_icon' => array(
    'arguments' => array(
    'file' => NULL 
  ), 'template' => 'file-icon' 
  ) 
  );
}


function base_menu_item_link($link) {
  
  if (empty($link['localized_options'])) {
    $link['localized_options'] = array(
       
    );
  }
  $link['localized_options']['html'] = true;
  
  if ($link['menu_name'] == 'primary-links') {
    list ( $top, $bottom ) = explode('-', $link['title']);
    $link['title'] = '<span class="l_top">' . $top . '</span><span class="l_bottom">' . $bottom . '</span>';
    return l($link['title'], $link['href'], $link['localized_options']);
  } else {
    return l('<span>' . $link['title'] . '</span>', $link['href'], $link['localized_options']);
  }
}

function base_color_scheme_form($form) {
  // Include stylesheet
  $theme = $form['theme']['#value'];
  $info = $form['info']['#value'];
  $path = drupal_get_path('theme', $theme) . '/';
  drupal_add_css($path . $info['preview_css']);
  $output = '';
  // Wrapper
  $output .= '<div class="color-form clear-block">';
  
  // Color schemes
  $output .= drupal_render($form['scheme']);
  
  // Palette
  $output .= '<div id="palette" class="clear-block">';
  foreach (element_children($form['palette']) as $name) {
    $output .= drupal_render($form['palette'][$name]);
  }
  $output .= '</div>';
  
  // Preview
  $output .= drupal_render($form);
  $output .= '<h2>' . t('Preview') . '</h2>';
  $output .= '<div id="preview"><div id="text">
		<h2 class="p_title">Master Template</h2>
		<div class="p_subtitle">Ut enim ad minim veniam quis nostrud</div>
		<div class="p_menu"><a href="#" class="first">HOME</a><a href="#">ABOUT US</a><a href="#">APPLY ONLINE</a><a href="#">CONTACT US</a></div>
		<h2>Spotlight</h2><p>Sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud <a href="#">exercitation ullamco</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div><div id="img" style="background-image: url(' . base_path() . $path . $info['preview_image'] . ')"></div></div>';
  
  // Close wrapper
  $output .= '</div>';
  
  return $output;
}


/**
 * Enter description here...
 *
 * @param unknown_type $path
 * @param unknown_type $alt
 * @param unknown_type $title
 * @param unknown_type $attributes
 * @param unknown_type $getsize
 */
//function base_image($path, $alt = '', $title = '', $attributes = NULL, $getsize = TRUE) {
//	
//  if (!is_file($path)) {
//    $base_path = drupal_get_path('theme', 'base');
//    $path = $base_path.'/images/image.png';
//  }
//	
//	return theme_image($path, $alt, $title, $attributes, $getsize);
//}

/**
 * If no image is found then fallback to a custom image.
 *
 * @param $namespace
 * @param $path
 * @param $alt
 * @param $title
 * @param $attributes
 * @return unknown
 */
function base_imagecache($namespace, $path, $alt = '', $title = '', $attributes = NULL) {
  if (!is_file($path)) {
    $base_path = drupal_get_path('theme', 'base');
    $path = $base_path.'/images/image.png';
  }
	return theme_imagecache($namespace, $path, $alt, $title, $attributes);
}
	

/**
 * Mimetypes mapping
 * 
 * application-octet-stream
 * application-pdf
 * application-x-executable
 * audio-x-generic
 * image-x-generic
 * package-x-generic
 * text-html
 * text-plain
 * text-x-generic
 * text-x-script
 * video-x-generic
 * x-office-document
 * x-office-presentation
 * x-office-spreadsheet
 *
 * @param unknown_type $file
 * @return unknown
 */
function base_filefield_file($file) {
	global $base_path;
	
	if (!$file['filepath']) {
		return '';
	}
	
	$path = $file['filepath'];
  $mime = check_plain($file['filemime']);
  $dashed_mime = strtr($mime, array('/' => '-')); 
  switch ($dashed_mime) {
    case 'application-pdf':
      $ext = 'pdf';
    break;
   case 'text-x-script': 
   case 'text-x-generic':
   case 'text-plain':
   	$ext = 'txt';
    break;
    case 'x-office-document':
      $ext = 'doc';
    break;
    case 'image-x-generic':
      $ext = 'image';
    break;
    case 'x-office-presentation':
      $ext = 'ppt';
    break;
    case 'x-office-spreadsheet':
      $ext = 'xls';
    break;
    case 'text-html':
      $ext = 'html';
    break;
    case 'video-x-generic':
      $ext = 'video';
    break;
    case 'package-x-generic':
    	$ext = 'zip';
    break;
    case 'audio-x-generic':
      $ext = 'audio';
    break;
    default:
  		$ext = 'default';
  	break;
  }
  $icon_url = $base_path.drupal_get_path('theme', 'base').'/images/icons/mimetypes/default/32x32/'.$ext.'.png';
  
  $url = file_create_url($path);
  $icon = '<img class="field-icon-'. $dashed_mime .'"  alt="'. $mime .' icon" src="'. $icon_url .'" />';
  $icon = '<div class="filefield-icon field-icon-'. $dashed_mime .'">'. $icon .'</div>';

  $options = array('attributes' => array('type' => $file['filemime'], 'length' => $file['filesize']));
  $options['attributes']['title'] =  (isset($file['data']['description'])) ? $file['data']['description'] : $file['filename'];
  $max_len = 19;
  $filename = strlen($file['filename']) > $max_len ? substr($file['filename'], 0, $max_len).'...' : $file['filename'];
  $title = $file['data']['description'] ? $file['data']['description'] : $filename;
  $description = '<div class="file-name">'.$filename.' ('.format_size($file['filesize']).')</div>';
  return '<div class="filefield-file clear-block">'. $icon . '<div class="file-description">'.l($title, $url, $options).'</div>'.$description.'</div>';
}



/**
 * Theme a single comment block.
 *
 * @param $comment
 *   The comment object.
 * @param $node
 *   The comment node.
 * @param $links
 *   An associative array containing control links.
 * @param $visible
 *   Switches between folded/unfolded view.
 * @ingroup themeable
 */
function base_comment($comment, $node, $links) {
  
  $output = '<div class="blog-container">';
  $output .= '<div class="top"><div class="round w1"><div class="round w2"><div class="round w3"><div class="round w4">';
  $output .= '<div class="comment-title">'.$comment->subject.'</div>';
  $output .= $comment->comment;
  $output .= '<div class="comment-links">'.theme('links', $links).'</div>';
  $output .= '</div></div></div></div></div>';
  $output .= '<div class="bottom"><b>'.t('Posted by:').'</b> '.theme('username', $comment).' - '.format_date($comment->timestamp, 'large').'</div>';
  $output .='</div>';
  
  return $output;
}




/**
 * Override theme_button
 *
 * @param Form element $element
 * @return New button style
 */
// function phptemplate_button($element) {
//   // Make sure not to overwrite classes.
//   if (isset($element['#attributes']['class'])) {
//     $element['#attributes']['class'] = 'form-' . $element['#button_type'] . ' ' . $element['#attributes']['class'];
//   } else {
//     $element['#attributes']['class'] = 'form-' . $element['#button_type'];
//   }
//   
//   // We here wrap the output with a couple span tags
//   return '<span class="button"><span><input type="submit" ' . (empty($element['#name']) ? '' : 'name="' . $element['#name'] . '" ') . 'id="' . $element['#id'] . '" value="' . check_plain($element['#value']) . '" ' . drupal_attributes($element['#attributes']) . " /></span></span>\n";
// }

/**
 * Override theme_date_popup()
 */
function base_date_popup($element) {
  $output = '';
  $class = 'container-inline-date';
  // Add #date_float to allow date parts to float together on the same line. 
  if (empty($element['#date_float'])) {
    $class .= ' date-clear-block';
  }
  if (isset($element['#children'])) {
    $output = $element['#children'];
  }

  /**
   * Hack: This appears as "Date From date" and "Date To date" in an
   * unpatched version, where "Date" is the field label.
   * Recheck when the date module is updated.
   */  
  $labels = array(
    t('From date') => t('Start date'), 
    t('To date') => t('End date'),
  );
  foreach($labels as $label => $override) {
    $match = $element['#field']['widget']['label'] .' '. $label;
    if($element['#title'] == $match) {
      $element['#title'] = $override;
    }
  }

  return '<div class="'. $class .'">'. theme('form_element', $element, $output) .'</div>';
}
