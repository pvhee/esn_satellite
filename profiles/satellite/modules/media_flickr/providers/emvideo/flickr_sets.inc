<?php
// $Id: flickr_sets.inc,v 1.1.2.1 2009/06/14 16:25:29 aaron Exp $

/**
 * @file
 *   This include processes flickr.com photosets for use by emfield/emvideo.module.
 */

define('EMVIDEO_FLICKR_SETS_MAIN_URL', 'http://www.flickr.com/');
define('EMVIDEO_FLICKR_SETS_RESTPOINT', 'http://api.flickr.com/services/rest/');
define('EMIMAGE_FLICKR_API_APPLICATION_URL', 'http://www.flickr.com/services/api/keys');

/**
 *  This defines the version of the content data array that we serialize
 *  in emvideo_flickr_sets_data(). If we change the expected keys of that array,
 *  we must increment this value, which will allow older content to be updated
 *  to the new version automatically.
 */
define('EMVIDEO_FLICKR_SETS_DATA_VERSION', 1);

/**
 * hook emvideo_PROVIDER_info
 * this returns information relevant to a specific 3rd party video provider
 * @return
 *   an array of strings requested by various admin and other forms
 *   'name' => the translated name of the provider
 *   'url' => the url to the main page for the provider
 *   'settings_description' => a description of the provider that will be posted in the admin settings form
 *   'supported_features' => an array of rows describing the state of certain supported features by the provider.
 *      These will be rendered in a table, with the columns being 'Feature', 'Supported', 'Notes'.
 */
function emvideo_flickr_sets_info() {
  $features = array(
    array(t('Autoplay'), t('No'), ''),
    array(t('RSS Attachment'), t('No'), ''),
    array(t('Thumbnails'), t('Yes'), t('')),
    array(t('Full screen mode'), t('Yes'), t('Full screen mode is enabled for this player, but may not be disabled.')),
  );
  return array(
    'provider' => 'flickr_sets',
    'name' => t('Flickr Photosets'),
    'url' => EMVIDEO_FLICKR_SETS_MAIN_URL,
    'settings_description' => t('These settings specifically affect slideshows displayed from !flickr_sets.', array('!flickr_sets' => l(t('Flickr.com'), EMVIDEO_FLICKR_SETS_MAIN_URL))),
    'supported_features' => $features,
  );
}

/**
 * hook emvideo_PROVIDER_settings
 * this should return a subform to be added to the emvideo_settings() admin settings page.
 * note that a form field will already be provided, at $form['PROVIDER'] (such as $form['flickr_sets'])
 * so if you want specific provider settings within that field, you can add the elements to that form field.
 */
function emvideo_flickr_sets_settings() {
  if (function_exists('emimage_flickr_settings')) {
    $form['flickr']['api'] = array(
      '#type' => 'fieldset',
      '#title' => t('Flickr API'),
      '#description' => t('You will first need to apply for an API Developer Key from the <a href="@flickr" target="_blank">Flickr Developer Profile page</a>.', array('@flickr' => EMIMAGE_FLICKR_API_APPLICATION_URL)),
      '#collapsible' => TRUE,
      '#collapsed' => (variable_get('emimage_flickr_api_key', '') != ''),
    );
    $form['flickr']['api']['notice'] = array(
      '#type' => 'item',
      '#value' => t('Please enter your Flickr Developer Key in the fieldset for Flickr, in the Embedded Image Field field set above.'),
    );
  }
  else {
    $form['flickr']['api'] = array(
      '#type' => 'fieldset',
      '#title' => t('Flickr API'),
      '#description' => t('You will first need to apply for an API Developer Key from the <a href="@flickr" target="_blank">Flickr Developer Profile page</a>.', array('@flickr' => EMIMAGE_FLICKR_API_APPLICATION_URL)),
      '#collapsible' => TRUE,
      '#collapsed' => (variable_get('emimage_flickr_api_key', '') != ''),
    );
    $form['flickr']['api']['emimage_flickr_api_key'] = array(
      '#type' => 'textfield',
      '#title' => t('Flickr API Key'),
      '#default_value' => variable_get('emimage_flickr_api_key', ''),
      '#description' => t('Please enter your Flickr Developer Key here.'),
    );
    $form['flickr']['api']['emimage_flickr_api_secret'] = array(
      '#type' => 'textfield',
      '#title' => t('Flickr API Secret'),
      '#default_value' => variable_get('emimage_flickr_api_secret', ''),
      '#description' => t('If you have a secret for the Flickr API, enter it here.'),
    );
  }
  return $form;
}

