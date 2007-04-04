README
------

Provides a block displaying titles of nodes in a scrolling news
ticker.

This module was sponsored by Koumbit.org.

Installation
------------

1. Copy all files in this directory to modules/taxonomy_ticker (i.e. a
   directory named 'taxonomy_ticker inside the Drupal modules/
   directory).

2. Make this module active (go to admin/modules page...).

3. Create a [taxonomy, category] to 'flag' nodes that are to be shown in
   the ticker.

4. Go to admin/settings/taxonomy_ticker and select the [taxonomy, category]
   that you just created.

5. Activate the block in admin/block.

6. Position the taxonomy_ticker block in your theme using something that
   looks like that :

#block-taxonomy_ticker-0 {
  position: absolute;
  left: 200px;
  top: 20px;
  background: transparent;
}

7. Test it! Create a node, put it in the [taxonomy, category] associated
   with the ticker and save.

Known Issues
--------------

You can have only one ticker block per page, because the javascript
relies on the id tag.

Only one block is exported.

...see todo, at the end of this file.

Authors
-------

 * Laurent Villeneuve created the javascript magic to make this happen.
 * Mathieu Petit-Clair (mathieu on drupal / scyrma  on freenode) made
   the basic framework of the module, glued everything together and
   is the current maintainer for the module.
 * The Anarcat provided CVS access, provided Drupal counseling and
   made the settings page.

Credits
------

Basic README structure and inspiration for the hooks implementaion
taken from taxonomy_dhtml.module by weitzman.

History
-------

 * First version written in Fall 2005.
 * Update to 4.7 done mid-June 2006 :
    Derek Kayfisher (kayfish) sent a patch for forms api
    Mathieu did the rest (mostly javascript activation)
 * Some improvements integrated at the same time (flexinode example in
    code and "better flowing")

Todo
----
 * Use regions!  Now that Drupal supports block in the header/footer, it would be nicer than using css
 * Better integration with Flexinode (or CCK, someday)
 * More options : empty lines (top/bottom), css classes to use ...
 * Support for more than one ticker per page
 * ...probably heaps of other stuff.
