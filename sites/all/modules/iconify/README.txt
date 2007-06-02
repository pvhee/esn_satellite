/* iconify.module  0.2 2007-04-08*/
Iconify
Author: morten.dk <drupal at morten dot dk>

-----------
Description
-----------
This module adds span tags to the fieldset, li and dt tags in the admin areas of drupal, so its simple to add icons to these areas, 
and make mighty drupal look even more fresh and hip ;)

the module uses css files for all the icons so its very easy to eather overwrite this or add new icons
all the icons are placed in the moduls/iconify/icon

-----------
Dependencies
------------
None.

-----------
How to add more icons n stuff
------------------
FOO modul thats not yet supported in iconify.

in foo.css or style.css etc
user acces control:
	#module-FOO{padding: 0 0 0 25px; background: url("icons/FOO.png") no-repeat 5px 4px;}
fieldsets & admin pages:
	#icon_FOO_TITLE{background: url("icons/FOO.png") no-repeat; display:block;}
modules
	#admin-FOO{background: url("icons/FOO.png") no-repeat 5px 0px; padding:0 0 0 24px;}
-----------
TODO
-----------

-----------
More Information
----------------
See http://www.morten.dk/code/iconify

