<?php
// $Id$

/**
 * @file
 *   This include processes Slideshare.com media files for use by emfield.module
 */

define('EMVIDEO_SLIDESHARE_MAIN_URL', 'http://slideshare.net/');
define('EMVIDEO_SLIDESHARE_XML', 'http://www.slideshare.net/api/2/');
define('EMVIDEO_SLIDESHARE_DOMAIN_DEFAULT', 'net');

function emvideo_slideshare_info() {
  $features = array(
    array(t('Autoplay'), t('No'), ''),
    array(t('RSS Attachment'), t('No'), ''),
    array(t('Thumbnails'), t('Yes'), ''),
  );
  return array(
    'provider' => 'slideshare',
    'name' => t('Slideshare'),
    'url' => EMVIDEO_SLIDESHARE_MAIN_URL,
    'settings_description' => t('These settings specifically affect videos displayed from <a href="@slideshare" target="_blank">Slideshare</a>.', array('@slideshare' => EMVIDEO_SLIDESHARE_MAIN_URL)),
    'supported_features' => $features,
  );
}

function emvideo_slideshare_settings() {
  $form = array();
  $form['emvideo_slideshare_api_key'] = array(
    '#type' => 'textfield',
    '#title' => t('API Key'),
    '#default_value' => variable_get('emvideo_slideshare_api_key', ''),
    '#description' => t('API key provided by SlideShare, to obtain one apply to <a href="http://www.slideshare.net/applyforapi" target="_blank">http://www.slideshare.net/applyforapi</a>.'),
  );
  $form['emvideo_slideshare_shared_secret'] = array(
    '#type' => 'textfield',
    '#title' => t('Shared Secret'),
    '#default_value' => variable_get('emvideo_slideshare_shared_secret', ''),
    '#description' => t('Shared Secret by SlideShare, to obtain one apply to <a href="http://www.slideshare.net/applyforapi" target="_blank">http://www.slideshare.net/applyforapi</a>.'),
  );
  $form['emvideo_slideshare_username'] = array(
    '#type' => 'textfield',
    '#title' => t('Username'),
    '#default_value' => variable_get('emvideo_slideshare_username', ''),
    '#description' => t('Username of your Slideshare account, only required for advanced requests.'),
  );
    $form['emvideo_slideshare_password'] = array(
    '#type' => 'textfield',
    '#title' => t('Password'),
    '#default_value' => variable_get('emvideo_slideshare_password', ''),
    '#description' => t('Password of your Slideshare account, only required for advanced requests.'),
  );
  return $form;
}

function emvideo_slideshare_extract($embed) {

  $embed = array_shift(explode('&', array_pop(explode('[slideshare id=', $embed))));
	return $embed;

	/**
	 * We can skip this regexp for the moment if we just provide a string
	 * we will simply return the $embed, until we will not find a way to do parsing
	 */
	return array(
    '@http://www.slideshare.net/(?:\.[a-z]{2,4})/(?:\.[a-z]{2,4})@i',
  );
}

function emvideo_slideshare_request($embed, $cacheable = TRUE) {
	
	/**
	 * ATTENTION: in case we will save wrong data or we will change the way we will store the data,
	 * which is possible since we will stor the id and not the full url, we can always reload by running 
	 * the function emfield_reload($nid)
	 */
	
  $api_key = variable_get('emvideo_slideshare_api_key', '');
  $shared_secret = variable_get('emvideo_slideshare_shared_secret', '');
  
  if ($api_key && $shared_secret) {
	  $ts = time();
	  $hash = sha1($shared_secret.$ts);
    $username = variable_get('emvideo_slideshare_username', '');
    $password = variable_get('emvideo_slideshare_password', '');
	  
    $args['api_key'] = $api_key;
    $args['ts'] = $ts;
    $args['hash'] = $hash;
    $args['slideshow_id'] = $embed;
    
    $cacheable = false;
    
    $result = module_invoke('emfield', 'request_xml', 'slideshare', EMVIDEO_SLIDESHARE_XML.'get_slideshow', $args, $cacheable);
	  return $result;
  } else {
  	return array();
  }
}

