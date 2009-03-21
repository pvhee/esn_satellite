<?php

function satellite_get_ie_styles() {
  // $index = rand() / 4;
  // $css .= '<style type="text/css" media="all">@import "'. base_path() . path_to_theme() .'/fix-ie-rtl.css";</style>';
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
    $out .= l(t('Edit Block'), 'admin/build/block/configure/' . $block->module . '/' . $block->delta, array('query' => drupal_get_destination()));
    $out .= '</div>';
  }
  return $out;
}