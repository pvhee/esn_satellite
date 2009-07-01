<?php
// $Id$

/**
 * @file rules integration for the feedback module
 */

/**
 * Implementation of hook_rules_event_info().
 */
function feedback_rules_event_info() {
  return array(
    'feedback_add_entry' => array(
      'label' => t('User gives feedback'),
      'module' => 'Feedback',
      'arguments' => rules_events_global_user_argument() + array(
        'feedback' => array('type' => 'string', 'label' => t('feedback message')),
        'location' => array('type' => 'string', 'label' => t('feedback location')),
        'location_masked' => array('type' => 'string', 'label' => t('feedback location masked')),
        'useragent' => array('type' => 'string', 'label' => t('user agent')),
      )
    ),
  );
}