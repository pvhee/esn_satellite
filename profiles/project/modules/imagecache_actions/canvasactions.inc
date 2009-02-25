<?php
// $ID: $
/**
 * Helper functions for the text2canvas action for imagecache
 * 
 */

/**
 * Implementation of imagecache_hook_form()
 *
 * Settings for preparing a canvas.
 *
 * @param $action array of settings for this action
 * @return a form definition
 */
function canvasactions_definecanvas_form($action) {
  $defaults = array(
    'RGB' => array(
      'HEX' => '#333333',
    ),
    'under' => TRUE,
    'exact' => array( 
      'width' => '',
      'height' => '',
    ),
    'relative' => array(
      'leftdiff' => '10',
      'rightdiff' => '10',
      'topdiff' => '10',
      'bottomdiff' => '10',
    ),
  );
  $action = array_merge($defaults, (array)$action);

  $form = array(
    'RGB' => imagecache_rgb_form($action['RGB']),
    'help' => array(
      '#type' => 'markup',
      '#value' => '<p>'. t('Enter no color value for transparent. This will have the effect of adding clear margins around the image.') .'</p>',
    ),
    'under' => array(
      '#type' => 'checkbox',
      '#title' => t('Resize canvas <em>under</em> image (possibly cropping)'),
      '#default_value' => $action['under'],
      '#description' => t('If <em>not</em> set, this will create a solid flat layer, probably totally obscuring the source image'),
    ),
  );
  $form['info'] = array('#value' => t('Enter values in ONLY ONE of the below options. Either exact or relative. Most values are optional - you can adjust only one dimension as needed. If no useful values are set, the current base image size will be used.'));
  $form['exact'] = array(
      '#type' => 'fieldset',
      '#collapsible' => true,
      '#title' => 'Exact size',
      'help' => array(
        '#type' => 'markup',
        '#value' => '<p>'. t('Set the canvas to a precise size, possibly cropping the image. Use to start with a known size.'). '</p>',
      ),
      
      'width' => array(
        '#type' => 'textfield',
        '#title' => t('Width'),
        '#default_value' => $action['exact']['width'],
        '#description' => t('Enter a value in pixels or percent'),
        '#size' => 5,
      ),
      'height' => array(
        '#type' => 'textfield',
        '#title' => t('Height'),
        '#default_value' => $action['exact']['height'],
        '#description' => t('Enter a value in pixels or percent'),
        '#size' => 5,
      ),
    );
  $form['exact'] = array_merge($form['exact'], imagecacheactions_pos_form($action['exact']));
  if(! $action['exact']['width'] && !$action['exact']['height']) {
    $form['exact']['#collapsed'] = true;
  }

  $form['relative'] = array(
      '#type' => 'fieldset',
      '#collapsible' => true,
      '#title' => t('Relative size'),
      'help' => array(
        '#type' => 'markup',
        '#value' => '<p>'. t('Set the canvas to a relative size, based on the current image dimensions. Use to add simple borders or expand by a fixed amount. Negative values may crop the image.') .'</p>',
      ),
      'leftdiff' => array(
        '#type' => 'textfield',
        '#title' => t('left difference'),
        '#default_value' => $action['relative']['leftdiff'],
        '#size' => 6,
        '#description' => t('Enter an offset in pixels.'),
      ),
      'rightdiff' => array(
        '#type' => 'textfield',
        '#title' => t('right difference'),
        '#default_value' => $action['relative']['rightdiff'],
        '#size' => 6,
        '#description' => t('Enter an offset in pixels.'),
      ),
      'topdiff' => array(
        '#type' => 'textfield',
        '#title' => t('top difference'),
        '#default_value' => $action['relative']['topdiff'] ,
        '#size' => 6,
        '#description' => t('Enter an offset in pixels.'),
      ),
      'bottomdiff' => array(
        '#type' => 'textfield',
        '#title' => t('bottom difference'),
        '#default_value' => $action['relative']['bottomdiff'],
        '#size' => 6,
        '#description' => t('Enter an offset in pixels.'),
      ),
    );
  if(! $action['relative']['leftdiff'] && !$action['relative']['rightdiff'] && !$action['relative']['topdiff'] && !$action['relative']['bottomdiff']) {
    $form['relative']['#collapsed'] = true;
  }

  $form['#submit'][] = 'canvasactions_definecanvas_form_submit';
  return $form;
}

