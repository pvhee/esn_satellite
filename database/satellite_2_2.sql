-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 25, 2008 at 09:50 PM
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_aggregator_feed`
-- 

INSERT INTO `satellite2_aggregator_feed` (`fid`, `title`, `url`, `refresh`, `checked`, `link`, `description`, `image`, `etag`, `modified`, `block`) VALUES 
(1, 'ESN International News', 'http://www.esn.org/news/feed', 3600, 1201292294, 'http://www.esn.org/news/feed', 'News view', '', '', 1201292293, 5);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=879 ;

-- 
-- Dumping data for table `satellite2_aggregator_item`
-- 

INSERT INTO `satellite2_aggregator_item` (`iid`, `fid`, `title`, `link`, `author`, `description`, `timestamp`, `guid`) VALUES 
(858, 1, 'ESNSurvey 2007 closed: more than 8000 students responded!', 'http://www.esn.org/news/esnsurvey_2007_closed_more_than_8000_students_responded', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">We thank all ESN sections and all supporters in promoting and distributing the survey: &lt;span&gt;&lt;span&gt;8150 answers have been gathered and are waiting for data analysis..&lt;/span&gt;&lt;/span&gt; Thanks to all of you who filled the Survey!</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><strong><span>ESNSurvey 2007 closed: more than 8000 students responded!</span> <span><br /></span></strong></p>\n<p><strong><span>  </span></strong><span><span>During three months, ESNSurvey about &quot;Generation Mobility&quot; received exactly 8150 answers. It is another great success that we managed to achieve as a network of ESN sections, and by networking with many other educational associations, both student and professional.</p>\n<p> </span>   </span>We thank all ESN sections and all supporters in promoting and distributing the survey.</p>\n<p> Thanks to all of you who filled the Survey!</p>\n<p> Now is time for data analysis. Results and report will be ready for the beginning of next year.</p>\n<p>    If you would like to receive the report don&#39;t hesitate to contact us at <a href="secretariat@20erasmus.eu" target="_blank">secretariat@20erasmus.eu</a></p>\n</div></div></div>', 1192444067, '143 at http://www.esn.org'),
(859, 1, 'Third Fun(d)raising conference: Bocconi', 'http://www.esn.org/news/third_fun_d_raising_conference_bocconi', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">After the great success of the first conference in Wien in 2005 and the second in Gdansk in 2006, from the 10th to the 14th of December, the Fundraising conference is organised in Milano by Università Bocconi </div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><font face="Palatino Linotype" size="3">This year the 3rd Fun(d)raising  Conference will be in Milano from the 10th till the 14th December 2007.  (See schedule)</font>\n<p><font face="Palatino Linotype" size="3">After the great success of  the first conference in Wien in 2005 and the second in Gdansk in 2006,  the third one is organised in Milano by Università Bocconi which will  gives facilities and lecturers, and ESN Milano Statale (<a href="http://www.esnmilanostatale.it/" target="_blank">www.esnmilanostatale.it</a>)  with the help of the other 5 ESN sections in Milano <u>(<a href="http://www.esnmilano.it/" target="_blank">www.esnmilano.it</a>)</u>.</font></p>\n<p><font face="Palatino Linotype" size="3">The Fun(d)rasing conference  is a unique opportunity for ESN members to learn from the most outstanding  professors in finance and economics and improve their skills in dealing  with financial issues. </font></p>\n<p><font face="Palatino Linotype" size="3">Università Bocconi (www.Uni<strong>Bocconi</strong>.it)  is a leading university of economics and marketing and they have great  experience in teaching. ESN has already cooperated with Università  Bocconi in two occasions and both of them were a great success: in January  2006 for the ESN training in human management and in July 2006 for the  Bocconi Summer Factory.</font></p>\n<p><font face="Palatino Linotype" size="3"><strong>About lectures</strong></font></p>\n<p><font face="Palatino Linotype" size="3">Marketing is becoming more  and more an important part of the management of non-profit organisations  and the need for some basic but essential tools for strategic marketing  planning is growing.</font></p>\n<p><font face="Palatino Linotype" size="3">During Monday and Wednesday,  Alex Turrini (see biography) will introduce the basics of the fund-raising  for non-profit organisation and will hold an interactive workshop, in  Tuesday morning lecture Christiane Roth (see biography) will speak about  marketing planning.</font></p>\n<p><font face="Palatino Linotype" size="3"> (See lecture programme)</font></p>\n<p><font face="Palatino Linotype" size="3"><strong>About the fun</strong></font></p>\n<p><font face="Palatino Linotype" size="3">But Fun(d)raising is not  only about improving skills, but also about fun and culture. You will  experience the famous Italian cuisine, you will visit the great monuments  of the city, its many churches (among them the famous Romanic S.Amborgio  and the wonderful Gothic cathedral Duomo), La Scala theatre, the wonderful  Vittorio Emanuele II Gallery, known as &quot;the living room&quot; of  Milano. And, course you will experience the amazing night life of Milano,  the capital of fashion and entrainment in Italy.</font></p>\n<p><font face="Palatino Linotype" size="3">So, what are you waiting  for? Hurry up and sign for an unforgettable experience in Milano at  the Fun(d)raising conference!!!</font></p>\n<p><font face="Palatino Linotype" size="3">See detailed programme (xxxx)</font>  </p>\n<p><font face="Palatino Linotype" size="3"><strong>Fee</strong></font></p>\n<p><font face="Palatino Linotype" size="3">The participation fee is  120 euros and includes:</font></p>\n<p><font face="Palatino Linotype" size="3">3 Breakfasts in the hostel</font></p>\n<p><font face="Palatino Linotype" size="3">3 Lunches at Bocconi canteen</font></p>\n<p><font face="Palatino Linotype" size="3">Dinner at Ciao ristorante</font></p>\n<p><font face="Palatino Linotype" size="3">Dinner in a typical restaurant</font></p>\n<p><font face="Palatino Linotype" size="3">Aperitivo (Happy hour) with  a drink at Gioia 69</font></p>\n<p><font face="Palatino Linotype" size="3">Extra food and drink provided  from the OC</font></p>\n<p><font face="Palatino Linotype" size="3">Accommodation from Monday  to Wednesday. </font></p>\n<p><font face="Palatino Linotype" size="3">Does not include</font></p>\n<p><font face="Palatino Linotype" size="3">Accommodation for Wednesday  night  because we will spend the last night in the most exciting Erasmus  party in Milano, but, if you want to go to sleep, feel free to ask for  the extra night (21 euros).</font></p>\n<p><font face="Palatino Linotype" size="3">Public transport. You’ll  be provided with all the information to purchase tickets.</font></p>\n<p><font face="Palatino Linotype" size="3">Three participants with less  opportunity or with high travel expenses will have the possibility to  have a reduced fee of 45 euros by being hosted by people from the section  of ESN Milano Statale. These people will be chosen among all those who  will explicitly claim for such in the special section of the application  form.</font></p>\n<p><font face="Palatino Linotype" size="3"><strong>Sign up  information</strong></font></p>\n<p><font face="Palatino Linotype" size="3">As the number of places is  limited to 36, there will be a selection procedure, although the application  is open to every ESN member.</font></p>\n<p><font face="Palatino Linotype" size="3">To sign up fill in the <u> application form</u> , after the first deadline (xxxxxxxxx), the OC  will open the selections of the candidates taking into account your  motivation to participate, your course of studies,  country of  origin and the other information included in the application form. If  your application is accepted the OC will send you an e - mail with the  payment information.</font></p>\n<p><font face="Palatino Linotype" size="3">For any further information  don’t hesitate to contact the OC at </font><a href="mailto:third.fundraising@gmail.com" target="_blank"><font face="Palatino Linotype" size="3" color="#0000ff"><u>third.fundraising@gmail.com</u></font></a></p>\n<p><font face="Palatino Linotype" size="3">Info line:</font></p>\n<p><font face="Palatino Linotype" size="3">+393281182872    Chandra</font></p>\n<p><font face="Palatino Linotype" size="3">+393294213446    Dario</font> </p>\n<p><font face="Palatino Linotype" size="3"><strong>Link:</strong></font></p>\n<p><font face="Palatino Linotype" size="3">Schedule</font></p>\n<p><font face="Palatino Linotype" size="3">Lecture programme</font></p>\n<p><font face="Palatino Linotype" size="3">Alex Turrini Biography</font></p>\n<p><font face="Palatino Linotype" size="3">Christiane Roth biography</font></p>\n<p><font face="Palatino Linotype" size="3">Application form</font></p>\n<p><a href="mailto:third.fundraising@gmail.com" target="_blank"><font face="Palatino Linotype" size="3" color="#0000ff"><u>third.fundraising@gmail.com</u></font></a></p>\n</div></div></div>', 1192467627, '144 at http://www.esn.org'),
(870, 1, 'Survey: live and work abroad', 'http://www.esn.org/news/survey_live_and_work_abroad', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item"> &lt;p&gt;The survey  &lt;a href=&quot;http://www.qlabo.eu/index.php&quot;&gt;&amp;quot;Live and work abroad&amp;quot;&lt;/a&gt; concerns  your experiences of being abroad on Erasmus scholarship. Your participation  in the survey is voluntary, you can always quit the survey or disagree  to use your results. Prize: a return plane tickets from any European  capital to Warsaw.&lt;/p&gt;</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><font face="TimesNewRomanPSMT" size="3">The survey  <a href="http://www.qlabo.eu/index.php">&quot;Live and work abroad&quot;</a> </font><font face="TimesNewRomanPSMT" size="3">concerns  your experiences of being abroad on Erasmus scholarship.</font></p>\n<p><font face="TimesNewRomanPSMT" size="3">Your participation in the survey is voluntary, you can always quit the survey or disagree to use your results. I would really want you to take part in this survey, that is why everybody who fills in all questionnaires will have a possibility to win a prize. The prize is return plane tickets from any European capital to Warsaw.</font></p>\n<p>&nbsp;</p>\n<p><font face="TimesNewRomanPSMT" size="3">You will be asked questions  about your opinions, values, experiences. There are no good or bad answers  here. Please answer all questions sincerely and on your own.</font></p>\n<p><font face="TimesNewRomanPSMT" size="3">The questionnaires are multi-lingual,  meaning you can fill them out in English, Spanish, Italian, French,  Polish, and German.</font></p>\n<p><font face="TimesNewRomanPSMT" size="3">The survey is anonymous and  only </font><font face="Times New Roman" size="3">generalized conclusions  will be drawn, I won&#39;t make any individual diagnosis </font><font face="TimesNewRomanPSMT" size="3">.</font></p>\n<p><font face="TimesNewRomanPSMT" size="3">There are 7 questionnaires  in the survey. Your progress (in %) will be seen always after logging  in in the table with the survey description. There are no time limits,  but it should not take longer than 30 minutes. I allow piecemeal filling  of the questionnaires, which means that you can fill in the questionnaires  in several sessions, because after logging out the data won&#39;t be lost  and you will be able to continue in the moment you stopped the survey.  You will find more information about functioning Qlabo service in the  &#39;Help-Section&#39;.</font></p>\n<p><font face="TimesNewRomanPSMT" size="3">I hope that taking part in  my survey will be a pleasant experience for you and will allow you to  have a look on your trip/ stay from a different perspective. </font></p>\n<p><font face="TimesNewRomanPSMT" size="3">If you have any questions  concerning the survey, don&#39;t hesitate to contact me at any moment of  your survey: </font><a href="mailto:monika.henne@swps.edu.pl" target="_blank"><font face="TimesNewRomanPSMT" size="3" color="#000080"><u>monika.henne@swps.edu.pl</u></font></a><font face="TimesNewRomanPSMT" size="3">; </font><a href="mailto:monbi@poczta.wp.pl" target="_blank"><font face="TimesNewRomanPSMT" size="3" color="#000080"><u>monbi@poczta.wp.pl </u></font></a><font face="Times New Roman" size="3">.</font> </p>\n<p><font face="TimesNewRomanPSMT" size="3">Thanks for your cooperation  and good luck !</font></p>\n<p><font face="Times New Roman" size="3">The survey: </font><a href="http://www.qlabo.eu/" target="_blank"><font face="Times New Roman" size="3" color="#000080"><u>www.qlabo.eu</u></font></a></p>\n</div></div></div>', 1197305291, '155 at http://www.esn.org'),
(871, 1, 'An Award for you', 'http://www.esn.org/news/an_award_for_you', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;img class=&quot;left&quot; src=&quot;/files/uploaded/ESNy_awards.jpg&quot; alt=&quot;&quot; width=&quot;50&quot; height=&quot;60&quot; /&gt;During the Gala Dinner, in Besan&lt;font size=&quot;-1&quot;&gt;ç&lt;/font&gt;on, we will know who are the Stars of ESN, the winners of the five awards. Do you want your section to be among them?</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p>You have time until the 28th of February to send us your application for:</p>\n<ul>\n<li>Most Pallomeri section</li>\n<li>Best newcomer</li>\n<li>Best satellite</li>\n<li>Spreading the ESN love</li>\n</ul>\n<p>If you wish, you can choose more than one.. just download the application form you find at the end of this page, fill it in and send it to: <strong>awards@esn.org</strong></p>\n<p>But don&#39;t forget to run also for: </p>\n<ul>\n<li>Most Trash Picture (you are going to regret it tomorrow)</li>\n</ul>\n<p>a) it has to be taken at a ESN event<br />b) original; not just drunk people<br />c) the quality of the execution<br />d) funny<br />e) represents the pallomeri spirit</p>\n<p>f) ...in high resolution...</p>\n<p>Please call the file you are sending us with the name of the award you are applying for + the name of tyour section; </p>\n<p>for example: nameoftheaward_nameofyoursection.doc/jpg</p>\n</div></div></div>', 1200400295, '160 at http://www.esn.org'),
(872, 1, 'Are you ready for the third issue?', 'http://www.esn.org/news/are_you_ready_for_the_third_issue', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;img class=&quot;left&quot; src=&quot;/files/uploaded/express_logo.jpg&quot; alt=&quot;&quot; width=&quot;66&quot; height=&quot;57&quot; /&gt; The second edition of eXpress has been printed! Now it&amp;#39;s time to look ahead, to the next edition. Do you want to see your article there? Contact us!</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p>So these are the characteristics that articles should have to best fit into the magazine:</p>\n<ul>\n<li>one page article : at most 400 words, that is around 2000 characters, spaces excluded.</li>\n<li>simple news or events: no more than 150 words, spaces excluded.</li>\n<li>complementary box (highly recommended in order to explain/introduce your article): around 50/60 word, around 300 characters, spaces excluded.</li>\n</ul>\n<p>Every article should have two or three <strong>photos or drawings</strong>, and the minimum dimension should be 10x15cm at 300dpi (if somebody of you doesn&#39;t know what dpi are, let&#39;s say that your image should be at least 2,5 megabyte).</p>\n<p>This time we would love to read about the daily life in your ESN section, or something about your National Board, if you have one. But what about an article on the cultural gaps in Europe? And why not writing about different approaches men and women have in different countries? Or maybe give your ESN mates some good hints about what to cook when you have 5 euros and no oven…</p>\n<p>Send your article and your pictures to <a href="http://www.esn.org/pr@esn.org">pr@esn.org</a> <strong>before Friday 29th February</strong></p>\n</div></div></div>', 1200578619, '161 at http://www.esn.org');

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
('views', 'Partners', 'esntheme', 1, -4, 'right', 0, 0, 1, '<front>', ''),
('views', 'News', 'esntheme', 0, 0, '', 0, 0, 1, '<front>', ''),
('simplenews', 'newsletter-1', 'esntheme', 1, -3, 'right', 0, 0, 1, '<front>', ''),
('signup', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('image', '1', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('image', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('event', '1', 'esntheme', 1, -5, 'left', 0, 0, 1, '<front>', ''),
('event', '0', 'esntheme', 1, -5, 'right', 0, 0, 1, '<front>', ''),
('user', '3', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('user', '2', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('user', '1', 'esntheme', 1, 6, 'left', 0, 0, 0, '', ''),
('user', '0', 'esntheme', 1, 8, 'left', 0, 0, 0, '', ''),
('search', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('profile', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('poll', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('node', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('menu', '2', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('comment', '0', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
('aggregator', 'feed-1', 'esntheme', 1, -4, 'left', 0, 0, 1, '<front>', ''),
('birthdays', 'by_birthdays', 'esntheme', 0, 0, '', 0, 0, 1, '<front>', ''),
('birthdays', 'by_days', 'esntheme', 0, 0, '', 0, 0, 0, '', ''),
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_contact`
-- 

