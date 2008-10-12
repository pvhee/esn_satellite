-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Oct 12, 2008 at 12:14 PM
-- Server version: 5.0.41
-- PHP Version: 5.2.5

-- 
-- Database: `satellite_svn`
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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM  AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_aggregator_feed`
-- 

INSERT INTO `satellite2_aggregator_feed` VALUES (1, 'ESN International News', 'http://www.esn.org/news/feed', 3600, 1223804136, 'http://www.esn.org/news/feed', 'News view', '', '', 1223804137, 5);

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
) TYPE=MyISAM  AUTO_INCREMENT=889 ;

-- 
-- Dumping data for table `satellite2_aggregator_item`
-- 

INSERT INTO `satellite2_aggregator_item` VALUES (884, 1, 'EAIE: European Association for International Education – Annual Conference', 'http://www.esn.org/news/eaie_european_association_for_international_education_annual_conference', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;p&gt;&lt;img style=&quot;border: 3px solid #f2c89c; margin: 3px&quot; src=&quot;http://esn.org/images/events/eaie.jpg&quot; alt=&quot;EAIE&quot; title=&quot;EAIE&quot; align=&quot;left&quot; /&gt;&lt;strong&gt;European Association for International Education annual meeting&lt;/strong&gt; took place in &lt;strong&gt;Antwerp&lt;/strong&gt; (Belgium) &lt;strong&gt;10th - 14th September&lt;/strong&gt;.&lt;br /&gt;Over 3&amp;#39;000 important persons involved in international higher education came together in Antwerp for four days. &lt;a href=&quot;http://supernova.esn.org/eaie-antwerp&quot; title=&quot;www.supernova.esn.org/eaie-antwerp&quot;&gt;&lt;/a&gt;&lt;/p&gt;</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><img style="border: 3px solid #f2c89c; margin: 3px" src="http://esn.org/images/events/eaie.jpg" alt="EAIE" title="EAIE" align="left" /><strong>European Association for International Education annual meeting</strong> took place in <strong>Antwerp</strong> (Belgium) <strong>10th - 14th September</strong>.</p>\n<p>Over 3&#39;000 important persons involved in international higher education came together in Antwerp for four days. </p>\n<p>Six people representing ESN International taught high-level representatives about how to organise a welcome week, the <strong>ESNSurvey</strong>, <strong>ESN PRIME</strong>, and the <strong>ESN Galaxy</strong>. </p>\n<p>A lot of valuable contacts were made and many left Antwerp with the impression: Involve students to help students!</p>\n<p>More information on: <a href="http://www.eaie.org/Antwerp">www.eaie.org/Antwerp</a> and <a href="http://supernova.esn.org/eaie-antwerp" title="www.supernova.esn.org/eaie-antwerp">www.supernova.esn.org/eaie-antwerp</a></p>\n</div></div></div>', 1222880501, '186 at http://www.esn.org');
INSERT INTO `satellite2_aggregator_item` VALUES (885, 1, 'Building Europe Piece by Piece conference', 'http://www.esn.org/news/building_europe_piece_by_piece_conference', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;p&gt;&lt;img style=&quot;border: 3px solid #f2c89c; margin: 3px&quot; src=&quot;http://esn.org/images/events/building-europe.jpg&quot; alt=&quot;logo&quot; title=&quot;logo&quot; width=&quot;160&quot; height=&quot;71&quot; align=&quot;left&quot; /&gt;The &lt;strong&gt;Puzzle Conference&lt;/strong&gt; took place in &lt;strong&gt;Brussels&lt;/strong&gt; on &lt;strong&gt;18-19th of September&lt;/strong&gt;. &lt;/p&gt;&lt;p&gt;We hosted around &lt;strong&gt;40 ESNers&lt;/strong&gt; from all over Europe whom actively participated during the 2-days event. &lt;/p&gt;</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><img style="border: 3px solid #f2c89c; margin: 3px" src="http://esn.org/images/events/building-europe.jpg" alt="logo" title="logo" width="160" height="71" align="left" />The <strong>Puzzle Conference</strong> took place in <strong>Brussels</strong> on <strong>18-19th of September</strong>. We hosted around <strong>40 ESNers</strong> from all over Europe whom actively participated during the 2-days event. </p>\n<p>First day we led the discussion with the policy makers from the European Commission, Committee of Regions, French presidency and other organizations. </p>\n<p>Second day the participants took part in Treasure Hunt in Brussels, and finally, piece by piece, we built up Europe!</p>\n</div></div></div>', 1222880897, '187 at http://www.esn.org');
INSERT INTO `satellite2_aggregator_item` VALUES (886, 1, 'CNR in Rimini', 'http://www.esn.org/news/cnr_in_rimini', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;p&gt;&lt;img style=&quot;border: 3px solid #f2c89c; margin: 3px&quot; src=&quot;http://esn.org/images/events/cnr_rimini.jpg&quot; alt=&quot;cnr rimini&quot; title=&quot;cnr rimini&quot; width=&quot;160&quot; height=&quot;68&quot; align=&quot;left&quot; /&gt;The &lt;strong&gt;Council of National Representatives (CNR)&lt;/strong&gt; took place &lt;strong&gt;24 - 28 September&lt;/strong&gt; in &lt;strong&gt;Rimini/Italy&lt;/strong&gt;. &lt;/p&gt;&lt;p&gt;National Representatives (NRs) together with the International Board discussed and decided about many important topics (...)&lt;/p&gt;</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><img style="border: 3px solid #f2c89c; margin: 3px" src="http://esn.org/images/events/cnr_rimini.jpg" alt="cnr rimini" title="cnr rimini" width="160" height="68" align="left" />The <strong>Council of National Representatives (CNR)</strong> took place <strong>24 - 28 September</strong> in <strong>Rimini/Italy</strong>. </p>\n<p>National Representatives (NRs) together with the International Board discussed and decided about many important topics, such as Bulgaria as a new candidate country, preparations for Regional Platforms and AGM, upcoming Happy Birthday, ESN and much more. </p>\n<p>If you want to know more, contact your NR.</p>\n<p>Many thanks to the OC and to all the NRs for their great job!!!</p>\n</div></div></div>', 1222881065, '188 at http://www.esn.org');
INSERT INTO `satellite2_aggregator_item` VALUES (887, 1, 'Vote for a logo for "Happy Birthday, ESN"', 'http://www.esn.org/news/vote_for_a_logo_for_happy_birthday_esn', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;p class=&quot;MsoNormal&quot;&gt;&lt;img style=&quot;border: 3px solid #f2c89c; margin: 3px&quot; src=&quot;http://esn.org/site/files/uploaded/design-competition-bnr_sm.jpg&quot; border=&quot;2&quot; alt=&quot;logo&quot; title=&quot;logo&quot; width=&quot;160&quot; height=&quot;57&quot; align=&quot;left&quot; /&gt;&lt;span&gt;After three months of open call for a logo for “Happy Birthday, ESN”, the time has come to choose the final design! Vote on &lt;a href=&quot;http://apps.new.facebook.com/arasakik_footprints/canvas_poll_stats_controller.php?poll_id=8035&amp;amp;auth_token=223778e540fb69ab7e21835a183ee10e&amp;amp;installed=1&quot; target=&quot;_blank&quot; title=&quot;Vote for Happy Birthday, ESN logo&quot;&gt;Facebook&lt;/a&gt; from 1 to 14 October and help us shape the celebrations of 20th Birthday of ESN.&lt;/span&gt;&lt;/p&gt;  </div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><img style="margin: 3px" src="http://esn.org/site/files/uploaded/design-competition-bnr.jpg" border="2" alt="logo" title="logo" width="300" height="107" align="left" /><span>After three months of open call for a logo for “<strong>Happy Birthday, ESN</strong>”, the time has come to choose the final design! Vote on <a href="http://apps.new.facebook.com/arasakik_footprints/canvas_poll_stats_controller.php?poll_id=8035&amp;auth_token=223778e540fb69ab7e21835a183ee10e&amp;installed=1" target="_blank" title="Vote for logo of Happy Birthday, ESN"><strong>Facebook</strong></a> from 1 to 14 October and help us shape the celebrations of 20th Birthday of ESN.</span></p>\n<p> The vote is anonymous and open to the general public, even though aimed especially for the ESN members. The winner will be announced on <strong>16 October 2008</strong> - exactly one year before the 20th birthday of ESN. Watch out for more news! </p>\n<p>The Board reserves the right to take the final decision (as the poll at Facebook is opened to public).</p>\n</div></div></div>', 1222882109, '189 at http://www.esn.org');
INSERT INTO `satellite2_aggregator_item` VALUES (888, 1, 'ESN eXpress - write an article !!!', 'http://www.esn.org/news/esn_express_write_an_article', '', '<div class="field field-type-image field-field-image"><div class="field-items"><div class="field-item"><img src="http://www.esn.org/files/cover.bmp" alt="" title="" width="736" height="779" /></div></div></div><div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;p&gt;Write an article for the new edition of the ESN Magazine!The topic of this edition is &lt;strong&gt;‘New Beginning’&lt;/strong&gt;. We’re waiting for your articles till the &lt;strong&gt;31st October&lt;/strong&gt; 2008.&lt;/p&gt;</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p>The requirements are as followed:  </p>\n<div style="margin-left: 20px">\n<ul> 	</ul>\n<ul>\n<li>- one page article: at most 400 words, around 2000 characters, spaces excluded; </li>\n<li>- columns: no more than 150 words, spaces excluded; </li>\n<li>- please send two/three photos connected to the article.</li>\n</ul>\n<ul> 	  	 </ul>\n</div>\n<p> This time English articles will be the core of the magazine, but we would also like to receive articles from your Erasmus students as well as columns in your own languages (not only in English) to make the magazine even more interesting.</p>\n<p>For more information please contact <strong>external@esn.org</strong>.</p>\n</div></div></div>', 1223631190, '191 at http://www.esn.org');

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_blocks`
-- 