/**
 * Implementation of theme_hook() for imagecache_ui.module
 */
function theme_canvasactions_definecanvas($element) {
  $action = $element['#value'];
  if ($action['exact']['width'] || $action['exact']['width']) {
    $output = $action['exact']['width'] .'x'. $action['exact']['height'];
    $output .= " (". $action['exact']['xpos'] .', '. $action['exact']['ypos'] .") ";
  }
  else {
    $output = ' left:'. $action['relative']['leftdiff'];
    $output .= ' right:'. $action['relative']['rightdiff'];
    $output .= ' top:'. $action['relative']['topdiff'];
    $output .= ' bottom:'. $action['relative']['bottomdiff'];
  }
  $output .= theme_imagecacheactions_rgb($action['RGB']);
  $output .= ($action['under']) ? t(" <b>under</b> image ") : t(" <b>over</b> image ");
  return $output ;
}

/**
 * Implementation of hook_image()
 *
 * Creates a solid background canvas
 *
 * Process the imagecache action on the passed image
 *
 * @param $image
 * array defining an image file, including  :
 *
 *   $image- >source as the filename,
 *
 *   $image->info array
 *
 *   $image->res handle on the image object
 */
function canvasactions_definecanvas_image(& $image, $action = array()) {
 
  // May be given either exact or relative dimensions.
  if ($action['exact']['width'] || $action['exact']['width']) {
  // Allows only one dimension to be used if the other is unset.
    if (! $action['exact']['width']) $action['exact']['width'] = $image->info['width'];
    if (! $action['exact']['height']) $action['exact']['height'] = $image->info['height'];

    $targetsize['width'] = _imagecache_percent_filter($action['exact']['width'], $image->info['width']);
    $targetsize['height'] = _imagecache_percent_filter($action['exact']['height'], $image->info['height']);

    $targetsize['left'] = _imagecache_keyword_filter($action['exact']['xpos'], $targetsize['width'], $image->info['width']);
    $targetsize['top'] = _imagecache_keyword_filter($action['exact']['ypos'], $targetsize['height'], $image->info['height']);

  }
  else {
    // calculate relative size
    $targetsize['width'] = $image->info['width'] + $action['relative']['leftdiff'] +  $action['relative']['rightdiff'];
    $targetsize['height'] = $image->info['height'] + $action['relative']['topdiff'] +  $action['relative']['bottomdiff'];
    $targetsize['left'] = $action['relative']['leftdiff'];
    $targetsize['top'] = $action['relative']['topdiff'];
  }
  
  $newcanvas = imagecreatetruecolor($targetsize['width'], $targetsize['height']);
  $RGB = $action['RGB'];

  // convert from hex (as it is stored in the UI)
  if($RGB['HEX'] && $deduced = hex_to_rgb($RGB['HEX'])) {
    $RGB = array_merge($RGB, $deduced);
    $background = imagecolorallocate($newcanvas, $RGB['red'], $RGB['green'], $RGB['blue']);
  }
  else {
    // No color, attempt transparency, assume white
    $background = imagecolorallocatealpha($newcanvas, 255, 255, 255, 127);
    imagesavealpha($newcanvas, TRUE);
    imagealphablending($newcanvas, false);
    imagesavealpha($image->res, TRUE);
  }
  imagefilledrectangle($newcanvas, 0, 0, $targetsize['width'], $targetsize['height'], $background);
  
  if ($action['under']) {
    require_once('watermark.inc');
    $watermark = new watermark();
    $image->res = $watermark->create_watermark($newcanvas, $image->res, $targetsize['left'], $targetsize['top'], 100);
    imagesavealpha($image->res, TRUE);
  } 
  else {
    $image->res = $newcanvas ;
  }
  
  $image->info['width'] = $targetsize['width'];
  $image->info['height'] = $targetsize['height'];
  return TRUE;
}

////////////////////////////////////////////////

/**
 * Place a given image under the current canvas
 *
 * Implementation of imagecache_hook_form()
 *
 * @param $action array of settings for this action
 * @return a form definition
 */
