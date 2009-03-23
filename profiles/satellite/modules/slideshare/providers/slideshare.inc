<?php
// $Id: slideshare.inc,v 1.1 2009/03/07 14:53:00 antoniodemarco Exp $

/**
 * @file
 *
 * This include processes Slideshare.com media files for use by emfield.module
 */

define('EMVIDEO_SLIDESHARE_MAIN_URL', 'http://slideshare.net/');
define('EMVIDEO_SLIDESHARE_XML', 'http://www.slideshare.net/api/2/');
define('EMVIDEO_SLIDESHARE_DOMAIN_DEFAULT', 'net');

function emvideo_slideshare_info() {
  $features = array(array(t('Autoplay'), t('No'), '' ), array(t('RSS Attachment'), t('No'), '' ), array(t('Thumbnails'), t('Yes'), '' ) );
  return array('provider' => 'slideshare', 'name' => t('Slideshare'), 'url' => EMVIDEO_SLIDESHARE_MAIN_URL, 'settings_description' => t('These settings specifically affect videos displayed from <a href="@slideshare" target="_blank">Slideshare</a>.', array('@slideshare' => EMVIDEO_SLIDESHARE_MAIN_URL )), 'supported_features' => $features );
}

function emvideo_slideshare_settings() {
  $form = array();
  $form['emvideo_slideshare_api_key'] = array('#type' => 'textfield', '#title' => t('API Key'), '#default_value' => variable_get('emvideo_slideshare_api_key', ''), '#description' => t('API key provided by SlideShare, to obtain one apply to <a href="http://www.slideshare.net/applyforapi" target="_blank">http://www.slideshare.net/applyforapi</a>.') );
  $form['emvideo_slideshare_shared_secret'] = array('#type' => 'textfield', '#title' => t('Shared Secret'), '#default_value' => variable_get('emvideo_slideshare_shared_secret', ''), '#description' => t('Shared Secret by SlideShare, to obtain one apply to <a href="http://www.slideshare.net/applyforapi" target="_blank">http://www.slideshare.net/applyforapi</a>.') );
  //  Username and Password will be used in future releases.
  //  $form['emvideo_slideshare_username'] = array('#type' => 'textfield', '#title' => t('Username'), '#default_value' => variable_get('emvideo_slideshare_username', ''), '#description' => t('Username of your Slideshare account, only required for advanced requests.') );
  //  $form['emvideo_slideshare_password'] = arrassy('#type' => 'textfield', '#title' => t('Password'), '#default_value' => variable_get('emvideo_slideshare_password', ''), '#description' => t('Password of your Slideshare account, only required for advanced requests.') );
  return $form;
}

function emvideo_slideshare_extract($embed) {
  $embed = array_shift(explode('&', array_pop(explode('[slideshare id=', $embed))));
  return $embed;
  // We can skip this regexp for the moment if we just provide a string
  // we will simply return the $embed, until we will not find a way to do parsing
  return array('\=[0-9]+');
}

function emvideo_slideshare_request($embed, $cacheable = TRUE) {
  /**
   * ATTENTION: in case we will save wrong data or we will change the way we will store the data,
   * which is possible since we will store the id and not the full url, we can always reload by running
   * the function emfield_reload($nid)
   */
  $api_key = variable_get('emvideo_slideshare_api_key', '');
  $shared_secret = variable_get('emvideo_slideshare_shared_secret', '');

  if ($api_key && $shared_secret) {
    $ts = time();
    $hash = sha1($shared_secret . $ts);
    //    $username = variable_get('emvideo_slideshare_username', '');
    //    $password = variable_get('emvideo_slideshare_password', '');

    $args['api_key'] = $api_key;
    $args['ts'] = $ts;
    $args['hash'] = $hash;
    $args['slideshow_id'] = $embed;
    $cacheable = FALSE;

    $result = module_invoke('emfield', 'request_xml', 'slideshare', EMVIDEO_SLIDESHARE_XML .'get_slideshow', $args, $cacheable);
    return $result;
  }
  else {
    return array();
  }
}

function emvideo_slideshare_video_link($video_code) {
  //  return 'http://video.slideshare.'. variable_get('emvideo_slideshare_domain', EMVIDEO_SLIDESHARE_DOMAIN_DEFAULT) .'/videoplay?docid='. $video_code;
  return NULL;
}

/**
 * hook emfield_PROVIDER_data
 *
 * provides an array to be serialised and made available with $item elsewhere
 */
function emvideo_slideshare_data($field, $item) {
  $result = emvideo_slideshare_request($item['value']);
  return $result['SLIDESHOW'];
}

function emvideo_slideshare_thumbnail($field, $item, $formatter, $node, $width, $height) {
  return $item['data']['THUMBNAILURL'][0];
}

function emvideo_slideshare_video($embed, $width, $height, $field, $item, &$node, $autoplay) {
  $output = theme('slideshare_flash', $embed, $width, $height, $field, $item, &$node, $autoplay);
  return $output;
}

function emvideo_slideshare_preview($embed, $width, $height, $field, $item, &$node, $autoplay) {
  $output = theme('slideshare_flash', $embed, $width, $height, $field, $item, &$node, $autoplay);
  return $output;
}