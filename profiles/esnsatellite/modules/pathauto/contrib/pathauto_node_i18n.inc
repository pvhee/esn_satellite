<?php
// $Id: pathauto_node_i18n.inc,v 1.3.4.4 2007/04/30 16:48:21 greggles Exp $

/*
 * Implementation of hook_token_list()
 */
function pathauto_node_i18n_token_list($type = 'all') {
  if ($type == 'node' || $type == 'all') {
    $tokens['node']['lang']   = t("Language code of the document");
    return $tokens;
  }
}

/*
 * Implementation of hook_token_values()
 */
 
function pathauto_node_i18n_token_values($type, $object = NULL) {
  if ($type == 'node') {
    $tokens['lang']      = i18n_node_get_lang($node->nid, i18n_get_lang());
    return $tokens;
  }
}

