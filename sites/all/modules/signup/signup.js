/* $Id: signup.js,v 1.1.2.2 2007/03/30 23:45:53 dww Exp $ */

/**
 * On a node form, if the "Allow signups" radios are set to 1
 * ('Enabled'), then show the other signup-specific settings,
 * otherwise, hide them.
 */
Drupal.signupShowSettingsAutoAttach = function () {
  $('div.signup-allow-radios input[@type=radio]').click(function () {
    $('div.signup-node-settings')[['hide', 'show', 'hide'][this.value]]();
  });
}

// Global killswitch.
$(function() {
  if (Drupal.jsEnabled) {
    Drupal.signupShowSettingsAutoAttach();
  }
});
