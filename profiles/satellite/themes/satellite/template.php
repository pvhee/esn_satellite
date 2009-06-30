<?php

  
function satellite_get_ie_styles() {
  // $css .= '<style type="text/css" media="all">@import "'. base_path() . path_to_theme() .'/fix-ie-rtl.css";</style>';
  return $css;
}

/**
 * Select a diferent footer image at every reload. 
 *
 * @return CSS
 */
function satellite_footer_change() {
  global $base_path;
  $colors = array('green', 'blue', 'orange', 'pink');
  $theme = drupal_get_path('theme', 'satellite');
  $key = array_rand($colors);
  $css = '<style type="text/css" media="all">#inner-footer {background-image: url('.$base_path.$theme.'/images/layout/footer_'.$colors[$key].'.png);}</style>';
  return $css;
}

/**
 * Select a diferent footer image at every reload. 
 *
 * @return CSS
 */
function satellite_header_background() {
  global $base_path;
  $theme = drupal_get_path('theme', 'satellite');
  $file_directory_path = file_directory_path();

  $token = token_get_values('esn');
  $data = array_combine($token->tokens, $token->values);
  
  $css = '';
    if (file_exists($data['header'])) {
	  if ($data['default_header'] == 1) {
        $css .= '<style type="text/css" media="all"> #wrapper #container #footer-fade {background: url("'.$base_path.$file_directory_path.'/imagecache/header/'.$data['header'].'") top left no-repeat;}</style>';
      }	
	  if ($data['default_header'] == 0) {
        $css .= '<style type="text/css" media="all"> #wrapper #container #footer-fade {background: url("'.$base_path.$file_directory_path.'/imagecache/header/'.$data['header'].'") top left no-repeat;}</style>';
	    $css .= '<style type="text/css" media="all"> #shadow-top { background: transparent url("'.$base_path.$theme.'/images/layout/shadow_top_clean.png") top center no-repeat;}</style>';
	  }
	  if ($data['default_header'] == 2) {
	    $css .= '<style type="text/css" media="all"> #wrapper #container #footer-fade { background: transparent url("'.$base_path.$file_directory_path.'/imagecache/header_star/'.$data['header'].'") top center no-repeat;}</style>';
	    $css .= '<style type="text/css" media="all"> #shadow-top { background: transparent url("'.$base_path.$theme.'/images/layout/shadow_top_clean.png") top center no-repeat;}</style>';
	  }
    } 
    else {
      $css .= '<style type="text/css" media="all">  #wrapper #container #header #header-title {background: url("'.$base_path.$theme.'/images/default_header.png") top left no-repeat;}</style>';
    }
  return $css;
}

/**
 * Print edit block link in block templates files
 *
 * @param $block
 * @return Block link
 */
function satellite_block_edit_link(&$block) {
  return base_block_edit_link($block);
}

/**
 * Insert a span in every link for a better styling.
 *
 * @param $link
 * @return item link
 */
function satellite_menu_item_link($link) {
  if (empty($link['localized_options'])) {
    $link['localized_options'] = array( );
  }
  $link['localized_options']['html'] = true;
  return l('<span>' . $link['title'] . '</span>', $link['href'], $link['localized_options']);
}

/**
 * Theme override of theme_block_fbconnect, use imagecache 'user_image_facebook' to format user pictures
 * in the block provided by facebook.
 */
function satellite_render_friends_list_fbconnect($data, $title) {
  $imagecache_action = 'user_image_facebook';
  
  if (!empty($data)) {
    $items = '<h3>'.t('My friends').'</h3>';
    
    foreach ($data as $account) {
      if($account->picture && file_exists($account->picture)) {
        
        $alt = t("@user's picture", array('@user' => $account->name ? $account->name : variable_get('anonymous', t('Anonymous'))));
        $picture = theme('imagecache', $imagecache_action, $account->picture, $alt, $alt);
        
        if (!empty($account->uid) && user_access('access user profiles')) {
          $attributes = array('attributes' => array('title' => t('View user profile.')), 'html' => TRUE);
          $picture = l($picture, "user/$account->uid", $attributes);
        }
         
      }
      $items .= '<div class="picture">'.$picture.'</div>'; 
    }
    
    return $items;
  }
}

/**
 * Theme override for the loggedinblock that shows for logged-in users:
 * Turn the username into a link to the user page.
 */
function satellite_lt_loggedinblock(){
  global $user;
  return theme('username', $user) .' | ' . l(t('Log out'), 'logout');
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
function satellite_filefield_file($file) {
  global $base_path;
  
  if (! $file['filepath']) {
    return '';
  }
  
  $path = $file['filepath'];
  $mime = check_plain($file['filemime']);
  $dashed_mime = strtr($mime, array('/' => '-' ));
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
    case 'application-msword':
      $ext = 'doc';
      break;
    case 'image-x-generic':
      $ext = 'image';
      break;
    case 'application-vnd.ms-powerpoint':
    case 'application-ms-powerpoint':
    case 'x-office-presentation':
      $ext = 'ppt';
      break;
    case 'application-vnd.ms-excel':
    case 'application-ms-excel':
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
  $icon_url = $base_path . drupal_get_path('theme', 'base') . '/images/icons/mimetypes/default/32x32/' . $ext . '.png';
  
  $url = file_create_url($path);
  $icon = '<img class="field-icon-'. $dashed_mime .'"  alt="'. $mime .' icon" src="'. $icon_url .'" />';
  $icon = '<div class="filefield-icon field-icon-'. $dashed_mime .'">'. $icon .'</div>';

  $file['data'] = @unserialize($file['data']) ? @unserialize($file['data']) : $file['data'];  
  
  $options = array('attributes' => array('type' => $file['filemime'], 'length' => $file['filesize']));
  $options['attributes']['title'] =  (isset($file['data']['description'])) ? $file['data']['description'] : $file['filename'];
  $max_len = 19;
  // $filename = strlen($file['filename']) > $max_len ? substr($file['filename'], 0, $max_len) . '...' : $file['filename'];
  $filename = $file['filename'];
  $title = $file['data']['description'] ? $file['data']['description'] : $filename;
  $description = '<div class="file-name">' . $filename . ' (' . format_size($file['filesize']) . ')</div>';
  return '<div class="filefield-file clear-block">' . $icon . '<div class="file-description">' . l($title, $url, $options) . '</div>' . $description . '</div>';
}


function satellite_signup_user_form(&$node) {
  return module_exists('ya_signup_cck') ? ya_signup_cck_get_form($node) : theme_signup_user_form($node);
}


