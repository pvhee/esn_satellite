This modules provides a menu with links for [Log in][My account][Log out].
These links are dynamic, only [Log in] is displayed if the user has not
logged in. After, [My account][Log in] are shown.

By default these links are in the menu "Account menu". It can be used like
the primary-links menu. These links can be moved to be part of any other
menu using the admin/settings/accountmenu screen.

The [Log in] link takes the user to the Drupal login screen. After the user
sucessfully log in, the screen return back to the page from where the user
originally click [Log in] link.

The links are fully configurable through the admin/build/menu interface.
However, remember that if you subsequently move the links to another menu,
the configuration changes are lost. So it's best to first move the links
first, then set configuration.