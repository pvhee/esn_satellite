<?php
// $Id: content_complete.rules.inc,v 1.1.2.2 2009/03/09 05:03:33 pvhee Exp $

/**
 * @file
 * Some rules conditions/actions
 */
 
/**
 * Implementation of hook_rules_condition_info().
 * 
 * @ingroup rules
 * @see content_complete_completeness_percentage_form
 */
function content_complete_rules_condition_info() {
  return array(
    'content_complete_completeness_percentage' => array(
      'label' => t('Content Complete % is >= than x'),
      'arguments' => array(
        'user' => array('type' => 'user', 'label' => t('User'))
      ),
      'module' => 'Content Complete',
      'eval input' => array('percentage'),
    ),
  );
}


/**
 * Rules Condition form configuration - set the % to compare
 * 
 * @see content_complete_rules_condition_info
 */
function content_complete_completeness_percentage_form($settings = array(), &$form) {
  $form['settings']['percentage'] = array(
    '#type' => 'textfield',
    '#title' => t('% to compare'),
    '#default_value' => isset($settings['percentage']) ? $settings['percentage'] : '',
    '#description' => t('The % to compare if >=. Example: 100, so the condition will be triggered if the content is complete.')
  );
  $form['settings']['type'] = array(
    '#type' => 'select',
    '#title' => t('Content Type to analyze'),
    '#options' => node_get_types('names'),
    '#default_value' => isset($settings['type']) ? $settings['type'] : '',
    '#description' => t('Content Type to analyze'),
    '#required' => TRUE,
  );
}

/**
 * Rules Condition - Content Complete % is >= than
 * 
 * @param $user 
 *   The user for which the condition is checked.
 * @param $settings
 *   The configured settings of the rule condition
 * 
 * @see content_complete_completeness_percentage_form
 * @see content_complete_rules_condition_info
 * 
 * @return TRUE or FALSE
 */
function content_complete_completeness_percentage($user, $settings) {
  $complete = content_complete_get_data($settings['type'], $user);
  return ($complete['percent'] >= $settings['percentage']);
}