<?php
// $Id: slideshare.theme.inc,v 1.1 2009/03/07 14:53:00 antoniodemarco Exp $

/**
 * @file
 *
 * Theme functions for Slideshare integration module
 */

/**
 * Flash embed for the theme function
 *
 * @param $embed
 * @param $width
 * @param $height
 * @param $field
 * @param $item
 * @param $node
 * @param $autoplay
 * @return Themed slideshare embed
 */
function theme_slideshare_flash($embed, $width, $height, $field, $item, &$node, $autoplay) {
  return $item['data']['EMBED'][0];
}