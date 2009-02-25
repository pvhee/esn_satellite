<?php
// $Id: database_pgsql_dump.inc,v 1.2 2007/09/20 15:34:41 sun Exp $

/**
 * Dump active database.
 *
 * @todo Postgres should utilize pg_dump. See phpPgAdmin's dbexport.php
 * for how to do it.
 */
function demo_dump_db($filename, $exclude = array()) {
  drupal_set_message(t('PostgreSQL support not implemented yet.'), 'error');
  return FALSE;
}

