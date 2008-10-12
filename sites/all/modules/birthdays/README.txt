// $Id: README.txt,v 1.2.2.5 2008/10/01 15:17:38 maartenvg Exp $

CONTENTS OF THIS FILE
---------------------

 * Introduction
 * Features
 * Requirements
 * Installation & Upgrading
 * Settings
 * Synchronizing
 * Customizing the module
 * Maintainers


INTRODUCTION
------------

The Birthdays module allows users to add their birthday to their profile. In
their profile the date of birth is show, as well as their age and their
star sign. This is all configurable. It also lists birthdays on a separate page
which can be filtered by month and year. Finally 2 blocks are defined to show
upcoming birthdays, either a fixed number or a specific number of days in
advance.

It is optional to send users an e-mail on their birthday congratulating them,
and the administrator can receive periodic reminders of who are having their
birthday next day, week or month.


FEATURES
--------

 * Integrates with Profile module.
 * Birthday input field on registration (or not)
 * A block displaying the next X birthdays.
 * A block listing birthdays for the next X days.
 * A page listing all the users and their birthdays/age/star sign, filtered by
   month and year.
 * Optionally displays user's star sign, with or without a link to Yahoo
   Horoscopes.
 * Displaying the user's birthday/current age/star sign on the user's profile.
 * User option not to be mailed on their birthday.
 * User & admin option to hide the year and age of the user(s).
 * User options can be turned off by administrator.
 * Optionally send e-mails to administrator with upcoming birthdays for the
   next day, week or month.
 * Optionally sends an e-mail to the user on their birthday.
 * Possibility to synchronize between the Birthdays module and the Profile
   module when necessary.
 * PGSQL support

Future features

 * Re-introduction optional postcard module support
 * Add optional Events module support
 * Use CCK field to enable use for Calendar, Node Profile and similar modules
 * Make visible for Views module
 * Add translations (files)


REQUIREMENTS
------------

The Birthdays module requires the Profile module which is a Core module that
comes with Drupal. It requires you to make a field of the type 'date'. To
receive administration e-mails or send out birthday wishes, cronjobs are
needed. See http://drupal.org/cron for more information about setting up
cronjobs.

This module no longer requires a version MySQL >= 4.1.1.


INSTALLATION & UPGRADING
------------------------

See INSTALL.txt for install/upgrade instructions.


SETTINGS
--------

Setting the module is done on a number of pages.

  Birthdays administration pages
  ------------------------------
  The Birthdays administration pages (?q=admin/settings/birthdays) is where the
  actual features of the birthdays module are set. Some of the options are
  described below.
  * 'Profile field': here you set which 'date' field of the Profile module you
    want the Birthdays module to use.
  * 'Show starsings': select whether you want to display the star sign icons on
    the profile and on the Birthdays page, and, if so, whether it should link
    to Yahoo Horoscopes.
  * 'Hide year and age': some sites might want to protect the user's privacy by
    hiding their age and year of birth. The options are 'No', 'Yes' and 'User
    optional, defaults to No', where the latter gives the user the option to
    select whether he or she wants this infomration to be hidden. If enabled it
    still requires them to put the full date of birth in, but only the day and
    month will be displayed.
  * 'Set Birthdays page settings': this influences how the listing of the
    Birthdays page is shown. Sorted by username of date of birth (year not
    included) and users without a birthday shown or not.
  * 'Show filter options': determine whether the buttons to filter by specific
    month and/or year should be displayed. When 'Hide year and age' is set to
    'Yes', filtering by year is not possible.
  * 'Send upcoming birthdays to admin': this one has 4 values 'Disabled',
    'Daily', 'Weekly, on the first day of the week' and 'Monthly'. This will
    send an e-mail to your site e-mail address at the given intervals, listing
    users that will have their birthday in that period. The first day of the
    week is controlled by the date and time settings of Drupal, which can be
    found at ?q=admin/settings/date-time.
  * 'Send user e-mail on day of birth': set whether users should receive an
    e-mail when they are having the birthday. Either 'No', 'Yes' or 'User
    optional, 'Yes' by default', where the latter leaves the decission up to
    the user.

  Permissions
  -----------
  To allow users to view birthdays of other people, the 'access birthdays'
  permission needs to be set for the appropiate role. This allows them to
  access the Birthdays page (?q=birthdays), see activated blocks with birthdays
  and view the birthday of the user in the profiles.

  Profile field settings
  ----------------------
  Several things can be adjusted to the assigned profile field. To do so please
  visit to ?q=admin/user/profile, and edit the field in question. The following
  options require special attention.
  * 'The user must enter a value': force the user to fill in their date of
    birth. A once set birthday can not be deleted.
  * 'Visibile in user registration form': give new users the option to add
    their date of birth when registering to your website. If combined with the
    option above, they can not register without putting their date of birth.
  * 'Visibility': this will influence the visibility of the field as described
    there, but the behavior might become erratic if not set to 'Public field,
    content shown on profile page but not used on member list pages'. So it is
    recommended to leave this as is.

  The other options on this page behave as described there.
  * 'Category': this controls with which other fields the birthdays field is
    shown.
  * 'Title': setting the visual name of the field.
  * 'Form name': changing this will not change anything visible to the user.
  * 'Explanation': add additional information about what the birthdays field
    does below the field.
  * 'Weight': will change the position of the field compared to other fields in
    the same category.

  Date format
  -----------
  The way the birthdays are formatted (e.g. 11 may 1934 or 05/11/1934) is
  controlled by the date and time settings of Drupal, which can be found at
  ?q=admin/settings/date-time. The Birthdays module uses the short date format
  as basis for displaying days and months in the blocks and the medium date
  format is used in the profile and on the Birthdays page.


SYNCHRONIZING
-------------

A special page is located at ?q=admin/settings/birthdays/sync. The birthdays
are saved to two different database tables. This is because the profile module
saves the dates in a format which limit the ability to perform calculations on
the dates. These two tables need to be in sync with each other, which will be
most of the time.

Sometimes this is not the case. For example when you already collected
birthdays with the Profile module, but later decided to switch to the birthdays
module. Or when you accidentally (on intentionally) completely uninstalled the
profile module, but left birthdays module merely disabled.

In the first case you need to copy the Profile data to the (most likely empty)
Birthdays table, which is done with the top button. In the latter you need the
copy the birthdays in the Birthdays table back to the Profile module with the
bottom button.

Please note that with large amounts of users this might take some time.


CUSTOMIZING THE MODULE
----------------------

Sometimes you might want to customize the way some areas of the module look.
For instance, you might want to alter the Birthdays page, or change the listing
in the Birthdays blocks. This can be done by overriding the theme functions.
How to do so can be found here: http://drupal.org/node/173880.

If you want to display the date of birth or age on another location (e.g. near
the username, in the forums, on nodes), you best use the functions
$age = _birthdays_show_age($account);
$date = _birthdays_show_date($date_array, $account, 'medium');

These will adhere to the global or user determined visibility of the age and
year of date.

More specific information might follow later.


MAINTAINERS
-----------

 * David Gildeh (Drazzig) - http://drupal.org/user/26260
 * Maarten van Grootel (maartenvg) - http://drupal.org/user/109716
