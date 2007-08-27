-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 27, 2007 at 06:34 PM
-- Server version: 5.0.32
-- PHP Version: 5.2.0-8+etch7
-- 
-- Database: `satellite`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_access`
-- 

CREATE TABLE `satellite2_access` (
  `aid` int(11) NOT NULL auto_increment,
  `mask` varchar(255) NOT NULL default '',
  `type` varchar(255) NOT NULL default '',
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_access`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_accesslog`
-- 

CREATE TABLE `satellite2_accesslog` (
  `aid` int(11) NOT NULL auto_increment,
  `sid` varchar(64) NOT NULL default '',
  `title` varchar(255) default NULL,
  `path` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `hostname` varchar(128) default NULL,
  `uid` int(10) unsigned default '0',
  `timer` int(10) unsigned NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  KEY `accesslog_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_accesslog`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_aggregator_category`
-- 

CREATE TABLE `satellite2_aggregator_category` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` longtext NOT NULL,
  `block` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_aggregator_category`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_aggregator_category_feed`
-- 

CREATE TABLE `satellite2_aggregator_category_feed` (
  `fid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`fid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_aggregator_category_feed`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_aggregator_category_item`
-- 

CREATE TABLE `satellite2_aggregator_category_item` (
  `iid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`iid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_aggregator_category_item`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_aggregator_feed`
-- 

CREATE TABLE `satellite2_aggregator_feed` (
  `fid` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `refresh` int(11) NOT NULL default '0',
  `checked` int(11) NOT NULL default '0',
  `link` varchar(255) NOT NULL default '',
  `description` longtext NOT NULL,
  `image` longtext NOT NULL,
  `etag` varchar(255) NOT NULL default '',
  `modified` int(11) NOT NULL default '0',
  `block` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `link` (`url`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_aggregator_feed`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_aggregator_item`
-- 

CREATE TABLE `satellite2_aggregator_item` (
  `iid` int(11) NOT NULL auto_increment,
  `fid` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `author` varchar(255) NOT NULL default '',
  `description` longtext NOT NULL,
  `timestamp` int(11) default NULL,
  `guid` varchar(255) default NULL,
  PRIMARY KEY  (`iid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_aggregator_item`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_authmap`
-- 

CREATE TABLE `satellite2_authmap` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `authname` varchar(128) NOT NULL default '',
  `module` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_authmap`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_blocks`
-- 