INSERT INTO `satellite2_contact` (`cid`, `category`, `recipients`, `reply`, `weight`, `selected`) VALUES 
(1, 'website feedback', 'change-this-email-address@test.org', '', 0, 0);

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
  `field_summary_value` longtext,
  `field_image_fid` int(11) NOT NULL default '0',
  `field_image_title` varchar(255) NOT NULL default '',
  `field_image_alt` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_content_type_news`
-- 

INSERT INTO `satellite2_content_type_news` (`vid`, `nid`, `field_summary_value`, `field_image_fid`, `field_image_title`, `field_image_alt`) VALUES 
(20, 20, 'Try Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite 2, thereby joining the fast growing ESN Galaxy!\r\n', 24, 'ESN Satellite 2', 'ESN Satellite 2'),
(3, 3, NULL, 3, '', ''),
(8, 8, NULL, 11, '', ''),
(14, 14, NULL, 15, '', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_content_type_page`
-- 

CREATE TABLE `satellite2_content_type_page` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for table `satellite2_content_type_simplenews`
-- 

CREATE TABLE `satellite2_content_type_simplenews` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

INSERT INTO `satellite2_files` (`fid`, `nid`, `filename`, `filepath`, `filemime`, `filesize`) VALUES 
(24, 20, 'ESN_astronaut.png', 'files/images-news/ESN_astronaut.png', 'image/png', 67587);

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

INSERT INTO `satellite2_history` (`uid`, `nid`, `timestamp`) VALUES 
(1, 12, 1201294182),
(1, 20, 1201294103);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_i18n_node`
-- 

INSERT INTO `satellite2_i18n_node` (`nid`, `trid`, `language`, `status`) VALUES 
(5, 1, 'en', 0),
(11, 1, 'nl', 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_i18n_variable`
-- 