/**
 * hook emfield_PROVIDER_data
 *
 * provides an array to be serialised and made available with $item elsewhere
 */
function emvideo_flickr_sets_data($field, $item) {
  $data = array();
  $xml = _emvideo_flickr_sets_request('flickr.photosets.getPhotos', array('photoset_id' => $item['value'], 'per_page' => 1));
  $data['owner'] = $xml['photoset']['owner'];
  $data['first_photo'] = $xml['photoset']['photo'][0]['id'];
  return $data;
}

/**
 * this is a wrapper for emimage_request_xml that includes flickr's api key
 */
function _emvideo_flickr_sets_request($method, $args = array(), $cached = TRUE) {
  // display an error if we don't have an api key yet
  _emvideo_flickr_set_error_check();

  $args['api_key'] = trim(variable_get('emimage_flickr_api_key', ''));
  if ($secret = trim(variable_get('emimage_flickr_api_secret', ''))) {
    $args['secret'] = md5($secret . $arghash);
  }
  $args['method'] = $method;
  $args['format'] = 'php_serial';

  $xml = module_invoke('emfield', 'request_xml', 'flickr', EMVIDEO_FLICKR_SETS_RESTPOINT, $args, $cached, FALSE, FALSE, TRUE);
  return $xml;
}

/**
 *
 */
function emvideo_flickr_sets_rss($item, $teaser = NULL) {
}

/**
 * hook emvideo_PROVIDER_extract
 * this is called to extract the video code from a pasted URL or embed code.
 * @param $embed
 *   an optional string with the pasted URL or embed code
 * @return
 *   either an array of regex expressions to be tested, or a string with the video code to be used
 *   if the hook tests the code itself, it should return either the string of the video code (if matched), or an empty array.
 *   otherwise, the calling function will handle testing the embed code against each regex string in the returned array.
 */
function emvideo_flickr_sets_extract($embed = '') {
  // http://www.flickr_sets.com/watch/1404/saturday-night-live-snl-digital-short-natalie-raps
  return array(
    '@\.flickr\.com/.+?/.+?/sets/([^/\?]+)@i',
    '@sets%2F(.+?)%2Fshow.+?flickr\.com/apps/slideshow/show\.swf@i',
  );
}

/**
 * hook emvideo_PROVIDER_embedded_link($video_code)
 * returns a link to view the video at the provider's site
 *  @param $video_code
 *    the string containing the video to watch
 *  @return
 *    a string containing the URL to view the video at the original provider's site
 */
function emvideo_flickr_sets_embedded_link($video_code, $data = array()) {
  return 'http://www.flickr.com/photos/'. $data['owner'] .'/sets/'. $video_code;
}

/**
 * The embedded flash displaying the flickr_sets video.
 */
function theme_emvideo_flickr_sets_flash($item, $width, $height, $autoplay) {
  $output = '';
  if ($item['value']) {
    $embed = drupal_urlencode('photos/'. $item['data']['owner'] .'/sets/'. $item['value']);
    $output = <<<EMBED
    <object width="$width" height="$height"> <param name="flashvars" value="offsite=true&amp;lang=en-us&amp;page_show_url=/$embed/show/&amp;page_show_back_url=/$embed&amp;set_id={$item['value']}&amp;jump_to="></param> <param name="movie" value="http://www.flickr.com/apps/slideshow/show.swf?v=71649"></param> <param name="allowFullScreen" value="true"></param><embed type="application/x-shockwave-flash" src="http://www.flickr.com/apps/slideshow/show.swf?v=71649" allowFullScreen="true" flashvars="offsite=true&amp;lang=en-us&amp;page_show_url=%2F$embed%2Fshow%2F&amp;page_show_back_url=%2F$embed&amp;set_id={$item['value']}&amp;jump_to=" width="$width" height="$height"></embed></object>
EMBED;
  }
  return $output;
}

