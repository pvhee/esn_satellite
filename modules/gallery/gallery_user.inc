<?php
// $Id: gallery_user.inc,v 1.2.2.2 2006/07/17 11:09:37 kiz0987 Exp $

/**
 * gallery.module : gallery_user.inc
 * User Modification Functions (create, update, delete...)
 */

define("G2_USER_EXISTS", 1);
define("G2_USER_EXISTS_BUT_NEEDS_MAPPING", 2);
define("G2_USER_DOES_NOT_EXIST_BUT_IS_MAPPED", 3);
define("G2_USER_DOES_NOT_EXIST", 4);

$path = drupal_get_path('module', 'gallery');
require_once($path . '/gallery_roles.inc');
 
/**
 * Insert new user
 */
function gallery_insert_user(&$edit, $user) {
    list ($success, $ret) = _gallery_init();
    if (!$success) {
      $err_msg = t('Unable to initialize embedded Gallery. You need to <a href="%link">
                    configure your embedded Gallery</a>.', 
                    array('%link' => url('admin/settings/gallery')));
      gallery_error($err_msg, $ret);
      return;
    }
    
    list ($success, $ret) = gallery_modify_user($user, 'create');
    if ($ret) {
      gallery_error(t('Error creating Gallery user'), $ret);
      return;
    }

    GalleryEmbed::done();
    return;
}

/**
 * Update a user with new information
 */
function gallery_update_user(&$edit, $user) {
  list ($success, $ret) = _gallery_init();
  if (!$success) {
      $err_msg = t('Unable to initialize embedded Gallery. You need to <a href="%link">
                    configure your embedded Gallery</a>.', 
                    array('%link' => url('admin/settings/gallery')));
      gallery_error($err_msg, $ret);
      return;
  }

  // on update we can't be sure how much info $edit will contain.
  // $user is a copy, so we can modify it here.
  $user->name = ($edit['name']) ? $edit['name'] : $user->name;
  $user->language = ($edit['language']) ? $edit['language'] : gallery_get_language($user);
  $user->pass = ($edit['pass']) ? md5($edit['pass']) : $user->pass;
  $user->status = ($edit['status']) ? $edit['status'] : $user->status;
  $user->mail = ($edit['mail']) ? $edit['mail'] : $user->mail;
  // Note: $user->roles is organized as [$rid]=>[$role_name], but edit['roles'] is [$rid]=>[$position]
  $user->roles = ($edit['roles']) ? $edit['roles'] : $user->roles;
  // Use full name from profile if it exists 
  $fullnamefield = variable_get('gallery_profile_full_name_field', 'profile_full_name');
  $usefullname = variable_get('gallery_use_full_name', 0) && module_exist('profile');
  if (($edit[$fullnamefield] || $user->$fullnamefield) && $usefullname) {
    $user->$fullnamefield = ($edit[$fullnamefield]) ? $edit[$fullnamefield] : $user->$fullnamefield;
  } else {
    $user->$fullnamefield = $name;
  } 

  list ($success, $ret) = gallery_modify_user($user, 'update');
  if ($ret) {
    gallery_error(t('Error updating Gallery user'), $ret);
    return;
  }  
  GalleryEmbed::done();
  return;
}

/**
 * Delete the user from the Gallery 
 */ 
function gallery_delete_user($user) {
    list ($success, $ret) = _gallery_init();
    if (!$success) {
      $err_msg = t('Unable to initialize embedded Gallery. You need to <a href="%link">
                    configure your embedded Gallery</a>.', 
                    array('%link' => url('admin/settings/gallery')));
      gallery_error($err_msg, $ret);
      return;
    }
    $ret = GalleryEmbed::deleteUser($user->uid);
    if ($ret) {
      gallery_error(t('Error deleting Gallery user'), $ret);
    }
    GalleryEmbed::done();
    return;
}

/**
 * Modify (create/update) a user
 */
