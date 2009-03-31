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
  
  if (file_exists($data['header'])) {
    $css = '<style type="text/css" media="all"> #wrapper #container #header {background: url("'.$base_path.$file_directory_path.'/imagecache/header/'.$data['header'].'") top left no-repeat;}</style>';
  } 
  else {
    $css = '<style type="text/css" media="all">  #wrapper #container #header {background: url("'.$base_path.$theme.'/images/default_header.png") top left no-repeat;}</style>';
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