function canvasactions_canvas2file_form($action) {
  $defaults = array(
    'xpos' => '0',
    'ypos' => '0',
    'alpha' => '100',
    'path' => '',
    'dimensions' => 'original',
  );
  $action = array_merge($defaults, (array)$action);

  $form = imagecacheactions_pos_form($action);
  $form['alpha'] = array(
    '#type' => 'textfield',
    '#title' => t('opacity'),
    '#default_value' => $action['alpha'],
    '#size' => 6,
    '#description' => t('Opacity: 0-100. Be aware that values other than 100% may be slow to process.'),
  );
  $form['path'] = array(
    '#type' => 'textfield',
    '#title' => t('file name'),
    '#default_value' => $action['path'],
    '#description' => t('File may be in the "files/" folder, or relative to the Drupal siteroot.'),
  );
  $form['dimensions'] = array(
    '#type' => 'radios',
    '#title' => t('final dimensions'),
    '#default_value' => $action['dimensions'],
    '#options' => array('original' => 'original (dimensions are retained)', 'background' => 'background (image will be forced to match the size of the background)', 'minimum' => 'minimum (image may be cropped)', 'maximum' => 'maximum (image may end up with gaps)'),
    '#description' => t('What to do when the background image is a different size from the source image. Backgrounds are not tiled, but may be arbitrarily large.'),
  );
  return $form;
}

/**
 * Implementation of theme_hook() for imagecache_ui.module
 */
function theme_canvasactions_canvas2file($element) {
  $data = $element['#value'];
  return 'xpos:'. $data['xpos'] .', ypos:'. $data['ypos'] .' alpha:'. $data['alpha'] .'%' ;
}

/**
 * Place the source image on the current background
 *
 * Implementation of hook_image()
 *
 *
 * @param $image
 * @param $action
 */
function canvasactions_canvas2file_image(&$image, $action = array()) {
  // search for full (siteroot) paths, then file dir paths, then relative to the current theme
  if (file_exists($action['path'])) {
    $underlay = imageapi_image_open($action['path']);
  }
  else if (file_exists(file_create_path($action['path']))) {
    $underlay = imageapi_image_open(file_create_path($action['path']));
  }
  
  // To handle odd sizes, we will resize/crop the background image to the desired dimensions before 
  // starting the merge. The built-in imagecopymerge, and the watermark library both do not
  // allow overlays to be bigger than the target.
  // Adjust size
  $crop_rules = array('xoffset' => 0, 'yoffset' => 0, );
  switch ($action['dimensions']) {
    case 'original' :
      $crop_rules['width'] = $image->info['width'];
      $crop_rules['height']  = $image->info['height'];
      break;
    case 'background' :
      $crop_rules['width'] = imagesx($underlay->res);
      $crop_rules['height'] = imagesy($underlay->res);;
      break;
    case 'minimum' :
      $crop_rules['width'] = min(imagesx($underlay->res), $image->info['width']);
      $crop_rules['height'] = min(imagesy($underlay->res), $image->info['height']);
      break;
    case 'maximum' :
      $crop_rules['width'] = max(imagesx($underlay->res), $image->info['width']);
      $crop_rules['height'] = max(imagesy($underlay->res), $image->info['height']);
      break;
  }
  // imageapi crop assumes upsize is legal.
  imagecache_crop_image($underlay, $crop_rules);
  
  // This func modifies the underlay image by ref, placing the current canvas on it
  if (imageapi_image_overlay($underlay, $image, $action['xpos'], $action['ypos'], $action['alpha'])) {
    $image->res = $underlay->res;
    
    return TRUE;
  }
}

////////////////////////////////////////////////


/**
 * Place a given image on top of the current canvas
 *
 * Implementation of imagecache_hook_form()
 *
 * @param $action array of settings for this action
 * @return a form definition
 */
