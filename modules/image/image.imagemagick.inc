<?php
// $Id: image.imagemagick.inc,v 1.3.2.3 2007/03/20 17:19:45 drewish Exp $

/**
 * Return information about the imagemagick toolkit
 */
function image_imagemagick_info() {
  return array('name' => 'imagemagick', 'title' => 'ImageMagick Toolkit.');
}

/**
 * Validate and return toolkit specific settings
 */
function image_imagemagick_settings() {
  $form['image_imagemagick_convert'] = array(
    '#type' => 'textfield',
    '#title' => t('Location of the "convert" binary'),
    '#default_value' => variable_get('image_imagemagick_convert', '/usr/bin/convert'),
    '#size' => 64,
    '#required' => TRUE,
    '#validate' => array('image_imagemagick_valid_file' => array('image_imagemagick_convert')),
  );
  return $form;
}

function image_imagemagick_valid_file($formelement = NULL, $fieldname = NULL) {
  $convert_path = $formelement['#value'];

  if (!is_file($convert_path)) {
    form_set_error($fieldname, t('%file does not exist.', array('%file' => $convert_path)));
  }
}

/**
 * Resize an image to the given width and height
 */
function image_imagemagick_resize($source, $dest, $width, $height) {
  $filter = ' -scale '. $width .'x'. $height .'! -filter QUADRATIC';
  return _image_imagemagick_convert($source, $dest, $filter);
}

/**
 * Rotate an image
 */
function image_imagemagick_rotate($source, $dest, $degrees) {
  $filter = ' -rotate '. escapeshellarg($degrees) .' -background #000000';  
  return _image_imagemagick_convert($source, $dest, $filter);  
}

/**
 * Crop an image to the specified dimensions
 */
function image_imagemagick_crop($source, $dest, $x, $y, $width, $height) {
  $filter = ' -crop '. $width .'x'. $height .'+'. $x .'+'. $y;
  return _image_imagemagick_convert($source, $dest, $filter);  
}

/**
 * Calls the convert executable with the specified filter
 */
function _image_imagemagick_convert($source, $dest, $filter) {
  $convert_path = variable_get('image_imagemagick_convert', '/usr/bin/convert');
  if (!file_exists($convert_path)) {
    return FALSE;
  }

  if (strstr($_SERVER['SERVER_SOFTWARE'], 'Win32') || strstr($_SERVER['SERVER_SOFTWARE'], 'IIS')) {
    // use window's start command to avoid the "black window" from showing up:
    // http://us3.php.net/manual/en/function.exec.php#56599
    // use /D to run the command from PHP's current working directory so the
    // file paths don't have to be absolute.
    $convert_path = 'start "window title" /D'. getcwd() .' /b '. escapeshellarg($convert_path);
  }

  $command = implode(' ', array(
    $convert_path,
    preg_replace("/[^A-Za-z0-9\!\.\-\+\040]/", '', $filter),
    escapeshellarg($source),
    escapeshellarg($dest),
  ));


  $status = _image_imagemagick_exec($command, $output, $error);
  if ($error) {
    drupal_set_message("ImageMagick reported an error: $error");
    #drupal_set_message("ImageMagick command: $command");
    #drupal_set_message("ImageMagick output: $output");
  }

  if ($status != 0) {
    return FALSE;
  }
  return file_exists($dest);
}

function _image_imagemagick_exec($command, &$output, &$errors) {
  $descriptors = array(
    0 => array('pipe', 'r'), // stdin
    1 => array('pipe', 'w'), // stdout
    2 => array('pipe', 'w')  // stderr
  );
  if ($h = proc_open($command, $descriptors, $pipes)) {
    $output = fgets($pipes[1]);
    $errors = fgets($pipes[2]);
    fclose($pipes[0]);
    fclose($pipes[1]);
    fclose($pipes[2]);
    return proc_close($h);
  }
  return FALSE;
}

