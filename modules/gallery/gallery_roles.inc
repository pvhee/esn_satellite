<?php
// $Id: gallery_roles.inc,v 1.1.2.1 2006/07/17 11:09:37 kiz0987 Exp $
/**
 * gallery.module : gallery_roles.inc
 * Group/Role Functions (sync groups, ...)
 */

/**
 * Sync Drupal roles and Gallery groups for a specific user
 */ 
 // Check for remove user.
function gallery_sync_groups_for_user($user) {
  // Take this opportunity to sync the Drupal roles and Gallery groups
  gallery_sync_groups();
  // Find the Ids for the 2 special Drupal roles (from user.module code)
  $authenticated_role =  db_result(db_query("SELECT rid FROM {role} WHERE name = 'authenticated user'"));
  $anonymous_role =  db_result(db_query("SELECT rid FROM {role} WHERE name = 'anonymous user'"));
  
  // Find the Ids for the special G2 groups 
  list ($ret, $g2_gid_everybodyGroup) = GalleryCoreApi::getPluginParameter('module', 'core',
    'id.everybodyGroup');
  if ($ret) {
    $msg = t('Error retrieving Gallery group Id for \'Everybody\' group');
    gallery_error($msg, $ret);
    return;
  }
  
  // Get the Gallery groups for this user
  // First get the G2 Id from the Drupal uid
  list ($ret, $g2_user) = GalleryCoreApi::loadEntityByExternalId($user->uid, 'GalleryUser');
  if ($ret) {
    $msg = t('Error getting Gallery User info from Drupal Id');
    $msg .= ' ' . t('Drupal User Id: ') . $user->uid;        
    gallery_error($msg, $ret);
    return;
  }
  // Then get the groups for this user currently set in G2
  list ($ret, $g2_cur_groups) = GalleryCoreApi::fetchGroupsForUser($g2_user->getId());
  if ($ret) {
    $msg = t('Error getting Gallery group info for user');
    $msg .= ' ' . t('Drupal User Id: ') . $user->uid;        
    gallery_error($msg, $ret);
    return;
  }
  // Now convert the new Drupal role Ids into Gallery Group Ids(for comparison)
  foreach ($user->roles as $rid=>$role_name) { 
    list ($ret, $g2_group) = GalleryCoreApi::loadEntityByExternalId($rid, 'GalleryGroup');
    if ($ret) {
      $msg = t('Error getting Gallery Group Id from Drupal Role Id');
      $msg .= ' ' . t('Drupal Role Id: ') . $rid;        
      gallery_error($msg, $ret);
      return;
    }
    $g2_rid[$rid] = $g2_group->getId();
  }
  // Find if the user needs to be deleted from any G2 groups (only mapped groups)
  $g2_mapped_groups = gallery_get_mapped_groups();
  foreach ($g2_cur_groups as $gid=>$gname) {
    if (!in_array($gid, $g2_rid) && ($gid != $g2_gid_everybodyGroup) && in_array($gid, $g2_mapped_groups)) {
      $delete_list[] = $gid;
      $ret = GalleryCoreApi::removeUserFromGroup($g2_user->getId(), $gid);
      if ($ret) {
        $msg = t('Error removing user from Gallery group');
        $msg .= ' ' . t('Gallery Group Id: ') . $gid . ' ' . t('Gallery Group Name: ') . $gname;        
        gallery_error($msg, $ret);
        return;
      }
    }
  }
  // Find if the user needs to be added to any G2 groups
  foreach ($g2_rid as $rid=>$gid) {
    if (!isset($g2_cur_groups[$gid])) {
      $add_list[] = $gid;
      $ret = GalleryCoreApi::addUserToGroup($g2_user->getId(), $gid);
      if ($ret) {
        $msg = t('Error adding user to Gallery group');
        $msg .= ' ' . t('Gallery Group Id: ') . $gid;        
        gallery_error($msg, $ret);
        return;
      }
    }
  }  
}

/**
 * Sync Drupal roles and Gallery groups. This will add any mappings that are required 
 * (eg on first install, or if a group is added). It will also delete groups in Gallery 
 * that have been deleted from Drupal. 
 */ 
