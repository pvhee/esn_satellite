<?php
// $Id: content_complete.theme.inc,v 1.1.2.1 2009/04/17 09:09:02 pvhee Exp $

/**
 * @file
 * Theme and template preprocessing code
 */

/**
 * Block Theme function that displays the default output of a content
 * complete percent. Use this theme function to override
 * the output / display of this block.
 *
 * @param $complete_data
 *   Assoc array of
 *   ['type'] - str - The machine-readable name of this content type.
 *   ['name'] - str - The human-readable name of this content type.
 *   ['nid'] - int - The node ID of the node from this content type.
 *   ['percent'] - int - A number that represents the total percent complete (ie 50).
 *   ['leq_percent'] - int - A number that the current percent is lower or equal to (ie 25, 50, 75 or 100).
 *   ['completed'] - int - How many fields total that have been completed (filled out).
 *   ['incomplete'] - int - How many fields still need to be filled out.
 *   ['total'] - int - The count of all tagged profile fields.
 *   ['nextfield'] - str - The next field to fill out that is currently empty.
 *   ['nextpercent'] - int - What the total percent complete value will be when ['nextfield'] is complete.
 *   ['nextname'] - str - The field name of the next field for field focus.
 */
function theme_content_complete_profile_percent_complete($complete_data) {
  // add CSS for theming
  drupal_add_css(drupal_get_path('module', 'content_complete') .'/content_complete.css');
  
  $id = $complete_data['type'];

  $output .= '<div id="cck-complete-wrapper-'. $id .'" class="cck-complete-wrapper">';
  $output .= t('!complete% complete', array(
    '!complete' => $complete_data['percent'] 
  ));
  $output .= '<div id="cck-complete-percent-bar-wrapper-'. $id .'" class="cck-complete-percent-bar-wrapper">';
  $output .= '<div id="cck-complete-percent-bar-'. $id .'" class="cck-complete-percent-bar cck-complete-percent-bar-leq-'. $complete_data['leq_percent'] .' cck-complete-percent-bar-'. $complete_data['percent'] .'" style="width: '. $complete_data['percent'] .'%"></div>';
  $output .= '</div>';
  $output .= '</div>';

  if ($complete_data['nextfield'] && $complete_data['nextpercent']) {
    $output .= t('Filling out <i>!nextfield</i> will bring !typename to !complete%.', array(
      '!nextfield' => l($complete_data['nextfield'], 'node/'. $complete_data['nid'] .'/edit', array(
        'query' => 'content_complete_fieldname='. $complete_data['nextname'] 
      )),
      '!typename' => $complete_data['name'],
      '!complete' => $complete_data['nextpercent']
    ));
  }
  
  return $output;
}