function gallery_modify_user($user, $action = 'create') {
  $fullnamefield = variable_get('gallery_profile_full_name_field', 'profile_full_name');
  $usefullname = variable_get('gallery_use_full_name', 0) && module_exist('profile');
  $fullname = ($user->$fullnamefield && $usefullname) ? $user->$fullnamefield : $user->name;
  // Generate random password for gallery2 if user is blocked, to avoid them being able to login
  // to gallery2 if not-embedded operation is allowed.
  $pass = ($user->status == 1) ? $user->pass : user_password(20);
     
  switch ($action) {
    case 'create' :
    case 'update' : 
      // See if user already exists in Gallery2
      list ($g2_user_state, $g2_user, $ret) = _gallery_check_user_status($user);
      if ($ret) {
        // An unmasked error, so exit now
        return array(false, $ret);
      }
    
      switch ($g2_user_state) {
        case G2_USER_EXISTS_BUT_NEEDS_MAPPING:
          // No mapping found, so add one
          $ret = GalleryEmbed::addExternalIdMapEntry($user->uid, $g2_user->getId(), 'GalleryUser');
          if ($ret) {
            // mapping the user failed for some reason, so exit
            return array(false, $ret);
          } 
          // Continue to update
        case G2_USER_EXISTS:
          // May need to update the user info with that from Drupal
          $ret = GalleryEmbed::updateUser($user->uid,
                  array('username' => $user->name,
                        'fullname' => $fullname,
                        'email' => $user->mail,
                        'language' => gallery_get_language($user),
                        'hashedpassword' => $pass,
                        'hashmethod' => 'md5'));
          if ($ret) {
            return array(false, $ret);
          }
          break;
        case G2_USER_DOES_NOT_EXIST_BUT_IS_MAPPED:
          $ret = GalleryCoreApi::removeMapEntry('ExternalIdMap', array('externalId' => $user->uid, 'entityType' => 'GalleryUser'));
          if ($ret) {
            // There was an error on removeMapEntry
            return array(false, $ret2);
          } 
          // Continue to creation
        case G2_USER_DOES_NOT_EXIST:
          // Create the new user
          $ret = GalleryEmbed::createUser($user->uid, 
                  array('username' => $user->name,
                        'email' => $user->mail,
                        'fullname' => $fullname,
                        'language' => gallery_get_language($user),
                        'hashedpassword' => $pass,
                        'hashmethod' => 'md5'));
          if ($ret) {
            // There was an error on user creation
            return array(false, $ret);
          }
          break;
      }
      if ($ret) {
        return array(false, $ret);
      }
      // Add group info
      gallery_sync_groups_for_user($user);
      break;  
  }
  return array(true, null);
}


function _gallery_create_user_if_necessary($user) {

}		    
       
function _gallery_check_user_status($user) {
  // See if user already exists in Gallery2
  list ($ret, $g2_user) = GalleryCoreApi::fetchUserByUsername($user->name);
  if (!$ret) {
    // The user is in Gallery2, so map the user if needed
    $ret2 = GalleryEmbed::isExternalIdMapped($user->uid, 'GalleryUser');
    if ($ret2) {
      if ($ret2->getErrorCode() & ERROR_MISSING_OBJECT) {
        return array(G2_USER_EXISTS_BUT_NEEDS_MAPPING, $g2_user, null);
      } else {					 
         // Some other error, so exit
        return array(null, $g2_user, $ret2);
      }
    } else {
        return array(G2_USER_EXISTS, $g2_user, null);
    }
  } elseif ($ret->getErrorCode() & ERROR_MISSING_OBJECT) {
    // The user does not yet exist in G2
    // First, check if the extID was mapped (it should not be)
    $ret2 = GalleryEmbed::isExternalIdMapped($user->uid, 'GalleryUser');
    if ($ret2) {
      if ($ret2->getErrorCode() & ERROR_MISSING_OBJECT) {
      // This should be missing
        return array(G2_USER_DOES_NOT_EXIST, $g2_user, null);      
      } else {
        // Some other error, so exit
        return array(null, $g2_user, $ret2);
      }
    } else {
      // No error, so user is mapped
      return array(G2_USER_DOES_NOT_EXIST_BUT_IS_MAPPED, $g2_user, null);
    }

    /*    if (!$ret2) {
       return array(G2_USER_DOES_NOT_EXIST, $g2_user, null);      
    } else {
      if (!($ret2->getErrorCode() & ERROR_MISSING_OBJECT)) {
        // There is a mapping for this user even though the user does not exist,
        return array(G2_USER_DOES_NOT_EXIST_BUT_IS_MAPPED, $g2_user, null);
      } else {
        // Some other error, so exit
        return array(null, $g2_user, $ret2);
      }
    }*/
  } else {
  // Some other error so exit
    return array(null, $g2_user, $ret);
  }
}

