ABOUT

This module provides a nested unordered list representation of a complete 
Drupal menu structure.  menutree/1 provides a tree representation of menu 1, 
menutree/2 provides a tree representation of menu 2, etc.  If no ID is 
specified, the primary_links menu is used.  That allows it to be used as a 
simple menu-based sitemap, give or take a path alias.  The path menutree/all
provides a list of all flagged menus for sites that have multiple separate
navigation menus.

REQUIREMENTS

- Drupal 5.x

INSTALLATION

- Copy the menutree directory to your modules directory.
- Go to admin/build/modules and enable it.
- Go to admin/settings/menutree to optionally set a page title and intro text
  for menutree (sitemap) pages.
- Everything else is handled by the miracle of Drupal's automated install
  system.

AUTHOR AND CREDIT

Larry Garfield
garfield@palantir.net
http://www.palantir.net/

This module was initially developed by Palantir.net for artsci.wustl.edu, and
released to the Drupal community under the GNU General Public License.