INSERT INTO `satellite2_blocks` VALUES ('user', '0', 'garland', 1, 0, 'left', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('user', '1', 'garland', 1, 0, 'left', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('views', 'Partners', 'esntheme', 1, -4, 'right', 0, 0, 1, '<front>', '');
INSERT INTO `satellite2_blocks` VALUES ('views', 'News', 'esntheme', 0, 0, '', 0, 0, 1, '<front>', '');
INSERT INTO `satellite2_blocks` VALUES ('simplenews', 'newsletter-1', 'esntheme', 1, -3, 'right', 0, 0, 1, '<front>', '');
INSERT INTO `satellite2_blocks` VALUES ('signup', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('image', '1', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('image', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('event', '1', 'esntheme', 1, -5, 'left', 0, 0, 1, '<front>', '');
INSERT INTO `satellite2_blocks` VALUES ('event', '0', 'esntheme', 1, -5, 'right', 0, 0, 1, '<front>', '');
INSERT INTO `satellite2_blocks` VALUES ('user', '3', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('user', '2', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('user', '1', 'esntheme', 1, 6, 'left', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('user', '0', 'esntheme', 1, 8, 'left', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('search', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('profile', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('poll', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('node', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('menu', '2', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('comment', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('aggregator', 'feed-1', 'esntheme', 1, -4, 'left', 0, 0, 1, '<front>', '');
INSERT INTO `satellite2_blocks` VALUES ('birthdays', 'by_birthdays', 'esntheme', 0, 0, '', 0, 0, 1, '<front>', '');
INSERT INTO `satellite2_blocks` VALUES ('birthdays', 'by_days', 'esntheme', 0, 0, '', 0, 0, 0, '', '');
INSERT INTO `satellite2_blocks` VALUES ('views', 'comments_recent', 'esntheme', 0, 0, '', 0, 0, 0, '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_blocks_roles`
-- 

CREATE TABLE `satellite2_blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`module`,`delta`,`rid`)
) TYPE=MyISAM;

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_cache_filter`
-- 


-- --------------------------------------------------------

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_cache_menu`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_cache_page`
-- 

CREATE TABLE `satellite2_cache_page` (
  `cid` varchar(255) binary NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM  AUTO_INCREMENT=2 ;

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
) TYPE=MyISAM  AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_contact`
-- 

INSERT INTO `satellite2_contact` VALUES (1, 'website feedback', 'change-this-email-address@test.org', '', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_event`
-- 

CREATE TABLE `satellite2_content_type_event` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) TYPE=MyISAM;

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
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) TYPE=MyISAM;

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
  `field_summary_value` longtext,
  `field_image_fid` int(11) NOT NULL default '0',
  `field_image_title` varchar(255) NOT NULL default '',
  `field_image_alt` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_content_type_news`
-- 

INSERT INTO `satellite2_content_type_news` VALUES (20, 20, 'Try Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite 2, thereby joining the fast growing ESN Galaxy!', 24, 'ESN Satellite 2', 'ESN Satellite 2');
INSERT INTO `satellite2_content_type_news` VALUES (3, 3, NULL, 3, '', '');
INSERT INTO `satellite2_content_type_news` VALUES (8, 8, NULL, 11, '', '');
INSERT INTO `satellite2_content_type_news` VALUES (14, 14, NULL, 15, '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_page`
-- 

CREATE TABLE `satellite2_content_type_page` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_content_type_page`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_partner`
-- 

CREATE TABLE `satellite2_content_type_partner` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_logo_fid` int(11) NOT NULL default '0',
  `field_logo_title` varchar(255) NOT NULL default '',
  `field_logo_alt` varchar(255) NOT NULL default '',
  `field_logolink_url` varchar(255) NOT NULL default '',
  `field_logolink_title` varchar(255) NOT NULL default '',
  `field_logolink_attributes` mediumtext,
  `field_shortdescription_value` longtext,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) TYPE=MyISAM;

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
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_content_type_poll`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_simplenews`
-- 

CREATE TABLE `satellite2_content_type_simplenews` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_content_type_simplenews`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_dob`
-- 

CREATE TABLE `satellite2_dob` (
  `uid` int(10) unsigned NOT NULL default '0',
  `birthday` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`uid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_dob`
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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_event`
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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_files`
-- 

INSERT INTO `satellite2_files` VALUES (24, 20, 'ESN_astronaut.png', 'files/images-news/ESN_astronaut.png', 'image/png', 67587);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_file_revisions`
-- 


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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_filters`
-- 

INSERT INTO `satellite2_filters` VALUES (1, 'filter', 3, 0);
INSERT INTO `satellite2_filters` VALUES (1, 'filter', 0, 1);
INSERT INTO `satellite2_filters` VALUES (1, 'filter', 2, 2);
INSERT INTO `satellite2_filters` VALUES (2, 'filter', 1, 0);
INSERT INTO `satellite2_filters` VALUES (3, 'filter', 3, 0);
INSERT INTO `satellite2_filters` VALUES (3, 'filter', 2, 1);

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
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `satellite2_filter_formats`
-- 

INSERT INTO `satellite2_filter_formats` VALUES (1, 'Filtered HTML', ',1,2,', 1);
INSERT INTO `satellite2_filter_formats` VALUES (2, 'PHP code', '', 0);
INSERT INTO `satellite2_filter_formats` VALUES (3, 'Full HTML', '', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_flood`
-- 

CREATE TABLE `satellite2_flood` (
  `event` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0'
) TYPE=MyISAM;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_history`
-- 

INSERT INTO `satellite2_history` VALUES (1, 12, 1223805157);
INSERT INTO `satellite2_history` VALUES (1, 20, 1223805008);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_i18n_node`
-- 

CREATE TABLE `satellite2_i18n_node` (
  `nid` int(11) unsigned NOT NULL,
  `trid` int(10) unsigned NOT NULL default '0',
  `language` varchar(12) NOT NULL default '',
  `status` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_i18n_node`
-- 

INSERT INTO `satellite2_i18n_node` VALUES (5, 1, 'en', 0);
INSERT INTO `satellite2_i18n_node` VALUES (11, 1, 'nl', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_i18n_variable`
-- 

CREATE TABLE `satellite2_i18n_variable` (
  `name` varchar(48) NOT NULL default '',
  `language` varchar(12) NOT NULL default '',
  `value` longtext NOT NULL,
  PRIMARY KEY  (`name`,`language`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_i18n_variable`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_imagecache_action`
-- 

CREATE TABLE `satellite2_imagecache_action` (
  `actionid` int(10) unsigned NOT NULL,
  `presetid` int(10) unsigned NOT NULL default '0',
  `weight` int(11) NOT NULL default '0',
  `data` text NOT NULL,
  PRIMARY KEY  (`actionid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_imagecache_action`
-- 

INSERT INTO `satellite2_imagecache_action` VALUES (1, 1, 1, 'a:4:{s:8:"function";s:5:"scale";s:3:"fit";s:6:"inside";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}');
INSERT INTO `satellite2_imagecache_action` VALUES (2, 2, 0, 'a:4:{s:8:"function";s:5:"scale";s:3:"fit";s:6:"inside";s:5:"width";s:3:"100";s:6:"height";s:3:"100";}');
INSERT INTO `satellite2_imagecache_action` VALUES (3, 3, 1, 'a:4:{s:8:"function";s:5:"scale";s:3:"fit";s:6:"inside";s:5:"width";s:3:"145";s:6:"height";s:3:"145";}');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_imagecache_preset`
-- 

CREATE TABLE `satellite2_imagecache_preset` (
  `presetid` int(10) unsigned NOT NULL,
  `presetname` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`presetid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_imagecache_preset`
-- 

INSERT INTO `satellite2_imagecache_preset` VALUES (1, 'mainimage');
INSERT INTO `satellite2_imagecache_preset` VALUES (2, 'thumbnail');
INSERT INTO `satellite2_imagecache_preset` VALUES (3, 'logo');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_img_assist_map`
-- 

CREATE TABLE `satellite2_img_assist_map` (
  `nid` int(10) unsigned NOT NULL,
  `iid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`nid`,`iid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_img_assist_map`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_locales_meta`
-- 

CREATE TABLE `satellite2_locales_meta` (
  `locale` varchar(12) NOT NULL default '',
  `name` varchar(64) NOT NULL default '',
  `enabled` int(11) NOT NULL default '0',
  `isdefault` int(11) NOT NULL default '0',
  `plurals` int(11) NOT NULL default '0',
  `formula` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`locale`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_locales_meta`
-- 

INSERT INTO `satellite2_locales_meta` VALUES ('en', 'English', 1, 1, 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_locales_source`
-- 

CREATE TABLE `satellite2_locales_source` (
  `lid` int(11) NOT NULL auto_increment,
  `location` varchar(255) NOT NULL default '',
  `source` blob NOT NULL,
  PRIMARY KEY  (`lid`),
  KEY `source` (`source`(30))
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_locales_source`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_locales_target`
-- 

CREATE TABLE `satellite2_locales_target` (
  `lid` int(11) NOT NULL default '0',
  `translation` blob NOT NULL,
  `locale` varchar(12) NOT NULL default '',
  `plid` int(11) NOT NULL default '0',
  `plural` int(11) NOT NULL default '0',
  KEY `lid` (`lid`),
  KEY `lang` (`locale`),
  KEY `plid` (`plid`),
  KEY `plural` (`plural`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_locales_target`
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
  `language` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`mid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_menu`
-- 

INSERT INTO `satellite2_menu` VALUES (2, 0, '', 'Primary links', '', 0, 115, '');
INSERT INTO `satellite2_menu` VALUES (3, 1, 'filter/tips', 'Compose tips', '', 0, 20, '');
INSERT INTO `satellite2_menu` VALUES (4, 1, 'node', 'Content', '', 0, 16, '');
INSERT INTO `satellite2_menu` VALUES (5, 1, 'search', 'Search', '', 0, 20, '');
INSERT INTO `satellite2_menu` VALUES (6, 1, 'admin', 'Administer', '', 9, 22, '');
INSERT INTO `satellite2_menu` VALUES (7, 1, 'logout', 'Log out', '', 10, 22, '');
INSERT INTO `satellite2_menu` VALUES (8, 1, 'tracker', 'Recent posts', '', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (9, 6, 'admin/help', 'Help', '', 9, 22, '');
INSERT INTO `satellite2_menu` VALUES (10, 6, 'admin/content', 'Content management', 'Manage your site''s content.', -10, 22, '');
INSERT INTO `satellite2_menu` VALUES (102, 4, 'node/add', 'Create content', '', 1, 28, '');
INSERT INTO `satellite2_menu` VALUES (12, 6, 'admin/settings', 'Site configuration', 'Adjust basic site configuration options.', -5, 22, '');
INSERT INTO `satellite2_menu` VALUES (13, 6, 'admin/build', 'Site building', 'Control how your site looks and feels.', -10, 22, '');
INSERT INTO `satellite2_menu` VALUES (14, 6, 'admin/logs', 'Logs', 'View system logs and other status information.', 5, 22, '');
INSERT INTO `satellite2_menu` VALUES (15, 6, 'admin/user', 'User management', 'Manage your site''s users, groups and access to site features.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (16, 13, 'admin/build/block', 'Blocks', 'Configure what block content appears in your site''s sidebars and other regions.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (17, 10, 'admin/content/comment', 'Comments', 'List and edit site comments and the comment moderation queue.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (18, 12, 'admin/settings/filters', 'Input formats', 'Configure how content input by users is filtered, including allowed HTML tags, PHP code tags. Also allows enabling of module-provided filters.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (19, 13, 'admin/build/menu', 'Menus', 'Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (20, 10, 'admin/content/node', 'Content', 'View, edit, and delete your site''s content.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (21, 10, 'admin/content/search', 'Search content', 'Search content by keyword.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (22, 10, 'admin/content/node-settings', 'Post settings', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (23, 10, 'admin/content/types', 'Content types', 'Manage posts by content type, including default status, front page promotion, etc.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (24, 13, 'admin/build/path', 'URL aliases', 'Change your site''s URL paths by aliasing them.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (25, 12, 'admin/settings/search', 'Search settings', 'Configure relevance settings for search and other indexing options', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (26, 14, 'admin/logs/search', 'Top search phrases', 'View most popular search phrases.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (27, 14, 'admin/logs/hits', 'Recent hits', 'View pages that have recently been visited.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (28, 14, 'admin/logs/pages', 'Top pages', 'View pages that have been hit frequently.', 1, 22, '');
INSERT INTO `satellite2_menu` VALUES (29, 14, 'admin/logs/visitors', 'Top visitors', 'View visitors that hit many pages.', 2, 22, '');
INSERT INTO `satellite2_menu` VALUES (30, 14, 'admin/logs/referrers', 'Top referrers', 'View top referrers.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (31, 14, 'admin/logs/settings', 'Access log settings', 'Control details about what and how your site logs.', 3, 22, '');
INSERT INTO `satellite2_menu` VALUES (32, 12, 'admin/settings/admin', 'Administration theme', 'Settings for how your administrative pages should look.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (33, 13, 'admin/build/themes', 'Themes', 'Change which theme your site uses or allows users to set.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (34, 13, 'admin/build/modules', 'Modules', 'Enable or disable add-on modules for your site.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (35, 12, 'admin/settings/site-information', 'Site information', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (36, 12, 'admin/settings/error-reporting', 'Error reporting', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (37, 12, 'admin/settings/performance', 'Performance', 'Enable or disable page caching for anonymous users, and enable or disable CSS preprocessor.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (38, 12, 'admin/settings/file-system', 'File system', 'Tell Drupal where to store uploaded files and how they are accessed.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (39, 12, 'admin/settings/image-toolkit', 'Image toolkit', 'Choose which image toolkit to use if you have installed optional toolkits.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (40, 10, 'admin/content/rss-publishing', 'RSS publishing', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (41, 12, 'admin/settings/date-time', 'Date and time', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (42, 12, 'admin/settings/site-maintenance', 'Site maintenance', 'Take the site off-line for maintenance or bring it back online.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (43, 12, 'admin/settings/clean-urls', 'Clean URLs', 'Enable or disable clean URLs for your site.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (44, 14, 'admin/logs/status', 'Status report', 'Get a status report about your site''s operation and any detected problems.', 10, 22, '');
INSERT INTO `satellite2_menu` VALUES (45, 10, 'admin/content/taxonomy', 'Categories', 'Create vocabularies and terms to categorize your content.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (46, 12, 'admin/settings/throttle', 'Throttle', 'Control how your site cuts out content during heavy load.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (47, 15, 'admin/user/user', 'Users', 'List, add, and edit users.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (48, 15, 'admin/user/settings', 'User settings', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (49, 15, 'admin/user/access', 'Access control', 'Determine access to features by selecting permissions for roles.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (50, 15, 'admin/user/roles', 'Roles', 'List, edit, or add user roles.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (51, 15, 'admin/user/rules', 'Access rules', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (52, 15, 'admin/user/search', 'Search users', 'Search users by name.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (53, 14, 'admin/logs/watchdog', 'Recent log entries', 'View events that have recently been logged.', -1, 22, '');
INSERT INTO `satellite2_menu` VALUES (54, 14, 'admin/logs/page-not-found', 'Top ''page not found'' errors', 'View ''page not found'' errors (404s).', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (55, 14, 'admin/logs/access-denied', 'Top ''access denied'' errors', 'View ''access denied'' errors (403s).', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (56, 11, 'node/add/event', 'Event', '', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (57, 12, 'admin/settings/event', 'Events', 'Set up how your site handles events.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (58, 11, 'node/add/image', 'Image', '', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (59, 12, 'admin/settings/image', 'Image', 'Image module settings.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (60, 12, 'admin/settings/imce', 'IMCE settings', 'Control how your image/file browser works.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (61, 12, 'admin/settings/img_assist', 'Image assist', 'Change settings for the Image assist module.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (62, 12, 'admin/settings/pathauto', 'Pathauto', 'Configure how pathauto generates clean URLs for your content.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (63, 12, 'admin/settings/signup', 'Signup', 'Configure settings for signups.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (64, 10, 'admin/content/signup', 'Signup overview', 'View all signup-enabled posts, and open or close signups on them.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (65, 12, 'admin/settings/simplemenu', 'SimpleMenu', 'Select the menu to display.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (66, 12, 'admin/settings/tinymce', 'TinyMCE', 'Configure the rich editor.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (67, 13, 'admin/build/views', 'Views', 'Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (68, 57, 'admin/settings/event/timezone', 'Timezone handling', 'Change how timezone information is saved and displayed.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (69, 57, 'admin/settings/event/overview', 'Event overview', 'Change how event summary information is displayed.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (70, 10, 'admin/content/aggregator', 'News aggregator', 'Configure which content your site aggregates from other sites, how often it polls them, and how they''re categorized.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (71, 1, 'aggregator', 'News aggregator', '', 5, 48, '');
INSERT INTO `satellite2_menu` VALUES (72, 13, 'admin/build/contact', 'Contact form', 'Create a system contact form and set up categories for the form to use.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (73, 1, 'contact', 'Contact', '', 0, 20, '');
INSERT INTO `satellite2_menu` VALUES (74, 12, 'admin/settings/uploads', 'File uploads', 'Control how files may be attached to content.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (75, 71, 'aggregator/sources', 'Sources', '', 0, 48, '');
INSERT INTO `satellite2_menu` VALUES (76, 71, 'aggregator/categories', 'Categories', '', 0, 28, '');
INSERT INTO `satellite2_menu` VALUES (77, 11, 'node/add/poll', 'Poll', '', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (78, 1, 'poll', 'Polls', '', 0, 20, '');
INSERT INTO `satellite2_menu` VALUES (79, 11, 'node/add/news', 'News', '', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (80, 11, 'node/add/partner', 'Partner', '', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (81, 2, '<front>', 'Home', 'Go to the Satellite homepage', -10, 118, '');
INSERT INTO `satellite2_menu` VALUES (82, 2, 'news', 'News', 'News page', -7, 118, '');
INSERT INTO `satellite2_menu` VALUES (83, 2, 'partners', 'Partners', 'Partners', -4, 118, '');
INSERT INTO `satellite2_menu` VALUES (84, 12, 'admin/settings/imagecache', 'Image cache', 'Configure rulesets and actions for imagecache.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (85, 2, 'event', 'Events', 'Events', -6, 118, '');
INSERT INTO `satellite2_menu` VALUES (86, 14, 'admin/logs/updates', 'Available updates', 'Get a status report on installed modules and available updates.', 10, 22, '');
INSERT INTO `satellite2_menu` VALUES (87, 12, 'admin/settings/poormanscron', 'Poormanscron', 'A module which runs Drupal cron jobs without the cron application.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (88, 1, 'profile', 'User list', '', 0, 20, '');
INSERT INTO `satellite2_menu` VALUES (89, 15, 'admin/user/profile', 'Profiles', 'Create customizable fields for your users.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (90, 12, 'admin/settings/birthdays', 'Birthdays', 'Set user birthday mail and toggle user mail, upcoming birthdays mail and more.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (91, 1, 'birthdays', 'Birthdays', 'List the birthdays of all users.', 0, 20, '');
INSERT INTO `satellite2_menu` VALUES (92, 11, 'node/add/simplenews', 'Newsletter issue', '', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (93, 10, 'admin/content/newsletters', 'Newsletters', 'Manage newsletters, subscriptions, and configuration options.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (94, 2, 'contact', 'Contact', 'Contact', 10, 118, '');
INSERT INTO `satellite2_menu` VALUES (95, 10, 'admin/content/translation', 'Translations', 'Manage content translations.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (96, 12, 'admin/settings/i18n', 'Multilingual system', 'Configure multilingual content and translation.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (97, 12, 'admin/settings/locale', 'Localization', 'Configure site localization and user interface translation.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (98, 12, 'admin/settings/shoutbox', 'Shoutbox', 'Settings for displaying and deleting shouts', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (100, 11, 'node/add/page', 'Page', '', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (101, 2, 'node/12', 'ESN Galaxy', 'ESN Galaxy', 5, 118, '');
INSERT INTO `satellite2_menu` VALUES (103, 13, 'admin/build/menutree', 'Menu trees', 'Configure page titles and intro text for menu tree pages.', 0, 22, '');
INSERT INTO `satellite2_menu` VALUES (104, 12, 'admin/settings/admin_menu', 'Administration Menu', 'Adjust settings for the dropdown Administration Menu.', 0, 22, '');

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
) TYPE=MyISAM  AUTO_INCREMENT=24 ;

-- 
-- Dumping data for table `satellite2_node`
-- 

INSERT INTO `satellite2_node` VALUES (20, 20, 'news', 'Welcome to ESN Satellite 2 and ESN Galaxy', 1, 1, 1190992527, 1223805008, 0, 1, 0, 0);
INSERT INTO `satellite2_node` VALUES (12, 12, 'page', 'ESN Galaxy', 1, 1, 1190502732, 1190724448, 2, 0, 0, 0);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_node_access`
-- 

INSERT INTO `satellite2_node_access` VALUES (0, 0, 'all', 1, 0, 0);

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
) TYPE=MyISAM  AUTO_INCREMENT=24 ;

-- 
-- Dumping data for table `satellite2_node_comment_statistics`
-- 

INSERT INTO `satellite2_node_comment_statistics` VALUES (20, 1190992527, NULL, 1, 0);
INSERT INTO `satellite2_node_comment_statistics` VALUES (12, 1190502732, '', 1, 0);

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_node_field`
-- 

INSERT INTO `satellite2_node_field` VALUES ('field_image', 'image', 'a:0:{}', 1, 0, 1);
INSERT INTO `satellite2_node_field` VALUES ('field_summary', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:3:"500";s:14:"allowed_values";s:0:"";s:18:"allowed_values_php";s:0:"";}', 1, 0, 1);
INSERT INTO `satellite2_node_field` VALUES ('field_shortdescription', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:0:"";s:18:"allowed_values_php";s:0:"";}', 1, 0, 1);
INSERT INTO `satellite2_node_field` VALUES ('field_logo', 'image', 'a:0:{}', 1, 0, 1);
INSERT INTO `satellite2_node_field` VALUES ('field_logolink', 'link', 'a:3:{s:10:"attributes";a:3:{s:6:"target";s:7:"default";s:3:"rel";i:0;s:5:"class";s:0:"";}s:7:"display";a:1:{s:10:"url_cutoff";s:2:"80";}s:5:"title";s:8:"optional";}', 0, 0, 1);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_node_field_instance`
-- 

INSERT INTO `satellite2_node_field_instance` VALUES ('field_image', 'news', -2, 'Image', 'image', 'a:6:{s:14:"max_resolution";s:1:"0";s:10:"image_path";s:11:"images-news";s:10:"custom_alt";i:1;s:12:"custom_title";i:1;s:13:"teaser_preset";N;s:11:"body_preset";N;}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:1:{s:6:"format";s:9:"thumbnail";}s:4:"full";a:1:{s:6:"format";s:9:"mainimage";}}', 'Add an image. This will make your post visually more attractive.');
INSERT INTO `satellite2_node_field_instance` VALUES ('field_summary', 'news', -1, 'Summary', 'text', 'a:3:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";s:0:"";s:4:"rows";s:2:"10";}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:1:{s:6:"format";s:5:"plain";}s:4:"full";a:1:{s:6:"format";s:7:"default";}}', 'A brief description of the news content, max. 500 characters. Tip: You can easily copy and paste the first rows from the news body.');
INSERT INTO `satellite2_node_field_instance` VALUES ('field_logo', 'partner', -3, 'Logo', 'image', 'a:6:{s:14:"max_resolution";s:1:"0";s:10:"image_path";s:14:"images-partner";s:10:"custom_alt";i:1;s:12:"custom_title";i:1;s:13:"teaser_preset";N;s:11:"body_preset";N;}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:1:{s:6:"format";s:4:"logo";}s:4:"full";a:1:{s:6:"format";s:9:"mainimage";}}', 'Put here the logo of your partner. This is recommended as it will appear on your Satellite homepage!');
INSERT INTO `satellite2_node_field_instance` VALUES ('field_logolink', 'partner', 1, 'Partner website', 'link', 'a:2:{s:13:"default_value";a:1:{i:0;a:3:{s:3:"url";s:0:"";s:5:"title";s:0:"";s:10:"attributes";s:2:"N;";}}s:17:"default_value_php";s:0:"";}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"inline";}s:6:"teaser";a:1:{s:6:"format";s:5:"plain";}s:4:"full";a:1:{s:6:"format";s:5:"plain";}}', 'Put here the website of your partner.');
INSERT INTO `satellite2_node_field_instance` VALUES ('field_shortdescription', 'partner', -1, 'Short Description', 'text', 'a:3:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";s:0:"";s:4:"rows";s:1:"7";}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:1:{s:6:"format";s:5:"plain";}s:4:"full";a:1:{s:6:"format";s:7:"default";}}', '');

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_node_revisions`
-- 

INSERT INTO `satellite2_node_revisions` VALUES (20, 20, 1, 'Welcome to ESN Satellite 2 and ESN Galaxy', '<div class="content"><p>ESN Satellite is the free website template for ESN sections, developed and maintained by the ESN International Webteam.  </p><h2>Be a ESN Astronaut: Install ESN Satellite for your section!</h2><p>Try Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite. Documentation will also be available.</p><p>ESN Satellite is easy to install, but it is still a Web application and its setup is thus different from a normal program installation onyour PC. So a basic knowledge of how to install Web applications is required if you want to try it out.</p><p>Join the project, get ESN Satellite and start experimenting!</p><h2>ESN Satellite Resources</h2><p>If you just wish to know more about the ESN Satellite but don''t want to try it right now, we have some documentation available. We expect it to be extended and improved during the beta testing phase, so please check back often. </p><ul>	<li><a href="http://www.esn.org/satellite">Satellite Documentation wiki</a></li>				<li><a href="http://groups.google.com/group/esn-satellite">ESN Satellite Google Group</a></li></ul><h2>New in ESN Satellite 2.0</h2><p>ESN Satellite 2 comes with several new features:</p><ul>	<li>Multilingual interface: it supports localizing your website pages in as many languages as you wish... and, anyway, every student will be able to see the web site interface in her own language!</li>		<li>A new &quot;control panel&quot; for faster access to the most common administration tasks.</li>		<li>Newsletter support.</li>		<li>Direct access to the ESN Galaxy.</li>		<li>An improved installation process, with broader compatibility.</li></ul></div><div class="content"><h2>Join the ESN Galaxy</h2><p>Curious to see what the ESN Galaxy is? Then check it out <a href="?q=esn-galaxy">on your own Satellite website!</a> And if you are not yet of this fast growing network of Satellites, then be quick and <a href="/?q=esn-galaxy">activate your Satellite now!</a></p><br /></div>', '<div class="content"><p>ESN Satellite is the free website template for ESN sections, developed and maintained by the ESN International Webteam.  </p><h2>Be a ESN Astronaut: Install ESN Satellite for your section!</h2><p>Try Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite. Documentation will also be available.</p>', '', 1223805008, 3);
INSERT INTO `satellite2_node_revisions` VALUES (12, 12, 1, 'ESN Galaxy', '<script src="http://gmodules.com/ig/ifr?url=http://galaxy.esn.org/gadget.xml&amp;synd=open&amp;w=500&amp;h=400&amp;title=ESN+Galaxy+%7C+Discover+Erasmus&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js"></script>\r\n\r\nNot yet a part of the <a href="http://galaxy.esn.org">ESN Galaxy</a>? Then <a href="http://galaxy.esn.org/index.php/satellites/add">join now</a>!', '<script src="http://gmodules.com/ig/ifr?url=http://galaxy.esn.org/gadget.xml&amp;synd=open&amp;w=500&amp;h=400&amp;title=ESN+Galaxy+%7C+Discover+Erasmus&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js"></script>\r\n\r\nNot yet a part of the <a href="http://galaxy.esn.org">ESN Galaxy</a>? Then <a href="http://galaxy.esn.org/index.php/satellites/add">join now</a>!', '', 1190724448, 3);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_node_type`
-- 

INSERT INTO `satellite2_node_type` VALUES ('event', 'Event', 'basicevent', 'An event is a story which can be given a start and end date, thus appearing in the events calendar.', '', 1, 'Title', 1, 'Body', 0, 0, 0, 1, 'event');
INSERT INTO `satellite2_node_type` VALUES ('image', 'Image', 'image', 'An image (with thumbnail). This is ideal for publishing photographs or screenshots.', '', 1, 'Title', 1, 'Body', 0, 0, 0, 1, 'image');
INSERT INTO `satellite2_node_type` VALUES ('poll', 'Poll', 'poll', 'A poll is a multiple-choice question which visitors can vote on.', '', 1, 'Question', 0, '', 0, 0, 0, 1, 'poll');
INSERT INTO `satellite2_node_type` VALUES ('news', 'News', 'node', 'All your ESN related news. Posting as news will put the news item into a news page and promote a teaser (short version of your news with a small image) to your front page. Use this for all dynamic content on your site.', 'Put here the content of your news item. You have to write at least 10 words.', 1, 'Title', 1, 'Body', 10, 1, 1, 0, '');
INSERT INTO `satellite2_node_type` VALUES ('partner', 'Partner', 'node', 'A partner from your ESN section, e.g. giving you ESN card discounts or sponsoring your section. Partners are grouped together and fetched in the ESN Galaxy.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, '');
INSERT INTO `satellite2_node_type` VALUES ('simplenews', 'Newsletter issue', 'simplenews', 'Create a newsletter issue to be sent to subscribed e-mail addresses.', '', 1, 'Title', 1, 'Body', 0, 0, 0, 1, 'simplenews');
INSERT INTO `satellite2_node_type` VALUES ('page', 'Page', 'node', 'If you want to add a static page, like a contact page or an about page, use a page.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_permission`
-- 

CREATE TABLE `satellite2_permission` (
  `rid` int(10) unsigned NOT NULL default '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL default '0',
  KEY `rid` (`rid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_permission`
-- 

INSERT INTO `satellite2_permission` VALUES (1, 'access news feeds, access comments, access site-wide contact form, access content, vote on polls, search content, subscribe to newsletters, view links in block, view uploaded files', 0);
INSERT INTO `satellite2_permission` VALUES (2, 'access news feeds, access birthdays, access comments, post comments, post comments without approval, access site-wide contact form, access content, cancel own vote, vote on polls, search content, use advanced search, sign up for content, subscribe to newsletters, view links in block, view uploaded files, access user profiles, access all views', 0);
INSERT INTO `satellite2_permission` VALUES (3, 'access news feeds, create events, edit own events, access birthdays, delete birthday, access comments, administer comments, post comments, post comments without approval, access site-wide contact form, create images, edit images, edit own images, view original images, access imce, administer menu, access content, create news content, create page content, create partner content, edit own news content, edit own partner content, edit page content, edit partner content, view revisions, cancel own vote, create polls, inspect all votes, vote on polls, search content, use advanced search, administer all signups, administer signups for own content, sign up for content, view all signups, administer newsletters, create newsletter, edit own newsletter, send newsletter, subscribe to newsletters, view links in block, access statistics, view post access counter, access tinymce, upload files, view uploaded files, access user profiles, access all views', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_poll`
-- 

CREATE TABLE `satellite2_poll` (
  `nid` int(10) unsigned NOT NULL default '0',
  `runtime` int(11) NOT NULL default '0',
  `active` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) TYPE=MyISAM;

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
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_poll_votes`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_profile_fields`
-- 

CREATE TABLE `satellite2_profile_fields` (
  `fid` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `name` varchar(128) default NULL,
  `explanation` text,
  `category` varchar(255) default NULL,
  `page` varchar(255) default NULL,
  `type` varchar(128) default NULL,
  `weight` tinyint(4) NOT NULL default '0',
  `required` tinyint(4) NOT NULL default '0',
  `register` tinyint(4) NOT NULL default '0',
  `visibility` tinyint(4) NOT NULL default '0',
  `autocomplete` tinyint(4) NOT NULL default '0',
  `options` text,
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`)
) TYPE=MyISAM  AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `satellite2_profile_fields`
-- 

INSERT INTO `satellite2_profile_fields` VALUES (1, 'Birthday', 'profile_birthday', 'Enter your date of birth.', 'Personal information', '', 'date', 0, 1, 1, 2, 0, '');
INSERT INTO `satellite2_profile_fields` VALUES (2, 'Real name', 'profile_realname', 'Your real name.', 'Personal information', '', 'textfield', -5, 1, 1, 2, 0, '');
INSERT INTO `satellite2_profile_fields` VALUES (3, 'Home country', 'profile_homecounty', '', 'Personal information', '', 'selection', -4, 1, 1, 2, 0, 'AFGHANISTAN\r\nALBANIA\r\nALGERIA\r\nAMERICAN SAMOA\r\nANDORRA\r\nANGOLA\r\nANTIGUA AND BARBUDA\r\nARGENTINA\r\nARMENIA\r\nARUBA\r\nAUSTRALIA\r\nAUSTRIA\r\nAZERBAIJAN\r\nBAHAMAS\r\nBAHRAIN\r\nBANGLADESH\r\nBARBADOS\r\nBELARUS\r\nBELGIUM\r\nBELIZE\r\nBENIN\r\nBERMUDA\r\nBHUTAN\r\nBOLIVIA\r\nBOSNIA AND HERZEGOVINA\r\nBOTSWANA\r\nBRAZIL\r\nBRITISH INDIAN OCEAN TERRITORY\r\nBRUNEI DARUSSALAM\r\nBULGARIA\r\nBURKINA FASO\r\nBURUNDI\r\nCAMBODIA\r\nCAMEROON\r\nCANADA\r\nCAPE VERDE\r\nCAYMAN ISLANDS\r\nCENTRAL AFRICAN REPUBLIC\r\nCHAD\r\nCHILE\r\nCHINA\r\nCOLOMBIA\r\nCOMOROS\r\nCONGO\r\nCOOK ISLANDS\r\nCOSTA RICA\r\nCOTE D''IVOIRE\r\nCROATIA\r\nCUBA\r\nCYPRUS\r\nCZECH REPUBLIC\r\nDENMARK\r\nDJIBOUTI\r\nDOMINICA\r\nDOMINICAN REPUBLIC\r\nEAST TIMOR\r\nECUADOR\r\nEGYPT\r\nEL SALVADOR\r\nEQUATORIAL GUINEA\r\nERITREA\r\nESTONIA\r\nETHIOPIA\r\nFALKLAND ISLANDS (MALVINAS)\r\nFAROE ISLANDS\r\nFEDERATED STATES OF MICRONESIA\r\nFIJI\r\nFINLAND\r\nFRANCE\r\nFRENCH POLYNESIA\r\nFRENCH SOUTHERN TERRITORIES\r\nGABON\r\nGAMBIA\r\nGEORGIA\r\nGERMANY\r\nGHANA\r\nGIBRALTAR\r\nGREECE\r\nGREENLAND\r\nGRENADA\r\nGUADELOUPE\r\nGUAM\r\nGUATEMALA\r\nGUINEA\r\nGUINEA-BISSAU\r\nGUYANA\r\nHAITI\r\nHOLY SEE (VATICAN CITY STATE)\r\nHONDURAS\r\nHONG KONG\r\nHUNGARY\r\nICELAND\r\nINDIA\r\nINDONESIA\r\nIRAQ\r\nIRELAND\r\nISLAMIC REPUBLIC OF IRAN\r\nISRAEL\r\nITALY\r\nJAMAICA\r\nJAPAN\r\nJORDAN\r\nKAZAKHSTAN\r\nKENYA\r\nKIRIBATI\r\nKUWAIT\r\nKYRGYZSTAN\r\nLAO PEOPLE''S DEMOCRATIC REPUBL\r\nLATVIA\r\nLEBANON\r\nLESOTHO\r\nLIBERIA\r\nLIBYAN ARAB JAMAHIRIYA\r\nLIECHTENSTEIN\r\nLITHUANIA\r\nLUXEMBOURG\r\nMACAO\r\nMADAGASCAR\r\nMALAWI\r\nMALAYSIA\r\nMALDIVES\r\nMALI\r\nMALTA\r\nMARSHALL ISLANDS\r\nMARTINIQUE\r\nMAURITANIA\r\nMAURITIUS\r\nMEXICO\r\nMONACO\r\nMONGOLIA\r\nMOROCCO\r\nMOZAMBIQUE\r\nMYANMAR\r\nNAMIBIA\r\nNAURU\r\nNEPAL\r\nNETHERLANDS\r\nNETHERLANDS ANTILLES\r\nNEW CALEDONIA\r\nNEW ZEALAND\r\nNICARAGUA\r\nNIGER\r\nNIGERIA\r\nNORTHERN MARIANA ISLANDS\r\nNORWAY\r\nOMAN\r\nPAKISTAN\r\nPALAU\r\nPALESTINIAN TERRITORY, OCCUPIE\r\nPANAMA\r\nPAPUA NEW GUINEA\r\nPARAGUAY\r\nPERU\r\nPHILIPPINES\r\nPOLAND\r\nPORTUGAL\r\nPUERTO RICO\r\nQATAR\r\nREPUBLIC OF KOREA\r\nREPUBLIC OF MOLDOVA\r\nREUNION\r\nROMANIA\r\nRUSSIAN FEDERATION\r\nRWANDA\r\nSAINT KITTS AND NEVIS\r\nSAINT LUCIA\r\nSAINT VINCENT AND THE GRENADIN\r\nSAMOA\r\nSAN MARINO\r\nSAO TOME AND PRINCIPE\r\nSAUDI ARABIA\r\nSENEGAL\r\nSERBIA\r\nSEYCHELLES\r\nSIERRA LEONE\r\nSINGAPORE\r\nSLOVAKIA\r\nSLOVENIA\r\nSOLOMON ISLANDS\r\nSOMALIA\r\nSOUTH AFRICA\r\nSPAIN\r\nSRI LANKA\r\nSUDAN\r\nSURINAME\r\nSWAZILAND\r\nSWEDEN\r\nSWITZERLAND\r\nSYRIAN ARAB REPUBLIC\r\nTAIWAN\r\nTAJIKISTAN\r\nTHAILAND\r\nTHE DEMOCRATIC REPUBLIC OF THE\r\nTHE FORMER YUGOSLAV REPUBLIC O\r\nTOGO\r\nTOKELAU\r\nTONGA\r\nTRINIDAD AND TOBAGO\r\nTUNISIA\r\nTURKEY\r\nTURKMENISTAN\r\nTURKS AND CAICOS ISLANDS\r\nTUVALU\r\nUGANDA\r\nUKRAINE\r\nUNITED ARAB EMIRATES\r\nUNITED KINGDOM\r\nUNITED REPUBLIC OF TANZANIA\r\nUNITED STATES\r\nURUGUAY\r\nUZBEKISTAN\r\nVANUATU\r\nVENEZUELA\r\nVIET NAM\r\nVIRGIN ISLANDS, BRITISH\r\nVIRGIN ISLANDS, U.S.\r\nWESTERN SAHARA\r\nYEMEN\r\nZAMBIA\r\nZIMBABWE');
INSERT INTO `satellite2_profile_fields` VALUES (4, 'Gender', 'profile_gender', '', 'Personal information', '', 'selection', -2, 1, 1, 2, 0, 'Female\r\nMale');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_profile_values`
-- 

CREATE TABLE `satellite2_profile_values` (
  `fid` int(10) unsigned default '0',
  `uid` int(10) unsigned default '0',
  `value` text,
  KEY `uid` (`uid`),
  KEY `fid` (`fid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_profile_values`
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
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `satellite2_role`
-- 

INSERT INTO `satellite2_role` VALUES (1, 'anonymous user');
INSERT INTO `satellite2_role` VALUES (2, 'authenticated user');
INSERT INTO `satellite2_role` VALUES (3, 'editor');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_search_dataset`
-- 

CREATE TABLE `satellite2_search_dataset` (
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) default NULL,
  `data` longtext NOT NULL,
  KEY `sid_type` (`sid`,`type`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_search_dataset`
-- 

INSERT INTO `satellite2_search_dataset` VALUES (20, 'node', ' welcome to esn satellite 2 and esn galaxy try satellite for your section the esn international webteam is supporting interested sections willing to install the esn satellite 2 thereby joining the fast growing esn galaxy esn satellite is the free website template for esn sections developed and maintained by the esn international webteam be a esn astronaut install esn satellite for your section  try satellite for your section the esn international webteam is supporting interested sections willing to install the esn satellite documentation will also be available esn satellite is easy to install but it is still a web application and its setup is thus different from a normal program installation onyour pc so a basic knowledge of how to install web applications is required if you want to try it out join the project get esn satellite and start experimenting  esn satellite resources if you just wish to know more about the esn satellite but don t want to try it right now we have some documentation available we expect it to be extended and improved during the beta testing phase so please check back often satellite documentation wiki esn satellite google group new in esn satellite 20 esn satellite 2 comes with several new features multilingual interface it supports localizing your website pages in as many languages as you wish and anyway every student will be able to see the web site interface in her own language a new control panel for faster access to the most common administration tasks newsletter support direct access to the esn galaxy an improved installation process with broader compatibility  join the esn galaxy curious to see what the esn galaxy is then check it out on your own satellite website  and if you are not yet of this fast growing network of satellites then be quick and activate your satellite now  ');
INSERT INTO `satellite2_search_dataset` VALUES (12, 'node', ' esn galaxy not yet a part of the esn galaxy  then join now   ');

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_search_index`
-- 

INSERT INTO `satellite2_search_index` VALUES ('see', 20, 'node', 0, NULL, 1.92743);
INSERT INTO `satellite2_search_index` VALUES ('able', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('student', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('every', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('anyway', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('languages', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('many', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('pages', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('localizing', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('supports', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('interface', 20, 'node', 0, NULL, 1.99731);
INSERT INTO `satellite2_search_index` VALUES ('multilingual', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('features', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('several', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('with', 20, 'node', 0, NULL, 1.93838);
INSERT INTO `satellite2_search_index` VALUES ('comes', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('20', 20, 'node', 0, NULL, 19);
INSERT INTO `satellite2_search_index` VALUES ('new', 20, 'node', 0, NULL, 20.9849);
INSERT INTO `satellite2_search_index` VALUES ('group', 20, 'node', 0, NULL, 11);
INSERT INTO `satellite2_search_index` VALUES ('google', 20, 'node', 0, NULL, 11);
INSERT INTO `satellite2_search_index` VALUES ('wiki', 20, 'node', 0, NULL, 11);
INSERT INTO `satellite2_search_index` VALUES ('often', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('back', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('check', 20, 'node', 0, NULL, 1.92027);
INSERT INTO `satellite2_search_index` VALUES ('please', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('phase', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('testing', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('beta', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('during', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('improved', 20, 'node', 0, NULL, 1.94209);
INSERT INTO `satellite2_search_index` VALUES ('extended', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('expect', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('some', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('have', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('now', 20, 'node', 0, NULL, 10.82);
INSERT INTO `satellite2_search_index` VALUES ('right', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('don', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('about', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('more', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('know', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('wish', 20, 'node', 0, NULL, 2);
INSERT INTO `satellite2_search_index` VALUES ('just', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('resources', 20, 'node', 0, NULL, 19);
INSERT INTO `satellite2_search_index` VALUES ('experimenting', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('start', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('get', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('project', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('now', 12, 'node', 0, NULL, 11);
INSERT INTO `satellite2_search_index` VALUES ('join', 12, 'node', 0, NULL, 11);
INSERT INTO `satellite2_search_index` VALUES ('then', 12, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('the', 12, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('part', 12, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('join', 20, 'node', 0, NULL, 18.69);
INSERT INTO `satellite2_search_index` VALUES ('yet', 12, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('galaxy', 12, 'node', 0, NULL, 37);
INSERT INTO `satellite2_search_index` VALUES ('out', 20, 'node', 0, NULL, 1.92027);
INSERT INTO `satellite2_search_index` VALUES ('not', 12, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('esn', 12, 'node', 0, NULL, 37);
INSERT INTO `satellite2_search_index` VALUES ('want', 20, 'node', 0, NULL, 2);
INSERT INTO `satellite2_search_index` VALUES ('you', 20, 'node', 0, NULL, 3.92027);
INSERT INTO `satellite2_search_index` VALUES ('required', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('applications', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('how', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('knowledge', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('basic', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('onyour', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('installation', 20, 'node', 0, NULL, 1.94209);
INSERT INTO `satellite2_search_index` VALUES ('program', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('normal', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('from', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('different', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('thus', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('setup', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('its', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('application', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('web', 20, 'node', 0, NULL, 3);
INSERT INTO `satellite2_search_index` VALUES ('still', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('but', 20, 'node', 0, NULL, 2);
INSERT INTO `satellite2_search_index` VALUES ('easy', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('available', 20, 'node', 0, NULL, 2);
INSERT INTO `satellite2_search_index` VALUES ('also', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('will', 20, 'node', 0, NULL, 2);
INSERT INTO `satellite2_search_index` VALUES ('documentation', 20, 'node', 0, NULL, 13);
INSERT INTO `satellite2_search_index` VALUES ('astronaut', 20, 'node', 0, NULL, 19);
INSERT INTO `satellite2_search_index` VALUES ('maintained', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('developed', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('template', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('website', 20, 'node', 0, NULL, 12.123);
INSERT INTO `satellite2_search_index` VALUES ('free', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('growing', 20, 'node', 0, NULL, 1.90629);
INSERT INTO `satellite2_search_index` VALUES ('fast', 20, 'node', 0, NULL, 1.90629);
INSERT INTO `satellite2_search_index` VALUES ('joining', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('thereby', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('install', 20, 'node', 0, NULL, 23);
INSERT INTO `satellite2_search_index` VALUES ('willing', 20, 'node', 0, NULL, 2);
INSERT INTO `satellite2_search_index` VALUES ('sections', 20, 'node', 0, NULL, 3);
INSERT INTO `satellite2_search_index` VALUES ('interested', 20, 'node', 0, NULL, 2);
INSERT INTO `satellite2_search_index` VALUES ('supporting', 20, 'node', 0, NULL, 2);
INSERT INTO `satellite2_search_index` VALUES ('webteam', 20, 'node', 0, NULL, 3);
INSERT INTO `satellite2_search_index` VALUES ('international', 20, 'node', 0, NULL, 3);
INSERT INTO `satellite2_search_index` VALUES ('the', 20, 'node', 0, NULL, 31.5248);
INSERT INTO `satellite2_search_index` VALUES ('section', 20, 'node', 0, NULL, 21);
INSERT INTO `satellite2_search_index` VALUES ('your', 20, 'node', 0, NULL, 41.943);
INSERT INTO `satellite2_search_index` VALUES ('for', 20, 'node', 0, NULL, 22.9769);
INSERT INTO `satellite2_search_index` VALUES ('try', 20, 'node', 0, NULL, 4);
INSERT INTO `satellite2_search_index` VALUES ('galaxy', 20, 'node', 0, NULL, 46.5559);
INSERT INTO `satellite2_search_index` VALUES ('and', 20, 'node', 0, NULL, 32.8163);
INSERT INTO `satellite2_search_index` VALUES ('2', 20, 'node', 0, NULL, 28);
INSERT INTO `satellite2_search_index` VALUES ('satellite', 20, 'node', 0, NULL, 133.943);
INSERT INTO `satellite2_search_index` VALUES ('esn', 20, 'node', 0, NULL, 170.556);
INSERT INTO `satellite2_search_index` VALUES ('welcome', 20, 'node', 0, NULL, 26);
INSERT INTO `satellite2_search_index` VALUES ('site', 20, 'node', 0, NULL, 1);
INSERT INTO `satellite2_search_index` VALUES ('her', 20, 'node', 0, NULL, 0.997306);
INSERT INTO `satellite2_search_index` VALUES ('own', 20, 'node', 0, NULL, 11.1161);
INSERT INTO `satellite2_search_index` VALUES ('language', 20, 'node', 0, NULL, 0.989021);
INSERT INTO `satellite2_search_index` VALUES ('control', 20, 'node', 0, NULL, 0.98493);
INSERT INTO `satellite2_search_index` VALUES ('panel', 20, 'node', 0, NULL, 0.980874);
INSERT INTO `satellite2_search_index` VALUES ('faster', 20, 'node', 0, NULL, 0.976851);
INSERT INTO `satellite2_search_index` VALUES ('access', 20, 'node', 0, NULL, 1.91495);
INSERT INTO `satellite2_search_index` VALUES ('most', 20, 'node', 0, NULL, 0.968904);
INSERT INTO `satellite2_search_index` VALUES ('common', 20, 'node', 0, NULL, 0.96498);
INSERT INTO `satellite2_search_index` VALUES ('administration', 20, 'node', 0, NULL, 0.961087);
INSERT INTO `satellite2_search_index` VALUES ('tasks', 20, 'node', 0, NULL, 0.957226);
INSERT INTO `satellite2_search_index` VALUES ('newsletter', 20, 'node', 0, NULL, 0.953396);
INSERT INTO `satellite2_search_index` VALUES ('support', 20, 'node', 0, NULL, 0.949597);
INSERT INTO `satellite2_search_index` VALUES ('direct', 20, 'node', 0, NULL, 0.945829);
INSERT INTO `satellite2_search_index` VALUES ('process', 20, 'node', 0, NULL, 0.942091);
INSERT INTO `satellite2_search_index` VALUES ('broader', 20, 'node', 0, NULL, 0.938382);
INSERT INTO `satellite2_search_index` VALUES ('compatibility', 20, 'node', 0, NULL, 0.934703);
INSERT INTO `satellite2_search_index` VALUES ('curious', 20, 'node', 0, NULL, 0.931053);
INSERT INTO `satellite2_search_index` VALUES ('what', 20, 'node', 0, NULL, 0.927431);
INSERT INTO `satellite2_search_index` VALUES ('then', 20, 'node', 0, NULL, 1.82329);
INSERT INTO `satellite2_search_index` VALUES ('are', 20, 'node', 0, NULL, 0.920273);
INSERT INTO `satellite2_search_index` VALUES ('not', 20, 'node', 0, NULL, 0.916736);
INSERT INTO `satellite2_search_index` VALUES ('yet', 20, 'node', 0, NULL, 0.913226);
INSERT INTO `satellite2_search_index` VALUES ('this', 20, 'node', 0, NULL, 0.909743);
INSERT INTO `satellite2_search_index` VALUES ('network', 20, 'node', 0, NULL, 0.906287);
INSERT INTO `satellite2_search_index` VALUES ('satellites', 20, 'node', 0, NULL, 0.902857);
INSERT INTO `satellite2_search_index` VALUES ('quick', 20, 'node', 0, NULL, 0.899454);
INSERT INTO `satellite2_search_index` VALUES ('activate', 20, 'node', 0, NULL, 9.85684);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_search_total`
-- 

CREATE TABLE `satellite2_search_total` (
  `word` varchar(50) NOT NULL default '',
  `count` float default NULL,
  PRIMARY KEY  (`word`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_search_total`
-- 

INSERT INTO `satellite2_search_total` VALUES ('astronaut', 0.0222764);
INSERT INTO `satellite2_search_total` VALUES ('satellite', 0.00323034);
INSERT INTO `satellite2_search_total` VALUES ('the', 0.0131515);
INSERT INTO `satellite2_search_total` VALUES ('satellites', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('network', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('install', 0.0184834);
INSERT INTO `satellite2_search_total` VALUES ('normal', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('different', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('sections', 0.124939);
INSERT INTO `satellite2_search_total` VALUES ('application', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('and', 0.0130365);
INSERT INTO `satellite2_search_total` VALUES ('program', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('from', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('still', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('website', 0.034423);
INSERT INTO `satellite2_search_total` VALUES ('your', 0.0102329);
INSERT INTO `satellite2_search_total` VALUES ('webteam', 0.124939);
INSERT INTO `satellite2_search_total` VALUES ('interested', 0.176091);
INSERT INTO `satellite2_search_total` VALUES ('welcome', 0.0163904);
INSERT INTO `satellite2_search_total` VALUES ('not', 0.182335);
INSERT INTO `satellite2_search_total` VALUES ('basic', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('its', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('also', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('project', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('template', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('multilingual', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('available', 0.176091);
INSERT INTO `satellite2_search_total` VALUES ('thus', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('esn', 0.0020874);
INSERT INTO `satellite2_search_total` VALUES ('knowledge', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('willing', 0.176091);
INSERT INTO `satellite2_search_total` VALUES ('thereby', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('developed', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('try', 0.09691);
INSERT INTO `satellite2_search_total` VALUES ('maintained', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('several', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('fast', 0.18315);
INSERT INTO `satellite2_search_total` VALUES ('start', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('supports', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('quick', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('activate', 0.0419657);
INSERT INTO `satellite2_search_total` VALUES ('will', 0.176091);
INSERT INTO `satellite2_search_total` VALUES ('curious', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('onyour', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('section', 0.0202034);
INSERT INTO `satellite2_search_total` VALUES ('see', 0.181508);
INSERT INTO `satellite2_search_total` VALUES ('what', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('for', 0.0185016);
INSERT INTO `satellite2_search_total` VALUES ('supporting', 0.176091);
INSERT INTO `satellite2_search_total` VALUES ('new', 0.0202176);
INSERT INTO `satellite2_search_total` VALUES ('international', 0.124939);
INSERT INTO `satellite2_search_total` VALUES ('own', 0.0374102);
INSERT INTO `satellite2_search_total` VALUES ('growing', 0.18315);
INSERT INTO `satellite2_search_total` VALUES ('comes', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('this', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('are', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('with', 0.180669);
INSERT INTO `satellite2_search_total` VALUES ('joining', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('interface', 0.176286);
INSERT INTO `satellite2_search_total` VALUES ('easy', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('features', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('web', 0.124939);
INSERT INTO `satellite2_search_total` VALUES ('documentation', 0.0321847);
INSERT INTO `satellite2_search_total` VALUES ('free', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('setup', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('20', 0.0222764);
INSERT INTO `satellite2_search_total` VALUES ('installation', 0.180387);
INSERT INTO `satellite2_search_total` VALUES ('galaxy', 0.00516679);
INSERT INTO `satellite2_search_total` VALUES ('how', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('yet', 0.182608);
INSERT INTO `satellite2_search_total` VALUES ('part', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('then', 0.131682);
INSERT INTO `satellite2_search_total` VALUES ('join', 0.0143867);
INSERT INTO `satellite2_search_total` VALUES ('now', 0.0194609);
INSERT INTO `satellite2_search_total` VALUES ('but', 0.176091);
INSERT INTO `satellite2_search_total` VALUES ('applications', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('required', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('you', 0.0986729);
INSERT INTO `satellite2_search_total` VALUES ('want', 0.176091);
INSERT INTO `satellite2_search_total` VALUES ('out', 0.18206);
INSERT INTO `satellite2_search_total` VALUES ('get', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('experimenting', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('able', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('please', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('resources', 0.0222764);
INSERT INTO `satellite2_search_total` VALUES ('just', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('wish', 0.176091);
INSERT INTO `satellite2_search_total` VALUES ('know', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('more', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('about', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('don', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('right', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('have', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('some', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('expect', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('extended', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('improved', 0.180387);
INSERT INTO `satellite2_search_total` VALUES ('during', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('beta', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('testing', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('phase', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('check', 0.18206);
INSERT INTO `satellite2_search_total` VALUES ('back', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('often', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('wiki', 0.0377886);
INSERT INTO `satellite2_search_total` VALUES ('google', 0.0377886);
INSERT INTO `satellite2_search_total` VALUES ('group', 0.0377886);
INSERT INTO `satellite2_search_total` VALUES ('localizing', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('pages', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('many', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('languages', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('anyway', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('every', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('student', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('site', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('her', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('language', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('control', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('panel', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('faster', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('access', 0.182474);
INSERT INTO `satellite2_search_total` VALUES ('most', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('common', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('administration', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('tasks', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('newsletter', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('support', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('direct', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('process', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('broader', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('compatibility', 0.30103);
INSERT INTO `satellite2_search_total` VALUES ('2', 0.01524);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_sequences`
-- 

CREATE TABLE `satellite2_sequences` (
  `name` varchar(255) NOT NULL default '',
  `id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`name`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_sequences`
-- 

INSERT INTO `satellite2_sequences` VALUES ('satellite2_users_uid', 3);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_menu_mid', 104);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_view_view_vid', 3);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_node_nid', 23);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_node_revisions_vid', 23);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_files_fid', 32);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_imagecache_preset_presetid', 3);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_imagecache_action_actionid', 3);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_aggregator_feed_fid', 1);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_aggregator_item_iid', 888);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_vocabulary_vid', 1);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_term_data_tid', 1);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_i18n_node_trid', 1);
INSERT INTO `satellite2_sequences` VALUES ('satellite2_comments_cid', 1);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_sessions`
-- 

INSERT INTO `satellite2_sessions` VALUES (1, '7aa5eaff61a597eb43e2d5e7f5c9c3fa', '::1', 1223806310, 0, 'form|a:8:{s:32:"1e8ad1bf40eebfdc89173e9993226c1e";a:2:{s:9:"timestamp";i:1223805280;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"db3071db52686fdfbf4ea24fc6929355";a:2:{s:9:"timestamp";i:1223805293;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"93890ef94b530464943a4cfbbf386d19";a:2:{s:9:"timestamp";i:1223806065;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"fdeb401af9a60db33bdec882e3487875";a:2:{s:9:"timestamp";i:1223806068;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"81e22563fb9aab0e4a7aa0aeffcf1205";a:2:{s:9:"timestamp";i:1223806073;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"f713aa6b2b730286372cea69f9975491";a:2:{s:9:"timestamp";i:1223806237;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"df18a8cfca6c485897a5891b5fa2bf8c";a:2:{s:9:"timestamp";i:1223806244;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"277078f56513326b11cfa9f9569a2633";a:2:{s:9:"timestamp";i:1223806286;s:4:"args";a:1:{i:0;s:14:"system_modules";}}}user_overview_filter|a:0:{}');
INSERT INTO `satellite2_sessions` VALUES (1, '43877b393c3145d8f6edbfa09d46442a', '::1', 1223805158, 0, 'form|a:2:{s:32:"d1f27e66047fe830930b9058065ec024";a:2:{s:9:"timestamp";i:1223804604;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"64614db38d6b44dcf1e9b285363c3540";a:2:{s:9:"timestamp";i:1223804625;s:4:"args";a:1:{i:0;s:14:"system_modules";}}}update_remaining|a:0:{}update_total|i:8;content_update_1009|a:1:{s:6:"tables";a:0:{}}content_update_1009_tables|a:0:{}content_update_1009_count|i:7;');

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_signup`
-- 

INSERT INTO `satellite2_signup` VALUES (0, '', 1, 'Enter your default confirmation email message here', 1, 0, 'Enter your default reminder email message here', 0, 0, 0);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_signup_log`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_simplenews_newsletters`
-- 

CREATE TABLE `satellite2_simplenews_newsletters` (
  `nid` int(10) NOT NULL default '0',
  `tid` int(10) NOT NULL default '0',
  `s_status` int(2) NOT NULL default '0',
  `s_format` varchar(8) NOT NULL default '',
  `priority` int(2) NOT NULL default '0',
  `receipt` int(2) NOT NULL default '0',
  `vid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_simplenews_newsletters`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_simplenews_snid_tid`
-- 

CREATE TABLE `satellite2_simplenews_snid_tid` (
  `snid` int(10) NOT NULL default '0',
  `tid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`snid`,`tid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_simplenews_snid_tid`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_simplenews_subscriptions`
-- 

CREATE TABLE `satellite2_simplenews_subscriptions` (
  `snid` int(10) NOT NULL auto_increment,
  `a_status` int(2) NOT NULL default '0',
  `s_status` int(2) NOT NULL default '0',
  `mail` varchar(64) NOT NULL default '',
  `uid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`snid`),
  KEY `satellite2_simplenews_subscriptions_mail_idx` (`mail`)
) TYPE=MyISAM  AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_simplenews_subscriptions`
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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_system`
-- 

INSERT INTO `satellite2_system` VALUES ('themes/engines/phptemplate/phptemplate.engine', 'phptemplate', 'theme_engine', '', 1, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/imagecache/imagecache.module', 'imagecache', 'module', 'Dynamic image manipulator and cache.', 1, 0, 0, 3, 0);
INSERT INTO `satellite2_system` VALUES ('modules/system/system.module', 'system', 'module', 'Handles general site configuration for administrators.', 1, 0, 0, 1022, 0);
INSERT INTO `satellite2_system` VALUES ('modules/aggregator/aggregator.module', 'aggregator', 'module', 'Aggregates syndicated content (RSS, RDF, and Atom feeds).', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/event/contrib/basicevent.module', 'basicevent', 'module', 'A story-like node that implements the event API automatically.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/block/block.module', 'block', 'module', 'Controls the boxes that are displayed around the main content.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/blog/blog.module', 'blog', 'module', 'Enables keeping easily and regularly updated user web pages or blogs.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/blogapi/blogapi.module', 'blogapi', 'module', 'Allows users to post content using applications that support XML-RPC blog APIs.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/book/book.module', 'book', 'module', 'Allows users to collaboratively author a book.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/color/color.module', 'color', 'module', 'Allows the user to change the color scheme of certain themes.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/comment/comment.module', 'comment', 'module', 'Allows users to comment on and discuss published content.', 1, 0, 0, 1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/contact/contact.module', 'contact', 'module', 'Enables the use of both personal and site-wide contact forms.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/cck/content.module', 'content', 'module', 'Allows administrators to define new content types.', 1, 0, 1, 1010, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/cck/content_copy.module', 'content_copy', 'module', 'Enables ability to import/export field definitions.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/drupal/drupal.module', 'drupal', 'module', 'Lets you register your site with a central server and improve ranking of Drupal projects by posting information on your installed modules and themes', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/event/event.module', 'event', 'module', 'Calendaring API, calendar display and export', 1, 0, 0, 2, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/event/contrib/event_all_day/event_all_day.module', 'event_all_day', 'module', 'Allows creation of all-day events.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/event/contrib/event_views/event_views.module', 'event_views', 'module', 'Views-enables the event fields and creates default event views.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/cck/fieldgroup.module', 'fieldgroup', 'module', 'Create field groups for CCK fields.', 1, 0, 0, 4, 9);
INSERT INTO `satellite2_system` VALUES ('modules/filter/filter.module', 'filter', 'module', 'Handles the filtering of content in preparation for display.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/forum/forum.module', 'forum', 'module', 'Enables threaded discussions about general topics.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/help/help.module', 'help', 'module', 'Manages the display of online help.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/iconify/iconify.module', 'iconify', 'module', 'this module adds icons/graphix in the admin baby :]', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/image/image.module', 'image', 'module', 'Allows uploading, resizing and viewing of images.', 1, 0, 0, 5, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/image/contrib/image_attach/image_attach.module', 'image_attach', 'module', 'Allows easy attaching of image nodes to other content types.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/image/contrib/image_gallery/image_gallery.module', 'image_gallery', 'module', 'Allows sorting and displaying of image galleries based on categories.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/image/contrib/image_import/image_import.module', 'image_import', 'module', 'Allows batches of images to be imported from a directory on the server.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/imagefield/imagefield.module', 'imagefield', 'module', 'Defines an image field type.', 1, 0, 0, 2, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/imce/imce.module', 'imce', 'module', 'An image/file uploader and browser supporting personal directories and user quota.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/img_assist/img_assist.module', 'img_assist', 'module', 'This module allows users to upload and insert inline images into posts. It automatically generates an Add image link under the textarea fields of your choice.', 0, 0, 0, 1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/legacy/legacy.module', 'legacy', 'module', 'Provides legacy handlers for upgrades from older Drupal installations.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/link/link.module', 'link', 'module', 'Defines simple link field types.', 1, 0, 0, 1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/locale/locale.module', 'locale', 'module', 'Enables the translation of the user interface to languages other than English.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/menu/menu.module', 'menu', 'module', 'Allows administrators to customize the site navigation menu.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/menutree/menutree.module', 'menutree', 'module', 'Display a site-map page based on one or more menus', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/node/node.module', 'node', 'module', 'Allows content to be submitted to the site and displayed on pages.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/cck/nodereference.module', 'nodereference', 'module', 'Defines a field type for referencing one node from another.', 1, 0, 0, 3, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/cck/number.module', 'number', 'module', 'Defines numeric field types.', 1, 0, 0, 5, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/cck/optionwidgets.module', 'optionwidgets', 'module', 'Defines selection, check box and radio button widgets for text and numeric fields.', 1, 0, 0, 1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/path/path.module', 'path', 'module', 'Allows users to rename URLs.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/pathauto/pathauto.module', 'pathauto', 'module', 'Provides a mechanism for modules to automatically generate aliases for the content they manage.', 1, 0, 0, 7, 1);
INSERT INTO `satellite2_system` VALUES ('modules/ping/ping.module', 'ping', 'module', 'Alerts other sites when your site has been updated.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/poll/poll.module', 'poll', 'module', 'Allows your site to capture votes on different topics in the form of multiple choice questions.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/profile/profile.module', 'profile', 'module', 'Supports configurable user profiles.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/search/search.module', 'search', 'module', 'Enables site-wide keyword searching.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/signup/signup.module', 'signup', 'module', 'Allow users to sign up for content (especially events).', 1, 0, 0, 4, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/simplemenu/simplemenu.module', 'simplemenu', 'module', 'Creates a menu bar that is displayed at the top of every page.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/statistics/statistics.module', 'statistics', 'module', 'Logs access statistics for your site.', 1, 0, 1, 1000, 0);
INSERT INTO `satellite2_system` VALUES ('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', 'Enables the categorization of content.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/cck/text.module', 'text', 'module', 'Defines simple text field types.', 1, 0, 0, 5, 0);
INSERT INTO `satellite2_system` VALUES ('modules/throttle/throttle.module', 'throttle', 'module', 'Handles the auto-throttling mechanism, to control site congestion.', 0, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/tinymce/tinymce.module', 'tinymce', 'module', 'The most popular WYSIWYG editor for advanced content editing.', 1, 0, 0, 1, 0);
INSERT INTO `satellite2_system` VALUES ('modules/tracker/tracker.module', 'tracker', 'module', 'Enables tracking of recent posts for users.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/upload/upload.module', 'upload', 'module', 'Allows users to upload and attach files to content.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/user/user.module', 'user', 'module', 'Manages the user registration and login system.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/cck/userreference.module', 'userreference', 'module', 'Defines a field type for referencing a user from a node.', 1, 0, 0, 4, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/views/views.module', 'views', 'module', 'The views module creates customized views of node lists.', 1, 0, 0, 16, 10);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/views/views_rss.module', 'views_rss', 'module', 'RSS plugin for the views feed selector argument.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/views/views_theme_wizard.module', 'views_theme_wizard', 'module', 'The views theme wizard helps create stub theming for views.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/views/views_ui.module', 'views_ui', 'module', 'The Views UI module allows you to create and edit views.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/watchdog/watchdog.module', 'watchdog', 'module', 'Logs and records system events.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/update_status/update_status.module', 'update_status', 'module', 'Checks to see if your installation of Drupal and its modules are up to date.', 1, 0, 0, 5202, 0);
INSERT INTO `satellite2_system` VALUES ('themes/garland/minnelli/style.css', 'minnelli', 'theme', 'themes/garland/page.tpl.php', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('themes/chameleon/marvin/style.css', 'marvin', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/themes/custom/esntheme/page.tpl.php', 'esntheme', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('themes/pushbutton/page.tpl.php', 'pushbutton', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('themes/garland/page.tpl.php', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('themes/bluemarine/page.tpl.php', 'bluemarine', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('themes/chameleon/chameleon.theme', 'chameleon', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/poormanscron/poormanscron.module', 'poormanscron', 'module', 'Internal scheduler for users without a cron application.', 1, 0, 1, 0, 0);
INSERT INTO `satellite2_system` VALUES ('modules/profile_wizard/profile_wizard.module', 'profile_wizard', 'module', 'This module will dump a Drupal profile straight from the database. It needs editing, but will constitute a good start.', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/install_profile_api/install_profile_wizard/install_profile_wizard.module', 'install_profile_wizard', 'module', 'This module will dump a Drupal installation profile straight from the database in a textarea. It needs editing, but will constitute a good start.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/birthdays/birthdays.module', 'birthdays', 'module', 'Displays and reminds of upcoming users birthdays.', 1, 0, 0, 5003, -1);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/simplenews/simplenews.module', 'simplenews', 'module', 'Send newsletters to subscribed e-mail addresses.', 1, 0, 0, 5001, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/i18n.module', 'i18n', 'module', 'Enables multilingual content.', 0, 0, 0, 8, -10);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/i18nblocks/i18nblocks.module', 'i18nblocks', 'module', 'Enables multilingual blocks.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/experimental/i18ncontent.module', 'i18ncontent', 'module', 'Translates content type parameters.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/contrib/i18nmenu.module', 'i18nmenu', 'module', 'Supports translatable custom menu items.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/i18nprofile/i18nprofile.module', 'i18nprofile', 'module', 'Enables multilingual profile fields.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/experimental/i18nstrings.module', 'i18nstrings', 'module', 'Translatable strings.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/experimental/i18nsync.module', 'i18nsync', 'module', 'Synchronizes translations', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/contrib/i18ntaxonomy.module', 'i18ntaxonomy', 'module', 'Translates taxonomy terms using localization system.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/i18nviews/i18nviews.module', 'i18nviews', 'module', 'Views support for i18n', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/translation/translation.module', 'translation', 'module', 'Manages translations between nodes and taxonomy terms.', 0, 0, 0, 0, 10);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/i18n/experimental/ttext.module', 'ttext', 'module', 'CCK translatable text field', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('profiles/esnsatellite/modules/shoutbox/shoutbox.module', 'shoutbox', 'module', 'This module enables you to display a shoutbox block.', 0, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/custom/custom.module', 'custom', 'module', 'Customizations for this ESN Satellite', 1, 0, 0, 0, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/token/token.module', 'token', 'module', 'Provides a shared API for replacement of textual placeholders with actual data.', 1, 0, 0, 1, 10);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/google_analytics/googleanalytics.module', 'googleanalytics', 'module', 'Adds Google Analytics javascript tracking code to all your site''s pages.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/image/contrib/image_im_advanced/image_im_advanced.module', 'image_im_advanced', 'module', 'Adds advanced options to the ImageMagick image toolkit.', 0, 0, 0, -1, 0);
INSERT INTO `satellite2_system` VALUES ('sites/all/modules/admin_menu/admin_menu.module', 'admin_menu', 'module', 'Renders a menu tree for administrative purposes as dropdown menu at the top of the window.', 0, 0, 0, 5202, 0);

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
  `language` varchar(12) NOT NULL default '',
  `trid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `vid` (`vid`)
) TYPE=MyISAM  AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_term_data`
-- 

INSERT INTO `satellite2_term_data` VALUES (1, 1, 'ESN Satellite newsletter', '', 0, '', 0);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_term_hierarchy`
-- 

INSERT INTO `satellite2_term_hierarchy` VALUES (1, 0);

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_tinymce_role`
-- 

INSERT INTO `satellite2_tinymce_role` VALUES ('Satellite Default', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_tinymce_settings`
-- 

CREATE TABLE `satellite2_tinymce_settings` (
  `name` varchar(128) NOT NULL default '',
  `settings` text,
  PRIMARY KEY  (`name`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_tinymce_settings`
-- 

INSERT INTO `satellite2_tinymce_settings` VALUES ('Satellite Default', 'a:28:{s:8:"old_name";s:17:"Satellite Default";s:4:"name";s:17:"Satellite Default";s:4:"rids";a:1:{i:3;s:1:"3";}s:7:"default";s:4:"true";s:11:"user_choose";s:4:"true";s:11:"show_toggle";s:4:"true";s:5:"theme";s:8:"advanced";s:8:"language";s:2:"en";s:14:"safari_message";s:5:"false";s:6:"access";s:1:"1";s:12:"access_pages";s:25:"node/*\r\nuser/*\r\ncomment/*";s:7:"buttons";a:15:{s:12:"default-bold";s:1:"1";s:14:"default-italic";s:1:"1";s:17:"default-underline";s:1:"1";s:19:"default-justifyleft";s:1:"1";s:21:"default-justifycenter";s:1:"1";s:20:"default-justifyright";s:1:"1";s:19:"default-justifyfull";s:1:"1";s:15:"default-bullist";s:1:"1";s:15:"default-numlist";s:1:"1";s:12:"default-link";s:1:"1";s:14:"default-unlink";s:1:"1";s:13:"default-image";s:1:"1";s:12:"default-code";s:1:"1";s:17:"emotions-emotions";s:1:"1";s:21:"fullscreen-fullscreen";s:1:"1";}s:11:"toolbar_loc";s:3:"top";s:13:"toolbar_align";s:6:"center";s:8:"path_loc";s:6:"bottom";s:8:"resizing";s:4:"true";s:13:"block_formats";s:31:"p,address,pre,h1,h2,h3,h4,h5,h6";s:11:"verify_html";s:4:"true";s:12:"preformatted";s:5:"false";s:22:"convert_fonts_to_spans";s:4:"true";s:17:"remove_linebreaks";s:4:"true";s:23:"apply_source_formatting";s:4:"true";s:11:"css_setting";s:4:"self";s:8:"css_path";s:46:"sites/all/themes/custom/esntheme/satellite.css";s:11:"css_classes";s:0:"";s:2:"op";s:14:"Update profile";s:10:"form_token";s:32:"474fd974388858bbd6a3be974d44a41e";s:7:"form_id";s:26:"tinymce_profile_form_build";}');

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
) TYPE=MyISAM  AUTO_INCREMENT=106 ;

-- 
-- Dumping data for table `satellite2_url_alias`
-- 

INSERT INTO `satellite2_url_alias` VALUES (105, 'node/20', 'welcome-esn-satellite-2-and-esn-galaxy');
INSERT INTO `satellite2_url_alias` VALUES (2, 'node/1/feed', 'test-item/feed');
INSERT INTO `satellite2_url_alias` VALUES (95, 'node/23/', 'esn/feed');
INSERT INTO `satellite2_url_alias` VALUES (4, 'node/2/feed', 'editor-news-item/feed');
INSERT INTO `satellite2_url_alias` VALUES (6, 'node/3/feed', 'cnd-winterthur/feed');
INSERT INTO `satellite2_url_alias` VALUES (74, 'node/20/', 'welcome-esn-satellite-2.0/feed');
INSERT INTO `satellite2_url_alias` VALUES (8, 'node/6/feed', 'skyeurope/feed');
INSERT INTO `satellite2_url_alias` VALUES (100, 'node/20/', 'welcome-esn-satellite-2-0-and-esn-galaxy/feed');
INSERT INTO `satellite2_url_alias` VALUES (10, 'node/5/feed', 'another-news-test/feed');
INSERT INTO `satellite2_url_alias` VALUES (12, 'node/7/feed', 'bodrum-turkiye/feed');
INSERT INTO `satellite2_url_alias` VALUES (14, 'node/8/feed', 'test-event/feed');
INSERT INTO `satellite2_url_alias` VALUES (16, 'node/9/feed', 'esn-international/feed');
INSERT INTO `satellite2_url_alias` VALUES (31, 'node/12', 'esn-galaxy');
INSERT INTO `satellite2_url_alias` VALUES (32, 'node/12/feed', 'esn-galaxy/feed');
INSERT INTO `satellite2_url_alias` VALUES (33, 'node/13', 'final-test-event');
INSERT INTO `satellite2_url_alias` VALUES (37, 'node/13/feed', 'final-test-event/feed');
INSERT INTO `satellite2_url_alias` VALUES (35, 'user/1', 'user/admin');
INSERT INTO `satellite2_url_alias` VALUES (36, 'user/1/track', 'user/admin/track');
INSERT INTO `satellite2_url_alias` VALUES (40, 'node/14/feed', 'etst-event/feed');
INSERT INTO `satellite2_url_alias` VALUES (41, 'node/15', 'test-image');
INSERT INTO `satellite2_url_alias` VALUES (42, 'node/15/feed', 'test-image/feed');
INSERT INTO `satellite2_url_alias` VALUES (43, 'node/16', 'news-event-item');
INSERT INTO `satellite2_url_alias` VALUES (44, 'node/16/feed', 'news-event-item/feed');
INSERT INTO `satellite2_url_alias` VALUES (45, 'node/17', 'etst-news');
INSERT INTO `satellite2_url_alias` VALUES (46, 'node/17/feed', 'etst-news/feed');
INSERT INTO `satellite2_url_alias` VALUES (77, 'node/20/', 'welcome-esn-galaxy/feed');
INSERT INTO `satellite2_url_alias` VALUES (51, 'node/18/feed', 'test-partner/feed');
INSERT INTO `satellite2_url_alias` VALUES (53, 'node/19/feed', 'example-poll/feed');
INSERT INTO `satellite2_url_alias` VALUES (103, 'node/20/1', 'welcome-esn-satellite-2-and-esn-galaxy/feed');
INSERT INTO `satellite2_url_alias` VALUES (104, 'taxonomy/term/1', 'newsletter/esnsatellite20newsletter');

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_users`
-- 

INSERT INTO `satellite2_users` VALUES (0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, NULL, '', '', '', NULL);
INSERT INTO `satellite2_users` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', 0, 0, 0, '', '', 1187592689, 1223806310, 1223805265, 1, NULL, 'en', '', '', 'a:3:{s:7:"contact";i:0;s:14:"picture_delete";s:0:"";s:14:"picture_upload";s:0:"";}');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_users_roles`
-- 

CREATE TABLE `satellite2_users_roles` (
  `uid` int(10) unsigned NOT NULL default '0',
  `rid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`,`rid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_users_roles`
-- 

INSERT INTO `satellite2_users_roles` VALUES (1, 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_variable`
-- 

CREATE TABLE `satellite2_variable` (
  `name` varchar(128) NOT NULL default '',
  `value` longtext NOT NULL,
  PRIMARY KEY  (`name`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_variable`
-- 

INSERT INTO `satellite2_variable` VALUES ('theme_default', 's:8:"esntheme";');
INSERT INTO `satellite2_variable` VALUES ('filter_html_1', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('node_options_forum', 'a:1:{i:0;s:6:"status";}');
INSERT INTO `satellite2_variable` VALUES ('menu_primary_menu', 'i:2;');
INSERT INTO `satellite2_variable` VALUES ('menu_secondary_menu', 'i:2;');
INSERT INTO `satellite2_variable` VALUES ('event_nodeapi_event', 's:3:"all";');
INSERT INTO `satellite2_variable` VALUES ('install_profile', 's:12:"esnsatellite";');
INSERT INTO `satellite2_variable` VALUES ('admin_theme', 's:7:"garland";');
INSERT INTO `satellite2_variable` VALUES ('drupal_private_key', 's:64:"8ba0739ddbc39e5a906d0b7741cd77aae87af62ae0cd853e3949c6e88e3f8b3f";');
INSERT INTO `satellite2_variable` VALUES ('content_schema_version', 'i:1003;');
INSERT INTO `satellite2_variable` VALUES ('node_cron_comments_scale', 'd:1;');
INSERT INTO `satellite2_variable` VALUES ('node_cron_views_scale', 'd:1;');
INSERT INTO `satellite2_variable` VALUES ('statistics_day_timestamp', 'i:1223804136;');
INSERT INTO `satellite2_variable` VALUES ('file_directory_temp', 's:4:"/tmp";');
INSERT INTO `satellite2_variable` VALUES ('cron_last', 'i:1223804148;');
INSERT INTO `satellite2_variable` VALUES ('node_options_news', 'a:2:{i:0;s:6:"status";i:1;s:7:"promote";}');
INSERT INTO `satellite2_variable` VALUES ('comment_news', 's:1:"2";');
INSERT INTO `satellite2_variable` VALUES ('upload_news', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('event_nodeapi_news', 's:5:"never";');
INSERT INTO `satellite2_variable` VALUES ('signup_form_news', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('node_options_partner', 'a:1:{i:0;s:6:"status";}');
INSERT INTO `satellite2_variable` VALUES ('comment_partner', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('upload_partner', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('event_nodeapi_partner', 's:5:"never";');
INSERT INTO `satellite2_variable` VALUES ('signup_form_partner', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_menu', 's:1:"6";');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_devel', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_element', 's:4:"body";');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_element_method', 's:7:"prepend";');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_exclusions', 'a:9:{i:1;i:1;i:0;i:1;s:8:"minnelli";i:0;s:6:"marvin";i:0;s:8:"esntheme";i:0;s:10:"pushbutton";i:0;s:7:"garland";i:0;s:10:"bluemarine";i:0;s:9:"chameleon";i:0;}');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_rtl', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('site_mail', 's:39:"change-this-email-address@satellite.org";');
INSERT INTO `satellite2_variable` VALUES ('site_slogan', 's:16:"Join the Galaxy!";');
INSERT INTO `satellite2_variable` VALUES ('site_mission', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('site_footer', 's:359:"Powered by <b>ESN Satellite 2</b> - 2005-2008\r\n<a href="http://satellite.esn.org" target="_blank">\r\n<img src="sites/all/themes/custom/esntheme/img/ESN.satellite.power.png" style="display: inline;"/></a>&nbsp;\r\n<a href="http://galaxy.esn.org" target="_blank">\r\n<img src="sites/all/themes/custom/esntheme/img/ESN.galaxy.power.png" style="display: inline;"/></a>";');
INSERT INTO `satellite2_variable` VALUES ('anonymous', 's:9:"Anonymous";');
INSERT INTO `satellite2_variable` VALUES ('site_frontpage', 's:4:"home";');
INSERT INTO `satellite2_variable` VALUES ('theme_esntheme_settings', 'a:16:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:0;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:0;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:0;s:12:"favicon_path";s:49:"/sites/all/themes/custom/esntheme/img/favicon.ico";s:14:"favicon_upload";s:0:"";s:2:"op";s:18:"Save configuration";s:10:"form_token";s:32:"064276ddcf117c44d58df8113922aea4";}');
INSERT INTO `satellite2_variable` VALUES ('event_range_prev', 'N;');
INSERT INTO `satellite2_variable` VALUES ('theme_garland_settings', 'a:20:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:0;s:12:"favicon_path";s:49:"/sites/all/themes/custom/esntheme/img/favicon.ico";s:14:"favicon_upload";s:0:"";s:2:"op";s:18:"Save configuration";s:10:"form_token";s:32:"c49199902b0f004742d731a766636eb5";s:6:"scheme";s:39:"#0072b9,#027ac6,#2385c2,#5ab5ee,#494949";s:7:"palette";a:5:{s:4:"base";s:7:"#0072b9";s:4:"link";s:7:"#027ac6";s:3:"top";s:7:"#2385c2";s:6:"bottom";s:7:"#5ab5ee";s:4:"text";s:7:"#494949";}s:5:"theme";s:7:"garland";s:4:"info";a:9:{s:7:"schemes";a:16:{s:39:"#0072b9,#027ac6,#2385c2,#5ab5ee,#494949";s:21:"Blue Lagoon (Default)";s:39:"#464849,#2f416f,#2a2b2d,#5d6779,#494949";s:3:"Ash";s:39:"#55c0e2,#000000,#085360,#007e94,#696969";s:10:"Aquamarine";s:39:"#d5b048,#6c420e,#331900,#971702,#494949";s:17:"Belgian Chocolate";s:39:"#3f3f3f,#336699,#6598cb,#6598cb,#000000";s:10:"Bluemarine";s:39:"#d0cb9a,#917803,#efde01,#e6fb2d,#494949";s:12:"Citrus Blast";s:39:"#0f005c,#434f8c,#4d91ff,#1a1575,#000000";s:8:"Cold Day";s:39:"#c9c497,#0c7a00,#03961e,#7be000,#494949";s:9:"Greenbeam";s:39:"#ffe23d,#a9290a,#fc6d1d,#a30f42,#494949";s:11:"Mediterrano";s:39:"#788597,#3f728d,#a9adbc,#d4d4d4,#707070";s:7:"Mercury";s:39:"#5b5fa9,#5b5faa,#0a2352,#9fa8d5,#494949";s:9:"Nocturnal";s:39:"#7db323,#6a9915,#b5d52a,#7db323,#191a19";s:6:"Olivia";s:39:"#12020b,#1b1a13,#f391c6,#f41063,#898080";s:12:"Pink Plastic";s:39:"#b7a0ba,#c70000,#a1443a,#f21107,#515d52";s:12:"Shiny Tomato";s:39:"#18583d,#1b5f42,#34775a,#52bf90,#2d2d2d";s:8:"Teal Top";s:0:"";s:6:"Custom";}s:4:"copy";a:3:{i:0;s:25:"images/menu-collapsed.gif";i:1;s:24:"images/menu-expanded.gif";i:2;s:20:"images/menu-leaf.gif";}s:8:"gradient";a:4:{i:0;i:0;i:1;i:37;i:2;i:760;i:3;i:121;}s:4:"fill";a:2:{s:4:"base";a:4:{i:0;i:0;i:1;i:0;i:2;i:760;i:3;i:568;}s:4:"link";a:4:{i:0;i:107;i:1;i:533;i:2;i:41;i:3;i:23;}}s:6:"slices";a:13:{s:15:"images/body.png";a:4:{i:0;i:0;i:1;i:37;i:2;i:1;i:3;i:280;}s:17:"images/bg-bar.png";a:4:{i:0;i:202;i:1;i:530;i:2;i:76;i:3;i:14;}s:23:"images/bg-bar-white.png";a:4:{i:0;i:202;i:1;i:506;i:2;i:76;i:3;i:14;}s:17:"images/bg-tab.png";a:4:{i:0;i:107;i:1;i:533;i:2;i:41;i:3;i:23;}s:24:"images/bg-navigation.png";a:4:{i:0;i:0;i:1;i:0;i:2;i:7;i:3;i:37;}s:26:"images/bg-content-left.png";a:4:{i:0;i:40;i:1;i:117;i:2;i:50;i:3;i:352;}s:27:"images/bg-content-right.png";a:4:{i:0;i:510;i:1;i:117;i:2;i:50;i:3;i:352;}s:21:"images/bg-content.png";a:4:{i:0;i:299;i:1;i:117;i:2;i:7;i:3;i:200;}s:29:"images/bg-navigation-item.png";a:4:{i:0;i:32;i:1;i:37;i:2;i:17;i:3;i:12;}s:35:"images/bg-navigation-item-hover.png";a:4:{i:0;i:54;i:1;i:37;i:2;i:17;i:3;i:12;}s:25:"images/gradient-inner.png";a:4:{i:0;i:646;i:1;i:307;i:2;i:112;i:3;i:42;}s:8:"logo.png";a:4:{i:0;i:622;i:1;i:51;i:2;i:64;i:3;i:73;}s:14:"screenshot.png";a:4:{i:0;i:0;i:1;i:37;i:2;i:400;i:3;i:240;}}s:12:"blend_target";s:7:"#ffffff";s:13:"preview_image";s:17:"color/preview.png";s:11:"preview_css";s:17:"color/preview.css";s:10:"base_image";s:14:"color/base.png";}}');
INSERT INTO `satellite2_variable` VALUES ('event_range_next', 'N;');
INSERT INTO `satellite2_variable` VALUES ('filter_url_length_1', 's:2:"72";');
INSERT INTO `satellite2_variable` VALUES ('allowed_html_1', 's:76:"<a> <em> <strong> <cite> <code> <ul> <ol> <li> <dl> <dt> <dd> <img> <p> <br>";');
INSERT INTO `satellite2_variable` VALUES ('filter_html_help_1', 'i:1;');
INSERT INTO `satellite2_variable` VALUES ('filter_html_nofollow_1', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('imce_settings_tinymce', 'i:1;');
INSERT INTO `satellite2_variable` VALUES ('imce_settings_textarea', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('imce_settings_user1', 'a:6:{s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:6:"twidth";s:0:"";s:7:"theight";s:0:"";s:6:"shared";s:2:"u1";s:6:"extras";i:0;}');
INSERT INTO `satellite2_variable` VALUES ('imce_settings_roles', 'a:1:{i:2;a:17:{s:6:"delete";i:1;s:6:"upload";i:1;s:7:"nolimit";i:0;s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:5:"scale";i:1;s:6:"twidth";s:0:"";s:7:"theight";s:0:"";s:6:"resize";i:0;s:8:"filesize";s:3:"500";s:5:"quota";s:4:"2000";s:6:"prefix";s:1:"u";s:6:"shared";s:0:"";s:6:"subnav";i:0;s:7:"subdirs";s:0:"";s:10:"extensions";s:0:"";s:6:"extras";i:0;}}');
INSERT INTO `satellite2_variable` VALUES ('upload_max_resolution', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('upload_list_default', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('upload_extensions_default', 's:57:"jpg jpeg gif png txt html doc xls pdf ppt pps odt ods odp";');
INSERT INTO `satellite2_variable` VALUES ('upload_uploadsize_default', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('upload_usersize_default', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('roles', 'a:1:{i:2;s:18:"authenticated user";}');
INSERT INTO `satellite2_variable` VALUES ('upload_extensions_2', 's:57:"jpg jpeg gif png txt html doc xls pdf ppt pps odt ods odp";');
INSERT INTO `satellite2_variable` VALUES ('upload_uploadsize_2', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('upload_usersize_2', 's:1:"5";');
INSERT INTO `satellite2_variable` VALUES ('update_access_fixed', 'b:1;');
INSERT INTO `satellite2_variable` VALUES ('date_default_timezone', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('configurable_timezones', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('date_format_short', 's:11:"d/m/Y - H:i";');
INSERT INTO `satellite2_variable` VALUES ('date_format_medium', 's:14:"D, d/m/Y - H:i";');
INSERT INTO `satellite2_variable` VALUES ('date_format_long', 's:15:"l, F j, Y - H:i";');
INSERT INTO `satellite2_variable` VALUES ('date_first_day', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('node_rank_comments', 's:1:"5";');
INSERT INTO `satellite2_variable` VALUES ('node_rank_recent', 's:1:"5";');
INSERT INTO `satellite2_variable` VALUES ('node_rank_relevance', 's:1:"5";');
INSERT INTO `satellite2_variable` VALUES ('overlap_cjk', 'i:1;');
INSERT INTO `satellite2_variable` VALUES ('minimum_word_size', 's:1:"3";');
INSERT INTO `satellite2_variable` VALUES ('search_cron_limit', 's:3:"100";');
INSERT INTO `satellite2_variable` VALUES ('wipe', 's:13:"Re-index site";');
INSERT INTO `satellite2_variable` VALUES ('node_cron_last', 's:10:"1201294102";');
INSERT INTO `satellite2_variable` VALUES ('node_cron_last_nid', 's:2:"20";');
INSERT INTO `satellite2_variable` VALUES ('site_name', 's:15:"ESN Satellite 2";');
INSERT INTO `satellite2_variable` VALUES ('poormanscron_lastrun', 'i:1223804148;');
INSERT INTO `satellite2_variable` VALUES ('update_status_last', 'i:1223806086;');
INSERT INTO `satellite2_variable` VALUES ('poormanscron_interval', 's:2:"60";');
INSERT INTO `satellite2_variable` VALUES ('poormanscron_retry_interval', 's:2:"10";');
INSERT INTO `satellite2_variable` VALUES ('poormanscron_log_cron_runs', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('poormanscron_log_progress', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('clean_url', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('content_update_1009', 'b:1;');
INSERT INTO `satellite2_variable` VALUES ('birthdays_field_id', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_show_starsign', 's:1:"2";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_hide_year', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_page_settings', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_page_list_number', 's:2:"25";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_page_show_filters', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_remind', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_send_user', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_send_user_subject', 's:15:"Happy Birthday!";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_send_user_message', 's:55:"Hey @name,\r\nHappy birthday!\r\nHope you have a great day!";');
INSERT INTO `satellite2_variable` VALUES ('user_register', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('user_email_verification', 'i:1;');
INSERT INTO `satellite2_variable` VALUES ('user_registration_help', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('user_mail_welcome_subject', 's:38:"Account details for !username at !site";');
INSERT INTO `satellite2_variable` VALUES ('user_mail_welcome_body', 's:442:"!username,\r\n\r\nThank you for registering at !site. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";');
INSERT INTO `satellite2_variable` VALUES ('user_mail_admin_subject', 's:52:"An administrator created an account for you at !site";');
INSERT INTO `satellite2_variable` VALUES ('user_mail_admin_body', 's:468:"!username,\r\n\r\nA site administrator at !site has created an account for you. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";');
INSERT INTO `satellite2_variable` VALUES ('user_mail_approval_subject', 's:63:"Account details for !username at !site (pending admin approval)";');
INSERT INTO `satellite2_variable` VALUES ('user_mail_approval_body', 's:508:"!username,\r\n\r\nThank you for registering at !site. Your application for an account is currently pending approval. Once it has been granted, you may log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you may wish to change your password at !edit_uri\r\n\r\n\r\n--  !site team";');
INSERT INTO `satellite2_variable` VALUES ('user_mail_pass_subject', 's:52:"Replacement login information for !username at !site";');
INSERT INTO `satellite2_variable` VALUES ('user_mail_pass_body', 's:416:"!username,\r\n\r\nA request to reset the password for your account has been made at !site.\r\n\r\nYou may now log in to !uri_brief clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once. It expires after one day and nothing will happen if it''s not used.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.";');
INSERT INTO `satellite2_variable` VALUES ('user_pictures', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('user_picture_path', 's:8:"pictures";');
INSERT INTO `satellite2_variable` VALUES ('user_picture_default', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('user_picture_dimensions', 's:5:"85x85";');
INSERT INTO `satellite2_variable` VALUES ('user_picture_file_size', 's:2:"30";');
INSERT INTO `satellite2_variable` VALUES ('user_picture_guidelines', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('birthdays_block_number_by_birthdays', 's:1:"3";');
INSERT INTO `satellite2_variable` VALUES ('simplenews_vid', 'i:1;');
INSERT INTO `satellite2_variable` VALUES ('simplenews_private_key', 's:32:"e8fdcd2343ebd3f10bceffa54868b117";');
INSERT INTO `satellite2_variable` VALUES ('i18n_languages', 'a:5:{s:12:"site_default";s:2:"en";s:4:"name";a:2:{s:2:"nl";s:5:"Dutch";s:2:"en";s:7:"English";}s:3:"rtl";a:3:{i:0;i:1;s:2:"en";i:0;s:2:"nl";i:0;}s:6:"native";a:2:{s:2:"en";s:7:"English";s:2:"nl";s:5:"Dutch";}s:7:"enabled";a:2:{s:2:"en";s:2:"en";s:2:"nl";s:2:"nl";}}');
INSERT INTO `satellite2_variable` VALUES ('i18n_node_news', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('node_options_page', 'a:1:{i:0;s:6:"status";}');
INSERT INTO `satellite2_variable` VALUES ('comment_page', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('upload_page', 's:1:"1";');
INSERT INTO `satellite2_variable` VALUES ('event_nodeapi_page', 's:5:"never";');
INSERT INTO `satellite2_variable` VALUES ('signup_form_page', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_version', 'a:2:{s:4:"text";s:9:"2005-9-18";s:5:"build";i:5;}');
INSERT INTO `satellite2_variable` VALUES ('pathauto_indexaliases_bulkupdate', 'b:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_punctuation_quotes', 's:1:"0";');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_hide_delay', 's:3:"800";');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_theme', 's:8:"original";');
INSERT INTO `satellite2_variable` VALUES ('admin_menu_margin_top', 'i:1;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_modulelist', 'a:4:{i:0;s:4:"node";i:1;s:8:"taxonomy";i:2;s:7:"tracker";i:3;s:4:"user";}');
INSERT INTO `satellite2_variable` VALUES ('pathauto_verbose', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_separator', 's:1:"-";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_max_length', 's:3:"100";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_max_component_length', 's:3:"100";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_indexaliases', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_update_action', 's:1:"2";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_ignore_words', 's:108:"a,an,as,at,before,but,by,for,from,is,in,into,like,of,off,on,onto,per,since,than,the,this,that,to,up,via,with";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_pattern', 's:7:"[title]";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_poll_pattern', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_event_pattern', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_image_pattern', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_simplenews_pattern', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_news_pattern', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_page_pattern', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_partner_pattern', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_bulkupdate', 'b:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_node_applytofeeds', 'i:1;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_taxonomy_pattern', 's:17:"[vocab]/[catpath]";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_taxonomy_1_pattern', 's:0:"";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_taxonomy_bulkupdate', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_taxonomy_applytofeeds', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_tracker_pattern', 's:17:"user/[user]/track";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_tracker_bulkupdate', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_tracker_applytofeeds', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('pathauto_user_pattern', 's:11:"user/[user]";');
INSERT INTO `satellite2_variable` VALUES ('pathauto_user_bulkupdate', 'i:0;');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_effect', 's:7:"opacity";');
INSERT INTO `satellite2_variable` VALUES ('simplemenu_effect_speed', 's:4:"fast";');
INSERT INTO `satellite2_variable` VALUES ('admin_menu_tweak_menu', 'i:1;');
INSERT INTO `satellite2_variable` VALUES ('admin_menu_tweak_modules', 'i:1;');

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_view_argument`
-- 

INSERT INTO `satellite2_view_argument` VALUES (3, 'node_feed', '2', 'ESN Satellite 2.0 - Join the Galaxy!', '', 0, '', '');
INSERT INTO `satellite2_view_argument` VALUES (2, 'rss_feed', '2', 'ESN Satellite - Partner Feed', '', 0, '', '');
INSERT INTO `satellite2_view_argument` VALUES (1, 'rss_feed', '2', 'ESN Satellite - News Feed', '', 0, '', '');

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_view_filter`
-- 

INSERT INTO `satellite2_view_filter` VALUES (1, '', 'node.type', 'news', 'OR', '', 1);
INSERT INTO `satellite2_view_filter` VALUES (1, '', 'node.status', '1', '=', '', 0);
INSERT INTO `satellite2_view_filter` VALUES (2, '', 'node.type', 'partner', 'OR', '', 1);
INSERT INTO `satellite2_view_filter` VALUES (2, '', 'node.status', '1', '=', '', 0);
INSERT INTO `satellite2_view_filter` VALUES (3, '', 'node.status', '1', '=', '', 0);
INSERT INTO `satellite2_view_filter` VALUES (3, '', 'node.type', 'news', 'OR', '', 1);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_view_sort`
-- 

INSERT INTO `satellite2_view_sort` VALUES (1, 0, 'node.created', 'DESC', 'normal', NULL);
INSERT INTO `satellite2_view_sort` VALUES (2, 0, 'node.title', 'ASC', '', NULL);
INSERT INTO `satellite2_view_sort` VALUES (3, 0, 'node.sticky', 'DESC', '', NULL);
INSERT INTO `satellite2_view_sort` VALUES (3, 1, 'node.created', 'DESC', 'normal', NULL);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_view_tablefield`
-- 

INSERT INTO `satellite2_view_tablefield` VALUES (1, 'node_data_field_summary', 'field_summary_value', '', 'content_views_field_handler_group', 0, '0', 'default', 3);
INSERT INTO `satellite2_view_tablefield` VALUES (1, 'node_data_field_image', 'field_image_fid', '', 'content_views_field_handler_group', 0, '', 'thumbnail', 2);
INSERT INTO `satellite2_view_tablefield` VALUES (2, 'node', 'title', '', 'views_handler_field_nodelink', 0, '0', 'link', 4);
INSERT INTO `satellite2_view_tablefield` VALUES (2, 'node_data_field_logo', 'field_logo_fid', '', 'content_views_field_handler_group', 0, '', 'logo', 0);
INSERT INTO `satellite2_view_tablefield` VALUES (2, 'node_data_field_shortdescription', 'field_shortdescription_value', '', 'content_views_field_handler_group', 0, '0', 'default', 1);
INSERT INTO `satellite2_view_tablefield` VALUES (2, 'node_data_field_logolink', 'field_logolink_url', '', 'content_views_field_handler_group', 0, '', 'default', 2);
INSERT INTO `satellite2_view_tablefield` VALUES (2, 'node', 'body', '', 'views_handler_field_teaser', 0, '', '', 3);
INSERT INTO `satellite2_view_tablefield` VALUES (3, 'node_data_field_summary', 'field_summary_value', '', 'content_views_field_handler_group', 0, '0', 'default', 4);
INSERT INTO `satellite2_view_tablefield` VALUES (3, 'node', 'nid', '', '', 0, '0', '', 0);
INSERT INTO `satellite2_view_tablefield` VALUES (3, 'node', 'created', '', 'views_handler_field_date_small', 0, '0', '', 1);
INSERT INTO `satellite2_view_tablefield` VALUES (3, 'node', 'title', '', 'views_handler_field_nodelink_with_mark', 0, '0', 'nolink', 2);
INSERT INTO `satellite2_view_tablefield` VALUES (3, 'node_data_field_image', 'field_image_fid', '', 'content_views_field_handler_group', 0, '', 'mainimage', 3);
INSERT INTO `satellite2_view_tablefield` VALUES (1, 'node', 'title', '', 'views_handler_field_nodelink_with_mark', 0, '0', 'nolink', 1);
INSERT INTO `satellite2_view_tablefield` VALUES (1, 'node', 'created', '', 'views_handler_field_date_small', 0, 'ASC', '', 0);

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_view_view`
-- 

INSERT INTO `satellite2_view_view` VALUES (1, 'News', 'View for the news content type', '', 1, 'News', '', 1, 'No news has been posted on your Satellite. Log in and click on Create Content / News.', 1, '', 1, 'list', 1, 5, 'news', 0, 0, 0, '', 0, 'tab', '', 0, 1, 'Latest news', 0, '', 1, 0, '', 1, 0, 'No news has been posted on your Satellite. Log in and click on Create Content / News.', 1, 'list', 5, 1, 0, 1190993909, '', 0);
INSERT INTO `satellite2_view_view` VALUES (2, 'Partners', 'View for the partners content type', '', 1, 'Partners', '', 1, 'No partners have been posted yet. Log in and click on Create Content / Partner.', 1, '', 1, 'list', 0, 0, 'partners', 0, 0, 0, '', 0, 'tab', '', 0, 1, 'Partners', 0, '', 1, 0, '', 1, 0, 'No partners have been posted yet. Log in and click on Create Content / Partner.', 1, 'list', 5, 0, 0, 1188466595, '', 0);
INSERT INTO `satellite2_view_view` VALUES (3, 'Homepage', 'The default ESN Satellite homepage', '', 1, '', '', 1, 'No news has been posted yet. Log in and click on Create Content / News.', 1, '', 1, 'list', 0, 5, 'home', 0, 0, 0, '', 0, 'tab', '', 0, 0, '', 0, '', 1, 0, '', 1, 0, '', 1, 'node', 0, 0, 1, 1188425773, '', 0);

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
  `language` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`vid`)
) TYPE=MyISAM  AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_vocabulary`
-- 

INSERT INTO `satellite2_vocabulary` VALUES (1, 'Newsletter', '', '', 0, 0, 0, 0, 0, 'simplenews', 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_vocabulary_node_types`
-- 

CREATE TABLE `satellite2_vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`vid`,`type`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_vocabulary_node_types`
-- 

INSERT INTO `satellite2_vocabulary_node_types` VALUES (1, 'simplenews');

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
) TYPE=MyISAM  AUTO_INCREMENT=110 ;

-- 
-- Dumping data for table `satellite2_watchdog`
-- 