function gallery_sync_groups() {
  // Check if the Drupal role <-> G2 group mapping exists
  $roles = user_roles();
  // Find the Ids for the 2 special Drupal groups (from user.module code)
  $authenticated_role =  db_result(db_query("SELECT rid FROM {role} WHERE name = 'authenticated user'"));
  $anonymous_role =  db_result(db_query("SELECT rid FROM {role} WHERE name = 'anonymous user'"));
  // Go through each role and add or delete the gallery group if needed
  foreach ($roles as $rid => $role_name) {
    // Add Drupal<->G2 mapping if needed
    $ret = GalleryEmbed::isExternalIdMapped($rid, 'GalleryGroup');
    if ($ret && ($ret->getErrorCode() & ERROR_MISSING_OBJECT)) {
    // Need to add the mapping
      switch ($rid) {
        // Add mapping for Anonymous and get the G2 group Id
        case $anonymous_role:
          list ($ret, $g2_gid) = GalleryCoreApi::getPluginParameter('module', 'core', 'id.everybodyGroup');
          if ($ret) {
            $msg = t('Error retrieving Gallery group Id for \'Everybody\' group');
            gallery_error($msg, $ret);
            return;
          }
          $ret = GalleryEmbed::addExternalIdMapEntry($rid, $g2_gid, 'GalleryGroup');
          if ($ret) {
              $msg = t('Error creating new Drupal role <-> Gallery group mapping (for \'anonymous user\' role)');
              $msg .= ' ' . t('Drupal Role Id: ') . $rid . ' ' . t('Gallery Group Id: ') . $g2_gid;
              gallery_error($msg, $ret);
              return;
          }
          break;
        // Add mapping for authenticated users role and get the G2 group Id
        case $authenticated_role:
          list ($ret, $g2_gid) = GalleryCoreApi::getPluginParameter('module', 'core', 'id.allUserGroup');
          if ($ret) {
            $msg = t('Error retrieving Gallery group Id for \'Registered Users\' group');
            gallery_error($msg, $ret);
            return;
          }
          $ret = GalleryEmbed::addExternalIdMapEntry($rid, $g2_gid, 'GalleryGroup');
          if ($ret) {
            $msg = t('Error creating new Drupal role <-> Gallery group mapping (for \'authenticated user\' role)');
            $msg .= ' ' . t('Drupal Role Id: ') . $rid . ' ' . t('Gallery Group Id: ') . $g2_gid;
            gallery_error($msg, $ret);
            return;
          }
          break;
        default:
          // Is there already a group by this name? If so, map to it.
          list ($ret, $g2_group) = GalleryCoreApi::fetchGroupByGroupName($role_name);
          if (!$ret) {
            $g2_gid = $g2_group->getId();
            $ret = GalleryEmbed::addExternalIdMapEntry($rid, $g2_gid, 'GalleryGroup');
            if ($ret) {
              $msg = t('Error creating new Drupal role <-> Gallery group mapping (by name)');
              $msg .= ' ' . t('Drupal Role Id: ') . $rid . ' ' . t('Gallery Group Id: ') . $g2_gid;
              gallery_error($msg, $ret);
              return;
            }
          } else {
            // If not, create a new group
            $ret = GalleryEmbed::createGroup($rid, $role_name);
            if ($ret) {
              $msg = t('Error creating new Gallery group');
              $msg .= ' ' . t('Drupal Role Id: ') . $rid . ' ' . t('Drupal Role Name: ') . $role_name;        
              gallery_error($msg, $ret);
              return;
            }
          }
          break;
      }
    } else {
    // Update group name if needed (not for $authenticated_role or $anonymous_role)
      list($ret, $g2_group) = GalleryCoreApi::loadEntityByExternalId($rid, 'GalleryGroup');
      // In some cases the ExternalId may be present, but the user may have been deleted
      if ($ret) {
        $msg = t('Error retrieving Gallery Group Id from Drupal Role Id');
        $msg .= ' ' . t('Drupal Role Id: ') . $rid;        
        gallery_error($msg, $ret);
        return;
      }
      if (($rid != $authenticated_role) && ($rid != $anonymous_role) && ($role_name != $g2_group->getGroupName())) {
        $ret = GalleryEmbed::updateGroup($rid, array('groupname'=>$role_name));
        if ($ret) {
          $msg = t('Error updating Gallery group');
          $msg .= ' ' . t('Drupal Role Id: ') . $rid . ' ' . t('Drupal Role Name: ') . $role_name;        
          gallery_error($msg, $ret);
          return;
        }
      }
    }
  }
  // Now check for any deleted Drupal roles. Only delete those G2 groups that were mapped to Drupal roles
  // (just in case other groups have been defined which are not meant to be sync'd with Drupal)
  list ($ret, $g2_map) = GalleryEmbed::getExternalIdMap('entityId');
  if ($ret) {
    $msg = t('Error retrieving all Drupal<->Gallery Map Ids');
    gallery_error($msg, $ret);
    return;
  }
  $g2_mapped_groups = gallery_get_mapped_groups();
  foreach ($g2_mapped_groups as $rid=>$g2_gid) {
    // Delete if needed
    if (!isset($roles[$rid])) {
      $msg = t('Deleting G2 group') . ' (' . t('Gallery Group Id: ') . $g2_gid .')';
      $ret = GalleryEmbed::deleteGroup($rid);
      if ($ret) {
        $msg = t('Error deleting Gallery group');
        $msg .= ' ' . t('Gallery Group Id: ') . $g2_gid;        
        gallery_error($msg, $ret);
        return;
      }        
    }
  }
}

/**
 * Get G2 Groups that have been mapped to Drupal Roles
 */
function gallery_get_mapped_groups() {
  list ($ret, $g2_map) = GalleryEmbed::getExternalIdMap('entityId');
  if ($ret) {
    $msg = t('Error retrieving all Drupal<->Gallery Map Ids');
    gallery_error($msg, $ret);
    return;
  }
  /* 
   * getExternalIdMap returns groups and user mappings. 
   * Cannot use 'externalId' as key as is not unique between users & groups
   */
  foreach ($g2_map as $g2_gid => $g2_data) {
    if ($g2_data['entityType'] == 'GalleryGroup') {
      $g2_mapped_groups[$g2_data['externalId']] = $g2_gid;
    }
  }
  return $g2_mapped_groups;
}
?>