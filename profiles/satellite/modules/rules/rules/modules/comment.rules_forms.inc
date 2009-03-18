<?php
// $Id: comment.rules_forms.inc,v 1.1.2.1 2009/02/19 12:58:46 fago Exp $
/**
 * @file
 * Rules configuration forms for the comment module.
 */

/**
 * Action "Load a comment by id" variable label callback.
 */
function rules_action_load_comment_variable_label($settings) {
  return t('Comment with id @id', array('@id' => $settings['cid']));
}