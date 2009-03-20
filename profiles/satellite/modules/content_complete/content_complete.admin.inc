<?php
// $Id: content_complete.admin.inc,v 1.1.2.1 2009/03/09 05:03:33 pvhee Exp $ 

/** 
 *@file 
 *Administration page callbacks for the content_complete module. 
 */

/**
 * Menu Callback Function
 *  Build output of the content_complete module settings which allows the
 *  administrator to tag specific profile fields which will be 
 *  used to determine the completion of a users profile.
 */
function content_complete_admin_settings() {
  $header = t('Select fields for the content types. Selected fields will be checked for completeness for that content type.');
  $form = drupal_get_form('content_complete_admin_settings_form');
  return $header . $form;
}

/**
 * Admin settings form
 */
function content_complete_admin_settings_form() {
  // get all content types
  $types = node_get_types('names');
  
  $form = array();
  foreach ($types as $content_type => $content_name) {
    $data = content_complete_admin_settings_form_data($content_type);
    $type_set = empty($data['default']['type']) ? FALSE : TRUE;    

    $id = $content_type;
    
    $form[$id] = array(
      '#title' => $content_name,
      '#type' => 'fieldset',
      '#description' => t('If one or more fields are selected, completeness checks will be run for this content type.'),
      '#collapsible' => TRUE, 
      '#collapsed' => ! $type_set 
    );

    $form[$id]['fields'] = array(
      '#type' => 'checkboxes', 
      '#options' => $data['options'], 
      '#default_value' => $data['default']['fields'] 
    );
  
  }
  
  $form['submit'] = array(
    '#type' => 'submit', 
    '#value' => t('Save') 
  );
  
  $form['#tree'] = TRUE; // return nested array of fields	

  return $form;
}

/**
 * Admin settings form submit
 */
function content_complete_admin_settings_form_submit($form, &$form_state) {
  if (is_array($form_state['values']) && ! empty($form_state['values'])) {
    db_query("DELETE FROM {content_complete}");
    foreach ($form_state['values'] as $content_type => $value) {

      if (is_array($value) && isset($value['fields'])) {
        //$content = array_filter($value['content']);
        $fields = array_filter($value['fields']);

        foreach ($fields as $field) {
          db_query("INSERT INTO {content_complete} VALUES ('%s', '%s')", $content_type, $field);
        }

      }
    }

    drupal_set_message(t("Your settings have been saved."));
  }
}

function content_complete_admin_settings_form_data($content_type) {
  /**
   * Get the fields for this content type
   */
  $fields = content_complete_get_fields($content_type);
  
  /**
   * Format for presentation
   */
  $options = array();
  foreach ($fields as $field_name => $field_data) {
    $key = $field_name;
    $label = $field_data['label'] ." <span class='description'>". $field_name ."</span>";
    $options[$field_name] = $label;
  }
  
  /**
   * Put the default values
   */
  $default_type = $default_fields = array();
  $tagged_fields = content_complete_get_tagged_fields($content_type);
  if (! empty($tagged_fields)) {
    $default_type[] = $content_type;
    foreach ($tagged_fields as $tagged_field) {
      $default_fields[] = $tagged_field;
    }
  }
  
  $data['options'] = $options;
  $data['default']['type'] = $default_type;
  $data['default']['fields'] = $default_fields;
  
  return $data;
}