/**
 * hook emvideo_PROVIDER_thumbnail
 * returns the external url for a thumbnail of a specific video
 * TODO: make the args: ($embed, $field, $item), with $field/$item provided if we need it, but otherwise simplifying things
 *  @param $field
 *    the field of the requesting node
 *  @param $item
 *    the actual content of the field from the requesting node
 *  @return
 *    a URL pointing to the thumbnail
 */
function emvideo_flickr_sets_thumbnail($field, $item, $formatter, $node, $width, $height) {
  if ($item['value']) {
    $size = _emvideo_flickr_sets_guess_size($width, $height);
    $getsize = _emvideo_flickr_sets_request('flickr.photos.getSizes', array('photo_id' => $item['data']['first_photo']));

    // For small images, there may not be the sizes 0..4 that
    // _emimage_flickr_guess_size assumes, so:
    $size = min( $size, (count($getsize['sizes']['size'])-1) );

    $url = $getsize['sizes']['size'][$size]['source'];
  }
  return $url;
}

/**
 * hook emvideo_PROVIDER_video
 * this actually displays the full/normal-sized video we want, usually on the default page view
 *  @param $embed
 *    the video code for the video to embed
 *  @param $width
 *    the width to display the video
 *  @param $height
 *    the height to display the video
 *  @param $field
 *    the field info from the requesting node
 *  @param $item
 *    the actual content from the field
 *  @return
 *    the html of the embedded video
 */
function emvideo_flickr_sets_video($embed, $width, $height, $field, $item, &$node, $autoplay) {
  $output = theme('emvideo_flickr_sets_flash', $item, $width, $height, $autoplay);
  return $output;
}

/**
 * hook emvideo_PROVIDER_video
 * this actually displays the preview-sized video we want, commonly for the teaser
 *  @param $embed
 *    the video code for the video to embed
 *  @param $width
 *    the width to display the video
 *  @param $height
 *    the height to display the video
 *  @param $field
 *    the field info from the requesting node
 *  @param $item
 *    the actual content from the field
 *  @return
 *    the html of the embedded video
 */
function emvideo_flickr_sets_preview($embed, $width, $height, $field, $item, &$node, $autoplay) {
  $output = theme('emvideo_flickr_sets_flash', $item, $width, $height, $autoplay);
  return $output;
}

/**
 * Implementation of hook_emfield_subtheme.
 */
function emvideo_flickr_sets_emfield_subtheme() {
    $themes = array(
        'emvideo_flickr_sets_flash'  => array(
            'arguments' => array('item' => NULL, 'width' => NULL, 'height' => NULL, 'autoplay' => NULL),
            'file' => 'providers/emvideo/flickr_sets.inc',
            'path' => drupal_get_path('module', 'media_flickr'),
        )
    );
    return $themes;
}

/**
 *  This will log an error if we don't have a key yet. In addition, if the user is an admin, we'll display an error.
 */
function _emvideo_flickr_set_error_check() {
  static $checked;
  if (!$checked && (variable_get('emimage_flickr_api_key', '') == '')) {
    global $user;
    $error = t('You do not yet have a Flickr API key set. You will need to <a href="@apply" target="_blank">apply for a Flickr API key</a> and enter your key at the <a href="@settings">settings administration page</a> before Flickr images may be displayed.', array('@apply' => EMIMAGE_FLICKR_API_APPLICATION_URL, '@settings' => url('admin/content/emfield')));
    if (user_access('administer site configuration')) {
      drupal_set_message($error, 'error');
    }
    watchdog('Embedded Media Field', '!error', array('!error' => $error));
  }
  $checked = TRUE;
}

/**
 *  Helper function for emimage_flickr_image_url.
 *  This will return the appropriate array key for the image size we wish.
 */
function _emvideo_flickr_sets_guess_size($width, $height) {
  $max = max($width, $height);

  if ($max) {
    foreach (array('0' => 75, '1' => 100, '2' => 240, '3' => 500, '4' => 1024) as $size => $value) {
      if ($max <= $value) {
        return $size;
      }
    }
  }

  // If we don't have width or height set, then get the original size.
  return '5';
}