/* --------------------------------------------------------------------------
 * User View Functions (view all users, view specific users,...)
 * --------------------------------------------------------------------------
 */

/**
 * View Gallery user details for a specific user
 */
function gallery_view_user($user) {
  $g2_userinfo = gallery_user_info($user, true);  
  if (($g2_userinfo['error_msg']) && (user_access('administer users'))) {
    $form['gallery_view_user'] = array(
      'title' => t('Gallery2-Drupal Sync Status'), 
      'value' => implode(',<br />', $g2_userinfo['error_msg']) . '<br />');
    return array(t('Gallery2') => $form);
  }
}

/**
 * Gallery Users Page - view a set of users
 */
function _gallery_users() {
// user.module and userlist.module inspired code with some G2 stuff from Mambo embed
  $header = array(
    array('data' => t('ID'), 'field' => 'u.uid', 'sort' => 'asc'),
    array('data' => t('G2ID')),
    array('data' => t('Username'), 'field' => 'u.name'),
    array('data' => t('Status'), 'field' => 'u.status'),
    array('data' => t('Sync Status')),
    t('Operations'),
    t('G2 Operations')
  );
  $sql = 'SELECT u.uid, u.name, u.status, u.mail, u.pass FROM {users} u WHERE uid != 0';
  $sql .= tablesort_sql($header);
  $result = pager_query($sql, 50);

  $status = array(t('blocked'), t('active'));
  $destination = drupal_get_destination();

  list ($success, $ret) = _gallery_init(true);
  if (!$success) {
      $err_msg = t('Unable to initialize embedded Gallery. You need to <a href="%link">
                    configure your embedded Gallery</a>.', 
                    array('%link' => url('admin/settings/gallery')));
      gallery_error($err_msg, $ret);
      return;
  }
  $urlGenerator =& $GLOBALS['gallery']->getUrlGenerator();
  while ($account = db_fetch_object($result)) {
    // Check if user exists in G2 database and check its info
    $g2_userinfo = gallery_user_info($account);
    
    $link_url = $urlGenerator->generateUrl(array('view' => 'core.SiteAdmin', 
                                                 'subView' => 'core.AdminEditUser',
                                                 'userId' => $g2_userinfo['g2_id']));
    $link_url = '<a href="' . $link_url . '">' . t('edit G2') . '</a>';                                             
    
    $g2_edituserlink = ($g2_userinfo['g2_id']>=0) ? $link_url : t('N/A');
    $g2_id = ($g2_userinfo['g2_id']>=0) ? $g2_userinfo['g2_id'] : t('N/A');
   
    $rows[] = array($account->uid, $g2_id, theme_username($account), 
                    $status[$account->status], implode(',<br />', $g2_userinfo['error_msg']),  
                    l(t('edit'), "user/$account->uid/edit", array(), $destination),
                    $g2_edituserlink);
  }

  $pager = theme('pager', NULL, 50, 0);
  if (!empty($pager)) {
    $rows[] = array(array('data' => $pager, 'colspan' => '5'));
  }
  $output = theme('table', $header, $rows);
  $output .= theme('pager', array(), 100);
  GalleryEmbed::done();
  return $output;
}

/**
 * Helper to get Gallery2 user info
 */