function canvasactions_file2canvas_form($action) {
  $defaults = array(
    'xpos' => '',
    'ypos' => '',
    'alpha' => '100',
    'path' => '',
  );
  $action = array_merge($defaults, (array)$action);
  
  $form = array(
    'help' => array(
      '#type' => 'markup',
      '#value' => t('Note that using a transparent overlay that is larger than the source image may result in unwanted results - a solid background.'),
    )
  );
  $form += imagecacheactions_pos_form($action);
  $form['alpha'] = array(
    '#type' => 'textfield',
    '#title' => t('opacity'),
    '#default_value' => $action['alpha'],
    '#size' => 6,
    '#description' => t('Opacity: 0-100. <b>Warning:</b> Due to a limitation in the GD toolkit, using an opacity other than 100% requires the system to use an algorithm that\'s much slower than the built-in functions. If you want partial transparency, you are better to use an already-transparent png as the overlay source image.'),
  );
  $form['path'] = array(
    '#type' => 'textfield',
    '#title' => t('file name'),
    '#default_value' => $action['path'],
    '#description' => t('File may be in the "files/" folder, or relative to the Drupal siteroot.'),
    '#element_validate' => array('canvasactions_file2canvas_validate_file'),
  );
  return $form;
}


/**
 * Check if the named file is available
 */
function canvasactions_file2canvas_validate_file(&$element, &$form_status) {
  if (! file_exists($element['#value']) && ! file_exists(file_create_path($element['#value'])) ) {
    form_error($element, t("Unable to find the named file '%filepath' in either the site or the files directory. Please check the path. Use relative paths only.", array('%filepath' => $element['#value'])) );
  }
}

/**
 * Implementation of theme_hook() for imagecache_ui.module
 */
function theme_canvasactions_file2canvas($element) {
  $action = $element['#value'];
  return '<strong>'. basename($action['path']) . '</strong> x:'. $action['xpos'] .', y:'. $action['ypos'] .' alpha:'. $action['alpha'] .'%' ;
}

/**
 * Place the source image on the current background
 *
 * Implementation of hook_image()
 *
 *
 * @param $image
 * @param $action
 */
function canvasactions_file2canvas_image(&$image, $action = array()) {
  // search for full (siteroot) paths, then file dir paths, then relative to the current theme
  if (file_exists($action['path'])) {
    $overlay = imageapi_image_open($action['path']);
  }
  else if (file_exists(file_create_path($action['path']))) {
    $overlay = imageapi_image_open(file_create_path($action['path']));
  }
  if (! isset($overlay) || ! $overlay) {
    trigger_error(t("Failed to find overlay image %path for imagecache_actions file-to-canvas action. File was not found in the sites 'files' path or the current theme folder.", array('%path' => $action['path'])), E_USER_WARNING);
    return FALSE;
  }
  return imageapi_image_overlay($image, $overlay, $action['xpos'], $action['ypos'], $action['alpha']);
}


///////////////////////////////////////////////////////////////////

/**
 * Set radius for corner rounding
 * 
 * Implementation of imagecache_hook_form()
 *
 * @param $action array of settings for this action
 * @return a form definition
 */