function emvideo_slideshare_video_link($video_code) {
//  return 'http://video.slideshare.'. variable_get('emvideo_slideshare_domain', EMVIDEO_SLIDESHARE_DOMAIN_DEFAULT) .'/videoplay?docid='. $video_code;
	
	 return 'http://www.slideshare.net/test';
}

/**
 * hook emfield_PROVIDER_data
 *
 * provides an array to be serialised and made available with $item elsewhere
 */
function emvideo_slideshare_data($field, $item) {
  
  $result = emvideo_slideshare_request($item['value']);
  return $result['SLIDESHOW'];
  
//  $rss = emvideo_slideshare_request($item['value']);
//
//  if (
//    is_array($rss['ITEM']) &&
//    is_array($rss['ITEM']['MEDIA:GROUP']) &&
//    is_array($rss['ITEM']['MEDIA:GROUP']['MEDIA:CONTENT']) &&
//    is_array($rss['ITEM']['MEDIA:GROUP']['MEDIA:CONTENT'][1])
//  ) {
//    $video = $rss['ITEM']['MEDIA:GROUP']['MEDIA:CONTENT'][1];
//    $data['filepath'] = $video['URL'];
//    $data['filemime'] = $video['TYPE'];
//    $data['medium'] = $video['MEDIUM'];
//    $data['expression'] = $video['EXPRESSION'];
//    $data['duration'] = $video['DURATION'];
//    $data['width'] = $video['WIDTH'];
//    $data['height'] = $video['HEIGHT'];
//  }
//
//  if (is_array($rss['MEDIA:GROUP'])) {
//    if (is_array($rss['MEDIA:GROUP']['MEDIA:THUMBNAIL']) && is_array($rss['MEDIA:GROUP']['MEDIA:THUMBNAIL'][1])) {
//      $thumbnail = $rss['MEDIA:GROUP']['MEDIA:THUMBNAIL'][1];
//      $data['thumbnail']['filepath'] = $thumbnail['URL'];
//      $data['thumbnail']['width'] = $thumbnail['WIDTH'];
//      $data['thumbnail']['height'] = $thumbnail['HEIGHT'];
//    }
//    if (is_array($rss['MEDIA:GROUP']['MEDIA:PLAYER']) && is_array($rss['MEDIA:GROUP']['MEDIA:PLAYER'][1])) {
//      $data['player']['filepath'] = $rss['MEDIA:GROUP']['MEDIA:PLAYER'][1]['URL'];
//    }
//  }
//
//  if ($data['thumbnail']['filepath'] == '' && is_array($rss['ITEM'])) {
//    // for whatever reason the thumbnail failed try the old method
//    // we'll parse it from the description, where it's repeated.
//    $desc = $rss['ITEM']['DESCRIPTION'][0];
//    $regex = '@<img src="([^"]*)"@';
//    if (preg_match($regex, $desc, $matches)) {
//      $data['thumbnail']['filepath'] = $matches[1];
//    }
//  }
//
//  // slideshare rss doesn't actually have <embeded> media, just MRSS, and no size
//  // so not actually really really necessary or really useful but for completeness
//  $play = 'http://video.slideshare.'. variable_get('emvideo_slideshare_domain', EMVIDEO_SLIDESHARE_DOMAIN_DEFAULT) .'/slideshareplayer.swf?docId='. check_plain($item['embed']);
//  $response = emfield_request_header('slideshare', $play, FALSE, FALSE);
//
//  if ($response->code == 200) {
//    $data['filesize'] = $response->headers['Content-Length'];
//  }
//
//  return $data;
}

function emvideo_slideshare_rss($item, $teaser) {
	
	/**
	 * For the moment return false
	 */
	return FALSE;
	
  if ($item['value']) {
    if ($item['data']['emvideo_slideshare_data_version'] >= 1000000) {
      $data = $item['data'];
    }
    else {
      $data = emvideo_slideshare_data(NULL, $item);
    }

    return $data;
  }
}

function emvideo_slideshare_thumbnail($field, $item, $formatter, $node, $width, $height) {
	
	$node = node_load(array('nid' => 2));
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