CREATE TABLE `satellite2_blocks` (
  `module` varchar(64) NOT NULL default '',
  `delta` varchar(32) NOT NULL default '0',
  `theme` varchar(255) NOT NULL default '',
  `status` tinyint(4) NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  `region` varchar(64) NOT NULL default 'left',
  `custom` tinyint(4) NOT NULL default '0',
  `throttle` tinyint(4) NOT NULL default '0',
  `visibility` tinyint(4) NOT NULL default '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_blocks`
-- 

INSERT INTO `satellite2_blocks` (`module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`) VALUES 
('user', '0', 'garland', 1, 0, 'left', 0, 0, 0, '', ''),
('user', '1', 'garland', 1, 0, 'left', 0, 0, 0, '', ''),
('views', 'News', 'esntheme', 1, 0, 'right', 0, 0, 0, '', ''),
('signup', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('image', '1', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('image', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('event', '1', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('event', '0', 'esntheme', 1, -5, 'right', 0, 0, 0, '', ''),
('user', '3', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('user', '2', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('user', '1', 'esntheme', 1, 0, 'left', 0, 0, 0, '', ''),
('user', '0', 'esntheme', 1, 0, 'left', 0, 0, 0, '', ''),
('search', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('poll', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('node', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('comment', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('menu', '2', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('views', 'comments_recent', 'esntheme', 0, 0, '', 0, 0, 0, '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_blocks_roles`
-- 

CREATE TABLE `satellite2_blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`module`,`delta`,`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_blocks_roles`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_boxes`
-- 

CREATE TABLE `satellite2_boxes` (
  `bid` int(11) NOT NULL auto_increment,
  `body` longtext,
  `info` varchar(128) NOT NULL default '',
  `format` int(11) NOT NULL default '0',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_boxes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_cache`
-- 

CREATE TABLE `satellite2_cache` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_cache`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_cache_content`
-- 

CREATE TABLE `satellite2_cache_content` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_cache_content`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_cache_filter`
-- 

CREATE TABLE `satellite2_cache_filter` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_cache_filter`
-- 

------------------------------------------------------

-- 
-- Table structure for table `satellite2_cache_menu`
-- 

CREATE TABLE `satellite2_cache_menu` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_cache_menu`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_cache_page`
-- 

CREATE TABLE `satellite2_cache_page` (
  `cid` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_cache_page`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_cache_views`
-- 

CREATE TABLE `satellite2_cache_views` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_cache_views`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_comments`
-- 

CREATE TABLE `satellite2_comments` (
  `cid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `nid` int(11) NOT NULL default '0',
  `uid` int(11) NOT NULL default '0',
  `subject` varchar(64) NOT NULL default '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  `score` mediumint(9) NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  `format` int(11) NOT NULL default '0',
  `thread` varchar(255) NOT NULL,
  `users` longtext,
  `name` varchar(60) default NULL,
  `mail` varchar(64) default NULL,
  `homepage` varchar(255) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `lid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_comments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_contact`
-- 

CREATE TABLE `satellite2_contact` (
  `cid` int(10) unsigned NOT NULL auto_increment,
  `category` varchar(255) NOT NULL default '',
  `recipients` longtext NOT NULL,
  `reply` longtext NOT NULL,
  `weight` tinyint(4) NOT NULL default '0',
  `selected` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  UNIQUE KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_contact`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_event`
-- 

CREATE TABLE `satellite2_content_type_event` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_content_type_event`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_image`
-- 

CREATE TABLE `satellite2_content_type_image` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_content_type_image`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_news`
-- 

CREATE TABLE `satellite2_content_type_news` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_content_type_news`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_partner`
-- 

CREATE TABLE `satellite2_content_type_partner` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_content_type_partner`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_poll`
-- 

CREATE TABLE `satellite2_content_type_poll` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_content_type_poll`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_event`
-- 

CREATE TABLE `satellite2_event` (
  `nid` int(10) unsigned NOT NULL default '0',
  `event_start` int(10) unsigned NOT NULL default '0',
  `event_end` int(10) unsigned NOT NULL default '0',
  `timezone` int(10) NOT NULL default '0',
  PRIMARY KEY  (`nid`),
  KEY `event_start` (`event_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_event`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_file_revisions`
-- 

CREATE TABLE `satellite2_file_revisions` (
  `fid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `list` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fid`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_file_revisions`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_files`
-- 

CREATE TABLE `satellite2_files` (
  `fid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `filemime` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_files`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_filter_formats`
-- 

CREATE TABLE `satellite2_filter_formats` (
  `format` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `roles` varchar(255) NOT NULL default '',
  `cache` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `satellite2_filter_formats`
-- 

INSERT INTO `satellite2_filter_formats` (`format`, `name`, `roles`, `cache`) VALUES 
(1, 'Filtered HTML', ',1,2,', 1),
(2, 'PHP code', '', 0),
(3, 'Full HTML', '', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_filters`
-- 

CREATE TABLE `satellite2_filters` (
  `format` int(11) NOT NULL default '0',
  `module` varchar(64) NOT NULL default '',
  `delta` tinyint(4) NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  KEY `weight` (`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_filters`
-- 

INSERT INTO `satellite2_filters` (`format`, `module`, `delta`, `weight`) VALUES 
(1, 'filter', 3, 0),
(1, 'filter', 0, 1),
(1, 'filter', 2, 2),
(2, 'filter', 1, 0),
(3, 'filter', 3, 0),
(3, 'filter', 2, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_flood`
-- 

CREATE TABLE `satellite2_flood` (
  `event` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_flood`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_history`
-- 

CREATE TABLE `satellite2_history` (
  `uid` int(11) NOT NULL default '0',
  `nid` int(11) NOT NULL default '0',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`uid`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_history`
-- 



-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_img_assist_map`
-- 

CREATE TABLE `satellite2_img_assist_map` (
  `nid` int(10) unsigned NOT NULL,
  `iid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`nid`,`iid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_img_assist_map`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_menu`
-- 

CREATE TABLE `satellite2_menu` (
  `mid` int(10) unsigned NOT NULL default '0',
  `pid` int(10) unsigned NOT NULL default '0',
  `path` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `weight` tinyint(4) NOT NULL default '0',
  `type` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_menu`
-- 

INSERT INTO `satellite2_menu` (`mid`, `pid`, `path`, `title`, `description`, `weight`, `type`) VALUES 
(2, 0, '', 'Primary links', '', 0, 115),
(3, 1, 'filter/tips', 'Compose tips', '', 0, 20),
(4, 1, 'node', 'Content', '', 0, 16),
(5, 1, 'search', 'Search', '', 0, 20),
(6, 1, 'admin', 'Administer', '', 9, 22),
(7, 1, 'logout', 'Log out', '', 10, 22),
(8, 1, 'tracker', 'Recent posts', '', 0, 22),
(9, 6, 'admin/help', 'Help', '', 9, 22),
(10, 6, 'admin/content', 'Content management', 'Manage your site''s content.', -10, 22),
(11, 4, 'node/add', 'Create content', '', 1, 28),
(12, 6, 'admin/settings', 'Site configuration', 'Adjust basic site configuration options.', -5, 22),
(13, 6, 'admin/build', 'Site building', 'Control how your site looks and feels.', -10, 22),
(14, 6, 'admin/logs', 'Logs', 'View system logs and other status information.', 5, 22),
(15, 6, 'admin/user', 'User management', 'Manage your site''s users, groups and access to site features.', 0, 22),
(16, 13, 'admin/build/block', 'Blocks', 'Configure what block content appears in your site''s sidebars and other regions.', 0, 22),
(17, 10, 'admin/content/comment', 'Comments', 'List and edit site comments and the comment moderation queue.', 0, 22),
(18, 12, 'admin/settings/filters', 'Input formats', 'Configure how content input by users is filtered, including allowed HTML tags, PHP code tags. Also allows enabling of module-provided filters.', 0, 22),
(19, 13, 'admin/build/menu', 'Menus', 'Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.', 0, 22),
(20, 10, 'admin/content/node', 'Content', 'View, edit, and delete your site''s content.', 0, 22),
(21, 10, 'admin/content/search', 'Search content', 'Search content by keyword.', 0, 22),
(22, 10, 'admin/content/node-settings', 'Post settings', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', 0, 22),
(23, 10, 'admin/content/types', 'Content types', 'Manage posts by content type, including default status, front page promotion, etc.', 0, 22),
(24, 13, 'admin/build/path', 'URL aliases', 'Change your site''s URL paths by aliasing them.', 0, 22),
(25, 12, 'admin/settings/search', 'Search settings', 'Configure relevance settings for search and other indexing options', 0, 22),
(26, 14, 'admin/logs/search', 'Top search phrases', 'View most popular search phrases.', 0, 22),
(27, 14, 'admin/logs/hits', 'Recent hits', 'View pages that have recently been visited.', 0, 22),
(28, 14, 'admin/logs/pages', 'Top pages', 'View pages that have been hit frequently.', 1, 22),
(29, 14, 'admin/logs/visitors', 'Top visitors', 'View visitors that hit many pages.', 2, 22),
(30, 14, 'admin/logs/referrers', 'Top referrers', 'View top referrers.', 0, 22),
(31, 14, 'admin/logs/settings', 'Access log settings', 'Control details about what and how your site logs.', 3, 22),
(32, 12, 'admin/settings/admin', 'Administration theme', 'Settings for how your administrative pages should look.', 0, 22),
(33, 13, 'admin/build/themes', 'Themes', 'Change which theme your site uses or allows users to set.', 0, 22),
(34, 13, 'admin/build/modules', 'Modules', 'Enable or disable add-on modules for your site.', 0, 22),
(35, 12, 'admin/settings/site-information', 'Site information', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', 0, 22),
(36, 12, 'admin/settings/error-reporting', 'Error reporting', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', 0, 22),
(37, 12, 'admin/settings/performance', 'Performance', 'Enable or disable page caching for anonymous users, and enable or disable CSS preprocessor.', 0, 22),
(38, 12, 'admin/settings/file-system', 'File system', 'Tell Drupal where to store uploaded files and how they are accessed.', 0, 22),
(39, 12, 'admin/settings/image-toolkit', 'Image toolkit', 'Choose which image toolkit to use if you have installed optional toolkits.', 0, 22),
(40, 10, 'admin/content/rss-publishing', 'RSS publishing', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', 0, 22),
(41, 12, 'admin/settings/date-time', 'Date and time', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', 0, 22),
(42, 12, 'admin/settings/site-maintenance', 'Site maintenance', 'Take the site off-line for maintenance or bring it back online.', 0, 22),
(43, 12, 'admin/settings/clean-urls', 'Clean URLs', 'Enable or disable clean URLs for your site.', 0, 22),
(44, 14, 'admin/logs/status', 'Status report', 'Get a status report about your site''s operation and any detected problems.', 10, 22),
(45, 10, 'admin/content/taxonomy', 'Categories', 'Create vocabularies and terms to categorize your content.', 0, 22),
(46, 12, 'admin/settings/throttle', 'Throttle', 'Control how your site cuts out content during heavy load.', 0, 22),
(47, 15, 'admin/user/user', 'Users', 'List, add, and edit users.', 0, 22),
(48, 15, 'admin/user/settings', 'User settings', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', 0, 22),
(49, 15, 'admin/user/access', 'Access control', 'Determine access to features by selecting permissions for roles.', 0, 22),
(50, 15, 'admin/user/roles', 'Roles', 'List, edit, or add user roles.', 0, 22),
(51, 15, 'admin/user/rules', 'Access rules', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', 0, 22),
(52, 15, 'admin/user/search', 'Search users', 'Search users by name.', 0, 22),
(53, 14, 'admin/logs/watchdog', 'Recent log entries', 'View events that have recently been logged.', -1, 22),
(54, 14, 'admin/logs/page-not-found', 'Top ''page not found'' errors', 'View ''page not found'' errors (404s).', 0, 22),
(55, 14, 'admin/logs/access-denied', 'Top ''access denied'' errors', 'View ''access denied'' errors (403s).', 0, 22),
(56, 11, 'node/add/event', 'Event', '', 0, 22),
(57, 12, 'admin/settings/event', 'Events', 'Set up how your site handles events.', 0, 22),
(58, 11, 'node/add/image', 'Image', '', 0, 22),
(59, 12, 'admin/settings/image', 'Image', 'Image module settings.', 0, 22),
(60, 12, 'admin/settings/imce', 'IMCE settings', 'Control how your image/file browser works.', 0, 22),
(61, 12, 'admin/settings/img_assist', 'Image assist', 'Change settings for the Image assist module.', 0, 22),
(62, 12, 'admin/settings/pathauto', 'Pathauto', 'Configure how pathauto generates clean URLs for your content.', 0, 22),
(63, 12, 'admin/settings/signup', 'Signup', 'Configure settings for signups.', 0, 22),
(64, 10, 'admin/content/signup', 'Signup overview', 'View all signup-enabled posts, and open or close signups on them.', 0, 22),
(65, 12, 'admin/settings/simplemenu', 'SimpleMenu', 'Select the menu to display.', 0, 22),
(66, 12, 'admin/settings/tinymce', 'TinyMCE', 'Configure the rich editor.', 0, 22),
(67, 13, 'admin/build/views', 'Views', 'Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.', 0, 22),
(68, 57, 'admin/settings/event/timezone', 'Timezone handling', 'Change how timezone information is saved and displayed.', 0, 22),
(69, 57, 'admin/settings/event/overview', 'Event overview', 'Change how event summary information is displayed.', 0, 22),
(70, 10, 'admin/content/aggregator', 'News aggregator', 'Configure which content your site aggregates from other sites, how often it polls them, and how they''re categorized.', 0, 22),
(71, 1, 'aggregator', 'News aggregator', '', 5, 22),
(72, 13, 'admin/build/contact', 'Contact form', 'Create a system contact form and set up categories for the form to use.', 0, 22),
(73, 1, 'contact', 'Contact', '', 0, 20),
(74, 12, 'admin/settings/uploads', 'File uploads', 'Control how files may be attached to content.', 0, 22),
(75, 71, 'aggregator/sources', 'Sources', '', 0, 22),
(76, 71, 'aggregator/categories', 'Categories', '', 0, 28),
(77, 11, 'node/add/poll', 'Poll', '', 0, 22),
(78, 1, 'poll', 'Polls', '', 0, 20),
(79, 11, 'node/add/news', 'News', '', 0, 22),
(80, 11, 'node/add/partner', 'Partner', '', 0, 22);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node`
-- 

CREATE TABLE `satellite2_node` (
  `nid` int(10) unsigned NOT NULL auto_increment,
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `title` varchar(128) NOT NULL default '',
  `uid` int(11) NOT NULL default '0',
  `status` int(11) NOT NULL default '1',
  `created` int(11) NOT NULL default '0',
  `changed` int(11) NOT NULL default '0',
  `comment` int(11) NOT NULL default '0',
  `promote` int(11) NOT NULL default '0',
  `moderate` int(11) NOT NULL default '0',
  `sticky` int(11) NOT NULL default '0',
  PRIMARY KEY  (`nid`,`vid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_type` (`type`(4)),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `status` (`status`),
  KEY `uid` (`uid`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_created` (`created`),
  KEY `node_changed` (`changed`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_node`
-- 

INSERT INTO `satellite2_node` (`nid`, `vid`, `type`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`) VALUES 
(1, 1, 'news', 'Test item', 1, 1, 1188223507, 1188224086, 2, 1, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_access`
-- 

CREATE TABLE `satellite2_node_access` (
  `nid` int(10) unsigned NOT NULL default '0',
  `gid` int(10) unsigned NOT NULL default '0',
  `realm` varchar(255) NOT NULL default '',
  `grant_view` tinyint(3) unsigned NOT NULL default '0',
  `grant_update` tinyint(3) unsigned NOT NULL default '0',
  `grant_delete` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_node_access`
-- 

INSERT INTO `satellite2_node_access` (`nid`, `gid`, `realm`, `grant_view`, `grant_update`, `grant_delete`) VALUES 
(0, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_comment_statistics`
-- 

CREATE TABLE `satellite2_node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL auto_increment,
  `last_comment_timestamp` int(11) NOT NULL default '0',
  `last_comment_name` varchar(60) default NULL,
  `last_comment_uid` int(11) NOT NULL default '0',
  `comment_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_node_comment_statistics`
-- 

INSERT INTO `satellite2_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES 
(1, 1188223507, NULL, 1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_counter`
-- 

CREATE TABLE `satellite2_node_counter` (
  `nid` int(11) NOT NULL default '0',
  `totalcount` bigint(20) unsigned NOT NULL default '0',
  `daycount` mediumint(8) unsigned NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`),
  KEY `totalcount` (`totalcount`),
  KEY `daycount` (`daycount`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_node_counter`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_field`
-- 

CREATE TABLE `satellite2_node_field` (
  `field_name` varchar(32) NOT NULL default '',
  `type` varchar(127) NOT NULL default '',
  `global_settings` mediumtext NOT NULL,
  `required` int(11) NOT NULL default '0',
  `multiple` int(11) NOT NULL default '0',
  `db_storage` int(11) NOT NULL default '0',
  PRIMARY KEY  (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_node_field`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_field_instance`
-- 

CREATE TABLE `satellite2_node_field_instance` (
  `field_name` varchar(32) NOT NULL default '',
  `type_name` varchar(32) NOT NULL default '',
  `weight` int(11) NOT NULL default '0',
  `label` varchar(255) NOT NULL default '',
  `widget_type` varchar(32) NOT NULL default '',
  `widget_settings` mediumtext NOT NULL,
  `display_settings` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY  (`field_name`,`type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_node_field_instance`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_group`
-- 

CREATE TABLE `satellite2_node_group` (
  `type_name` varchar(32) NOT NULL default '',
  `group_name` varchar(32) NOT NULL default '',
  `label` varchar(255) NOT NULL default '',
  `settings` mediumtext NOT NULL,
  `weight` tinyint(4) NOT NULL,
  PRIMARY KEY  (`type_name`,`group_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_node_group`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_group_fields`
-- 

CREATE TABLE `satellite2_node_group_fields` (
  `type_name` varchar(32) NOT NULL default '',
  `group_name` varchar(32) NOT NULL default '',
  `field_name` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`type_name`,`group_name`,`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_node_group_fields`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_revisions`
-- 

CREATE TABLE `satellite2_node_revisions` (
  `nid` int(10) unsigned NOT NULL,
  `vid` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL default '0',
  `title` varchar(128) NOT NULL default '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL default '0',
  `format` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_node_revisions`
-- 

INSERT INTO `satellite2_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES 
(1, 1, 1, 'Test item', '<div>\r\n<img class="left" src="/satellite-2.0/files/u1/ESN_astronaut_2.png" alt="" width="299" height="224" />&quot;My year participation in the Erasmus exchange was highly enjoyable, exciting experience, which broadened my mind, and exceeded all of my expectations&quot; said Timothy, English, who studied in the Netherlands. &quot;One of the best years in my life, <strong>if not the best</strong>&quot; commented Maria, Spanish, who studied in Sweden. \r\n</div>\r\n', '<div>\r\n<img class="left" src="/satellite-2.0/files/u1/ESN_astronaut_2.png" alt="" width="299" height="224" />&quot;My year participation in the Erasmus exchange was highly enjoyable, exciting experience, which broadened my mind, and exceeded all of my expectations&quot; said Timothy, English, who studied in the Netherlands. &quot;One of the best years in my life, <strong>if not the best</strong>&quot; commented Maria, Spanish, who studied in Sweden. \r\n</div>\r\n', '', 1188224086, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_node_type`
-- 

CREATE TABLE `satellite2_node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL default '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL default '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL default '0',
  `modified` tinyint(4) NOT NULL default '0',
  `locked` tinyint(4) NOT NULL default '0',
  `orig_type` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_node_type`
-- 

INSERT INTO `satellite2_node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES 
('event', 'Event', 'basicevent', 'An event is a story which can be given a start and end date, thus appearing in the events calendar.', '', 1, 'Title', 1, 'Body', 0, 0, 0, 1, 'event'),
('image', 'Image', 'image', 'An image (with thumbnail). This is ideal for publishing photographs or screenshots.', '', 1, 'Title', 1, 'Body', 0, 0, 0, 1, 'image'),
('poll', 'Poll', 'poll', 'A poll is a multiple-choice question which visitors can vote on.', '', 1, 'Question', 0, '', 0, 0, 0, 1, 'poll'),
('news', 'News', 'node', 'All your ESN related news. Posting as news will put the news item into a news page and promote a teaser (short version of your news with a small image) to your front page. Use this for all dynamic content on your site.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, ''),
('partner', 'Partner', 'node', 'A partner from your ESN section, e.g. giving you ESN card discounts or sponsoring your section. Partners are grouped together and fetched in the ESN Galaxy.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_permission`
-- 

CREATE TABLE `satellite2_permission` (
  `rid` int(10) unsigned NOT NULL default '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL default '0',
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_permission`
-- 

INSERT INTO `satellite2_permission` (`rid`, `perm`, `tid`) VALUES 
(1, 'access news feeds, access comments, access site-wide contact form, access content, vote on polls, search content, view uploaded files', 0),
(2, 'access news feeds, access comments, post comments, post comments without approval, access site-wide contact form, access imce, access content, cancel own vote, vote on polls, search content, use advanced search, sign up for content, access tinymce, upload files, view uploaded files, access user profiles, access all views', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_poll`
-- 

CREATE TABLE `satellite2_poll` (
  `nid` int(10) unsigned NOT NULL default '0',
  `runtime` int(11) NOT NULL default '0',
  `active` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_poll`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_poll_choices`
-- 

CREATE TABLE `satellite2_poll_choices` (
  `chid` int(10) unsigned NOT NULL auto_increment,
  `nid` int(10) unsigned NOT NULL default '0',
  `chtext` varchar(128) NOT NULL default '',
  `chvotes` int(11) NOT NULL default '0',
  `chorder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`chid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_poll_choices`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_poll_votes`
-- 

CREATE TABLE `satellite2_poll_votes` (
  `nid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL default '0',
  `chorder` int(11) NOT NULL default '-1',
  `hostname` varchar(128) NOT NULL default '',
  KEY `nid` (`nid`),
  KEY `uid` (`uid`),
  KEY `hostname` (`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_poll_votes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_role`
-- 

CREATE TABLE `satellite2_role` (
  `rid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `satellite2_role`
-- 

INSERT INTO `satellite2_role` (`rid`, `name`) VALUES 
(1, 'anonymous user'),
(2, 'authenticated user');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_search_dataset`
-- 

CREATE TABLE `satellite2_search_dataset` (
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) default NULL,
  `data` longtext NOT NULL,
  KEY `sid_type` (`sid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_search_dataset`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_search_index`
-- 

CREATE TABLE `satellite2_search_index` (
  `word` varchar(50) NOT NULL default '',
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) default NULL,
  `fromsid` int(10) unsigned NOT NULL default '0',
  `fromtype` varchar(16) default NULL,
  `score` float default NULL,
  KEY `sid_type` (`sid`,`type`),
  KEY `from_sid_type` (`fromsid`,`fromtype`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_search_index`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_search_total`
-- 

CREATE TABLE `satellite2_search_total` (
  `word` varchar(50) NOT NULL default '',
  `count` float default NULL,
  PRIMARY KEY  (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_search_total`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_sequences`
-- 

CREATE TABLE `satellite2_sequences` (
  `name` varchar(255) NOT NULL default '',
  `id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_sequences`
-- 

INSERT INTO `satellite2_sequences` (`name`, `id`) VALUES 
('satellite2_users_uid', 1),
('satellite2_menu_mid', 80),
('satellite2_view_view_vid', 1),
('satellite2_node_nid', 1),
('satellite2_node_revisions_vid', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_sessions`
-- 

CREATE TABLE `satellite2_sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  `cache` int(11) NOT NULL default '0',
  `session` longtext,
  PRIMARY KEY  (`sid`),
  KEY `uid` (`uid`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_sessions`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_signup`
-- 

CREATE TABLE `satellite2_signup` (
  `nid` int(10) unsigned NOT NULL default '0',
  `forwarding_email` varchar(64) NOT NULL default '',
  `send_confirmation` int(2) NOT NULL default '0',
  `confirmation_email` longtext NOT NULL,
  `send_reminder` int(2) NOT NULL default '0',
  `reminder_days_before` int(4) unsigned NOT NULL default '0',
  `reminder_email` longtext NOT NULL,
  `close_in_advance_time` int(10) unsigned NOT NULL default '0',
  `close_signup_limit` int(10) unsigned NOT NULL default '0',
  `completed` int(2) NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_signup`
-- 

INSERT INTO `satellite2_signup` (`nid`, `forwarding_email`, `send_confirmation`, `confirmation_email`, `send_reminder`, `reminder_days_before`, `reminder_email`, `close_in_advance_time`, `close_signup_limit`, `completed`) VALUES 
(0, '', 1, 'Enter your default confirmation email message here', 1, 0, 'Enter your default reminder email message here', 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_signup_log`
-- 

CREATE TABLE `satellite2_signup_log` (
  `uid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `anon_mail` varchar(255) NOT NULL default '',
  `signup_time` int(10) unsigned NOT NULL default '0',
  `form_data` longtext NOT NULL,
  KEY `uid` (`uid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_signup_log`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_system`
-- 

CREATE TABLE `satellite2_system` (
  `filename` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `type` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `status` int(11) NOT NULL default '0',
  `throttle` tinyint(4) NOT NULL default '0',
  `bootstrap` int(11) NOT NULL default '0',
  `schema_version` smallint(6) NOT NULL default '-1',
  `weight` int(11) NOT NULL default '0',
  PRIMARY KEY  (`filename`),
  KEY `weight` (`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_system`
-- 

INSERT INTO `satellite2_system` (`filename`, `name`, `type`, `description`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`) VALUES 
('themes/engines/phptemplate/phptemplate.engine', 'phptemplate', 'theme_engine', '', 1, 0, 0, -1, 0),
('modules/system/system.module', 'system', 'module', 'Handles general site configuration for administrators.', 1, 0, 0, 1022, 0),
('modules/aggregator/aggregator.module', 'aggregator', 'module', 'Aggregates syndicated content (RSS, RDF, and Atom feeds).', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/event/contrib/basicevent.module', 'basicevent', 'module', 'A story-like node that implements the event API automatically.', 1, 0, 0, 0, 0),
('modules/block/block.module', 'block', 'module', 'Controls the boxes that are displayed around the main content.', 1, 0, 0, 0, 0),
('modules/blog/blog.module', 'blog', 'module', 'Enables keeping easily and regularly updated user web pages or blogs.', 0, 0, 0, -1, 0),
('modules/blogapi/blogapi.module', 'blogapi', 'module', 'Allows users to post content using applications that support XML-RPC blog APIs.', 0, 0, 0, -1, 0),
('modules/book/book.module', 'book', 'module', 'Allows users to collaboratively author a book.', 0, 0, 0, -1, 0),
('modules/color/color.module', 'color', 'module', 'Allows the user to change the color scheme of certain themes.', 1, 0, 0, 0, 0),
('modules/comment/comment.module', 'comment', 'module', 'Allows users to comment on and discuss published content.', 1, 0, 0, 1, 0),
('modules/contact/contact.module', 'contact', 'module', 'Enables the use of both personal and site-wide contact forms.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/cck/content.module', 'content', 'module', 'Allows administrators to define new content types.', 1, 0, 1, 1008, 0),
('profiles/esnsatellite/modules/cck/content_copy.module', 'content_copy', 'module', 'Enables ability to import/export field definitions.', 1, 0, 0, 0, 0),
('modules/drupal/drupal.module', 'drupal', 'module', 'Lets you register your site with a central server and improve ranking of Drupal projects by posting information on your installed modules and themes', 0, 0, 0, -1, 0),
('profiles/esnsatellite/modules/event/event.module', 'event', 'module', 'Calendaring API, calendar display and export', 1, 0, 0, 2, 0),
('profiles/esnsatellite/modules/event/contrib/event_all_day/event_all_day.module', 'event_all_day', 'module', 'Allows creation of all-day events.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/event/contrib/event_views/event_views.module', 'event_views', 'module', 'Views-enables the event fields and creates default event views.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/cck/fieldgroup.module', 'fieldgroup', 'module', 'Create field groups for CCK fields.', 1, 0, 0, 4, 9),
('modules/filter/filter.module', 'filter', 'module', 'Handles the filtering of content in preparation for display.', 1, 0, 0, 0, 0),
('modules/forum/forum.module', 'forum', 'module', 'Enables threaded discussions about general topics.', 0, 0, 0, -1, 0),
('modules/help/help.module', 'help', 'module', 'Manages the display of online help.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/iconify/iconify.module', 'iconify', 'module', 'this module adds icons/graphix in the admin baby :]', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/image/image.module', 'image', 'module', 'Allows uploading, resizing and viewing of images.', 1, 0, 0, 4, 0),
('profiles/esnsatellite/modules/image/contrib/image_attach/image_attach.module', 'image_attach', 'module', 'Allows easy attaching of image nodes to other content types.', 0, 0, 0, -1, 0),
('profiles/esnsatellite/modules/image/contrib/image_gallery/image_gallery.module', 'image_gallery', 'module', 'Allows sorting and displaying of image galleries based on categories.', 0, 0, 0, -1, 0),
('profiles/esnsatellite/modules/image/contrib/image_import/image_import.module', 'image_import', 'module', 'Allows batches of images to be imported from a directory on the server.', 0, 0, 0, -1, 0),
('profiles/esnsatellite/modules/imagefield/imagefield.module', 'imagefield', 'module', 'Defines an image field type.', 1, 0, 0, 2, 0),
('profiles/esnsatellite/modules/imce/imce.module', 'imce', 'module', 'An image/file uploader and browser supporting personal directories and user quota.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/img_assist/img_assist.module', 'img_assist', 'module', 'This module allows users to upload and insert inline images into posts. It automatically generates an Add image link under the textarea fields of your choice.', 0, 0, 0, 1, 0),
('modules/legacy/legacy.module', 'legacy', 'module', 'Provides legacy handlers for upgrades from older Drupal installations.', 0, 0, 0, -1, 0),
('profiles/esnsatellite/modules/link/link.module', 'link', 'module', 'Defines simple link field types.', 1, 0, 0, 1, 0),
('modules/locale/locale.module', 'locale', 'module', 'Enables the translation of the user interface to languages other than English.', 0, 0, 0, -1, 0),
('modules/menu/menu.module', 'menu', 'module', 'Allows administrators to customize the site navigation menu.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/menutree/menutree.module', 'menutree', 'module', 'Display a site-map page based on one or more menus.', 1, 0, 0, 0, 0),
('modules/node/node.module', 'node', 'module', 'Allows content to be submitted to the site and displayed on pages.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/cck/nodereference.module', 'nodereference', 'module', 'Defines a field type for referencing one node from another.', 1, 0, 0, 3, 0),
('profiles/esnsatellite/modules/cck/number.module', 'number', 'module', 'Defines numeric field types.', 1, 0, 0, 5, 0),
('profiles/esnsatellite/modules/cck/optionwidgets.module', 'optionwidgets', 'module', 'Defines selection, check box and radio button widgets for text and numeric fields.', 1, 0, 0, 1, 0),
('modules/path/path.module', 'path', 'module', 'Allows users to rename URLs.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/pathauto/pathauto.module', 'pathauto', 'module', 'Provides a mechanism for modules to automatically generate aliases for the content they manage.', 1, 0, 0, 0, 0),
('modules/ping/ping.module', 'ping', 'module', 'Alerts other sites when your site has been updated.', 0, 0, 0, -1, 0),
('modules/poll/poll.module', 'poll', 'module', 'Allows your site to capture votes on different topics in the form of multiple choice questions.', 1, 0, 0, 0, 0),
('modules/profile/profile.module', 'profile', 'module', 'Supports configurable user profiles.', 0, 0, 0, -1, 0),
('modules/search/search.module', 'search', 'module', 'Enables site-wide keyword searching.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/signup/signup.module', 'signup', 'module', 'Allow users to sign up for content (especially events).', 1, 0, 0, 4, 0),
('profiles/esnsatellite/modules/simplemenu/simplemenu.module', 'simplemenu', 'module', 'Creates a menu bar that is displayed at the top of every page.', 1, 0, 0, 0, 0),
('modules/statistics/statistics.module', 'statistics', 'module', 'Logs access statistics for your site.', 1, 0, 1, 1000, 0),
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', 'Enables the categorization of content.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/cck/text.module', 'text', 'module', 'Defines simple text field types.', 1, 0, 0, 5, 0),
('modules/throttle/throttle.module', 'throttle', 'module', 'Handles the auto-throttling mechanism, to control site congestion.', 0, 0, 0, 0, 0),
('profiles/esnsatellite/modules/tinymce/tinymce.module', 'tinymce', 'module', 'The most popular WYSIWYG editor for advanced content editing.', 1, 0, 0, 1, 0),
('modules/tracker/tracker.module', 'tracker', 'module', 'Enables tracking of recent posts for users.', 1, 0, 0, 0, 0),
('modules/upload/upload.module', 'upload', 'module', 'Allows users to upload and attach files to content.', 1, 0, 0, 0, 0),
('modules/user/user.module', 'user', 'module', 'Manages the user registration and login system.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/cck/userreference.module', 'userreference', 'module', 'Defines a field type for referencing a user from a node.', 1, 0, 0, 4, 0),
('profiles/esnsatellite/modules/views/views.module', 'views', 'module', 'The views module creates customized views of node lists.', 1, 0, 0, 16, 10),
('profiles/esnsatellite/modules/views/views_rss.module', 'views_rss', 'module', 'RSS plugin for the views feed selector argument.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/views/views_theme_wizard.module', 'views_theme_wizard', 'module', 'The views theme wizard helps create stub theming for views.', 1, 0, 0, 0, 0),
('profiles/esnsatellite/modules/views/views_ui.module', 'views_ui', 'module', 'The Views UI module allows you to create and edit views.', 1, 0, 0, 0, 0),
('modules/watchdog/watchdog.module', 'watchdog', 'module', 'Logs and records system events.', 1, 0, 0, 0, 0),
('themes/garland/minnelli/style.css', 'minnelli', 'theme', 'themes/garland/page.tpl.php', 0, 0, 0, -1, 0),
('themes/chameleon/marvin/style.css', 'marvin', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0),
('sites/all/themes/custom/esntheme/page.tpl.php', 'esntheme', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0),
('themes/bluemarine/page.tpl.php', 'bluemarine', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0),
('themes/pushbutton/page.tpl.php', 'pushbutton', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0),
('themes/garland/page.tpl.php', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0),
('themes/chameleon/chameleon.theme', 'chameleon', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_term_data`
-- 

CREATE TABLE `satellite2_term_data` (
  `tid` int(10) unsigned NOT NULL auto_increment,
  `vid` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_term_data`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_term_hierarchy`
-- 

CREATE TABLE `satellite2_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL default '0',
  `parent` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`,`parent`),
  KEY `tid` (`tid`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_term_hierarchy`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_term_node`
-- 

CREATE TABLE `satellite2_term_node` (
  `nid` int(10) unsigned NOT NULL default '0',
  `tid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`,`nid`),
  KEY `nid` (`nid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_term_node`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_term_relation`
-- 

CREATE TABLE `satellite2_term_relation` (
  `tid1` int(10) unsigned NOT NULL default '0',
  `tid2` int(10) unsigned NOT NULL default '0',
  KEY `tid1` (`tid1`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_term_relation`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_term_synonym`
-- 

CREATE TABLE `satellite2_term_synonym` (
  `tid` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  KEY `tid` (`tid`),
  KEY `name` (`name`(3))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_term_synonym`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_tinymce_role`
-- 

CREATE TABLE `satellite2_tinymce_role` (
  `name` varchar(128) NOT NULL default '',
  `rid` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`name`,`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_tinymce_role`
-- 

INSERT INTO `satellite2_tinymce_role` (`name`, `rid`) VALUES 
('Satellite Default', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_tinymce_settings`
-- 

CREATE TABLE `satellite2_tinymce_settings` (
  `name` varchar(128) NOT NULL default '',
  `settings` text,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_tinymce_settings`
-- 

INSERT INTO `satellite2_tinymce_settings` (`name`, `settings`) VALUES 
('Satellite Default', 'a:28:{s:8:"old_name";s:17:"Satellite Default";s:4:"name";s:17:"Satellite Default";s:4:"rids";a:1:{i:2;s:1:"2";}s:7:"default";s:4:"true";s:11:"user_choose";s:5:"false";s:11:"show_toggle";s:4:"true";s:5:"theme";s:8:"advanced";s:8:"language";s:2:"en";s:14:"safari_message";s:5:"false";s:6:"access";s:1:"1";s:12:"access_pages";s:25:"node/*\r\nuser/*\r\ncomment/*";s:7:"buttons";a:15:{s:12:"default-bold";s:1:"1";s:14:"default-italic";s:1:"1";s:17:"default-underline";s:1:"1";s:19:"default-justifyleft";s:1:"1";s:21:"default-justifycenter";s:1:"1";s:20:"default-justifyright";s:1:"1";s:19:"default-justifyfull";s:1:"1";s:15:"default-bullist";s:1:"1";s:15:"default-numlist";s:1:"1";s:12:"default-link";s:1:"1";s:14:"default-unlink";s:1:"1";s:13:"default-image";s:1:"1";s:12:"default-code";s:1:"1";s:17:"emotions-emotions";s:1:"1";s:21:"fullscreen-fullscreen";s:1:"1";}s:11:"toolbar_loc";s:3:"top";s:13:"toolbar_align";s:6:"center";s:8:"path_loc";s:6:"bottom";s:8:"resizing";s:4:"true";s:13:"block_formats";s:31:"p,address,pre,h1,h2,h3,h4,h5,h6";s:11:"verify_html";s:4:"true";s:12:"preformatted";s:5:"false";s:22:"convert_fonts_to_spans";s:4:"true";s:17:"remove_linebreaks";s:4:"true";s:23:"apply_source_formatting";s:4:"true";s:11:"css_setting";s:4:"self";s:8:"css_path";s:46:"sites/all/themes/custom/esntheme/satellite.css";s:11:"css_classes";s:0:"";s:2:"op";s:14:"Update profile";s:10:"form_token";s:32:"069b3bae0c47331840905ced83c37f34";s:7:"form_id";s:26:"tinymce_profile_form_build";}');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_url_alias`
-- 

CREATE TABLE `satellite2_url_alias` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `src` varchar(128) NOT NULL default '',
  `dst` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  UNIQUE KEY `dst` (`dst`),
  KEY `src` (`src`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_url_alias`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_users`
-- 

CREATE TABLE `satellite2_users` (
  `uid` int(10) unsigned NOT NULL default '0',
  `name` varchar(60) NOT NULL default '',
  `pass` varchar(32) NOT NULL default '',
  `mail` varchar(64) default '',
  `mode` tinyint(4) NOT NULL default '0',
  `sort` tinyint(4) default '0',
  `threshold` tinyint(4) default '0',
  `theme` varchar(255) NOT NULL default '',
  `signature` varchar(255) NOT NULL default '',
  `created` int(11) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `login` int(11) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '0',
  `timezone` varchar(8) default NULL,
  `language` varchar(12) NOT NULL default '',
  `picture` varchar(255) NOT NULL default '',
  `init` varchar(64) default '',
  `data` longtext,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `created` (`created`),
  KEY `access` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_users`
-- 

INSERT INTO `satellite2_users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES 
(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, NULL, '', '', '', NULL),
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', 0, 0, 0, '', '', 1187592689, 1188225507, 1188222585, 1, NULL, '', '', '', 'a:0:{}');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_users_roles`
-- 

CREATE TABLE `satellite2_users_roles` (
  `uid` int(10) unsigned NOT NULL default '0',
  `rid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`,`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_users_roles`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_variable`
-- 

CREATE TABLE `satellite2_variable` (
  `name` varchar(48) NOT NULL default '',
  `value` longtext NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_variable`
-- 

INSERT INTO `satellite2_variable` (`name`, `value`) VALUES 
('theme_default', 's:8:"esntheme";'),
('filter_html_1', 's:1:"1";'),
('node_options_forum', 'a:1:{i:0;s:6:"status";}'),
('menu_primary_menu', 'i:2;'),
('menu_secondary_menu', 'i:2;'),
('event_nodeapi_event', 's:3:"all";'),
('install_profile', 's:12:"esnsatellite";'),
('admin_theme', 's:7:"garland";'),
('drupal_private_key', 's:64:"8ba0739ddbc39e5a906d0b7741cd77aae87af62ae0cd853e3949c6e88e3f8b3f";'),
('content_schema_version', 'i:1003;'),
('node_cron_comments_scale', 'd:1;'),
('node_cron_views_scale', 'd:1;'),
('statistics_day_timestamp', 'i:1187592904;'),
('file_directory_temp', 's:4:"/tmp";'),
('cron_last', 'i:1187592904;'),
('node_options_news', 'a:2:{i:0;s:6:"status";i:1;s:7:"promote";}'),
('comment_news', 's:1:"2";'),
('upload_news', 's:1:"1";'),
('event_nodeapi_news', 's:5:"never";'),
('signup_form_news', 'i:0;'),
('node_options_partner', 'a:1:{i:0;s:6:"status";}'),
('comment_partner', 's:1:"0";'),
('upload_partner', 's:1:"1";'),
('event_nodeapi_partner', 's:5:"never";'),
('signup_form_partner', 'i:0;'),
('simplemenu_menu', 's:1:"6";'),
('simplemenu_devel', 'i:0;'),
('simplemenu_element', 's:4:"body";'),
('simplemenu_element_method', 's:7:"prepend";'),
('simplemenu_exclusions', 'a:9:{s:9:"chameleon";i:0;s:7:"garland";i:0;s:10:"pushbutton";i:0;s:10:"bluemarine";i:0;s:8:"esntheme";i:0;s:3:"zen";i:0;s:6:"marvin";i:0;s:8:"minnelli";i:0;s:9:"zen-fixed";i:0;}'),
('simplemenu_rtl', 'i:0;'),
('site_name', 's:17:"ESN Satellite 2.0";'),
('site_mail', 's:39:"change-this-email-address@satellite.org";'),
('site_slogan', 's:16:"Join the Galaxy!";'),
('site_mission', 's:0:"";'),
('site_footer', 's:359:"<b>ESN Satellite</b> - © all right reserved \r\n<a href="http://satellite.esn.org" target="_blank">\r\n<img src="sites/all/themes/custom/esntheme/img/ESN.satellite.power.png" style="display: inline;"/></a>&nbsp;\r\n<a href="http://galaxy.esn.org" target="_blank">\r\n<img src="sites/all/themes/custom/esntheme/img/ESN.galaxy.power.png" style="display: inline;"/></a>";'),
('anonymous', 's:9:"Anonymous";'),
('site_frontpage', 's:4:"node";'),
('theme_esntheme_settings', 'a:16:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:0;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:0;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:0;s:12:"favicon_path";s:46:"/sites/all/themes/custom/esntheme/img/star.gif";s:14:"favicon_upload";s:0:"";s:2:"op";s:18:"Save configuration";s:10:"form_token";s:32:"6b2a8b4222e563b7366a7c4749942288";}'),
('event_range_prev', 'N;'),
('theme_garland_settings', 'a:20:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:0;s:12:"favicon_path";s:46:"/sites/all/themes/custom/esntheme/img/star.gif";s:14:"favicon_upload";s:0:"";s:2:"op";s:18:"Save configuration";s:10:"form_token";s:32:"6b2a8b4222e563b7366a7c4749942288";s:6:"scheme";s:39:"#0072b9,#027ac6,#2385c2,#5ab5ee,#494949";s:7:"palette";a:5:{s:4:"base";s:7:"#0072b9";s:4:"link";s:7:"#027ac6";s:3:"top";s:7:"#2385c2";s:6:"bottom";s:7:"#5ab5ee";s:4:"text";s:7:"#494949";}s:5:"theme";s:7:"garland";s:4:"info";a:9:{s:7:"schemes";a:16:{s:39:"#0072b9,#027ac6,#2385c2,#5ab5ee,#494949";s:21:"Blue Lagoon (Default)";s:39:"#464849,#2f416f,#2a2b2d,#5d6779,#494949";s:3:"Ash";s:39:"#55c0e2,#000000,#085360,#007e94,#696969";s:10:"Aquamarine";s:39:"#d5b048,#6c420e,#331900,#971702,#494949";s:17:"Belgian Chocolate";s:39:"#3f3f3f,#336699,#6598cb,#6598cb,#000000";s:10:"Bluemarine";s:39:"#d0cb9a,#917803,#efde01,#e6fb2d,#494949";s:12:"Citrus Blast";s:39:"#0f005c,#434f8c,#4d91ff,#1a1575,#000000";s:8:"Cold Day";s:39:"#c9c497,#0c7a00,#03961e,#7be000,#494949";s:9:"Greenbeam";s:39:"#ffe23d,#a9290a,#fc6d1d,#a30f42,#494949";s:11:"Mediterrano";s:39:"#788597,#3f728d,#a9adbc,#d4d4d4,#707070";s:7:"Mercury";s:39:"#5b5fa9,#5b5faa,#0a2352,#9fa8d5,#494949";s:9:"Nocturnal";s:39:"#7db323,#6a9915,#b5d52a,#7db323,#191a19";s:6:"Olivia";s:39:"#12020b,#1b1a13,#f391c6,#f41063,#898080";s:12:"Pink Plastic";s:39:"#b7a0ba,#c70000,#a1443a,#f21107,#515d52";s:12:"Shiny Tomato";s:39:"#18583d,#1b5f42,#34775a,#52bf90,#2d2d2d";s:8:"Teal Top";s:0:"";s:6:"Custom";}s:4:"copy";a:3:{i:0;s:25:"images/menu-collapsed.gif";i:1;s:24:"images/menu-expanded.gif";i:2;s:20:"images/menu-leaf.gif";}s:8:"gradient";a:4:{i:0;i:0;i:1;i:37;i:2;i:760;i:3;i:121;}s:4:"fill";a:2:{s:4:"base";a:4:{i:0;i:0;i:1;i:0;i:2;i:760;i:3;i:568;}s:4:"link";a:4:{i:0;i:107;i:1;i:533;i:2;i:41;i:3;i:23;}}s:6:"slices";a:13:{s:15:"images/body.png";a:4:{i:0;i:0;i:1;i:37;i:2;i:1;i:3;i:280;}s:17:"images/bg-bar.png";a:4:{i:0;i:202;i:1;i:530;i:2;i:76;i:3;i:14;}s:23:"images/bg-bar-white.png";a:4:{i:0;i:202;i:1;i:506;i:2;i:76;i:3;i:14;}s:17:"images/bg-tab.png";a:4:{i:0;i:107;i:1;i:533;i:2;i:41;i:3;i:23;}s:24:"images/bg-navigation.png";a:4:{i:0;i:0;i:1;i:0;i:2;i:7;i:3;i:37;}s:26:"images/bg-content-left.png";a:4:{i:0;i:40;i:1;i:117;i:2;i:50;i:3;i:352;}s:27:"images/bg-content-right.png";a:4:{i:0;i:510;i:1;i:117;i:2;i:50;i:3;i:352;}s:21:"images/bg-content.png";a:4:{i:0;i:299;i:1;i:117;i:2;i:7;i:3;i:200;}s:29:"images/bg-navigation-item.png";a:4:{i:0;i:32;i:1;i:37;i:2;i:17;i:3;i:12;}s:35:"images/bg-navigation-item-hover.png";a:4:{i:0;i:54;i:1;i:37;i:2;i:17;i:3;i:12;}s:25:"images/gradient-inner.png";a:4:{i:0;i:646;i:1;i:307;i:2;i:112;i:3;i:42;}s:8:"logo.png";a:4:{i:0;i:622;i:1;i:51;i:2;i:64;i:3;i:73;}s:14:"screenshot.png";a:4:{i:0;i:0;i:1;i:37;i:2;i:400;i:3;i:240;}}s:12:"blend_target";s:7:"#ffffff";s:13:"preview_image";s:17:"color/preview.png";s:11:"preview_css";s:17:"color/preview.css";s:10:"base_image";s:14:"color/base.png";}}'),
('event_range_next', 'N;'),
('filter_url_length_1', 's:2:"72";'),
('allowed_html_1', 's:76:"<a> <em> <strong> <cite> <code> <ul> <ol> <li> <dl> <dt> <dd> <img> <p> <br>";'),
('filter_html_help_1', 'i:1;'),
('filter_html_nofollow_1', 'i:0;'),
('imce_settings_tinymce', 'i:1;'),
('imce_settings_textarea', 's:0:"";'),
('imce_settings_user1', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:6:"twidth";s:0:"";s:7:"theight";s:0:"";s:6:"shared";s:2:"u1";s:6:"extras";i:0;}'),
('imce_settings_roles', 'a:1:{i:2;a:17:{s:6:"delete";i:1;s:6:"upload";i:1;s:7:"nolimit";i:0;s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:5:"scale";i:1;s:6:"twidth";s:0:"";s:7:"theight";s:0:"";s:6:"resize";i:0;s:8:"filesize";s:3:"500";s:5:"quota";s:4:"2000";s:6:"prefix";s:1:"u";s:6:"shared";s:0:"";s:6:"subnav";i:0;s:7:"subdirs";s:0:"";s:10:"extensions";s:0:"";s:6:"extras";i:0;}}'),
('upload_max_resolution', 's:1:"0";'),
('upload_list_default', 's:1:"1";'),
('upload_extensions_default', 's:57:"jpg jpeg gif png txt html doc xls pdf ppt pps odt ods odp";'),
('upload_uploadsize_default', 's:1:"1";'),
('upload_usersize_default', 's:1:"1";'),
('roles', 'a:1:{i:2;s:18:"authenticated user";}'),
('upload_extensions_2', 's:57:"jpg jpeg gif png txt html doc xls pdf ppt pps odt ods odp";'),
('upload_uploadsize_2', 's:1:"1";'),
('upload_usersize_2', 's:1:"5";');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_view_argument`
-- 

CREATE TABLE `satellite2_view_argument` (
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(255) default NULL,
  `argdefault` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `options` varchar(255) default NULL,
  `position` int(2) default NULL,
  `wildcard` varchar(32) default NULL,
  `wildcard_substitution` varchar(32) default NULL,
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_view_argument`
-- 

INSERT INTO `satellite2_view_argument` (`vid`, `type`, `argdefault`, `title`, `options`, `position`, `wildcard`, `wildcard_substitution`) VALUES 
(1, 'rss_feed', '2', 'feed', '', 0, '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_view_exposed_filter`
-- 

CREATE TABLE `satellite2_view_exposed_filter` (
  `vid` int(10) unsigned NOT NULL default '0',
  `field` varchar(255) default NULL,
  `label` varchar(255) default NULL,
  `optional` int(1) default NULL,
  `is_default` int(1) default NULL,
  `operator` int(1) default NULL,
  `single` int(1) default NULL,
  `position` int(2) default NULL,
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_view_exposed_filter`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_view_filter`
-- 

CREATE TABLE `satellite2_view_filter` (
  `vid` int(10) unsigned NOT NULL default '0',
  `tablename` varchar(255) default NULL,
  `field` varchar(255) default NULL,
  `value` longtext,
  `operator` varchar(20) default NULL,
  `options` varchar(255) default NULL,
  `position` int(2) default NULL,
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_view_filter`
-- 

INSERT INTO `satellite2_view_filter` (`vid`, `tablename`, `field`, `value`, `operator`, `options`, `position`) VALUES 
(1, '', 'node.status', '1', '=', '', 0),
(1, '', 'node.type', 'news', 'OR', '', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_view_sort`
-- 

CREATE TABLE `satellite2_view_sort` (
  `vid` int(10) unsigned NOT NULL default '0',
  `position` int(2) default NULL,
  `field` varchar(255) default NULL,
  `sortorder` varchar(5) default NULL,
  `options` varchar(255) default NULL,
  `tablename` varchar(255) default NULL,
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_view_sort`
-- 

INSERT INTO `satellite2_view_sort` (`vid`, `position`, `field`, `sortorder`, `options`, `tablename`) VALUES 
(1, 0, 'node.created', 'DESC', 'normal', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_view_tablefield`
-- 

CREATE TABLE `satellite2_view_tablefield` (
  `vid` int(10) unsigned NOT NULL default '0',
  `tablename` varchar(255) default NULL,
  `field` varchar(255) default NULL,
  `label` varchar(255) default NULL,
  `handler` varchar(255) default NULL,
  `sortable` int(1) default NULL,
  `defaultsort` varchar(5) default NULL,
  `options` varchar(255) default NULL,
  `position` int(2) default NULL,
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_view_tablefield`
-- 

INSERT INTO `satellite2_view_tablefield` (`vid`, `tablename`, `field`, `label`, `handler`, `sortable`, `defaultsort`, `options`, `position`) VALUES 
(1, 'node', 'created', '', 'views_handler_field_date_small', 0, 'ASC', '', 0),
(1, 'node', 'title', '', 'views_handler_field_nodelink_with_mark', 0, '0', 'nolink', 1),
(1, 'node', 'body', '', 'views_handler_field_body', 0, '', '', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_view_view`
-- 

CREATE TABLE `satellite2_view_view` (
  `vid` int(10) unsigned NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  `description` varchar(255) default NULL,
  `access` varchar(255) default NULL,
  `page` int(1) default NULL,
  `page_title` varchar(255) default NULL,
  `page_header` longtext,
  `page_header_format` int(4) NOT NULL,
  `page_empty` longtext,
  `page_empty_format` int(4) NOT NULL,
  `page_footer` longtext,
  `page_footer_format` int(4) NOT NULL,
  `page_type` varchar(20) default NULL,
  `use_pager` int(1) default NULL,
  `nodes_per_page` int(5) default NULL,
  `url` varchar(255) default NULL,
  `menu` int(1) default NULL,
  `menu_tab` int(1) default NULL,
  `menu_tab_weight` int(4) default NULL,
  `menu_title` varchar(255) default NULL,
  `menu_tab_default` int(1) default NULL,
  `menu_tab_default_parent_type` varchar(10) default NULL,
  `menu_parent_title` varchar(255) default NULL,
  `menu_parent_tab_weight` int(4) default NULL,
  `block` int(1) default NULL,
  `block_title` varchar(255) default NULL,
  `block_use_page_header` int(1) default NULL,
  `block_header` longtext,
  `block_header_format` int(4) NOT NULL,
  `block_use_page_footer` int(1) default NULL,
  `block_footer` longtext,
  `block_footer_format` int(4) NOT NULL,
  `block_use_page_empty` int(1) default NULL,
  `block_empty` longtext,
  `block_empty_format` int(4) NOT NULL,
  `block_type` varchar(20) default NULL,
  `nodes_per_block` int(5) default NULL,
  `block_more` int(1) default NULL,
  `breadcrumb_no_home` int(1) default NULL,
  `changed` int(11) default NULL,
  `view_args_php` longtext,
  `is_cacheable` int(1) default NULL,
  PRIMARY KEY  (`vid`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_view_view`
-- 

INSERT INTO `satellite2_view_view` (`vid`, `name`, `description`, `access`, `page`, `page_title`, `page_header`, `page_header_format`, `page_empty`, `page_empty_format`, `page_footer`, `page_footer_format`, `page_type`, `use_pager`, `nodes_per_page`, `url`, `menu`, `menu_tab`, `menu_tab_weight`, `menu_title`, `menu_tab_default`, `menu_tab_default_parent_type`, `menu_parent_title`, `menu_parent_tab_weight`, `block`, `block_title`, `block_use_page_header`, `block_header`, `block_header_format`, `block_use_page_footer`, `block_footer`, `block_footer_format`, `block_use_page_empty`, `block_empty`, `block_empty_format`, `block_type`, `nodes_per_block`, `block_more`, `breadcrumb_no_home`, `changed`, `view_args_php`, `is_cacheable`) VALUES 
(1, 'News', 'News view', '', 1, 'News page', '', 1, '', 1, '', 1, 'list', 1, 5, 'news', 0, 0, 0, '', 0, 'tab', '', 0, 1, 'Latest news', 0, '', 1, 0, '', 1, 0, '', 1, 'list', 5, 1, 0, 1188219426, '', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_vocabulary`
-- 

CREATE TABLE `satellite2_vocabulary` (
  `vid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `help` varchar(255) NOT NULL default '',
  `relations` tinyint(3) unsigned NOT NULL default '0',
  `hierarchy` tinyint(3) unsigned NOT NULL default '0',
  `multiple` tinyint(3) unsigned NOT NULL default '0',
  `required` tinyint(3) unsigned NOT NULL default '0',
  `tags` tinyint(3) unsigned NOT NULL default '0',
  `module` varchar(255) NOT NULL default '',
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_vocabulary`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_vocabulary_node_types`
-- 

CREATE TABLE `satellite2_vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`vid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_vocabulary_node_types`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_watchdog`
-- 

CREATE TABLE `satellite2_watchdog` (
  `wid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `type` varchar(16) NOT NULL default '',
  `message` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL default '0',
  `link` varchar(255) NOT NULL default '',
  `location` text NOT NULL,
  `referer` varchar(128) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

-- 
-- Dumping data for table `satellite2_watchdog`
-- 
