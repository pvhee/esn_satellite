<?php
// $Id: gallery_g2image.inc,v 1.1 2006/03/24 14:04:52 kiz0987 Exp $

/**
 * gallery.module : gallery_g2image.inc
 * Support functions for g2image by capt_kirk (from http://g2image.steffensenfamily.com)
 */
 
 /**
 * Add js to page
 */
 function gallery_g2image_add_js() {
  // Ensure only sent once
  static $sent = false;
  if (!$sent) {
    $path = drupal_get_path('module', 'gallery');
    $g2image_uri = base_path() . $path . '/g2image/';
  
    $output .= '<script type="text/javascript">';
    $output .= '  var G2IMAGE_URI = "' . $g2image_uri . '";';
    $output .= '</script>';
    
    drupal_set_html_head($output);
    drupal_add_js($path . '/g2image.js');
    $sent = true;
  }
}
 
 /**
 * Theme for adding an image link underneath textareas
 */
function theme_gallery_g2image_textarea_link($element, $link) {
  $output = '<div class="g2image-button"><a class="g2image-link" id="g2image-link-'. $element['#id']
    . '" title="'. t('Click here to add images from Gallery2 albums') 
    . '" href="#" onclick="g2ic_open(\''.$element['#id'].'\');">';  
  $output .= t('add Gallery2 images');
  $output .= '</a></div>';
  
  return $output;
}

/**
 * Determine if g2image button should be attached to the page/textarea.
 * (from img_assist and tinymce code)
 *
 * @return
 *   TRUE if can render, FALSE if not allowed.
 */     
function _gallery_g2image_page_match() {
  //if (variable_get('gallery_g2image_std_all', 1)) {
  $page_match = FALSE;
  $only_listed_pages = variable_get('gallery_g2image_only_listed_pages', 1);
  $pages = variable_get('gallery_g2image_std_pages', gallery_help('admin/settings/gallery_g2image#pages'));
  if ($pages) {
    $path = drupal_get_path_alias($_GET['q']);
    $regexp = '/^('. preg_replace(array('/(\r\n?|\n)/', '/\\\\\*/', '/(^|\|)\\\\<front\\\\>($|\|)/'), array('|', '.*', '\1'. variable_get('site_frontpage', 'node') .'\2'), preg_quote($pages, '/')) .')$/';      
    $page_match = !($only_listed_pages xor preg_match($regexp, $path));    
  }
  return $page_match;  
} 
 
 ?>