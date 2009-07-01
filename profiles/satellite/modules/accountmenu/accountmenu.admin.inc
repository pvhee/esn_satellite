<?php
// $Id: accountmenu.admin.inc,v 1.1 2009/06/23 18:50:57 mattyoung Exp $
/**
 * @file accountmenu.admin.inc
 * admin/settings/accountmenu form constructor
 */



function accountmenu_settings_form() {
  $options = menu_get_menus();
  $description = t('The Account menu links are currently in "!name". They can be moved to be part of another menu.',
                   array('!name' => $options[variable_get('accountmenu_menu_name', 'accountmenu')]));
  unset($options[variable_get('accountmenu_menu_name', 'accountmenu')]);    // user cannot choose the current value
  if (variable_get('accountmenu_menu_name', 'accountmenu') != 'accountmenu') {
    $description .= t(' Or in the "!name" by themselve.', array('!name' => 'Account menu'));
  }
  $form['accountmenu_menu_name'] = array(
    '#type' => 'select',
    '#title' => t('Move the links to'),
    '#options' => $options,
    '#description' => $description,
  );
  
  $form = system_settings_form($form);
  $form['#submit'][] = '_accountmenu_reset_menu';
  return $form;
}