function canvasactions_roundedcorners_form($action) {
  $defaults = array(
    'radius' => '16',
    'antialias' => TRUE,
  );
  $action = array_merge($defaults, (array)$action);

  $form['radius'] = array(
      '#type' => 'textfield',
      '#title' => t('radius'),
      '#default_value' => $action['radius'],
      '#size' => 2,
  );

  $form['antialias'] = array(
      '#type' => 'checkbox',
      '#title' => t('antialias'),
      '#return_value' => TRUE,
      '#default_value' => $action['antialias'],
      '#description' => t('Attempt antialias smoothing when drawing the corners'),
  );

  $form['notes'] = array(
      '#type' => 'markup',
      '#value' => t('
        Note: the rounded corners effect uses true alpha transparency masking. 
        This means that this effect <b>will fail to be saved</b> on jpegs 
        <em>unless</em> you either <ul>
        <li>convert the image to PNG (using the coloractions filter for that),</li>
        <li>underlay a solid color (using coloractions-alpha-flatten) or</li> 
        <li>underlay a background image (canvasactions-underlay)</li> 
        </ul>
        as a later part of this imagecache pipeline.
        <br/>
      '),
  );

  return $form;
}

/**
 * Create a rounded corner mask and alpha-merge it with the image.
 * 
 * Implementation of hook_image()
 *
 * @param $image
 * @param $action
 */
function canvasactions_roundedcorners_image(&$image, $action = array()) {

  $width = $image->info['width'];
  $height = $image->info['height'];
  $radius = $action['radius'];

  if ($action['antialias']) {
    $width = $width * 3;
    $height = $height * 3;
    $radius = $radius * 3;
  }
  
  // Create a mask with rounded corners
  $mask = imagecreatetruecolor($width, $height);

  // Is using the toolkit really worth the bother?
  // Just doing it in an attempt to be consistent
  $mask_image = (object)array(
    'res' => &$mask, 
    'info' => array('width' => $width, 'height' => $height, 'extension' => 'png'), 
    'toolkit' => $image->toolkit,
  );

  // Start with a blank slate
  $background = imagecolorallocatealpha($mask, 255, 255, 255, 127);
  imagesavealpha($mask, TRUE);
  imagealphablending($mask, false);
  imagefilledrectangle($mask, 0, 0, $width, $height, $background);
  // Place solid lumps on it
  $foreground = imagecolorallocatealpha($mask, 0, 0, 0, 0);

  // Blobs in the corners
  $diameter = $radius * 2;
  ImageFilledEllipse($mask, $radius, $radius, $diameter, $diameter, $foreground);
  ImageFilledEllipse($mask, $width-$radius, $radius, $diameter, $diameter, $foreground);
  ImageFilledEllipse($mask, $radius, $height-$radius, $diameter, $diameter, $foreground);
  ImageFilledEllipse($mask, $width-$radius, $height-$radius, $diameter, $diameter, $foreground);
  
  // Block out the middle
  ImageFilledRectangle($mask, $radius, 0, $width-$radius, $height, $foreground);
  ImageFilledRectangle($mask, 0, $radius, $width, $height-$radius, $foreground);

  if ($action['antialias']) {
    // Use toolkit so scale down again. 
    imageapi_image_scale($mask_image, $width/3, $height/3);
    $mask = $mask_image->res;
  }
  // No we have a mask. Merge to get a result
  #$image->res = $mask;  
  canvasactions_mask($image, $mask_image);
  
  return TRUE;
}

/**
 * Given a source image in the $action, use the alpha values from it to set
 * transparency on the source image.
 * 
 * Note that the returned image has transparency set BUT if it's a jpeg it may
 * not remember that channel.
 * Need to switch formats or flatten before saving, or the transparency will be
 * lost.
 */
function canvasactions_mask(&$image, $mask) {
  // I do not believe there is a func for this, so I'll do it pixel-by-pixel
  // Slow, I know.
  $info = $image->info;
  if (!$info) { return FALSE; }
  $img = &$image->res;
  $msk = &$mask->res;
  
  imagesavealpha($image->res, TRUE);
  imagealphablending($image->res, FALSE);

  $width = imagesx($img);  // Use the actual, not claimed image size.
  $height = imagesy($img);
  for ($i = 0; $i < $height; $i++) { //this loop traverses each row in the image
    for ($j = 0; $j < $width; $j++) { //this loop traverses each pixel of each row

      // Get the color & alpha info of the current pixel
      $color_ix = imagecolorat($img, $j, $i); // an index
      $rgba_array = imagecolorsforindex($img, $color_ix);
      
      // Get the alpha of the corresponding mask pixel
      $mask_color_ix = imagecolorat($msk, $j, $i); // an index
      $msk_rgba_array = imagecolorsforindex($msk, $mask_color_ix);

      // Calculate the total alpha value of this pixel
      $rgba_array['alpha'] = max($msk_rgba_array['alpha'], $rgba_array['alpha']);

      //paint the pixel
      $color_to_paint = imagecolorallocatealpha($image->res, $rgba_array['red'], $rgba_array['green'], $rgba_array['blue'], $rgba_array['alpha']);
      imagesetpixel($image->res, $j, $i, $color_to_paint);  
    }
  }
  return TRUE;

}


/**
 * Implementation of theme_hook() for imagecache_ui.module
 */
function theme_canvasactions_roundedcorners($element) {
  $data = $element['#value'];
  return "Radius: {$data['radius']}px " . ($data['antialias'] ? "antialiased" : "") ;
}

