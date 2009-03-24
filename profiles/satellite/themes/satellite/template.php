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

  $token = token_get_values('esn');
  $data = array_combine($token->tokens, $token->values);
  
  if (file_exists($data['header'])) {
//    $css = '<style type="text/css" media="all"> #wrapper #container #header {background: url('.$base_path.$data['header'].') top left no-repeat;}</style>';
    $css = '<style type="text/css" media="all"> #wrapper #container #header {background: url('.$base_path.'sites/default/files/imagecache/header/'.$data['header'].') top left no-repeat;}</style>';
  } 
  else {
    $css = '<style type="text/css" media="all">  #wrapper #container #header {background: url('.$base_path.$theme.'/images/default_header.png) top left no-repeat;}</style>';
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
  $out = '';
  if (user_access('administer blocks')) {
    $out = '<div class="block-edit-link">';
    $out .= l(t('Edit Block'), 'admin/build/block/configure/' . $block->module . '/' . $block->delta, array('query' => drupal_get_destination() ));
    $out .= '</div>';
  }
  return $out;
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