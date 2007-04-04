<?php
// $Id: gallery_base.inc,v 1.2.2.2 2006/07/17 11:09:37 kiz0987 Exp $

/**
 * gallery.module : gallery_base.inc
 * Base functions
 */
 
/* --------------------------------------------------------------------------
 * Gallery init and misc functions
 * --------------------------------------------------------------------------
 */
 
/**
 * fetch a galleryEmbed object
 */
function _gallery_init($full = false, $vars = null) {
  global $user;
  
  if (!$vars) {
    $embedPath = variable_get('gallery_dir', './gallery2/') . 'embed.php';
    $g2Uri =  variable_get('gallery_uri', '/gallery2/');
    $embedUri = variable_get('gallery_embed_uri', '?q=gallery'); 
    $gallery_valid = variable_get('gallery_valid', 0);
  } else {
    $embedPath = $vars['gallery_dir'] . 'embed.php';
    $g2Uri = $vars['gallery_uri'];
    $embedUri = $vars['gallery_embed_uri']; 
    $gallery_valid = $vars['gallery_valid']; 
  }

  if ((!$gallery_valid) || (!is_readable($embedPath))) {
    // It's probably now bad practice to return a null here, given that $ret=null is a gallery2
    // success response
    return array(false, null);
  }

  include_once($embedPath);
 
  $new_user_needed = false;
  $active_id = ($user->uid>0) ? $user->uid : '';
  $params = array('embedUri' => $embedUri,
                  'g2Uri' => $g2Uri,
                  'loginRedirect' => url('user/login', null, null, true),
                  'activeUserId' => $active_id,
                  'activeLanguage' => gallery_get_language($user),
                  'fullInit' => $full);

  $ret = GalleryEmbed::init($params);
  if (!$ret) {
    // No error returned, but it is still possible that the ExternalID mapping has not been done
    $ret2 = GalleryEmbed::isExternalIdMapped($user->uid, 'GalleryUser');
    if ($ret2 && ($ret2->getErrorCode() & ERROR_MISSING_OBJECT)) {
      // Need to make a new user, but don't try to map anonymous user.
      $new_user_needed = ($user->uid>0);
    }    
  } 
  if (($new_user_needed) || ($ret && ($ret->getErrorCode() & ERROR_MISSING_OBJECT))) {
    // Our user mapping is missing.  Make a mapping, or create a new user.
    $g2_user = null;
    // Get the G2 user that matches the Drupal username
    list ($ret, $g2_user) = GalleryCoreApi::fetchUserByUsername($user->name);
    if ($ret && !($ret->getErrorCode() & ERROR_MISSING_OBJECT)) {
      return array(false, $ret);
    }
    if (!isset($g2_user)) {
      // No G2 user with a matching username.  If this is the admin user, we're going to
      // try a little harder and match it to the oldest admin in G2.
      if ($user->uid == 1) {
        list ($ret, $admin_group_id) = GalleryCoreApi::getPluginParameter('module', 'core', 'id.adminGroup');
        if ($ret) {
          return array(false, $ret);
        }
        list ($ret, $g2_users) = GalleryCoreApi::fetchUsersForGroup($admin_group_id);
        if ($ret) {
          return array(false, $ret);
        }
        $keys = array_keys($g2_users);
        $g2_user_name = $g2_users[$keys[0]];
        list ($ret, $g2_user) = GalleryCoreApi::fetchUserByUsername($g2_user_name);
        if ($ret) {
          return array(false, $ret);
        }
      }
    }
    
    if (isset($g2_user)) {
      // The G2 user was found so add to the External ID Map
      $ret = GalleryEmbed::addExternalIdMapEntry($user->uid, $g2_user->getId(), 'GalleryUser');
      if ($ret) {
        return array(false, $ret);
      }
    } else {
      // No matching G2 user found -- create one. 
      $path = drupal_get_path('module', 'gallery');
      require_once($path . '/gallery_user.inc');
      return gallery_modify_user($user, 'create');
    }
  }
  return array(true, null);
}

/**
 * Include head information with check made for uniqueness (see drupal_add_js)
 */
function gallery_set_html_head($info, $unique=true) {
  static $sent = array(); 
  if ($unique) {
  // Only set html head if this info has not been sent before. 
    $hash_info = md5($info);
    if (!isset($sent[$hash_info])) {
      drupal_set_html_head($info);
      $sent[$hash_info] = true;
    } 
  } else {
    drupal_set_html_head($info);
  }
}

/**
 * Get the language for the user. If unknown, make a best guess.
 */
function gallery_get_language($user) {
  // Added depdev patch for language support (http://drupal.org/node/32374)
  // without i18 part (I seem to remember a Rewrite issue with it
  // Added test for no user language defined
  if (($user->uid==0 || !($user->language)) && module_exist('locale')) { 
    // This is a visitor and locale module is enabled 
    // Get drupal's default language
    $result = db_query('SELECT locale, name FROM {locales_meta} WHERE isdefault = 1'); 
    $row = db_fetch_object($result);
    return $row->locale;
  } else {
    return $user->language;
  }   
}

/**
 * Split an image block result into individual images
 * (Kludge until imageblock has this option)
 */
function _gallery_split_imageblock($html) {
  /**
   * From http://uk.php.net/manual/en/function.preg-split.php
   * Split the html from image block into <...> parts
   */
  $pattern = '/(<(?:[^<>]+(?:"[^"]*"|\'[^\']*\')?)+>)/';
  $html_array = preg_split ($pattern, trim ($html), -1, 
    PREG_SPLIT_DELIM_CAPTURE | PREG_SPLIT_NO_EMPTY);
  
  $ndx = 0;
  $images = array();
  $image_html = '';
  // Now iterate through this array and combine again, but on a per-image basis
  foreach ($html_array as $value) {
    $value = trim($value);
    $image_html .= $value; 
    if (!strcmp($value, '<div class="one-image">')) {
      // Found the opening <div> for the image
      $open_divs = 0;
    } else if (!strncmp($value, '<div', 4)) {
      // Found a <div> but not the main image one (eg a frame)
      $open_divs++;
    } else if (!strcmp($value, '</div>')) {
      // Found a </div> but check if it's for the main image or a subcomponent (eg frame)
      if ($open_divs>0) {
        $open_divs--;
      } else {
        // This must be the closing div for "one-image" so move to next image
        $images[] = $image_html;
        $image_html = '';
      }
    }
  }
  return $images;  
}


/* 
 * --------------------------------------------------------------------------
 * Error Functions
 * --------------------------------------------------------------------------
 */
function gallery_error($message, $ret) {
// Changed default, just in case!
  $error_mode = variable_get('gallery_error_mode', array(1));
  if (in_array(2, $error_mode)) {
    drupal_set_message($message);
  }

  if (isset($ret)) {
    $full_message = $message . '<br/>' . $ret->getAsHtml();
      } else {
    $full_message = $message;
  }

  if (in_array(1, $error_mode)) {
    watchdog('gallery', $full_message, WATCHDOG_ERROR);
  }
}
 
 
?>