function gallery_user_info($user, $full = false) {
  list ($success, $ret) = _gallery_init(true);
  if (!$success) {
      $err_msg = t('Unable to initialize embedded Gallery. You need to <a href="%link">
                    configure your embedded Gallery</a>.', 
                    array('%link' => url('admin/settings/gallery')));
      gallery_error($err_msg, $ret);
      return;
  }
  $g2_userinfo['error_msg'] = array();
  $ret = GalleryEmbed::isExternalIdMapped($user->uid, 'GalleryUser');
  if ($ret && !($ret->getErrorCode() & ERROR_MISSING_OBJECT)) {
    $g2_userinfo['g2_id'] = -1;
    $g2_userinfo['error_msg'][] = t('Missing from G2');
    $g2_userinfo['sync_ok'] = 0;
    return $g2_userinfo;
  }
  // There is an ExternalId, so load the info
  list($ret, $g2_user) = GalleryCoreApi::loadEntityByExternalId($user->uid, 'GalleryUser');
  // In some cases the ExternalId may be present, but the user may have been deleted
  if ($ret) {
    $g2_userinfo['g2_id'] = -1;
    $g2_userinfo['error_msg'][] = t('Missing from G2');
    $g2_userinfo['sync_ok'] = 0;
    return $g2_userinfo;
  }
  // Go through a number of fields in both users and check for differences
  // The G2 object seems to have changed from $g2_user->_id to $g2_user->id
  $g2_userinfo['g2_id'] = $g2_user->id;
  if ($g2_user->getuserName() != $user->name ){ 
    $g2_userinfo['error_msg'][] = t('Different Usernames');
  }
  $usefullname = variable_get('gallery_use_full_name', 0) && module_exist('profile');
  if ($usefullname) {
    $fullnamefield = variable_get('gallery_profile_full_name_field', 'profile_full_name');
    $fullnameresult = db_query("SELECT v.value FROM {profile_values} v INNER JOIN {profile_fields} f ON v.fid = f.fid AND v.uid=%d WHERE f.name = '%s'", $user->uid, $fullnamefield);
    $fullname = db_fetch_object($fullnameresult);
    $fullname = $fullname->value;
    $msg = t('Drupal Full Name: "') . $fullname . t('" G2 Full Name: "') . $g2_user->getfullName().'"';
    
    if ($g2_user->getfullName() != $fullname) { 
      $g2_userinfo['error_msg'][] = t('Different Full Names');
    } else if (!$fullname) {
    // If usefullname is turned on, but the field is not completed, this will occur.
      $g2_userinfo['error_msg'][] = t('Full Name missing');
    }
  } else {
    if ($g2_user->getfullName() != $user->name) { 
      $g2_userinfo['error_msg'][] = t('G2 Full Name incorrect');
    }     
  }
  if ($g2_user->getemail() != $user->mail) { 
    $g2_userinfo['error_msg'][] = t('Different E-Mails'); //FIX
  }
  if ($g2_user->gethashedPassword() != $user->pass) {
      $g2_userinfo['error_msg'][] = ($user->status) ? t('Different Passwords') : t('Blocked User');
  }  
  
  $g2_userinfo['sync_ok'] = (!$g2_userinfo['error_msg']);  
  if ($g2_userinfo['sync_ok']) {
    $g2_userinfo['error_msg'][] = t('OK');
  }
  // Get full info if needed
  if (!$full) {
    return $g2_userinfo;
  }
  list($ret, $all_itemids) = GalleryCoreApi::fetchAllItemIdsByOwnerId($g2_userinfo['g2_id']);
  $g2_userinfo['count_total'] = count($all_itemids);
  $g2_userinfo['count_album'] = 0;
  $g2_userinfo['album_id'] = array();
  // Get all albums for this user
  list($ret, $all_albumids) = GalleryCoreApi::fetchAllItemIds('GalleryAlbumItem');
  foreach ($all_itemids as $id => $name) {
    if (in_array($name, $all_albumids)) {
      $g2_userinfo['count_album']++;
      $g2_userinfo['album_id'][] = $name;
    }	
  }
  return $g2_userinfo;
}
?>