CREATE TABLE `satellite2_i18n_variable` (
  `name` varchar(48) NOT NULL default '',
  `language` varchar(12) NOT NULL default '',
  `value` longtext NOT NULL,
  PRIMARY KEY  (`name`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_imagecache_action`
-- 

INSERT INTO `satellite2_imagecache_action` (`actionid`, `presetid`, `weight`, `data`) VALUES 
(1, 1, 1, 'a:4:{s:8:"function";s:5:"scale";s:3:"fit";s:6:"inside";s:5:"width";s:3:"300";s:6:"height";s:3:"300";}'),
(2, 2, 0, 'a:4:{s:8:"function";s:5:"scale";s:3:"fit";s:6:"inside";s:5:"width";s:3:"100";s:6:"height";s:3:"100";}'),
(3, 3, 1, 'a:4:{s:8:"function";s:5:"scale";s:3:"fit";s:6:"inside";s:5:"width";s:3:"145";s:6:"height";s:3:"145";}');

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_imagecache_preset`
-- 

CREATE TABLE `satellite2_imagecache_preset` (
  `presetid` int(10) unsigned NOT NULL,
  `presetname` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`presetid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_imagecache_preset`
-- 

INSERT INTO `satellite2_imagecache_preset` (`presetid`, `presetname`) VALUES 
(1, 'mainimage'),
(2, 'thumbnail'),
(3, 'logo');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_locales_meta`
-- 

INSERT INTO `satellite2_locales_meta` (`locale`, `name`, `enabled`, `isdefault`, `plurals`, `formula`) VALUES 
('en', 'English', 1, 1, 0, '');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_menu`
-- 

INSERT INTO `satellite2_menu` (`mid`, `pid`, `path`, `title`, `description`, `weight`, `type`, `language`) VALUES 
(2, 0, '', 'Primary links', '', 0, 115, ''),
(3, 1, 'filter/tips', 'Compose tips', '', 0, 20, ''),
(4, 1, 'node', 'Content', '', 0, 16, ''),
(5, 1, 'search', 'Search', '', 0, 20, ''),
(6, 1, 'admin', 'Administer', '', 9, 22, ''),
(7, 1, 'logout', 'Log out', '', 10, 22, ''),
(8, 1, 'tracker', 'Recent posts', '', 0, 22, ''),
(9, 6, 'admin/help', 'Help', '', 9, 22, ''),
(10, 6, 'admin/content', 'Content management', 'Manage your site''s content.', -10, 22, ''),
(102, 4, 'node/add', 'Create content', '', 1, 28, ''),
(12, 6, 'admin/settings', 'Site configuration', 'Adjust basic site configuration options.', -5, 22, ''),
(13, 6, 'admin/build', 'Site building', 'Control how your site looks and feels.', -10, 22, ''),
(14, 6, 'admin/logs', 'Logs', 'View system logs and other status information.', 5, 22, ''),
(15, 6, 'admin/user', 'User management', 'Manage your site''s users, groups and access to site features.', 0, 22, ''),
(16, 13, 'admin/build/block', 'Blocks', 'Configure what block content appears in your site''s sidebars and other regions.', 0, 22, ''),
(17, 10, 'admin/content/comment', 'Comments', 'List and edit site comments and the comment moderation queue.', 0, 22, ''),
(18, 12, 'admin/settings/filters', 'Input formats', 'Configure how content input by users is filtered, including allowed HTML tags, PHP code tags. Also allows enabling of module-provided filters.', 0, 22, ''),
(19, 13, 'admin/build/menu', 'Menus', 'Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.', 0, 22, ''),
(20, 10, 'admin/content/node', 'Content', 'View, edit, and delete your site''s content.', 0, 22, ''),
(21, 10, 'admin/content/search', 'Search content', 'Search content by keyword.', 0, 22, ''),
(22, 10, 'admin/content/node-settings', 'Post settings', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', 0, 22, ''),
(23, 10, 'admin/content/types', 'Content types', 'Manage posts by content type, including default status, front page promotion, etc.', 0, 22, ''),
(24, 13, 'admin/build/path', 'URL aliases', 'Change your site''s URL paths by aliasing them.', 0, 22, ''),
(25, 12, 'admin/settings/search', 'Search settings', 'Configure relevance settings for search and other indexing options', 0, 22, ''),
(26, 14, 'admin/logs/search', 'Top search phrases', 'View most popular search phrases.', 0, 22, ''),
(27, 14, 'admin/logs/hits', 'Recent hits', 'View pages that have recently been visited.', 0, 22, ''),
(28, 14, 'admin/logs/pages', 'Top pages', 'View pages that have been hit frequently.', 1, 22, ''),
(29, 14, 'admin/logs/visitors', 'Top visitors', 'View visitors that hit many pages.', 2, 22, ''),
(30, 14, 'admin/logs/referrers', 'Top referrers', 'View top referrers.', 0, 22, ''),
(31, 14, 'admin/logs/settings', 'Access log settings', 'Control details about what and how your site logs.', 3, 22, ''),
(32, 12, 'admin/settings/admin', 'Administration theme', 'Settings for how your administrative pages should look.', 0, 22, ''),
(33, 13, 'admin/build/themes', 'Themes', 'Change which theme your site uses or allows users to set.', 0, 22, ''),
(34, 13, 'admin/build/modules', 'Modules', 'Enable or disable add-on modules for your site.', 0, 22, ''),
(35, 12, 'admin/settings/site-information', 'Site information', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', 0, 22, ''),
(36, 12, 'admin/settings/error-reporting', 'Error reporting', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', 0, 22, ''),
(37, 12, 'admin/settings/performance', 'Performance', 'Enable or disable page caching for anonymous users, and enable or disable CSS preprocessor.', 0, 22, ''),
(38, 12, 'admin/settings/file-system', 'File system', 'Tell Drupal where to store uploaded files and how they are accessed.', 0, 22, ''),
(39, 12, 'admin/settings/image-toolkit', 'Image toolkit', 'Choose which image toolkit to use if you have installed optional toolkits.', 0, 22, ''),
(40, 10, 'admin/content/rss-publishing', 'RSS publishing', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', 0, 22, ''),
(41, 12, 'admin/settings/date-time', 'Date and time', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', 0, 22, ''),
(42, 12, 'admin/settings/site-maintenance', 'Site maintenance', 'Take the site off-line for maintenance or bring it back online.', 0, 22, ''),
(43, 12, 'admin/settings/clean-urls', 'Clean URLs', 'Enable or disable clean URLs for your site.', 0, 22, ''),
(44, 14, 'admin/logs/status', 'Status report', 'Get a status report about your site''s operation and any detected problems.', 10, 22, ''),
(45, 10, 'admin/content/taxonomy', 'Categories', 'Create vocabularies and terms to categorize your content.', 0, 22, ''),
(46, 12, 'admin/settings/throttle', 'Throttle', 'Control how your site cuts out content during heavy load.', 0, 22, ''),
(47, 15, 'admin/user/user', 'Users', 'List, add, and edit users.', 0, 22, ''),
(48, 15, 'admin/user/settings', 'User settings', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', 0, 22, ''),
(49, 15, 'admin/user/access', 'Access control', 'Determine access to features by selecting permissions for roles.', 0, 22, ''),
(50, 15, 'admin/user/roles', 'Roles', 'List, edit, or add user roles.', 0, 22, ''),
(51, 15, 'admin/user/rules', 'Access rules', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', 0, 22, ''),
(52, 15, 'admin/user/search', 'Search users', 'Search users by name.', 0, 22, ''),
(53, 14, 'admin/logs/watchdog', 'Recent log entries', 'View events that have recently been logged.', -1, 22, ''),
(54, 14, 'admin/logs/page-not-found', 'Top ''page not found'' errors', 'View ''page not found'' errors (404s).', 0, 22, ''),
(55, 14, 'admin/logs/access-denied', 'Top ''access denied'' errors', 'View ''access denied'' errors (403s).', 0, 22, ''),
(56, 11, 'node/add/event', 'Event', '', 0, 22, ''),
(57, 12, 'admin/settings/event', 'Events', 'Set up how your site handles events.', 0, 22, ''),
(58, 11, 'node/add/image', 'Image', '', 0, 22, ''),
(59, 12, 'admin/settings/image', 'Image', 'Image module settings.', 0, 22, ''),
(60, 12, 'admin/settings/imce', 'IMCE settings', 'Control how your image/file browser works.', 0, 22, ''),
(61, 12, 'admin/settings/img_assist', 'Image assist', 'Change settings for the Image assist module.', 0, 22, ''),
(62, 12, 'admin/settings/pathauto', 'Pathauto', 'Configure how pathauto generates clean URLs for your content.', 0, 22, ''),
(63, 12, 'admin/settings/signup', 'Signup', 'Configure settings for signups.', 0, 22, ''),
(64, 10, 'admin/content/signup', 'Signup overview', 'View all signup-enabled posts, and open or close signups on them.', 0, 22, ''),
(65, 12, 'admin/settings/simplemenu', 'SimpleMenu', 'Select the menu to display.', 0, 22, ''),
(66, 12, 'admin/settings/tinymce', 'TinyMCE', 'Configure the rich editor.', 0, 22, ''),
(67, 13, 'admin/build/views', 'Views', 'Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.', 0, 22, ''),
(68, 57, 'admin/settings/event/timezone', 'Timezone handling', 'Change how timezone information is saved and displayed.', 0, 22, ''),
(69, 57, 'admin/settings/event/overview', 'Event overview', 'Change how event summary information is displayed.', 0, 22, ''),
(70, 10, 'admin/content/aggregator', 'News aggregator', 'Configure which content your site aggregates from other sites, how often it polls them, and how they''re categorized.', 0, 22, ''),
(71, 1, 'aggregator', 'News aggregator', '', 5, 48, ''),
(72, 13, 'admin/build/contact', 'Contact form', 'Create a system contact form and set up categories for the form to use.', 0, 22, ''),
(73, 1, 'contact', 'Contact', '', 0, 20, ''),
(74, 12, 'admin/settings/uploads', 'File uploads', 'Control how files may be attached to content.', 0, 22, ''),
(75, 71, 'aggregator/sources', 'Sources', '', 0, 48, ''),
(76, 71, 'aggregator/categories', 'Categories', '', 0, 28, ''),
(77, 11, 'node/add/poll', 'Poll', '', 0, 22, ''),
(78, 1, 'poll', 'Polls', '', 0, 20, ''),
(79, 11, 'node/add/news', 'News', '', 0, 22, ''),
(80, 11, 'node/add/partner', 'Partner', '', 0, 22, ''),
(81, 2, '<front>', 'Home', 'Go to the Satellite homepage', -10, 118, ''),
(82, 2, 'news', 'News', 'News page', -7, 118, ''),
(83, 2, 'partners', 'Partners', 'Partners', -4, 118, ''),
(84, 12, 'admin/settings/imagecache', 'Image cache', 'Configure rulesets and actions for imagecache.', 0, 22, ''),
(85, 2, 'event', 'Events', 'Events', -6, 118, ''),
(86, 14, 'admin/logs/updates', 'Available updates', 'Get a status report on installed modules and available updates.', 10, 22, ''),
(87, 12, 'admin/settings/poormanscron', 'Poormanscron', 'A module which runs Drupal cron jobs without the cron application.', 0, 22, ''),
(88, 1, 'profile', 'User list', '', 0, 20, ''),
(89, 15, 'admin/user/profile', 'Profiles', 'Create customizable fields for your users.', 0, 22, ''),
(90, 12, 'admin/settings/birthdays', 'Birthdays', 'Set user birthday mail and toggle user mail, upcoming birthdays mail and more.', 0, 22, ''),
(91, 1, 'birthdays', 'Birthdays', 'List the birthdays of all users.', 0, 20, ''),
(92, 11, 'node/add/simplenews', 'Newsletter issue', '', 0, 22, ''),
(93, 10, 'admin/content/newsletters', 'Newsletters', 'Manage newsletters, subscriptions, and configuration options.', 0, 22, ''),
(94, 2, 'contact', 'Contact', 'Contact', 10, 118, ''),
(95, 10, 'admin/content/translation', 'Translations', 'Manage content translations.', 0, 22, ''),
(96, 12, 'admin/settings/i18n', 'Multilingual system', 'Configure multilingual content and translation.', 0, 22, ''),
(97, 12, 'admin/settings/locale', 'Localization', 'Configure site localization and user interface translation.', 0, 22, ''),
(98, 12, 'admin/settings/shoutbox', 'Shoutbox', 'Settings for displaying and deleting shouts', 0, 22, ''),
(100, 11, 'node/add/page', 'Page', '', 0, 22, ''),
(101, 2, 'node/12', 'ESN Galaxy', 'ESN Galaxy', 5, 118, ''),
(103, 13, 'admin/build/menutree', 'Menu trees', 'Configure page titles and intro text for menu tree pages.', 0, 22, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- 
-- Dumping data for table `satellite2_node`
-- 

INSERT INTO `satellite2_node` (`nid`, `vid`, `type`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`) VALUES 
(20, 20, 'news', 'Welcome to ESN Satellite 2 and ESN Galaxy', 1, 1, 1190992527, 1201294102, 0, 1, 0, 0),
(12, 12, 'page', 'ESN Galaxy', 1, 1, 1190502732, 1190724448, 2, 0, 0, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- 
-- Dumping data for table `satellite2_node_comment_statistics`
-- 

INSERT INTO `satellite2_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES 
(20, 1190992527, NULL, 1, 0),
(12, 1190502732, '', 1, 0);

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

INSERT INTO `satellite2_node_field` (`field_name`, `type`, `global_settings`, `required`, `multiple`, `db_storage`) VALUES 
('field_image', 'image', 'a:0:{}', 1, 0, 1),
('field_summary', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:3:"500";s:14:"allowed_values";s:0:"";s:18:"allowed_values_php";s:0:"";}', 1, 0, 1),
('field_shortdescription', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:0:"";s:18:"allowed_values_php";s:0:"";}', 1, 0, 1),
('field_logo', 'image', 'a:0:{}', 1, 0, 1),
('field_logolink', 'link', 'a:3:{s:10:"attributes";a:3:{s:6:"target";s:7:"default";s:3:"rel";i:0;s:5:"class";s:0:"";}s:7:"display";a:1:{s:10:"url_cutoff";s:2:"80";}s:5:"title";s:8:"optional";}', 0, 0, 1);

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

INSERT INTO `satellite2_node_field_instance` (`field_name`, `type_name`, `weight`, `label`, `widget_type`, `widget_settings`, `display_settings`, `description`) VALUES 
('field_image', 'news', -2, 'Image', 'image', 'a:6:{s:14:"max_resolution";s:1:"0";s:10:"image_path";s:11:"images-news";s:10:"custom_alt";i:1;s:12:"custom_title";i:1;s:13:"teaser_preset";N;s:11:"body_preset";N;}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:1:{s:6:"format";s:9:"thumbnail";}s:4:"full";a:1:{s:6:"format";s:9:"mainimage";}}', 'Add an image. This will make your post visually more attractive.'),
('field_summary', 'news', -1, 'Summary', 'text', 'a:3:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";s:0:"";s:4:"rows";s:2:"10";}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:1:{s:6:"format";s:5:"plain";}s:4:"full";a:1:{s:6:"format";s:7:"default";}}', 'A brief description of the news content, max. 500 characters. Tip: You can easily copy and paste the first rows from the news body.'),
('field_logo', 'partner', -3, 'Logo', 'image', 'a:6:{s:14:"max_resolution";s:1:"0";s:10:"image_path";s:14:"images-partner";s:10:"custom_alt";i:1;s:12:"custom_title";i:1;s:13:"teaser_preset";N;s:11:"body_preset";N;}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:1:{s:6:"format";s:4:"logo";}s:4:"full";a:1:{s:6:"format";s:9:"mainimage";}}', 'Put here the logo of your partner. This is recommended as it will appear on your Satellite homepage!'),
('field_logolink', 'partner', 1, 'Partner website', 'link', 'a:2:{s:13:"default_value";a:1:{i:0;a:3:{s:3:"url";s:0:"";s:5:"title";s:0:"";s:10:"attributes";s:2:"N;";}}s:17:"default_value_php";s:0:"";}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"inline";}s:6:"teaser";a:1:{s:6:"format";s:5:"plain";}s:4:"full";a:1:{s:6:"format";s:5:"plain";}}', 'Put here the website of your partner.'),
('field_shortdescription', 'partner', -1, 'Short Description', 'text', 'a:3:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";s:0:"";s:4:"rows";s:1:"7";}', 'a:3:{s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:1:{s:6:"format";s:5:"plain";}s:4:"full";a:1:{s:6:"format";s:7:"default";}}', '');

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
(20, 20, 1, 'Welcome to ESN Satellite 2 and ESN Galaxy', '<div class="content">\r\n<p>\r\nESN Satellite is the free website template for ESN sections, developed and maintained by the ESN International Webteam.  \r\n</p>\r\n<h2>Be a ESN Astronaut: Install ESN Satellite for your section!</h2>\r\n<p>\r\nTry Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite. Documentation will also be available.\r\n</p>\r\n<p>\r\nESN Satellite is easy to install, but it is still a Web application and its setup is thus different from a normal program installation onyour PC. So a basic knowledge of how to install Web applications is required if you want to try it out.\r\n</p>\r\n<p>\r\nJoin the project, get ESN Satellite and start experimenting!\r\n</p>\r\n<h2>ESN Satellite Resources</h2>\r\n<p>\r\nIf you just wish to know more about the ESN Satellite but don''t want to try it right now, we have some documentation available. We expect it to be extended and improved during the beta testing phase, so please check back often. \r\n</p>\r\n<ul>\r\n		\r\n	<li><a href="http://www.esn.org/satellite">Satellite Documentation wiki</a></li>			\r\n	<li><a href="http://groups.google.com/group/esn-satellite">ESN Satellite Google Group</a></li>\r\n</ul>\r\n<h2>New in ESN Satellite 2.0</h2>\r\n<p>\r\nESN Satellite 2 comes with several new features:\r\n</p>\r\n<ul>\r\n		\r\n	<li>Multilingual interface: it supports localizing your website pages in as many languages as you wish... and, anyway, every student will be able to see the web site interface in her own language!</li>	\r\n	<li>A new &quot;control panel&quot; for faster access to the most common administration tasks.</li>	\r\n	<li>Newsletter support.</li>	\r\n	<li>Direct access to the ESN Galaxy.</li>	\r\n	<li>An improved installation process, with broader compatibility.</li>\r\n</ul>\r\n<p>\r\n&nbsp;\r\n</p>\r\n</div>\r\n<div class="content">\r\n<h2>Join the ESN Galaxy</h2>\r\n<p>\r\nCurious to see what the ESN Galaxy is? Then check it out <a href="?q=esn-galaxy">on your own Satellite website!</a> And if you are not yet of this fast growing network of Satellites, then be quick and <a href="/?q=esn-galaxy">activate your Satellite now!</a>\r\n</p>\r\n<br />\r\n</div>\r\n', '<div class="content">\r\n<p>\r\nESN Satellite is the free website template for ESN sections, developed and maintained by the ESN International Webteam.  \r\n</p>\r\n<h2>Be a ESN Astronaut: Install ESN Satellite for your section!</h2>\r\n<p>\r\nTry Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite. Documentation will also be available.\r\n</p>', '', 1201294102, 3),
(12, 12, 1, 'ESN Galaxy', '<script src="http://gmodules.com/ig/ifr?url=http://galaxy.esn.org/gadget.xml&amp;synd=open&amp;w=500&amp;h=400&amp;title=ESN+Galaxy+%7C+Discover+Erasmus&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js"></script>\r\n\r\nNot yet a part of the <a href="http://galaxy.esn.org">ESN Galaxy</a>? Then <a href="http://galaxy.esn.org/index.php/satellites/add">join now</a>!', '<script src="http://gmodules.com/ig/ifr?url=http://galaxy.esn.org/gadget.xml&amp;synd=open&amp;w=500&amp;h=400&amp;title=ESN+Galaxy+%7C+Discover+Erasmus&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js"></script>\r\n\r\nNot yet a part of the <a href="http://galaxy.esn.org">ESN Galaxy</a>? Then <a href="http://galaxy.esn.org/index.php/satellites/add">join now</a>!', '', 1190724448, 3);

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
('news', 'News', 'node', 'All your ESN related news. Posting as news will put the news item into a news page and promote a teaser (short version of your news with a small image) to your front page. Use this for all dynamic content on your site.', 'Put here the content of your news item. You have to write at least 10 words.', 1, 'Title', 1, 'Body', 10, 1, 1, 0, ''),
('partner', 'Partner', 'node', 'A partner from your ESN section, e.g. giving you ESN card discounts or sponsoring your section. Partners are grouped together and fetched in the ESN Galaxy.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, ''),
('simplenews', 'Newsletter issue', 'simplenews', 'Create a newsletter issue to be sent to subscribed e-mail addresses.', '', 1, 'Title', 1, 'Body', 0, 0, 0, 1, 'simplenews'),
('page', 'Page', 'node', 'If you want to add a static page, like a contact page or an about page, use a page.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, '');

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
(1, 'access news feeds, access comments, access site-wide contact form, access content, vote on polls, search content, subscribe to newsletters, view links in block, view uploaded files', 0),
(2, 'access news feeds, access birthdays, access comments, post comments, post comments without approval, access site-wide contact form, access content, cancel own vote, vote on polls, search content, use advanced search, sign up for content, subscribe to newsletters, view links in block, view uploaded files, access user profiles, access all views', 0),
(3, 'access news feeds, create events, edit own events, access birthdays, delete birthday, access comments, administer comments, post comments, post comments without approval, access site-wide contact form, create images, edit images, edit own images, view original images, access imce, administer menu, access content, create news content, create page content, create partner content, edit own news content, edit own partner content, edit page content, edit partner content, view revisions, cancel own vote, create polls, inspect all votes, vote on polls, search content, use advanced search, administer all signups, administer signups for own content, sign up for content, view all signups, administer newsletters, create newsletter, edit own newsletter, send newsletter, subscribe to newsletters, view links in block, access statistics, view post access counter, access tinymce, upload files, view uploaded files, access user profiles, access all views', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `satellite2_profile_fields`
-- 

INSERT INTO `satellite2_profile_fields` (`fid`, `title`, `name`, `explanation`, `category`, `page`, `type`, `weight`, `required`, `register`, `visibility`, `autocomplete`, `options`) VALUES 
(1, 'Birthday', 'profile_birthday', 'Enter your date of birth.', 'Personal information', '', 'date', 0, 1, 1, 2, 0, ''),
(2, 'Real name', 'profile_realname', 'Your real name.', 'Personal information', '', 'textfield', -5, 1, 1, 2, 0, ''),
(3, 'Home country', 'profile_homecounty', '', 'Personal information', '', 'selection', -4, 1, 1, 2, 0, 'AFGHANISTAN\r\nALBANIA\r\nALGERIA\r\nAMERICAN SAMOA\r\nANDORRA\r\nANGOLA\r\nANTIGUA AND BARBUDA\r\nARGENTINA\r\nARMENIA\r\nARUBA\r\nAUSTRALIA\r\nAUSTRIA\r\nAZERBAIJAN\r\nBAHAMAS\r\nBAHRAIN\r\nBANGLADESH\r\nBARBADOS\r\nBELARUS\r\nBELGIUM\r\nBELIZE\r\nBENIN\r\nBERMUDA\r\nBHUTAN\r\nBOLIVIA\r\nBOSNIA AND HERZEGOVINA\r\nBOTSWANA\r\nBRAZIL\r\nBRITISH INDIAN OCEAN TERRITORY\r\nBRUNEI DARUSSALAM\r\nBULGARIA\r\nBURKINA FASO\r\nBURUNDI\r\nCAMBODIA\r\nCAMEROON\r\nCANADA\r\nCAPE VERDE\r\nCAYMAN ISLANDS\r\nCENTRAL AFRICAN REPUBLIC\r\nCHAD\r\nCHILE\r\nCHINA\r\nCOLOMBIA\r\nCOMOROS\r\nCONGO\r\nCOOK ISLANDS\r\nCOSTA RICA\r\nCOTE D''IVOIRE\r\nCROATIA\r\nCUBA\r\nCYPRUS\r\nCZECH REPUBLIC\r\nDENMARK\r\nDJIBOUTI\r\nDOMINICA\r\nDOMINICAN REPUBLIC\r\nEAST TIMOR\r\nECUADOR\r\nEGYPT\r\nEL SALVADOR\r\nEQUATORIAL GUINEA\r\nERITREA\r\nESTONIA\r\nETHIOPIA\r\nFALKLAND ISLANDS (MALVINAS)\r\nFAROE ISLANDS\r\nFEDERATED STATES OF MICRONESIA\r\nFIJI\r\nFINLAND\r\nFRANCE\r\nFRENCH POLYNESIA\r\nFRENCH SOUTHERN TERRITORIES\r\nGABON\r\nGAMBIA\r\nGEORGIA\r\nGERMANY\r\nGHANA\r\nGIBRALTAR\r\nGREECE\r\nGREENLAND\r\nGRENADA\r\nGUADELOUPE\r\nGUAM\r\nGUATEMALA\r\nGUINEA\r\nGUINEA-BISSAU\r\nGUYANA\r\nHAITI\r\nHOLY SEE (VATICAN CITY STATE)\r\nHONDURAS\r\nHONG KONG\r\nHUNGARY\r\nICELAND\r\nINDIA\r\nINDONESIA\r\nIRAQ\r\nIRELAND\r\nISLAMIC REPUBLIC OF IRAN\r\nISRAEL\r\nITALY\r\nJAMAICA\r\nJAPAN\r\nJORDAN\r\nKAZAKHSTAN\r\nKENYA\r\nKIRIBATI\r\nKUWAIT\r\nKYRGYZSTAN\r\nLAO PEOPLE''S DEMOCRATIC REPUBL\r\nLATVIA\r\nLEBANON\r\nLESOTHO\r\nLIBERIA\r\nLIBYAN ARAB JAMAHIRIYA\r\nLIECHTENSTEIN\r\nLITHUANIA\r\nLUXEMBOURG\r\nMACAO\r\nMADAGASCAR\r\nMALAWI\r\nMALAYSIA\r\nMALDIVES\r\nMALI\r\nMALTA\r\nMARSHALL ISLANDS\r\nMARTINIQUE\r\nMAURITANIA\r\nMAURITIUS\r\nMEXICO\r\nMONACO\r\nMONGOLIA\r\nMOROCCO\r\nMOZAMBIQUE\r\nMYANMAR\r\nNAMIBIA\r\nNAURU\r\nNEPAL\r\nNETHERLANDS\r\nNETHERLANDS ANTILLES\r\nNEW CALEDONIA\r\nNEW ZEALAND\r\nNICARAGUA\r\nNIGER\r\nNIGERIA\r\nNORTHERN MARIANA ISLANDS\r\nNORWAY\r\nOMAN\r\nPAKISTAN\r\nPALAU\r\nPALESTINIAN TERRITORY, OCCUPIE\r\nPANAMA\r\nPAPUA NEW GUINEA\r\nPARAGUAY\r\nPERU\r\nPHILIPPINES\r\nPOLAND\r\nPORTUGAL\r\nPUERTO RICO\r\nQATAR\r\nREPUBLIC OF KOREA\r\nREPUBLIC OF MOLDOVA\r\nREUNION\r\nROMANIA\r\nRUSSIAN FEDERATION\r\nRWANDA\r\nSAINT KITTS AND NEVIS\r\nSAINT LUCIA\r\nSAINT VINCENT AND THE GRENADIN\r\nSAMOA\r\nSAN MARINO\r\nSAO TOME AND PRINCIPE\r\nSAUDI ARABIA\r\nSENEGAL\r\nSERBIA\r\nSEYCHELLES\r\nSIERRA LEONE\r\nSINGAPORE\r\nSLOVAKIA\r\nSLOVENIA\r\nSOLOMON ISLANDS\r\nSOMALIA\r\nSOUTH AFRICA\r\nSPAIN\r\nSRI LANKA\r\nSUDAN\r\nSURINAME\r\nSWAZILAND\r\nSWEDEN\r\nSWITZERLAND\r\nSYRIAN ARAB REPUBLIC\r\nTAIWAN\r\nTAJIKISTAN\r\nTHAILAND\r\nTHE DEMOCRATIC REPUBLIC OF THE\r\nTHE FORMER YUGOSLAV REPUBLIC O\r\nTOGO\r\nTOKELAU\r\nTONGA\r\nTRINIDAD AND TOBAGO\r\nTUNISIA\r\nTURKEY\r\nTURKMENISTAN\r\nTURKS AND CAICOS ISLANDS\r\nTUVALU\r\nUGANDA\r\nUKRAINE\r\nUNITED ARAB EMIRATES\r\nUNITED KINGDOM\r\nUNITED REPUBLIC OF TANZANIA\r\nUNITED STATES\r\nURUGUAY\r\nUZBEKISTAN\r\nVANUATU\r\nVENEZUELA\r\nVIET NAM\r\nVIRGIN ISLANDS, BRITISH\r\nVIRGIN ISLANDS, U.S.\r\nWESTERN SAHARA\r\nYEMEN\r\nZAMBIA\r\nZIMBABWE'),
(4, 'Gender', 'profile_gender', '', 'Personal information', '', 'selection', -2, 1, 1, 2, 0, 'Female\r\nMale');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `satellite2_role`
-- 

INSERT INTO `satellite2_role` (`rid`, `name`) VALUES 
(1, 'anonymous user'),
(2, 'authenticated user'),
(3, 'editor');

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

INSERT INTO `satellite2_search_dataset` (`sid`, `type`, `data`) VALUES 
(20, 'node', ' welcome to esn satellite 20 and esn galaxy try satellite for your section the esn international webteam is supporting interested sections willing to install the esn satellite 20 thereby joining the fast growing esn galaxy esn satellite is the free website template for esn sections developed and maintained by the esn international webteam be a esn astronaut install esn satellite for your section  try satellite for your section the esn international webteam is supporting interested sections willing to install the esn satellite documentation will also be available esn satellite is easy to install but it is still a web application and its setup is thus different from a normal program installation onyour pc so a basic knowledge of how to install web applications is required if you want to try it out join the project get esn satellite and start experimenting  esn satellite resources if you just wish to know more about the esn satellite but don t want to try it right now we have some documentation available we expect it to be extended and improved during the beta testing phase so please check back often satellite documentation wiki esn satellite google group new in esn satellite 20 esn satellite 20 comes with several new features multilingual interface it supports localizing your website pages in as many languages as you wish and anyway every student will be able to see the web site interface in her own language a new control panel for faster access to the most common administration tasks newsletter support direct access to the esn galaxy an improved installation process with broader compatibility join the esn galaxy curious to see what the esn galaxy is then check it out on your own satellite website  and if you are not yet of this fast growing network of satellites then be quick and activate your satellite now  '),
(12, 'node', ' esn galaxy not yet a part of the esn galaxy  then join now   ');

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

INSERT INTO `satellite2_search_index` (`word`, `sid`, `type`, `fromsid`, `fromtype`, `score`) VALUES 
('see', 20, 'node', 0, NULL, 1.93105),
('able', 20, 'node', 0, NULL, 1),
('student', 20, 'node', 0, NULL, 1),
('every', 20, 'node', 0, NULL, 1),
('anyway', 20, 'node', 0, NULL, 1),
('languages', 20, 'node', 0, NULL, 1),
('many', 20, 'node', 0, NULL, 1),
('pages', 20, 'node', 0, NULL, 1),
('localizing', 20, 'node', 0, NULL, 1),
('supports', 20, 'node', 0, NULL, 1),
('interface', 20, 'node', 0, NULL, 2),
('multilingual', 20, 'node', 0, NULL, 1),
('features', 20, 'node', 0, NULL, 1),
('several', 20, 'node', 0, NULL, 1),
('with', 20, 'node', 0, NULL, 1.94209),
('comes', 20, 'node', 0, NULL, 1),
('new', 20, 'node', 0, NULL, 20.989),
('group', 20, 'node', 0, NULL, 11),
('google', 20, 'node', 0, NULL, 11),
('wiki', 20, 'node', 0, NULL, 11),
('often', 20, 'node', 0, NULL, 1),
('back', 20, 'node', 0, NULL, 1),
('check', 20, 'node', 0, NULL, 1.92384),
('please', 20, 'node', 0, NULL, 1),
('phase', 20, 'node', 0, NULL, 1),
('testing', 20, 'node', 0, NULL, 1),
('beta', 20, 'node', 0, NULL, 1),
('during', 20, 'node', 0, NULL, 1),
('improved', 20, 'node', 0, NULL, 1.94583),
('extended', 20, 'node', 0, NULL, 1),
('expect', 20, 'node', 0, NULL, 1),
('some', 20, 'node', 0, NULL, 1),
('have', 20, 'node', 0, NULL, 1),
('now', 20, 'node', 0, NULL, 10.8568),
('right', 20, 'node', 0, NULL, 1),
('don', 20, 'node', 0, NULL, 1),
('about', 20, 'node', 0, NULL, 1),
('more', 20, 'node', 0, NULL, 1),
('know', 20, 'node', 0, NULL, 1),
('wish', 20, 'node', 0, NULL, 2),
('just', 20, 'node', 0, NULL, 1),
('resources', 20, 'node', 0, NULL, 19),
('experimenting', 20, 'node', 0, NULL, 1),
('start', 20, 'node', 0, NULL, 1),
('get', 20, 'node', 0, NULL, 1),
('project', 20, 'node', 0, NULL, 1),
('join', 20, 'node', 0, NULL, 18.7594),
('out', 20, 'node', 0, NULL, 1.92384),
('want', 20, 'node', 0, NULL, 2),
('you', 20, 'node', 0, NULL, 3.92384),
('required', 20, 'node', 0, NULL, 1),
('applications', 20, 'node', 0, NULL, 1),
('how', 20, 'node', 0, NULL, 1),
('knowledge', 20, 'node', 0, NULL, 1),
('basic', 20, 'node', 0, NULL, 1),
('onyour', 20, 'node', 0, NULL, 1),
('installation', 20, 'node', 0, NULL, 1.94583),
('program', 20, 'node', 0, NULL, 1),
('now', 12, 'node', 0, NULL, 11),
('join', 12, 'node', 0, NULL, 11),
('then', 12, 'node', 0, NULL, 1),
('the', 12, 'node', 0, NULL, 1),
('part', 12, 'node', 0, NULL, 1),
('normal', 20, 'node', 0, NULL, 1),
('yet', 12, 'node', 0, NULL, 1),
('galaxy', 12, 'node', 0, NULL, 37),
('from', 20, 'node', 0, NULL, 1),
('not', 12, 'node', 0, NULL, 1),
('esn', 12, 'node', 0, NULL, 37),
('different', 20, 'node', 0, NULL, 1),
('thus', 20, 'node', 0, NULL, 1),
('setup', 20, 'node', 0, NULL, 1),
('its', 20, 'node', 0, NULL, 1),
('application', 20, 'node', 0, NULL, 1),
('web', 20, 'node', 0, NULL, 3),
('still', 20, 'node', 0, NULL, 1),
('but', 20, 'node', 0, NULL, 2),
('easy', 20, 'node', 0, NULL, 1),
('available', 20, 'node', 0, NULL, 2),
('also', 20, 'node', 0, NULL, 1),
('will', 20, 'node', 0, NULL, 2),
('documentation', 20, 'node', 0, NULL, 13),
('astronaut', 20, 'node', 0, NULL, 19),
('maintained', 20, 'node', 0, NULL, 1),
('developed', 20, 'node', 0, NULL, 1),
('template', 20, 'node', 0, NULL, 1),
('website', 20, 'node', 0, NULL, 12.1622),
('free', 20, 'node', 0, NULL, 1),
('growing', 20, 'node', 0, NULL, 1.90974),
('fast', 20, 'node', 0, NULL, 1.90974),
('joining', 20, 'node', 0, NULL, 1),
('thereby', 20, 'node', 0, NULL, 1),
('install', 20, 'node', 0, NULL, 23),
('willing', 20, 'node', 0, NULL, 2),
('sections', 20, 'node', 0, NULL, 3),
('interested', 20, 'node', 0, NULL, 2),
('supporting', 20, 'node', 0, NULL, 2),
('webteam', 20, 'node', 0, NULL, 3),
('international', 20, 'node', 0, NULL, 3),
('the', 20, 'node', 0, NULL, 31.6055),
('section', 20, 'node', 0, NULL, 21),
('your', 20, 'node', 0, NULL, 42.0191),
('for', 20, 'node', 0, NULL, 22.9809),
('try', 20, 'node', 0, NULL, 4),
('galaxy', 20, 'node', 0, NULL, 46.6326),
('and', 20, 'node', 0, NULL, 32.8233),
('20', 20, 'node', 0, NULL, 47),
('satellite', 20, 'node', 0, NULL, 134.019),
('esn', 20, 'node', 0, NULL, 170.633),
('welcome', 20, 'node', 0, NULL, 26),
('site', 20, 'node', 0, NULL, 1),
('her', 20, 'node', 0, NULL, 1),
('own', 20, 'node', 0, NULL, 11.1595),
('language', 20, 'node', 0, NULL, 0.993146),
('control', 20, 'node', 0, NULL, 0.989021),
('panel', 20, 'node', 0, NULL, 0.98493),
('faster', 20, 'node', 0, NULL, 0.980874),
('access', 20, 'node', 0, NULL, 1.92268),
('most', 20, 'node', 0, NULL, 0.972861),
('common', 20, 'node', 0, NULL, 0.968904),
('administration', 20, 'node', 0, NULL, 0.96498),
('tasks', 20, 'node', 0, NULL, 0.961087),
('newsletter', 20, 'node', 0, NULL, 0.957226),
('support', 20, 'node', 0, NULL, 0.953396),
('direct', 20, 'node', 0, NULL, 0.949597),
('process', 20, 'node', 0, NULL, 0.945829),
('broader', 20, 'node', 0, NULL, 0.942091),
('compatibility', 20, 'node', 0, NULL, 0.938382),
('curious', 20, 'node', 0, NULL, 0.934703),
('what', 20, 'node', 0, NULL, 0.931053),
('then', 20, 'node', 0, NULL, 1.83029),
('are', 20, 'node', 0, NULL, 0.923838),
('not', 20, 'node', 0, NULL, 0.920273),
('yet', 20, 'node', 0, NULL, 0.916736),
('this', 20, 'node', 0, NULL, 0.913226),
('network', 20, 'node', 0, NULL, 0.909743),
('satellites', 20, 'node', 0, NULL, 0.906287),
('quick', 20, 'node', 0, NULL, 0.902857),
('activate', 20, 'node', 0, NULL, 9.89399);

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

INSERT INTO `satellite2_search_total` (`word`, `count`) VALUES 
('astronaut', 0.0222764),
('satellite', 0.00322851),
('the', 0.0131195),
('satellites', 0.30103),
('network', 0.30103),
('install', 0.0184834),
('normal', 0.30103),
('different', 0.30103),
('sections', 0.124939),
('application', 0.30103),
('and', 0.0130337),
('program', 0.30103),
('from', 0.30103),
('still', 0.30103),
('website', 0.0343163),
('your', 0.0102146),
('webteam', 0.124939),
('interested', 0.176091),
('welcome', 0.0163904),
('not', 0.18206),
('basic', 0.30103),
('its', 0.30103),
('also', 0.30103),
('project', 0.30103),
('template', 0.30103),
('multilingual', 0.30103),
('available', 0.176091),
('thus', 0.30103),
('esn', 0.00208663),
('knowledge', 0.30103),
('willing', 0.176091),
('thereby', 0.30103),
('developed', 0.30103),
('try', 0.09691),
('maintained', 0.30103),
('several', 0.30103),
('fast', 0.18288),
('start', 0.30103),
('supports', 0.30103),
('quick', 0.30103),
('activate', 0.0418155),
('will', 0.176091),
('curious', 0.30103),
('onyour', 0.30103),
('section', 0.0202034),
('see', 0.18123),
('what', 0.30103),
('for', 0.0184985),
('supporting', 0.176091),
('new', 0.0202137),
('international', 0.124939),
('own', 0.0372709),
('growing', 0.18288),
('comes', 0.30103),
('this', 0.30103),
('are', 0.30103),
('with', 0.180387),
('joining', 0.30103),
('interface', 0.176091),
('easy', 0.30103),
('features', 0.30103),
('web', 0.124939),
('documentation', 0.0321847),
('free', 0.30103),
('setup', 0.30103),
('20', 0.00914338),
('installation', 0.180103),
('galaxy', 0.00516208),
('how', 0.30103),
('yet', 0.182335),
('part', 0.30103),
('then', 0.131401),
('join', 0.0143537),
('now', 0.0194288),
('but', 0.176091),
('applications', 0.30103),
('required', 0.30103),
('you', 0.0985927),
('want', 0.176091),
('out', 0.181785),
('get', 0.30103),
('experimenting', 0.30103),
('able', 0.30103),
('please', 0.30103),
('resources', 0.0222764),
('just', 0.30103),
('wish', 0.176091),
('know', 0.30103),
('more', 0.30103),
('about', 0.30103),
('don', 0.30103),
('right', 0.30103),
('have', 0.30103),
('some', 0.30103),
('expect', 0.30103),
('extended', 0.30103),
('improved', 0.180103),
('during', 0.30103),
('beta', 0.30103),
('testing', 0.30103),
('phase', 0.30103),
('check', 0.181785),
('back', 0.30103),
('often', 0.30103),
('wiki', 0.0377886),
('google', 0.0377886),
('group', 0.0377886),
('localizing', 0.30103),
('pages', 0.30103),
('many', 0.30103),
('languages', 0.30103),
('anyway', 0.30103),
('every', 0.30103),
('student', 0.30103),
('site', 0.30103),
('her', 0.30103),
('language', 0.30103),
('control', 0.30103),
('panel', 0.30103),
('faster', 0.30103),
('access', 0.181874),
('most', 0.30103),
('common', 0.30103),
('administration', 0.30103),
('tasks', 0.30103),
('newsletter', 0.30103),
('support', 0.30103),
('direct', 0.30103),
('process', 0.30103),
('broader', 0.30103),
('compatibility', 0.30103);

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
('satellite2_users_uid', 3),
('satellite2_menu_mid', 103),
('satellite2_view_view_vid', 3),
('satellite2_node_nid', 23),
('satellite2_node_revisions_vid', 23),
('satellite2_files_fid', 32),
('satellite2_imagecache_preset_presetid', 3),
('satellite2_imagecache_action_actionid', 3),
('satellite2_aggregator_feed_fid', 1),
('satellite2_aggregator_item_iid', 878),
('satellite2_vocabulary_vid', 1),
('satellite2_term_data_tid', 1),
('satellite2_i18n_node_trid', 1),
('satellite2_comments_cid', 1);

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

INSERT INTO `satellite2_sessions` (`uid`, `sid`, `hostname`, `timestamp`, `cache`, `session`) VALUES 
(1, 'd085b58618ec4020fb6edcaa21739b06', '62.218.228.5', 1193026730, 0, ''),
(1, '73ee66e3e3f635434fe6f1d7fe2cf465', '134.184.84.139', 1193045608, 0, 'form|a:4:{s:32:"5f36e78a5d56c012dd83d8f7b98edd52";a:2:{s:9:"timestamp";i:1193043799;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"356cf94e19defbe850ed7d2a3f7bbf87";a:2:{s:9:"timestamp";i:1193043831;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"fa3285f4e70ed76a9f7c281d83c5e18a";a:2:{s:9:"timestamp";i:1193043839;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"067bdf3c80aa94f910bcb047c60ca4ad";a:2:{s:9:"timestamp";i:1193043852;s:4:"args";a:1:{i:0;s:14:"system_modules";}}}'),
(1, 'be63192e0a9fbb82e4a46cce107716e5', '83.184.100.68', 1201294183, 0, 'form|a:6:{s:32:"07e82b161b9aa37359ff7a7940e0e65f";a:2:{s:9:"timestamp";i:1201284267;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"0379ed652de52471d429f29a0b2cc569";a:2:{s:9:"timestamp";i:1201284272;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"762add894884ac74e839b72c526c88ef";a:2:{s:9:"timestamp";i:1201292293;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"ce5b76213eb5bada02dbbd081066735c";a:2:{s:9:"timestamp";i:1201292305;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"336513be7e18693f6810d6e1c315d256";a:2:{s:9:"timestamp";i:1201292313;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"ae1f0a5b5257f102bf1c5adec602b99c";a:2:{s:9:"timestamp";i:1201292332;s:4:"args";a:1:{i:0;s:14:"system_modules";}}}update_remaining|a:0:{}update_total|i:1;'),
(1, '874a90f9268c5dd3a48d6b5a58ddfeb5', '83.184.100.68', 1201284340, 0, '');

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
-- Table structure for table `satellite2_simplenews_newsletters`
-- 

CREATE TABLE `satellite2_simplenews_newsletters` (
  `nid` int(10) NOT NULL default '0',
  `tid` int(10) NOT NULL default '0',
  `s_status` int(2) NOT NULL default '0',
  `s_format` varchar(8) NOT NULL default '',
  `priority` int(2) NOT NULL default '0',
  `receipt` int(2) NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `satellite2_system`
-- 

INSERT INTO `satellite2_system` (`filename`, `name`, `type`, `description`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`) VALUES 
('themes/engines/phptemplate/phptemplate.engine', 'phptemplate', 'theme_engine', '', 1, 0, 0, -1, 0),
('sites/all/modules/imagecache/imagecache.module', 'imagecache', 'module', 'Dynamic image manipulator and cache.', 1, 0, 0, 3, 0),
('modules/system/system.module', 'system', 'module', 'Handles general site configuration for administrators.', 1, 0, 0, 1022, 0),
('modules/aggregator/aggregator.module', 'aggregator', 'module', 'Aggregates syndicated content (RSS, RDF, and Atom feeds).', 1, 0, 0, 0, 0),
('sites/all/modules/event/contrib/basicevent.module', 'basicevent', 'module', 'A story-like node that implements the event API automatically.', 1, 0, 0, 0, 0),
('modules/block/block.module', 'block', 'module', 'Controls the boxes that are displayed around the main content.', 1, 0, 0, 0, 0),
('modules/blog/blog.module', 'blog', 'module', 'Enables keeping easily and regularly updated user web pages or blogs.', 0, 0, 0, -1, 0),
('modules/blogapi/blogapi.module', 'blogapi', 'module', 'Allows users to post content using applications that support XML-RPC blog APIs.', 0, 0, 0, -1, 0),
('modules/book/book.module', 'book', 'module', 'Allows users to collaboratively author a book.', 0, 0, 0, -1, 0),
('modules/color/color.module', 'color', 'module', 'Allows the user to change the color scheme of certain themes.', 1, 0, 0, 0, 0),
('modules/comment/comment.module', 'comment', 'module', 'Allows users to comment on and discuss published content.', 1, 0, 0, 1, 0),
('modules/contact/contact.module', 'contact', 'module', 'Enables the use of both personal and site-wide contact forms.', 1, 0, 0, 0, 0),
('sites/all/modules/cck/content.module', 'content', 'module', 'Allows administrators to define new content types.', 1, 0, 1, 1008, 0),
('sites/all/modules/cck/content_copy.module', 'content_copy', 'module', 'Enables ability to import/export field definitions.', 1, 0, 0, 0, 0),
('modules/drupal/drupal.module', 'drupal', 'module', 'Lets you register your site with a central server and improve ranking of Drupal projects by posting information on your installed modules and themes', 0, 0, 0, -1, 0),
('sites/all/modules/event/event.module', 'event', 'module', 'Calendaring API, calendar display and export', 1, 0, 0, 2, 0),
('sites/all/modules/event/contrib/event_all_day/event_all_day.module', 'event_all_day', 'module', 'Allows creation of all-day events.', 1, 0, 0, 0, 0),
('sites/all/modules/event/contrib/event_views/event_views.module', 'event_views', 'module', 'Views-enables the event fields and creates default event views.', 1, 0, 0, 0, 0),
('sites/all/modules/cck/fieldgroup.module', 'fieldgroup', 'module', 'Create field groups for CCK fields.', 1, 0, 0, 4, 9),
('modules/filter/filter.module', 'filter', 'module', 'Handles the filtering of content in preparation for display.', 1, 0, 0, 0, 0),
('modules/forum/forum.module', 'forum', 'module', 'Enables threaded discussions about general topics.', 0, 0, 0, -1, 0),
('modules/help/help.module', 'help', 'module', 'Manages the display of online help.', 1, 0, 0, 0, 0),
('sites/all/modules/iconify/iconify.module', 'iconify', 'module', 'this module adds icons/graphix in the admin baby :]', 1, 0, 0, 0, 0),
('sites/all/modules/image/image.module', 'image', 'module', 'Allows uploading, resizing and viewing of images.', 1, 0, 0, 5, 0),
('sites/all/modules/image/contrib/image_attach/image_attach.module', 'image_attach', 'module', 'Allows easy attaching of image nodes to other content types.', 0, 0, 0, -1, 0),
('sites/all/modules/image/contrib/image_gallery/image_gallery.module', 'image_gallery', 'module', 'Allows sorting and displaying of image galleries based on categories.', 0, 0, 0, -1, 0),
('sites/all/modules/image/contrib/image_import/image_import.module', 'image_import', 'module', 'Allows batches of images to be imported from a directory on the server.', 0, 0, 0, -1, 0),
('sites/all/modules/imagefield/imagefield.module', 'imagefield', 'module', 'Defines an image field type.', 1, 0, 0, 2, 0),
('sites/all/modules/imce/imce.module', 'imce', 'module', 'An image/file uploader and browser supporting personal directories and user quota.', 1, 0, 0, 0, 0),
('sites/all/modules/img_assist/img_assist.module', 'img_assist', 'module', 'This module allows users to upload and insert inline images into posts. It automatically generates an Add image link under the textarea fields of your choice.', 0, 0, 0, 1, 0),
('modules/legacy/legacy.module', 'legacy', 'module', 'Provides legacy handlers for upgrades from older Drupal installations.', 0, 0, 0, -1, 0),
('sites/all/modules/link/link.module', 'link', 'module', 'Defines simple link field types.', 1, 0, 0, 1, 0),
('modules/locale/locale.module', 'locale', 'module', 'Enables the translation of the user interface to languages other than English.', 1, 0, 0, 0, 0),
('modules/menu/menu.module', 'menu', 'module', 'Allows administrators to customize the site navigation menu.', 1, 0, 0, 0, 0),
('sites/all/modules/menutree/menutree.module', 'menutree', 'module', 'Display a site-map page based on one or more menus', 1, 0, 0, 0, 0),
('modules/node/node.module', 'node', 'module', 'Allows content to be submitted to the site and displayed on pages.', 1, 0, 0, 0, 0),
('sites/all/modules/cck/nodereference.module', 'nodereference', 'module', 'Defines a field type for referencing one node from another.', 1, 0, 0, 3, 0),
('sites/all/modules/cck/number.module', 'number', 'module', 'Defines numeric field types.', 1, 0, 0, 5, 0),
('sites/all/modules/cck/optionwidgets.module', 'optionwidgets', 'module', 'Defines selection, check box and radio button widgets for text and numeric fields.', 1, 0, 0, 1, 0),
('modules/path/path.module', 'path', 'module', 'Allows users to rename URLs.', 1, 0, 0, 0, 0),
('sites/all/modules/pathauto/pathauto.module', 'pathauto', 'module', 'Provides a mechanism for modules to automatically generate aliases for the content they manage.', 1, 0, 0, 4, 1),
('modules/ping/ping.module', 'ping', 'module', 'Alerts other sites when your site has been updated.', 0, 0, 0, -1, 0),
('modules/poll/poll.module', 'poll', 'module', 'Allows your site to capture votes on different topics in the form of multiple choice questions.', 1, 0, 0, 0, 0),
('modules/profile/profile.module', 'profile', 'module', 'Supports configurable user profiles.', 1, 0, 0, 0, 0),
('modules/search/search.module', 'search', 'module', 'Enables site-wide keyword searching.', 1, 0, 0, 0, 0),
('sites/all/modules/signup/signup.module', 'signup', 'module', 'Allow users to sign up for content (especially events).', 1, 0, 0, 4, 0),
('sites/all/modules/simplemenu/simplemenu.module', 'simplemenu', 'module', 'Creates a menu bar that is displayed at the top of every page.', 1, 0, 0, 0, 0),
('modules/statistics/statistics.module', 'statistics', 'module', 'Logs access statistics for your site.', 1, 0, 1, 1000, 0),
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', 'Enables the categorization of content.', 1, 0, 0, 0, 0),
('sites/all/modules/cck/text.module', 'text', 'module', 'Defines simple text field types.', 1, 0, 0, 5, 0),
('modules/throttle/throttle.module', 'throttle', 'module', 'Handles the auto-throttling mechanism, to control site congestion.', 0, 0, 0, 0, 0),
('sites/all/modules/tinymce/tinymce.module', 'tinymce', 'module', 'The most popular WYSIWYG editor for advanced content editing.', 1, 0, 0, 1, 0),
('modules/tracker/tracker.module', 'tracker', 'module', 'Enables tracking of recent posts for users.', 1, 0, 0, 0, 0),
('modules/upload/upload.module', 'upload', 'module', 'Allows users to upload and attach files to content.', 1, 0, 0, 0, 0),
('modules/user/user.module', 'user', 'module', 'Manages the user registration and login system.', 1, 0, 0, 0, 0),
('sites/all/modules/cck/userreference.module', 'userreference', 'module', 'Defines a field type for referencing a user from a node.', 1, 0, 0, 4, 0),
('sites/all/modules/views/views.module', 'views', 'module', 'The views module creates customized views of node lists.', 1, 0, 0, 16, 10),
('sites/all/modules/views/views_rss.module', 'views_rss', 'module', 'RSS plugin for the views feed selector argument.', 1, 0, 0, 0, 0),
('sites/all/modules/views/views_theme_wizard.module', 'views_theme_wizard', 'module', 'The views theme wizard helps create stub theming for views.', 1, 0, 0, 0, 0),
('sites/all/modules/views/views_ui.module', 'views_ui', 'module', 'The Views UI module allows you to create and edit views.', 1, 0, 0, 0, 0),
('modules/watchdog/watchdog.module', 'watchdog', 'module', 'Logs and records system events.', 1, 0, 0, 0, 0),
('sites/all/modules/update_status/update_status.module', 'update_status', 'module', 'Checks to see if your installation of Drupal and its modules are up to date.', 1, 0, 0, 5202, 0),
('themes/garland/minnelli/style.css', 'minnelli', 'theme', 'themes/garland/page.tpl.php', 0, 0, 0, -1, 0),
('themes/chameleon/marvin/style.css', 'marvin', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0),
('sites/all/themes/custom/esntheme/page.tpl.php', 'esntheme', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0),
('themes/bluemarine/page.tpl.php', 'bluemarine', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0),
('themes/pushbutton/page.tpl.php', 'pushbutton', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0),
('themes/garland/page.tpl.php', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0),
('themes/chameleon/chameleon.theme', 'chameleon', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0),
('sites/all/modules/poormanscron/poormanscron.module', 'poormanscron', 'module', 'Internal scheduler for users without a cron application.', 1, 0, 1, 0, 0),
('modules/profile_wizard/profile_wizard.module', 'profile_wizard', 'module', 'This module will dump a Drupal profile straight from the database. It needs editing, but will constitute a good start.', 1, 0, 0, 0, 0),
('sites/all/modules/install_profile_api/install_profile_wizard/install_profile_wizard.module', 'install_profile_wizard', 'module', 'This module will dump a Drupal installation profile straight from the database in a textarea. It needs editing, but will constitute a good start.', 0, 0, 0, -1, 0),
('sites/all/modules/birthdays/birthdays.module', 'birthdays', 'module', 'Displays and reminds of upcoming users birthdays.', 1, 0, 0, 1, -1),
('sites/all/modules/simplenews/simplenews.module', 'simplenews', 'module', 'Send newsletters to subscribed e-mail addresses.', 1, 0, 0, 5000, 0),
('sites/all/modules/i18n/i18n.module', 'i18n', 'module', 'Enables multilingual content.', 0, 0, 0, 8, -10),
('sites/all/modules/i18n/i18nblocks/i18nblocks.module', 'i18nblocks', 'module', 'Enables multilingual blocks.', 0, 0, 0, -1, 0),
('sites/all/modules/i18n/experimental/i18ncontent.module', 'i18ncontent', 'module', 'Translates content type parameters.', 0, 0, 0, -1, 0),
('sites/all/modules/i18n/contrib/i18nmenu.module', 'i18nmenu', 'module', 'Supports translatable custom menu items.', 0, 0, 0, -1, 0),
('sites/all/modules/i18n/i18nprofile/i18nprofile.module', 'i18nprofile', 'module', 'Enables multilingual profile fields.', 0, 0, 0, -1, 0),
('sites/all/modules/i18n/experimental/i18nstrings.module', 'i18nstrings', 'module', 'Translatable strings.', 0, 0, 0, -1, 0),
('sites/all/modules/i18n/experimental/i18nsync.module', 'i18nsync', 'module', 'Synchronizes translations', 0, 0, 0, -1, 0),
('sites/all/modules/i18n/contrib/i18ntaxonomy.module', 'i18ntaxonomy', 'module', 'Translates taxonomy terms using localization system.', 0, 0, 0, -1, 0),
('sites/all/modules/i18n/i18nviews/i18nviews.module', 'i18nviews', 'module', 'Views support for i18n', 0, 0, 0, -1, 0),
('sites/all/modules/i18n/translation/translation.module', 'translation', 'module', 'Manages translations between nodes and taxonomy terms.', 0, 0, 0, 0, 10),
('sites/all/modules/i18n/experimental/ttext.module', 'ttext', 'module', 'CCK translatable text field', 0, 0, 0, -1, 0),
('profiles/esnsatellite/modules/shoutbox/shoutbox.module', 'shoutbox', 'module', 'This module enables you to display a shoutbox block.', 0, 0, 0, 0, 0),
('sites/all/modules/custom/custom.module', 'custom', 'module', 'Customizations for this ESN Satellite', 1, 0, 0, 0, 0),
('sites/all/modules/token/token.module', 'token', 'module', 'Provides a shared API for replacement of textual placeholders with actual data.', 1, 0, 1, 1, 10),
('sites/all/modules/google_analytics/googleanalytics.module', 'googleanalytics', 'module', 'Adds Google Analytics javascript tracking code to all your site''s pages.', 0, 0, 0, -1, 0),
('sites/all/modules/image/contrib/image_im_advanced/image_im_advanced.module', 'image_im_advanced', 'module', 'Adds advanced options to the ImageMagick image toolkit.', 0, 0, 0, -1, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_term_data`
-- 

INSERT INTO `satellite2_term_data` (`tid`, `vid`, `name`, `description`, `weight`, `language`, `trid`) VALUES 
(1, 1, 'ESN Satellite newsletter', '', 0, '', 0);

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

INSERT INTO `satellite2_term_hierarchy` (`tid`, `parent`) VALUES 
(1, 0);

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
('Satellite Default', 3);

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
('Satellite Default', 'a:28:{s:8:"old_name";s:17:"Satellite Default";s:4:"name";s:17:"Satellite Default";s:4:"rids";a:1:{i:3;s:1:"3";}s:7:"default";s:4:"true";s:11:"user_choose";s:4:"true";s:11:"show_toggle";s:4:"true";s:5:"theme";s:8:"advanced";s:8:"language";s:2:"en";s:14:"safari_message";s:5:"false";s:6:"access";s:1:"1";s:12:"access_pages";s:25:"node/*\r\nuser/*\r\ncomment/*";s:7:"buttons";a:15:{s:12:"default-bold";s:1:"1";s:14:"default-italic";s:1:"1";s:17:"default-underline";s:1:"1";s:19:"default-justifyleft";s:1:"1";s:21:"default-justifycenter";s:1:"1";s:20:"default-justifyright";s:1:"1";s:19:"default-justifyfull";s:1:"1";s:15:"default-bullist";s:1:"1";s:15:"default-numlist";s:1:"1";s:12:"default-link";s:1:"1";s:14:"default-unlink";s:1:"1";s:13:"default-image";s:1:"1";s:12:"default-code";s:1:"1";s:17:"emotions-emotions";s:1:"1";s:21:"fullscreen-fullscreen";s:1:"1";}s:11:"toolbar_loc";s:3:"top";s:13:"toolbar_align";s:6:"center";s:8:"path_loc";s:6:"bottom";s:8:"resizing";s:4:"true";s:13:"block_formats";s:31:"p,address,pre,h1,h2,h3,h4,h5,h6";s:11:"verify_html";s:4:"true";s:12:"preformatted";s:5:"false";s:22:"convert_fonts_to_spans";s:4:"true";s:17:"remove_linebreaks";s:4:"true";s:23:"apply_source_formatting";s:4:"true";s:11:"css_setting";s:4:"self";s:8:"css_path";s:46:"sites/all/themes/custom/esntheme/satellite.css";s:11:"css_classes";s:0:"";s:2:"op";s:14:"Update profile";s:10:"form_token";s:32:"474fd974388858bbd6a3be974d44a41e";s:7:"form_id";s:26:"tinymce_profile_form_build";}');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

-- 
-- Dumping data for table `satellite2_url_alias`
-- 

INSERT INTO `satellite2_url_alias` (`pid`, `src`, `dst`) VALUES 
(102, 'node/20', 'welcome-esn-satellite-2-and-esn-galaxy'),
(2, 'node/1/feed', 'test-item/feed'),
(95, 'node/23/', 'esn/feed'),
(4, 'node/2/feed', 'editor-news-item/feed'),
(6, 'node/3/feed', 'cnd-winterthur/feed'),
(74, 'node/20/', 'welcome-esn-satellite-2.0/feed'),
(8, 'node/6/feed', 'skyeurope/feed'),
(100, 'node/20/', 'welcome-esn-satellite-2-0-and-esn-galaxy/feed'),
(10, 'node/5/feed', 'another-news-test/feed'),
(12, 'node/7/feed', 'bodrum-turkiye/feed'),
(14, 'node/8/feed', 'test-event/feed'),
(16, 'node/9/feed', 'esn-international/feed'),
(31, 'node/12', 'esn-galaxy'),
(32, 'node/12/feed', 'esn-galaxy/feed'),
(33, 'node/13', 'final-test-event'),
(37, 'node/13/feed', 'final-test-event/feed'),
(35, 'user/1', 'user/admin'),
(36, 'user/1/track', 'user/admin/track'),
(40, 'node/14/feed', 'etst-event/feed'),
(41, 'node/15', 'test-image'),
(42, 'node/15/feed', 'test-image/feed'),
(43, 'node/16', 'news-event-item'),
(44, 'node/16/feed', 'news-event-item/feed'),
(45, 'node/17', 'etst-news'),
(46, 'node/17/feed', 'etst-news/feed'),
(77, 'node/20/', 'welcome-esn-galaxy/feed'),
(51, 'node/18/feed', 'test-partner/feed'),
(53, 'node/19/feed', 'example-poll/feed'),
(103, 'node/20/', 'welcome-esn-satellite-2-and-esn-galaxy/feed'),
(104, 'taxonomy/term/1', 'newsletter/esnsatellite20newsletter');

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
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', 0, 0, 0, '', '', 1187592689, 1201294183, 1201284339, 1, NULL, 'en', '', '', 'a:3:{s:7:"contact";i:0;s:14:"picture_delete";s:0:"";s:14:"picture_upload";s:0:"";}');

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

INSERT INTO `satellite2_users_roles` (`uid`, `rid`) VALUES 
(1, 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `satellite2_variable`
-- 

CREATE TABLE `satellite2_variable` (
  `name` varchar(128) NOT NULL default '',
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
('statistics_day_timestamp', 'i:1201282712;'),
('file_directory_temp', 's:4:"/tmp";'),
('cron_last', 'i:1201292322;'),
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
('site_mail', 's:39:"change-this-email-address@satellite.org";'),
('site_slogan', 's:16:"Join the Galaxy!";'),
('site_mission', 's:0:"";'),
('site_footer', 's:359:"Powered by <b>ESN Satellite 2</b> - 2005-2008\r\n<a href="http://satellite.esn.org" target="_blank">\r\n<img src="sites/all/themes/custom/esntheme/img/ESN.satellite.power.png" style="display: inline;"/></a>&nbsp;\r\n<a href="http://galaxy.esn.org" target="_blank">\r\n<img src="sites/all/themes/custom/esntheme/img/ESN.galaxy.power.png" style="display: inline;"/></a>";'),
('anonymous', 's:9:"Anonymous";'),
('site_frontpage', 's:4:"home";'),
('theme_esntheme_settings', 'a:16:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:0;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:0;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:0;s:12:"favicon_path";s:49:"/sites/all/themes/custom/esntheme/img/favicon.ico";s:14:"favicon_upload";s:0:"";s:2:"op";s:18:"Save configuration";s:10:"form_token";s:32:"064276ddcf117c44d58df8113922aea4";}'),
('event_range_prev', 'N;'),
('theme_garland_settings', 'a:20:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:0;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:0;s:12:"favicon_path";s:49:"/sites/all/themes/custom/esntheme/img/favicon.ico";s:14:"favicon_upload";s:0:"";s:2:"op";s:18:"Save configuration";s:10:"form_token";s:32:"064276ddcf117c44d58df8113922aea4";s:6:"scheme";s:39:"#0072b9,#027ac6,#2385c2,#5ab5ee,#494949";s:7:"palette";a:5:{s:4:"base";s:7:"#0072b9";s:4:"link";s:7:"#027ac6";s:3:"top";s:7:"#2385c2";s:6:"bottom";s:7:"#5ab5ee";s:4:"text";s:7:"#494949";}s:5:"theme";s:7:"garland";s:4:"info";a:9:{s:7:"schemes";a:16:{s:39:"#0072b9,#027ac6,#2385c2,#5ab5ee,#494949";s:21:"Blue Lagoon (Default)";s:39:"#464849,#2f416f,#2a2b2d,#5d6779,#494949";s:3:"Ash";s:39:"#55c0e2,#000000,#085360,#007e94,#696969";s:10:"Aquamarine";s:39:"#d5b048,#6c420e,#331900,#971702,#494949";s:17:"Belgian Chocolate";s:39:"#3f3f3f,#336699,#6598cb,#6598cb,#000000";s:10:"Bluemarine";s:39:"#d0cb9a,#917803,#efde01,#e6fb2d,#494949";s:12:"Citrus Blast";s:39:"#0f005c,#434f8c,#4d91ff,#1a1575,#000000";s:8:"Cold Day";s:39:"#c9c497,#0c7a00,#03961e,#7be000,#494949";s:9:"Greenbeam";s:39:"#ffe23d,#a9290a,#fc6d1d,#a30f42,#494949";s:11:"Mediterrano";s:39:"#788597,#3f728d,#a9adbc,#d4d4d4,#707070";s:7:"Mercury";s:39:"#5b5fa9,#5b5faa,#0a2352,#9fa8d5,#494949";s:9:"Nocturnal";s:39:"#7db323,#6a9915,#b5d52a,#7db323,#191a19";s:6:"Olivia";s:39:"#12020b,#1b1a13,#f391c6,#f41063,#898080";s:12:"Pink Plastic";s:39:"#b7a0ba,#c70000,#a1443a,#f21107,#515d52";s:12:"Shiny Tomato";s:39:"#18583d,#1b5f42,#34775a,#52bf90,#2d2d2d";s:8:"Teal Top";s:0:"";s:6:"Custom";}s:4:"copy";a:3:{i:0;s:25:"images/menu-collapsed.gif";i:1;s:24:"images/menu-expanded.gif";i:2;s:20:"images/menu-leaf.gif";}s:8:"gradient";a:4:{i:0;i:0;i:1;i:37;i:2;i:760;i:3;i:121;}s:4:"fill";a:2:{s:4:"base";a:4:{i:0;i:0;i:1;i:0;i:2;i:760;i:3;i:568;}s:4:"link";a:4:{i:0;i:107;i:1;i:533;i:2;i:41;i:3;i:23;}}s:6:"slices";a:13:{s:15:"images/body.png";a:4:{i:0;i:0;i:1;i:37;i:2;i:1;i:3;i:280;}s:17:"images/bg-bar.png";a:4:{i:0;i:202;i:1;i:530;i:2;i:76;i:3;i:14;}s:23:"images/bg-bar-white.png";a:4:{i:0;i:202;i:1;i:506;i:2;i:76;i:3;i:14;}s:17:"images/bg-tab.png";a:4:{i:0;i:107;i:1;i:533;i:2;i:41;i:3;i:23;}s:24:"images/bg-navigation.png";a:4:{i:0;i:0;i:1;i:0;i:2;i:7;i:3;i:37;}s:26:"images/bg-content-left.png";a:4:{i:0;i:40;i:1;i:117;i:2;i:50;i:3;i:352;}s:27:"images/bg-content-right.png";a:4:{i:0;i:510;i:1;i:117;i:2;i:50;i:3;i:352;}s:21:"images/bg-content.png";a:4:{i:0;i:299;i:1;i:117;i:2;i:7;i:3;i:200;}s:29:"images/bg-navigation-item.png";a:4:{i:0;i:32;i:1;i:37;i:2;i:17;i:3;i:12;}s:35:"images/bg-navigation-item-hover.png";a:4:{i:0;i:54;i:1;i:37;i:2;i:17;i:3;i:12;}s:25:"images/gradient-inner.png";a:4:{i:0;i:646;i:1;i:307;i:2;i:112;i:3;i:42;}s:8:"logo.png";a:4:{i:0;i:622;i:1;i:51;i:2;i:64;i:3;i:73;}s:14:"screenshot.png";a:4:{i:0;i:0;i:1;i:37;i:2;i:400;i:3;i:240;}}s:12:"blend_target";s:7:"#ffffff";s:13:"preview_image";s:17:"color/preview.png";s:11:"preview_css";s:17:"color/preview.css";s:10:"base_image";s:14:"color/base.png";}}'),
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
('upload_usersize_2', 's:1:"5";'),
('update_access_fixed', 'b:1;'),
('date_default_timezone', 's:1:"0";'),
('configurable_timezones', 's:1:"0";'),
('date_format_short', 's:11:"d/m/Y - H:i";'),
('date_format_medium', 's:14:"D, d/m/Y - H:i";'),
('date_format_long', 's:15:"l, F j, Y - H:i";'),
('date_first_day', 's:1:"1";'),
('node_rank_comments', 's:1:"5";'),
('node_rank_recent', 's:1:"5";'),
('node_rank_relevance', 's:1:"5";'),
('overlap_cjk', 'i:1;'),
('minimum_word_size', 's:1:"3";'),
('search_cron_limit', 's:3:"100";'),
('wipe', 's:13:"Re-index site";'),
('node_cron_last', 's:10:"1191082431";'),
('node_cron_last_nid', 's:2:"20";'),
('site_name', 's:15:"ESN Satellite 2";'),
('poormanscron_lastrun', 'i:1201292294;'),
('update_status_last', 'i:1201284302;'),
('poormanscron_interval', 's:2:"60";'),
('poormanscron_retry_interval', 's:2:"10";'),
('poormanscron_log_cron_runs', 's:1:"1";'),
('poormanscron_log_progress', 's:1:"0";'),
('clean_url', 's:1:"0";'),
('birthdays_field_name', 's:16:"profile_birthday";'),
('birthdays_field_id', 's:1:"1";'),
('birthdays_show_starsign', 's:1:"2";'),
('birthdays_hide_year', 's:1:"0";'),
('birthdays_page_settings', 's:1:"0";'),
('birthdays_page_list_number', 's:2:"25";'),
('birthdays_page_show_filters', 's:1:"1";'),
('birthdays_remind', 's:1:"0";'),
('birthdays_send_user', 's:1:"0";'),
('birthdays_send_user_subject', 's:15:"Happy Birthday!";'),
('birthdays_send_user_message', 's:55:"Hey @name,\r\nHappy birthday!\r\nHope you have a great day!";'),
('user_register', 's:1:"1";'),
('user_email_verification', 'i:1;'),
('user_registration_help', 's:0:"";'),
('user_mail_welcome_subject', 's:38:"Account details for !username at !site";'),
('user_mail_welcome_body', 's:442:"!username,\r\n\r\nThank you for registering at !site. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";'),
('user_mail_admin_subject', 's:52:"An administrator created an account for you at !site";'),
('user_mail_admin_body', 's:468:"!username,\r\n\r\nA site administrator at !site has created an account for you. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";'),
('user_mail_approval_subject', 's:63:"Account details for !username at !site (pending admin approval)";'),
('user_mail_approval_body', 's:508:"!username,\r\n\r\nThank you for registering at !site. Your application for an account is currently pending approval. Once it has been granted, you may log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you may wish to change your password at !edit_uri\r\n\r\n\r\n--  !site team";'),
('user_mail_pass_subject', 's:52:"Replacement login information for !username at !site";'),
('user_mail_pass_body', 's:416:"!username,\r\n\r\nA request to reset the password for your account has been made at !site.\r\n\r\nYou may now log in to !uri_brief clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once. It expires after one day and nothing will happen if it''s not used.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.";'),
('user_pictures', 's:1:"1";'),
('user_picture_path', 's:8:"pictures";'),
('user_picture_default', 's:0:"";'),
('user_picture_dimensions', 's:5:"85x85";'),
('user_picture_file_size', 's:2:"30";'),
('user_picture_guidelines', 's:0:"";'),
('birthdays_block_number_by_birthdays', 's:1:"3";'),
('simplenews_vid', 'i:1;'),
('simplenews_private_key', 's:32:"e8fdcd2343ebd3f10bceffa54868b117";'),
('i18n_languages', 'a:5:{s:12:"site_default";s:2:"en";s:4:"name";a:2:{s:2:"nl";s:5:"Dutch";s:2:"en";s:7:"English";}s:3:"rtl";a:3:{i:0;i:1;s:2:"en";i:0;s:2:"nl";i:0;}s:6:"native";a:2:{s:2:"en";s:7:"English";s:2:"nl";s:5:"Dutch";}s:7:"enabled";a:2:{s:2:"en";s:2:"en";s:2:"nl";s:2:"nl";}}'),
('i18n_node_news', 's:1:"1";'),
('node_options_page', 'a:1:{i:0;s:6:"status";}'),
('comment_page', 's:1:"0";'),
('upload_page', 's:1:"1";'),
('event_nodeapi_page', 's:5:"never";'),
('signup_form_page', 'i:0;'),
('pathauto_version', 'a:2:{s:4:"text";s:9:"2005-9-18";s:5:"build";i:5;}'),
('pathauto_indexaliases_bulkupdate', 'b:0;'),
('pathauto_punctuation_quotes', 's:1:"0";'),
('pathauto_taxonomy_supportsfeeds', 's:6:"0/feed";'),
('pathauto_tracker_supportsfeeds', 's:4:"feed";'),
('pathauto_user_supportsfeeds', 'N;'),
('pathauto_modulelist', 'a:4:{i:0;s:4:"node";i:1;s:8:"taxonomy";i:2;s:7:"tracker";i:3;s:4:"user";}'),
('pathauto_verbose', 'i:0;'),
('pathauto_separator', 's:1:"-";'),
('pathauto_max_length', 's:3:"100";'),
('pathauto_max_component_length', 's:3:"100";'),
('pathauto_indexaliases', 'i:0;'),
('pathauto_update_action', 's:1:"2";'),
('pathauto_ignore_words', 's:108:"a,an,as,at,before,but,by,for,from,is,in,into,like,of,off,on,onto,per,since,than,the,this,that,to,up,via,with";'),
('pathauto_node_pattern', 's:7:"[title]";'),
('pathauto_node_poll_pattern', 's:0:"";'),
('pathauto_node_event_pattern', 's:0:"";'),
('pathauto_node_image_pattern', 's:0:"";'),
('pathauto_node_simplenews_pattern', 's:0:"";'),
('pathauto_node_news_pattern', 's:0:"";'),
('pathauto_node_page_pattern', 's:0:"";'),
('pathauto_node_partner_pattern', 's:0:"";'),
('pathauto_node_bulkupdate', 'b:0;'),
('pathauto_node_applytofeeds', 'i:1;'),
('pathauto_taxonomy_pattern', 's:17:"[vocab]/[catpath]";'),
('pathauto_taxonomy_1_pattern', 's:0:"";'),
('pathauto_taxonomy_bulkupdate', 'i:0;'),
('pathauto_taxonomy_applytofeeds', 'i:0;'),
('pathauto_tracker_pattern', 's:17:"user/[user]/track";'),
('pathauto_tracker_bulkupdate', 'i:0;'),
('pathauto_tracker_applytofeeds', 'i:0;'),
('pathauto_user_pattern', 's:11:"user/[user]";'),
('pathauto_user_bulkupdate', 'i:0;');

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
(3, 'node_feed', '2', 'ESN Satellite 2.0 - Join the Galaxy!', '', 0, '', ''),
(2, 'rss_feed', '2', 'ESN Satellite - Partner Feed', '', 0, '', ''),
(1, 'rss_feed', '2', 'ESN Satellite - News Feed', '', 0, '', '');

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
(1, '', 'node.type', 'news', 'OR', '', 1),
(1, '', 'node.status', '1', '=', '', 0),
(2, '', 'node.type', 'partner', 'OR', '', 1),
(2, '', 'node.status', '1', '=', '', 0),
(3, '', 'node.status', '1', '=', '', 0),
(3, '', 'node.type', 'news', 'OR', '', 1);

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
(1, 0, 'node.created', 'DESC', 'normal', NULL),
(2, 0, 'node.title', 'ASC', '', NULL),
(3, 0, 'node.sticky', 'DESC', '', NULL),
(3, 1, 'node.created', 'DESC', 'normal', NULL);

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
(1, 'node_data_field_summary', 'field_summary_value', '', 'content_views_field_handler_group', 0, '0', 'default', 3),
(1, 'node_data_field_image', 'field_image_fid', '', 'content_views_field_handler_group', 0, '', 'thumbnail', 2),
(2, 'node', 'title', '', 'views_handler_field_nodelink', 0, '0', 'link', 4),
(2, 'node_data_field_logo', 'field_logo_fid', '', 'content_views_field_handler_group', 0, '', 'logo', 0),
(2, 'node_data_field_shortdescription', 'field_shortdescription_value', '', 'content_views_field_handler_group', 0, '0', 'default', 1),
(2, 'node_data_field_logolink', 'field_logolink_url', '', 'content_views_field_handler_group', 0, '', 'default', 2),
(2, 'node', 'body', '', 'views_handler_field_teaser', 0, '', '', 3),
(3, 'node_data_field_summary', 'field_summary_value', '', 'content_views_field_handler_group', 0, '0', 'default', 4),
(3, 'node', 'nid', '', '', 0, '0', '', 0),
(3, 'node', 'created', '', 'views_handler_field_date_small', 0, '0', '', 1),
(3, 'node', 'title', '', 'views_handler_field_nodelink_with_mark', 0, '0', 'nolink', 2),
(3, 'node_data_field_image', 'field_image_fid', '', 'content_views_field_handler_group', 0, '', 'mainimage', 3),
(1, 'node', 'title', '', 'views_handler_field_nodelink_with_mark', 0, '0', 'nolink', 1),
(1, 'node', 'created', '', 'views_handler_field_date_small', 0, 'ASC', '', 0);

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
(1, 'News', 'View for the news content type', '', 1, 'News', '', 1, 'No news has been posted on your Satellite. Log in and click on Create Content / News.', 1, '', 1, 'list', 1, 5, 'news', 0, 0, 0, '', 0, 'tab', '', 0, 1, 'Latest news', 0, '', 1, 0, '', 1, 0, 'No news has been posted on your Satellite. Log in and click on Create Content / News.', 1, 'list', 5, 1, 0, 1190993909, '', 0),
(2, 'Partners', 'View for the partners content type', '', 1, 'Partners', '', 1, 'No partners have been posted yet. Log in and click on Create Content / Partner.', 1, '', 1, 'list', 0, 0, 'partners', 0, 0, 0, '', 0, 'tab', '', 0, 1, 'Partners', 0, '', 1, 0, '', 1, 0, 'No partners have been posted yet. Log in and click on Create Content / Partner.', 1, 'list', 5, 0, 0, 1188466595, '', 0),
(3, 'Homepage', 'The default ESN Satellite homepage', '', 1, '', '', 1, 'No news has been posted yet. Log in and click on Create Content / News.', 1, '', 1, 'list', 0, 5, 'home', 0, 0, 0, '', 0, 'tab', '', 0, 0, '', 0, '', 1, 0, '', 1, 0, '', 1, 'node', 0, 0, 1, 1188425773, '', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_vocabulary`
-- 

INSERT INTO `satellite2_vocabulary` (`vid`, `name`, `description`, `help`, `relations`, `hierarchy`, `multiple`, `required`, `tags`, `module`, `weight`, `language`) VALUES 
(1, 'Newsletter', '', '', 0, 0, 0, 0, 0, 'simplenews', 0, '');

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

INSERT INTO `satellite2_vocabulary_node_types` (`vid`, `type`) VALUES 
(1, 'simplenews');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;
