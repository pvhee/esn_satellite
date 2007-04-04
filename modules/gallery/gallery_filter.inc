<?php
// $Id: gallery_filter.inc,v 1.1.2.2 2006/07/17 11:09:37 kiz0987 Exp $

/**
 * gallery.module : gallery_filter.inc
 * Gallery Filter functions (originally by MichelleC and Waldemar)
 */
 
// ***************** The Filter in Action ***********************

define('GALLERY__FILTER_WORD', 1);
define('GALLERY_FILTER_INTEGER', 2);
define('GALLERY_FILTER_STRING', 3);

function gallery_filter_attr_value($text, $value_type = GALLERY_FILTER_WORD) {
  // Strip off initial and final quotes.
	$first = substr($text, 0, 1);
	if ($first == "\"" || $first == "\'") {
		if (substr($text, -1, 1) == $first) {
			$text = substr($text, 1, -1);
		}
	}
	switch ($value_type) {
		case GALLERY_FILTER_WORD :
			return preg_replace("/\W/", '', $text);
		case GALLERY_FILTER_INTEGER :
			return preg_replace("/\D/", '', $text);
		default :
			return check_plain($text);
	}
}

// Execute filter on given text.
function gallery_filter_process($text) {
	// Find all the image codes and loop over them, replacing each with the Gallery2 image block
	$prefix = variable_get('gallery_filter_prefix', 'G2');

	$matchetxt = "/\[".trim($prefix).":(\d+)(\s*,)?\s*(.*?)\]/i";
	preg_match_all($matchetxt, $text, $matches, PREG_SET_ORDER);
	// If we have at least one match, set everything up
	if (count($matches) > 0) {
		// Set the default and path variables based on module settings
		$default_size = variable_get('gallery_filter_default_size', 150);
		$default_div_class = variable_get('gallery_filter_default_div_class', 'nowrap');
		$default_album_frame = variable_get('gallery_filter_default_album_frame', '');
		$default_item_frame = variable_get('gallery_filter_default_item_frame', '');
		$default_block_type = variable_get('gallery_filter_default_block_type', 'recentImage');
		$default_n_images = variable_get('gallery_filter_n_images', 1);
		$default_show = variable_get('gallery_filter_default_show', 'none');
		$default_link_target = variable_get('gallery_filter_default_link_target', '');

		if ($default_album_frame == 'none') {
			$default_album_frame = '';
		}
		if ($default_item_frame == 'none') {
			$default_item_frame = '';
		}

		// This will hold the list of frames used for images so we can add the CSS link(s) at the end
		$frame_list = array ();

		// This sets up the embedding
		list ($success, $ret) = _gallery_init(true);
		if (!$success) {
			gallery_error(t('Unable to initialize embedded Gallery'), $ret);
			return;
		}
	}
	foreach ($matches as $match) {
		// Pull out the arguments into the $args array
		$args = array ();
		preg_match_all("/(\w+)\=(\"[^\"]*\"|\S*)/", $match[3], $a, PREG_SET_ORDER);

		foreach ($a as $arg) {
			$args[strtolower($arg[1])] = $arg[2];
		}

		// Set number of images to show
		$n_images = gallery_filter_attr_value($args['n'], GALLERY_FILTER_INTEGER);
		if ($n_images == 0) {
			// No size specified; use the default
			$n_images = $default_n_images;
		}

		// Set the block type
		$block_type = gallery_filter_attr_value($args['type'], GALLERY_FILTER_WORD);
		if (empty($block_type)) {
			// No block type specified; use the default
			$block_type = $default_block_type;
		}
		if ($n_images <= 1)
			$block_type = 'specificItem'; //so it shows something if n=1 and an album is selected

		// Set the size of the thumbnail
		$size = gallery_filter_attr_value($args['size'], GALLERY_FILTER_INTEGER);
		if ($size == 0) {
			// No size specified; use the default
			$size = $default_size;
		}

		// Set the class of the div
		$div_class = gallery_filter_attr_value($args['class'], GALLERY_FILTER_WORD);
		if (empty ($div_class)) {
			// No class specified; use the default
			$div_class = $default_div_class;
		}
		// Switch the class to g2image versions (adds consistency)
		switch ($div_class) {
		case 'left':
		  $div_class = "g2image_float_left";
		  break;
		case 'right':
		  $div_class = "g2image_float_right";
		  break;
		case 'center':
		case 'centre':
		  $div_class = "g2image_centered";
		  break;
		case 'normal':
		  $div_class = "g2image_normal";
		  break;
		}
		// Set the overriding, album, and item frames
		$frame = gallery_filter_attr_value($args['frame'], GALLERY_FILTER_WORD);
		$album_frame = gallery_filter_attr_value($args['aframe'], GALLERY_FILTER_WORD);
		$item_frame = gallery_filter_attr_value($args['iframe'], GALLERY_FILTER_WORD);

		if (empty ($frame)) {
			// No overriding frame given; check for album_frame and item_frame
			if (empty ($album_frame)) {
				// No album frame specified; use the default one
				$album_frame = $default_album_frame;
			}

			if (empty ($item_frame)) {
				// No item frame specified; use the default one
				$item_frame = $default_item_frame;
			}

		} else {
			// Overriding frame given; use it
			$album_frame = $frame;
			$item_frame = $frame;
		}

		// Add the requested frames to the array so we can get the CSS later. Don't worry about
		// dupes at this point; they will be filtered out later.
		array_push($frame_list, $frame);
		array_push($frame_list, $album_frame);
		array_push($frame_list, $item_frame);

		// This part actually fetches the image block. It uses the same paramaters as the code
		// found under "Image Block" in site admin in Gallery2. 

		$show = $default_show;

		// Not customized yet:
		$link_target = $default_link_target;

		$param_blocks_array = array_fill(0, $n_images, $block_type);
		$params['itemId'] = $match[1];
		$params['blocks'] = is_array($param_blocks_array) ? implode('|', $param_blocks_array) : "";
		$param_show_array = $show;
		$params['show'] = is_array($param_show_array) ? implode('|', $param_show_array) : "";
		$params['maxSize'] = $size;
		// Add frames and link target using g2_filter code from MichelleC
		$params['albumFrame'] = $album_frame;
		$params['itemFrame'] = $item_frame;
		$params['linkTarget'] = $link_target;

    $g2_head = array();
    $block = array ();
		list ($ret, $content, $head) = GalleryEmbed::getImageBlock($params);
		if ($ret) {
			gallery_error(t('Unable to get Gallery image block'), $ret);
			return;
		} else {
			if ($content) { 
        // Add a div around the table for styling
        if ($div_class != 'none') {
          $content = '<div class ="giImageBlock '.$div_class.'">'.$content.'</div>';
        }
        // This puts the image block HTML back into the rest of the text
        $text = str_replace($match[0], $content, $text);
			}
      if ($head) {
        $g2_head[] = $head;
      }          
		}
	} // end of for loop through matches
	// If we had at least one match, finish up by adding the css. Unfotunately if there are multiple
	// images on a page this will get added multiple times.
	if (count($matches) > 0) {
		GalleryEmbed :: done();
    if ($g2_head) {
      gallery_set_html_head(implode("\n", array_unique($g2_head)));
    }
    theme_add_style(drupal_get_path('module', 'gallery') .'/gallery_filter.css');
	}
	return $text . "<br class=\"giImageBlock-clear-both\" />";;
}
?>