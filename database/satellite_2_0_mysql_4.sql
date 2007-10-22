-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Oct 22, 2007 at 11:34 AM
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

INSERT INTO `satellite2_aggregator_feed` (`fid`, `title`, `url`, `refresh`, `checked`, `link`, `description`, `image`, `etag`, `modified`, `block`) VALUES 
(1, 'ESN International News', 'http://www.esn.org/news/feed', 3600, 1193045594, 'http://www.esn.org/news/feed', 'News view', '', '', 1193045594, 5);

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
) TYPE=MyISAM  AUTO_INCREMENT=868 ;

-- 
-- Dumping data for table `satellite2_aggregator_item`
-- 

INSERT INTO `satellite2_aggregator_item` (`iid`, `fid`, `title`, `link`, `author`, `description`, `timestamp`, `guid`) VALUES 
(6, 1, 'ESN is looking for a Webteam Member', 'http://www.esn.org/news/become_a_webteamer', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">The ESN Webteam is starting bigger and more ambitious projects, and this may be the perfect time for you to join the team.</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p>The Webteam Leaders are looking for the following positions: </p>\n<p><u>Are you a real Programmer</u>? Join the ESN Galaxy project, which aims at strengthening ESN as a community by, for instance, automatically gathering data from sections and arranging it into maps. CakePHP is the tool of choice for coding.</p>\n<p><u>Do you like playing with illustrator or photoshop?</u> Be our graphic artist: your work is going to be on ESN posters, T-shirts, flyers and Website.</p>\n<p><u>Hard-core system administrators and hackers</u> have a place in the webteam too. Our huge and widespread network faces big technical challenges every day, and we like to use the best, latest, open technologies. We are currently implementing an LDAP system which will ultimately contain all ESN data, from individual members to countries. You may be of help in optimizing the system&#39;s design, performance and security: if you like challenges, this is the project for you!</p>\n<p>You needn&#39;t be available 40 hours a week; you needn&#39;t be a computer programmer; you don&#39;t even need to be an advanced computer user to help! </p>\n<p>Do you need more information? Have a look in the Sections&#39; Bulletin! Or ask the ESN Webteam at webteam@esn.org.  </p>\n</div></div></div>', 1183973493, '123 at http://www.esn.org'),
(7, 1, 'New ESN office!!!', 'http://www.esn.org/news/new_esn_office', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">From the 1st of August ESN will have a new office:&lt;br /&gt;it is in Rue Hydraulique 15; call us at +32 22 567 427</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p>From the 1st of August ESN will have a new office:<br /> Rue Hydraulique 15<br /> 1210 Saint-josse-ten-noode<br /> Brussels, Belgium<br /> Tel: +3222567427 </p>\n</div></div></div>', 1184678017, '128 at http://www.esn.org'),
(8, 1, 'AEGEE and ESN together', 'http://www.esn.org/news/aegee_and_esn_together', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;div style=&quot;direction: ltr&quot;&gt;ESN and AEGEE have signed a memorable agreement:&lt;/div&gt;&lt;div style=&quot;direction: ltr&quot;&gt;our two associations are partners!&lt;/div&gt;</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p> After several dinners in the AEGEE house and ESN house, on 17th July 2007, Giorgio (ESN President) and Theijs (AEGEE President) signed the letter of partnership you find <a href="http://www.esn.org/esn_aegee_agreement">here</a>.<br />  The aim of this partnership is not to have just a nice paper to show around and nice logos to put on our websites, but the intention is to really start a cooperation between our two associations at any level.<br />  We know that especially at local level, there were and in some places there are still some troubles between ESN sections and AEGEE antennas.<br /> We believe that this is absolutely against the spirit of our associations, which both have similar aims, goals and share the same common values. And to proof this already in many locals, ESN sections and AEGEE antennas are actively collaborating and somewhere are even composed by the same people.<br /> Moreover positive collaboration have been seen during our main projects this year. <br />With this new partnership ESN and AEGEE locals are invited to promote the creation of the other where only one of the two partners is present, this can lead to a substantial growth of both networks.<br /> We believe this is the starting point for a very positive and fruitful collaboration and I am looking forward for the great achievements that ESN and AEGEE will reach together.</p>\n</div></div></div>', 1184694685, '131 at http://www.esn.org'),
(9, 1, 'The winner of Stars are Everywhere', 'http://www.esn.org/news/new_pictures_for_stars_are_everywhere', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;img class=&quot;left&quot; src=&quot;/files/uploaded/starsareeverywherelogo.gif&quot; alt=&quot;Stars Are Everywhere&quot; title=&quot;Stars Are Everywhere&quot; width=&quot;60&quot; height=&quot;58&quot; /&gt;Ladies and Gentlemen, we are proud to announce that the Council of National Delegates has chosen the winner of &amp;quot;Stars are everywhere&amp;quot;:</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><div>\n<p style="margin-bottom: 0.0001pt; text-align: justify; line-height: 150%" class="MsoNormal">Many Compliments to the winner:  here&#39;s the picture chosen by the National Delegates!!</p>\n</div>\n<h3>Friendship and love</h3>\n<p><a href="http://www.esn.org/files/uploaded/friedshipandlove.jpg" target="_new"><img src="http://www.esn.org/files/uploaded/friedshipandlove.jpg" alt="" width="300" /></a></p>\n</div></div></div>', 1187970555, '137 at http://www.esn.org'),
(858, 1, 'ESNSurvey 2007 closed: more than 8000 students responded!', 'http://www.esn.org/news/esnsurvey_2007_closed_more_than_8000_students_responded', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">We thank all ESN sections and all supporters in promoting and distributing the survey: &lt;span&gt;&lt;span&gt;8150 answers have been gathered and are waiting for data analysis..&lt;/span&gt;&lt;/span&gt; Thanks to all of you who filled the Survey!</div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><strong><span>ESNSurvey 2007 closed: more than 8000 students responded!</span> <span><br /></span></strong></p>\n<p><strong><span>  </span></strong><span><span>During three months, ESNSurvey about &quot;Generation Mobility&quot; received exactly 8150 answers. It is another great success that we managed to achieve as a network of ESN sections, and by networking with many other educational associations, both student and professional.</p>\n<p> </span>   </span>We thank all ESN sections and all supporters in promoting and distributing the survey.</p>\n<p> Thanks to all of you who filled the Survey!</p>\n<p> Now is time for data analysis. Results and report will be ready for the beginning of next year.</p>\n<p>    If you would like to receive the report don&#39;t hesitate to contact us at <a href="secretariat@20erasmus.eu" target="_blank">secretariat@20erasmus.eu</a></p>\n</div></div></div>', 1192444067, '143 at http://www.esn.org'),
(859, 1, 'Third Fun(d)raising conference: Bocconi', 'http://www.esn.org/news/third_fun_d_raising_conference_bocconi', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">After the great success of the first conference in Wien in 2005 and the second in Gdansk in 2006, from the 10th to the 14th of December, the Fundraising conference is organised in Milano by Università Bocconi </div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p><font face="Palatino Linotype" size="3">This year the 3rd Fun(d)raising  Conference will be in Milano from the 10th till the 14th December 2007.  (See schedule)</font>\n<p><font face="Palatino Linotype" size="3">After the great success of  the first conference in Wien in 2005 and the second in Gdansk in 2006,  the third one is organised in Milano by Università Bocconi which will  gives facilities and lecturers, and ESN Milano Statale (<a href="http://www.esnmilanostatale.it/" target="_blank">www.esnmilanostatale.it</a>)  with the help of the other 5 ESN sections in Milano <u>(<a href="http://www.esnmilano.it/" target="_blank">www.esnmilano.it</a>)</u>.</font></p>\n<p><font face="Palatino Linotype" size="3">The Fun(d)rasing conference  is a unique opportunity for ESN members to learn from the most outstanding  professors in finance and economics and improve their skills in dealing  with financial issues. </font></p>\n<p><font face="Palatino Linotype" size="3">Università Bocconi (www.Uni<strong>Bocconi</strong>.it)  is a leading university of economics and marketing and they have great  experience in teaching. ESN has already cooperated with Università  Bocconi in two occasions and both of them were a great success: in January  2006 for the ESN training in human management and in July 2006 for the  Bocconi Summer Factory.</font></p>\n<p><font face="Palatino Linotype" size="3"><strong>About lectures</strong></font></p>\n<p><font face="Palatino Linotype" size="3">Marketing is becoming more  and more an important part of the management of non-profit organisations  and the need for some basic but essential tools for strategic marketing  planning is growing.</font></p>\n<p><font face="Palatino Linotype" size="3">During Monday and Wednesday,  Alex Turrini (see biography) will introduce the basics of the fund-raising  for non-profit organisation and will hold an interactive workshop, in  Tuesday morning lecture Christiane Roth (see biography) will speak about  marketing planning.</font></p>\n<p><font face="Palatino Linotype" size="3"> (See lecture programme)</font></p>\n<p><font face="Palatino Linotype" size="3"><strong>About the fun</strong></font></p>\n<p><font face="Palatino Linotype" size="3">But Fun(d)raising is not  only about improving skills, but also about fun and culture. You will  experience the famous Italian cuisine, you will visit the great monuments  of the city, its many churches (among them the famous Romanic S.Amborgio  and the wonderful Gothic cathedral Duomo), La Scala theatre, the wonderful  Vittorio Emanuele II Gallery, known as &quot;the living room&quot; of  Milano. And, course you will experience the amazing night life of Milano,  the capital of fashion and entrainment in Italy.</font></p>\n<p><font face="Palatino Linotype" size="3">So, what are you waiting  for? Hurry up and sign for an unforgettable experience in Milano at  the Fun(d)raising conference!!!</font></p>\n<p><font face="Palatino Linotype" size="3">See detailed programme (xxxx)</font>  </p>\n<p><font face="Palatino Linotype" size="3"><strong>Fee</strong></font></p>\n<p><font face="Palatino Linotype" size="3">The participation fee is  120 euros and includes:</font></p>\n<p><font face="Palatino Linotype" size="3">3 Breakfasts in the hostel</font></p>\n<p><font face="Palatino Linotype" size="3">3 Lunches at Bocconi canteen</font></p>\n<p><font face="Palatino Linotype" size="3">Dinner at Ciao ristorante</font></p>\n<p><font face="Palatino Linotype" size="3">Dinner in a typical restaurant</font></p>\n<p><font face="Palatino Linotype" size="3">Aperitivo (Happy hour) with  a drink at Gioia 69</font></p>\n<p><font face="Palatino Linotype" size="3">Extra food and drink provided  from the OC</font></p>\n<p><font face="Palatino Linotype" size="3">Accommodation from Monday  to Wednesday. </font></p>\n<p><font face="Palatino Linotype" size="3">Does not include</font></p>\n<p><font face="Palatino Linotype" size="3">Accommodation for Wednesday  night  because we will spend the last night in the most exciting Erasmus  party in Milano, but, if you want to go to sleep, feel free to ask for  the extra night (21 euros).</font></p>\n<p><font face="Palatino Linotype" size="3">Public transport. You’ll  be provided with all the information to purchase tickets.</font></p>\n<p><font face="Palatino Linotype" size="3">Three participants with less  opportunity or with high travel expenses will have the possibility to  have a reduced fee of 45 euros by being hosted by people from the section  of ESN Milano Statale. These people will be chosen among all those who  will explicitly claim for such in the special section of the application  form.</font></p>\n<p><font face="Palatino Linotype" size="3"><strong>Sign up  information</strong></font></p>\n<p><font face="Palatino Linotype" size="3">As the number of places is  limited to 36, there will be a selection procedure, although the application  is open to every ESN member.</font></p>\n<p><font face="Palatino Linotype" size="3">To sign up fill in the <u> application form</u> , after the first deadline (xxxxxxxxx), the OC  will open the selections of the candidates taking into account your  motivation to participate, your course of studies,  country of  origin and the other information included in the application form. If  your application is accepted the OC will send you an e - mail with the  payment information.</font></p>\n<p><font face="Palatino Linotype" size="3">For any further information  don’t hesitate to contact the OC at </font><a href="mailto:third.fundraising@gmail.com" target="_blank"><font face="Palatino Linotype" size="3" color="#0000ff"><u>third.fundraising@gmail.com</u></font></a></p>\n<p><font face="Palatino Linotype" size="3">Info line:</font></p>\n<p><font face="Palatino Linotype" size="3">+393281182872    Chandra</font></p>\n<p><font face="Palatino Linotype" size="3">+393294213446    Dario</font> </p>\n<p><font face="Palatino Linotype" size="3"><strong>Link:</strong></font></p>\n<p><font face="Palatino Linotype" size="3">Schedule</font></p>\n<p><font face="Palatino Linotype" size="3">Lecture programme</font></p>\n<p><font face="Palatino Linotype" size="3">Alex Turrini Biography</font></p>\n<p><font face="Palatino Linotype" size="3">Christiane Roth biography</font></p>\n<p><font face="Palatino Linotype" size="3">Application form</font></p>\n<p><a href="mailto:third.fundraising@gmail.com" target="_blank"><font face="Palatino Linotype" size="3" color="#0000ff"><u>third.fundraising@gmail.com</u></font></a></p>\n</div></div></div>', 1192467627, '144 at http://www.esn.org'),
(10, 1, 'Your song for ESN', 'http://www.esn.org/news/your_song_for_esn', '', '<div class="field field-type-text field-field-summary"><div class="field-items"><div class="field-item">&lt;img class=&quot;left&quot; src=&quot;/files/uploaded/song_competition2.jpg&quot; alt=&quot;ESN Song&quot; title=&quot;ESN song&quot; width=&quot;60&quot; height=&quot;60&quot; /&gt;   From September 15th, we will look for the next official ESN song. Your song will be on the ESN CD, distributed, and played during ESN events!  </div></div></div><div class="field field-type-text field-field-body"><div class="field-items"><div class="field-item"><p>From September 15th,  we will look for the next official ESN song.</p>\n<p><u>Song specifics</u>:<br />1.    no more than five minutes<br />2.    in mp3 format<br />3.    when you send the song, you should attach the lyric to the email</p>\n<p><u>Participants:</u><br />1.    are allowed to send more than one song;<br />2. can belong to ESN or not (doesn’t matter if they belong to ESN sections or ESN countries, if they are exchange students or if they have just seen the contest on the website);</p>\n<p><u>Advices</u>: we are looking for a song which everyone can enjoy, somehow connected with the idea of exchange: so please keep in mind that a songs where the following words (not necessarily all of them!) are mentioned will be preferred: “Exchange”, “Erasmus student network”, “ESN”, “Pallomeri”; for the same reasons it might be a good idea to write a song in English; but it’s not compulsory<br />Then, we hope that when you will sit with your group to think about an “ESN song”, you will think about joy, liveliness, confidence: but this doesn’t mean that a brainless song will win…<br />As usual, since you read the logo guidelines, you will not produce anything that goes against our corporate design and values.<br />Be creative: Skyeurope vouchers and other prizes will be given to the winners! </p>\n<p>We will also include the song in a CD which will be produced for the AGM, and we will put it online.<br />Send your song to external@esn.org</p>\n<p>Deadline on November, 25th.</p>\n</div></div></div>', 1189069234, '141 at http://www.esn.org');

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

INSERT INTO `satellite2_cache` (`cid`, `data`, `expire`, `created`, `headers`) VALUES 
('variables', 0x613a3135333a7b733a31333a227468656d655f64656661756c74223b733a383a2265736e7468656d65223b733a31333a2266696c7465725f68746d6c5f31223b733a313a2231223b733a31383a226e6f64655f6f7074696f6e735f666f72756d223b613a313a7b693a303b733a363a22737461747573223b7d733a31373a226d656e755f7072696d6172795f6d656e75223b693a323b733a31393a226d656e755f7365636f6e646172795f6d656e75223b693a323b733a31393a226576656e745f6e6f64656170695f6576656e74223b733a333a22616c6c223b733a31353a22696e7374616c6c5f70726f66696c65223b733a31323a2265736e736174656c6c697465223b733a31313a2261646d696e5f7468656d65223b733a373a226761726c616e64223b733a31383a2264727570616c5f707269766174655f6b6579223b733a36343a2238626130373339646462633339653561393036643062373734316364373761616538376166363261653063643835336533393439633665383865336638623366223b733a32323a22636f6e74656e745f736368656d615f76657273696f6e223b693a313030333b733a32343a226e6f64655f63726f6e5f636f6d6d656e74735f7363616c65223b643a313b733a32313a226e6f64655f63726f6e5f76696577735f7363616c65223b643a313b733a32343a22737461746973746963735f6461795f74696d657374616d70223b693a313139333032363730353b733a31393a2266696c655f6469726563746f72795f74656d70223b733a343a222f746d70223b733a393a2263726f6e5f6c617374223b693a313139333034353539343b733a31373a226e6f64655f6f7074696f6e735f6e657773223b613a323a7b693a303b733a363a22737461747573223b693a313b733a373a2270726f6d6f7465223b7d733a31323a22636f6d6d656e745f6e657773223b733a313a2232223b733a31313a2275706c6f61645f6e657773223b733a313a2231223b733a31383a226576656e745f6e6f64656170695f6e657773223b733a353a226e65766572223b733a31363a227369676e75705f666f726d5f6e657773223b693a303b733a32303a226e6f64655f6f7074696f6e735f706172746e6572223b613a313a7b693a303b733a363a22737461747573223b7d733a31353a22636f6d6d656e745f706172746e6572223b733a313a2230223b733a31343a2275706c6f61645f706172746e6572223b733a313a2231223b733a32313a226576656e745f6e6f64656170695f706172746e6572223b733a353a226e65766572223b733a31393a227369676e75705f666f726d5f706172746e6572223b693a303b733a31353a2273696d706c656d656e755f6d656e75223b733a313a2236223b733a31363a2273696d706c656d656e755f646576656c223b693a303b733a31383a2273696d706c656d656e755f656c656d656e74223b733a343a22626f6479223b733a32353a2273696d706c656d656e755f656c656d656e745f6d6574686f64223b733a373a2270726570656e64223b733a32313a2273696d706c656d656e755f6578636c7573696f6e73223b613a393a7b733a393a226368616d656c656f6e223b693a303b733a373a226761726c616e64223b693a303b733a31303a2270757368627574746f6e223b693a303b733a31303a22626c75656d6172696e65223b693a303b733a383a2265736e7468656d65223b693a303b733a333a227a656e223b693a303b733a363a226d617276696e223b693a303b733a383a226d696e6e656c6c69223b693a303b733a393a227a656e2d6669786564223b693a303b7d733a31343a2273696d706c656d656e755f72746c223b693a303b733a393a22736974655f6d61696c223b733a33393a226368616e67652d746869732d656d61696c2d6164647265737340736174656c6c6974652e6f7267223b733a31313a22736974655f736c6f67616e223b733a31363a224a6f696e207468652047616c61787921223b733a31323a22736974655f6d697373696f6e223b733a303a22223b733a31313a22736974655f666f6f746572223b733a3336323a22506f7765726564206279203c623e45534e20536174656c6c69746520322e303c2f623e202d20323030352d32303037200d0a3c6120687265663d22687474703a2f2f736174656c6c6974652e65736e2e6f726722207461726765743d225f626c616e6b223e0d0a3c696d67207372633d2273697465732f616c6c2f7468656d65732f637573746f6d2f65736e7468656d652f696d672f45534e2e736174656c6c6974652e706f7765722e706e6722207374796c653d22646973706c61793a20696e6c696e653b222f3e3c2f613e266e6273703b0d0a3c6120687265663d22687474703a2f2f67616c6178792e65736e2e6f726722207461726765743d225f626c616e6b223e0d0a3c696d67207372633d2273697465732f616c6c2f7468656d65732f637573746f6d2f65736e7468656d652f696d672f45534e2e67616c6178792e706f7765722e706e6722207374796c653d22646973706c61793a20696e6c696e653b222f3e3c2f613e223b733a393a22616e6f6e796d6f7573223b733a393a22416e6f6e796d6f7573223b733a31343a22736974655f66726f6e7470616765223b733a343a22686f6d65223b733a32333a227468656d655f65736e7468656d655f73657474696e6773223b613a31363a7b733a31313a22746f67676c655f6c6f676f223b693a313b733a31313a22746f67676c655f6e616d65223b693a303b733a31333a22746f67676c655f736c6f67616e223b693a303b733a31343a22746f67676c655f6d697373696f6e223b693a303b733a32343a22746f67676c655f6e6f64655f757365725f70696374757265223b693a303b733a32373a22746f67676c655f636f6d6d656e745f757365725f70696374757265223b693a303b733a31333a22746f67676c655f736561726368223b693a313b733a31343a22746f67676c655f66617669636f6e223b693a313b733a31323a2264656661756c745f6c6f676f223b693a313b733a393a226c6f676f5f70617468223b733a303a22223b733a31313a226c6f676f5f75706c6f6164223b733a303a22223b733a31353a2264656661756c745f66617669636f6e223b693a303b733a31323a2266617669636f6e5f70617468223b733a34393a222f73697465732f616c6c2f7468656d65732f637573746f6d2f65736e7468656d652f696d672f66617669636f6e2e69636f223b733a31343a2266617669636f6e5f75706c6f6164223b733a303a22223b733a323a226f70223b733a31383a225361766520636f6e66696775726174696f6e223b733a31303a22666f726d5f746f6b656e223b733a33323a223036343237366464636631313763343464353864663831313339323261656134223b7d733a31363a226576656e745f72616e67655f70726576223b4e3b733a32323a227468656d655f6761726c616e645f73657474696e6773223b613a32303a7b733a31313a22746f67676c655f6c6f676f223b693a313b733a31313a22746f67676c655f6e616d65223b693a313b733a31333a22746f67676c655f736c6f67616e223b693a303b733a31343a22746f67676c655f6d697373696f6e223b693a313b733a32343a22746f67676c655f6e6f64655f757365725f70696374757265223b693a303b733a32373a22746f67676c655f636f6d6d656e745f757365725f70696374757265223b693a303b733a31333a22746f67676c655f736561726368223b693a313b733a31343a22746f67676c655f66617669636f6e223b693a313b733a31323a2264656661756c745f6c6f676f223b693a313b733a393a226c6f676f5f70617468223b733a303a22223b733a31313a226c6f676f5f75706c6f6164223b733a303a22223b733a31353a2264656661756c745f66617669636f6e223b693a303b733a31323a2266617669636f6e5f70617468223b733a34393a222f73697465732f616c6c2f7468656d65732f637573746f6d2f65736e7468656d652f696d672f66617669636f6e2e69636f223b733a31343a2266617669636f6e5f75706c6f6164223b733a303a22223b733a323a226f70223b733a31383a225361766520636f6e66696775726174696f6e223b733a31303a22666f726d5f746f6b656e223b733a33323a223036343237366464636631313763343464353864663831313339323261656134223b733a363a22736368656d65223b733a33393a22233030373262392c233032376163362c233233383563322c233561623565652c23343934393439223b733a373a2270616c65747465223b613a353a7b733a343a2262617365223b733a373a2223303037326239223b733a343a226c696e6b223b733a373a2223303237616336223b733a333a22746f70223b733a373a2223323338356332223b733a363a22626f74746f6d223b733a373a2223356162356565223b733a343a2274657874223b733a373a2223343934393439223b7d733a353a227468656d65223b733a373a226761726c616e64223b733a343a22696e666f223b613a393a7b733a373a22736368656d6573223b613a31363a7b733a33393a22233030373262392c233032376163362c233233383563322c233561623565652c23343934393439223b733a32313a22426c7565204c61676f6f6e202844656661756c7429223b733a33393a22233436343834392c233266343136662c233261326232642c233564363737392c23343934393439223b733a333a22417368223b733a33393a22233535633065322c233030303030302c233038353336302c233030376539342c23363936393639223b733a31303a22417175616d6172696e65223b733a33393a22236435623034382c233663343230652c233333313930302c233937313730322c23343934393439223b733a31373a2242656c6769616e2043686f636f6c617465223b733a33393a22233366336633662c233333363639392c233635393863622c233635393863622c23303030303030223b733a31303a22426c75656d6172696e65223b733a33393a22236430636239612c233931373830332c236566646530312c236536666232642c23343934393439223b733a31323a2243697472757320426c617374223b733a33393a22233066303035632c233433346638632c233464393166662c233161313537352c23303030303030223b733a383a22436f6c6420446179223b733a33393a22236339633439372c233063376130302c233033393631652c233762653030302c23343934393439223b733a393a22477265656e6265616d223b733a33393a22236666653233642c236139323930612c236663366431642c236133306634322c23343934393439223b733a31313a224d65646974657272616e6f223b733a33393a22233738383539372c233366373238642c236139616462632c236434643464342c23373037303730223b733a373a224d657263757279223b733a33393a22233562356661392c233562356661612c233061323335322c233966613864352c23343934393439223b733a393a224e6f637475726e616c223b733a33393a22233764623332332c233661393931352c236235643532612c233764623332332c23313931613139223b733a363a224f6c69766961223b733a33393a22233132303230622c233162316131332c236633393163362c236634313036332c23383938303830223b733a31323a2250696e6b20506c6173746963223b733a33393a22236237613062612c236337303030302c236131343433612c236632313130372c23353135643532223b733a31323a225368696e7920546f6d61746f223b733a33393a22233138353833642c233162356634322c233334373735612c233532626639302c23326432643264223b733a383a225465616c20546f70223b733a303a22223b733a363a22437573746f6d223b7d733a343a22636f7079223b613a333a7b693a303b733a32353a22696d616765732f6d656e752d636f6c6c61707365642e676966223b693a313b733a32343a22696d616765732f6d656e752d657870616e6465642e676966223b693a323b733a32303a22696d616765732f6d656e752d6c6561662e676966223b7d733a383a226772616469656e74223b613a343a7b693a303b693a303b693a313b693a33373b693a323b693a3736303b693a333b693a3132313b7d733a343a2266696c6c223b613a323a7b733a343a2262617365223b613a343a7b693a303b693a303b693a313b693a303b693a323b693a3736303b693a333b693a3536383b7d733a343a226c696e6b223b613a343a7b693a303b693a3130373b693a313b693a3533333b693a323b693a34313b693a333b693a32333b7d7d733a363a22736c69636573223b613a31333a7b733a31353a22696d616765732f626f64792e706e67223b613a343a7b693a303b693a303b693a313b693a33373b693a323b693a313b693a333b693a3238303b7d733a31373a22696d616765732f62672d6261722e706e67223b613a343a7b693a303b693a3230323b693a313b693a3533303b693a323b693a37363b693a333b693a31343b7d733a32333a22696d616765732f62672d6261722d77686974652e706e67223b613a343a7b693a303b693a3230323b693a313b693a3530363b693a323b693a37363b693a333b693a31343b7d733a31373a22696d616765732f62672d7461622e706e67223b613a343a7b693a303b693a3130373b693a313b693a3533333b693a323b693a34313b693a333b693a32333b7d733a32343a22696d616765732f62672d6e617669676174696f6e2e706e67223b613a343a7b693a303b693a303b693a313b693a303b693a323b693a373b693a333b693a33373b7d733a32363a22696d616765732f62672d636f6e74656e742d6c6566742e706e67223b613a343a7b693a303b693a34303b693a313b693a3131373b693a323b693a35303b693a333b693a3335323b7d733a32373a22696d616765732f62672d636f6e74656e742d72696768742e706e67223b613a343a7b693a303b693a3531303b693a313b693a3131373b693a323b693a35303b693a333b693a3335323b7d733a32313a22696d616765732f62672d636f6e74656e742e706e67223b613a343a7b693a303b693a3239393b693a313b693a3131373b693a323b693a373b693a333b693a3230303b7d733a32393a22696d616765732f62672d6e617669676174696f6e2d6974656d2e706e67223b613a343a7b693a303b693a33323b693a313b693a33373b693a323b693a31373b693a333b693a31323b7d733a33353a22696d616765732f62672d6e617669676174696f6e2d6974656d2d686f7665722e706e67223b613a343a7b693a303b693a35343b693a313b693a33373b693a323b693a31373b693a333b693a31323b7d733a32353a22696d616765732f6772616469656e742d696e6e65722e706e67223b613a343a7b693a303b693a3634363b693a313b693a3330373b693a323b693a3131323b693a333b693a34323b7d733a383a226c6f676f2e706e67223b613a343a7b693a303b693a3632323b693a313b693a35313b693a323b693a36343b693a333b693a37333b7d733a31343a2273637265656e73686f742e706e67223b613a343a7b693a303b693a303b693a313b693a33373b693a323b693a3430303b693a333b693a3234303b7d7d733a31323a22626c656e645f746172676574223b733a373a2223666666666666223b733a31333a22707265766965775f696d616765223b733a31373a22636f6c6f722f707265766965772e706e67223b733a31313a22707265766965775f637373223b733a31373a22636f6c6f722f707265766965772e637373223b733a31303a22626173655f696d616765223b733a31343a22636f6c6f722f626173652e706e67223b7d7d733a31363a226576656e745f72616e67655f6e657874223b4e3b733a31393a2266696c7465725f75726c5f6c656e6774685f31223b733a323a223732223b733a31343a22616c6c6f7765645f68746d6c5f31223b733a37363a223c613e203c656d3e203c7374726f6e673e203c636974653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e203c696d673e203c703e203c62723e223b733a31383a2266696c7465725f68746d6c5f68656c705f31223b693a313b733a32323a2266696c7465725f68746d6c5f6e6f666f6c6c6f775f31223b693a303b733a32313a22696d63655f73657474696e67735f74696e796d6365223b693a313b733a32323a22696d63655f73657474696e67735f7465787461726561223b733a303a22223b733a31393a22696d63655f73657474696e67735f7573657231223b613a363a7b733a353a227769647468223b733a333a22353030223b733a363a22686569676874223b733a333a22353030223b733a363a22747769647468223b733a303a22223b733a373a2274686569676874223b733a303a22223b733a363a22736861726564223b733a323a227531223b733a363a22657874726173223b693a303b7d733a31393a22696d63655f73657474696e67735f726f6c6573223b613a313a7b693a323b613a31373a7b733a363a2264656c657465223b693a313b733a363a2275706c6f6164223b693a313b733a373a226e6f6c696d6974223b693a303b733a353a227769647468223b733a333a22353030223b733a363a22686569676874223b733a333a22353030223b733a353a227363616c65223b693a313b733a363a22747769647468223b733a303a22223b733a373a2274686569676874223b733a303a22223b733a363a22726573697a65223b693a303b733a383a2266696c6573697a65223b733a333a22353030223b733a353a2271756f7461223b733a343a2232303030223b733a363a22707265666978223b733a313a2275223b733a363a22736861726564223b733a303a22223b733a363a227375626e6176223b693a303b733a373a2273756264697273223b733a303a22223b733a31303a22657874656e73696f6e73223b733a303a22223b733a363a22657874726173223b693a303b7d7d733a32313a2275706c6f61645f6d61785f7265736f6c7574696f6e223b733a313a2230223b733a31393a2275706c6f61645f6c6973745f64656661756c74223b733a313a2231223b733a32353a2275706c6f61645f657874656e73696f6e735f64656661756c74223b733a35373a226a7067206a7065672067696620706e67207478742068746d6c20646f6320786c73207064662070707420707073206f6474206f6473206f6470223b733a32353a2275706c6f61645f75706c6f616473697a655f64656661756c74223b733a313a2231223b733a32333a2275706c6f61645f7573657273697a655f64656661756c74223b733a313a2231223b733a353a22726f6c6573223b613a313a7b693a323b733a31383a2261757468656e746963617465642075736572223b7d733a31393a2275706c6f61645f657874656e73696f6e735f32223b733a35373a226a7067206a7065672067696620706e67207478742068746d6c20646f6320786c73207064662070707420707073206f6474206f6473206f6470223b733a31393a2275706c6f61645f75706c6f616473697a655f32223b733a313a2231223b733a31373a2275706c6f61645f7573657273697a655f32223b733a313a2235223b733a31393a227570646174655f6163636573735f6669786564223b623a313b733a32313a22646174655f64656661756c745f74696d657a6f6e65223b733a313a2230223b733a32323a22636f6e666967757261626c655f74696d657a6f6e6573223b733a313a2230223b733a31373a22646174655f666f726d61745f73686f7274223b733a31313a22642f6d2f59202d20483a69223b733a31383a22646174655f666f726d61745f6d656469756d223b733a31343a22442c20642f6d2f59202d20483a69223b733a31363a22646174655f666f726d61745f6c6f6e67223b733a31353a226c2c2046206a2c2059202d20483a69223b733a31343a22646174655f66697273745f646179223b733a313a2231223b733a31383a226e6f64655f72616e6b5f636f6d6d656e7473223b733a313a2235223b733a31363a226e6f64655f72616e6b5f726563656e74223b733a313a2235223b733a31393a226e6f64655f72616e6b5f72656c6576616e6365223b733a313a2235223b733a31313a226f7665726c61705f636a6b223b693a313b733a31373a226d696e696d756d5f776f72645f73697a65223b733a313a2233223b733a31373a227365617263685f63726f6e5f6c696d6974223b733a333a22313030223b733a343a2277697065223b733a31333a2252652d696e6465782073697465223b733a31343a226e6f64655f63726f6e5f6c617374223b733a31303a2231313931303832343331223b733a31383a226e6f64655f63726f6e5f6c6173745f6e6964223b733a323a223230223b733a393a22736974655f6e616d65223b733a31373a2245534e20536174656c6c69746520322e30223b733a32303a22706f6f726d616e7363726f6e5f6c61737472756e223b693a313139333034353539343b733a31383a227570646174655f7374617475735f6c617374223b693a313139333034333835323b733a32313a22706f6f726d616e7363726f6e5f696e74657276616c223b733a323a223630223b733a32373a22706f6f726d616e7363726f6e5f72657472795f696e74657276616c223b733a323a223130223b733a32363a22706f6f726d616e7363726f6e5f6c6f675f63726f6e5f72756e73223b733a313a2231223b733a32353a22706f6f726d616e7363726f6e5f6c6f675f70726f6772657373223b733a313a2230223b733a393a22636c65616e5f75726c223b733a313a2230223b733a32303a226269727468646179735f6669656c645f6e616d65223b733a31363a2270726f66696c655f6269727468646179223b733a31383a226269727468646179735f6669656c645f6964223b733a313a2231223b733a32333a226269727468646179735f73686f775f737461727369676e223b733a313a2232223b733a31393a226269727468646179735f686964655f79656172223b733a313a2230223b733a32333a226269727468646179735f706167655f73657474696e6773223b733a313a2230223b733a32363a226269727468646179735f706167655f6c6973745f6e756d626572223b733a323a223235223b733a32373a226269727468646179735f706167655f73686f775f66696c74657273223b733a313a2231223b733a31363a226269727468646179735f72656d696e64223b733a313a2230223b733a31393a226269727468646179735f73656e645f75736572223b733a313a2230223b733a32373a226269727468646179735f73656e645f757365725f7375626a656374223b733a31353a22486170707920426972746864617921223b733a32373a226269727468646179735f73656e645f757365725f6d657373616765223b733a35353a2248657920406e616d652c0d0a4861707079206269727468646179210d0a486f706520796f75206861766520612067726561742064617921223b733a31333a22757365725f7265676973746572223b733a313a2231223b733a32333a22757365725f656d61696c5f766572696669636174696f6e223b693a313b733a32323a22757365725f726567697374726174696f6e5f68656c70223b733a303a22223b733a32353a22757365725f6d61696c5f77656c636f6d655f7375626a656374223b733a33383a224163636f756e742064657461696c7320666f722021757365726e616d65206174202173697465223b733a32323a22757365725f6d61696c5f77656c636f6d655f626f6479223b733a3434323a2221757365726e616d652c0d0a0d0a5468616e6b20796f7520666f72207265676973746572696e672061742021736974652e20596f75206d6179206e6f77206c6f6720696e20746f20216c6f67696e5f757269207573696e672074686520666f6c6c6f77696e6720757365726e616d6520616e642070617373776f72643a0d0a0d0a757365726e616d653a2021757365726e616d650d0a70617373776f72643a202170617373776f72640d0a0d0a596f75206d617920616c736f206c6f6720696e20627920636c69636b696e67206f6e2074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420696e20796f75722062726f777365723a0d0a0d0a216c6f67696e5f75726c0d0a0d0a546869732069732061206f6e652d74696d65206c6f67696e2c20736f2069742063616e2062652075736564206f6e6c79206f6e63652e0d0a0d0a4166746572206c6f6767696e6720696e2c20796f752077696c6c206265207265646972656374656420746f2021656469745f75726920736f20796f752063616e206368616e676520796f75722070617373776f72642e0d0a0d0a0d0a2d2d20202173697465207465616d223b733a32333a22757365725f6d61696c5f61646d696e5f7375626a656374223b733a35323a22416e2061646d696e6973747261746f72206372656174656420616e206163636f756e7420666f7220796f75206174202173697465223b733a32303a22757365725f6d61696c5f61646d696e5f626f6479223b733a3436383a2221757365726e616d652c0d0a0d0a4120736974652061646d696e6973747261746f7220617420217369746520686173206372656174656420616e206163636f756e7420666f7220796f752e20596f75206d6179206e6f77206c6f6720696e20746f20216c6f67696e5f757269207573696e672074686520666f6c6c6f77696e6720757365726e616d6520616e642070617373776f72643a0d0a0d0a757365726e616d653a2021757365726e616d650d0a70617373776f72643a202170617373776f72640d0a0d0a596f75206d617920616c736f206c6f6720696e20627920636c69636b696e67206f6e2074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420696e20796f75722062726f777365723a0d0a0d0a216c6f67696e5f75726c0d0a0d0a546869732069732061206f6e652d74696d65206c6f67696e2c20736f2069742063616e2062652075736564206f6e6c79206f6e63652e0d0a0d0a4166746572206c6f6767696e6720696e2c20796f752077696c6c206265207265646972656374656420746f2021656469745f75726920736f20796f752063616e206368616e676520796f75722070617373776f72642e0d0a0d0a0d0a2d2d20202173697465207465616d223b733a32363a22757365725f6d61696c5f617070726f76616c5f7375626a656374223b733a36333a224163636f756e742064657461696c7320666f722021757365726e616d65206174202173697465202870656e64696e672061646d696e20617070726f76616c29223b733a32333a22757365725f6d61696c5f617070726f76616c5f626f6479223b733a3530383a2221757365726e616d652c0d0a0d0a5468616e6b20796f7520666f72207265676973746572696e672061742021736974652e20596f7572206170706c69636174696f6e20666f7220616e206163636f756e742069732063757272656e746c792070656e64696e6720617070726f76616c2e204f6e636520697420686173206265656e206772616e7465642c20796f75206d6179206c6f6720696e20746f20216c6f67696e5f757269207573696e672074686520666f6c6c6f77696e6720757365726e616d6520616e642070617373776f72643a0d0a0d0a757365726e616d653a2021757365726e616d650d0a70617373776f72643a202170617373776f72640d0a0d0a596f75206d617920616c736f206c6f6720696e20627920636c69636b696e67206f6e2074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420696e20796f75722062726f777365723a0d0a0d0a216c6f67696e5f75726c0d0a0d0a546869732069732061206f6e652d74696d65206c6f67696e2c20736f2069742063616e2062652075736564206f6e6c79206f6e63652e0d0a0d0a4166746572206c6f6767696e6720696e2c20796f75206d6179207769736820746f206368616e676520796f75722070617373776f72642061742021656469745f7572690d0a0d0a0d0a2d2d20202173697465207465616d223b733a32323a22757365725f6d61696c5f706173735f7375626a656374223b733a35323a225265706c6163656d656e74206c6f67696e20696e666f726d6174696f6e20666f722021757365726e616d65206174202173697465223b733a31393a22757365725f6d61696c5f706173735f626f6479223b733a3431363a2221757365726e616d652c0d0a0d0a41207265717565737420746f207265736574207468652070617373776f726420666f7220796f7572206163636f756e7420686173206265656e206d6164652061742021736974652e0d0a0d0a596f75206d6179206e6f77206c6f6720696e20746f20217572695f627269656620636c69636b696e67206f6e2074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420696e20796f75722062726f777365723a0d0a0d0a216c6f67696e5f75726c0d0a0d0a546869732069732061206f6e652d74696d65206c6f67696e2c20736f2069742063616e2062652075736564206f6e6c79206f6e63652e2049742065787069726573206166746572206f6e652064617920616e64206e6f7468696e672077696c6c2068617070656e2069662069742773206e6f7420757365642e0d0a0d0a4166746572206c6f6767696e6720696e2c20796f752077696c6c206265207265646972656374656420746f2021656469745f75726920736f20796f752063616e206368616e676520796f75722070617373776f72642e223b733a31333a22757365725f7069637475726573223b733a313a2231223b733a31373a22757365725f706963747572655f70617468223b733a383a227069637475726573223b733a32303a22757365725f706963747572655f64656661756c74223b733a303a22223b733a32333a22757365725f706963747572655f64696d656e73696f6e73223b733a353a223835783835223b733a32323a22757365725f706963747572655f66696c655f73697a65223b733a323a223330223b733a32333a22757365725f706963747572655f67756964656c696e6573223b733a303a22223b733a33353a226269727468646179735f626c6f636b5f6e756d6265725f62795f626972746864617973223b733a313a2233223b733a31343a2273696d706c656e6577735f766964223b693a313b733a32323a2273696d706c656e6577735f707269766174655f6b6579223b733a33323a226538666463643233343365626433663130626365666661353438363862313137223b733a31343a226931386e5f6c616e677561676573223b613a353a7b733a31323a22736974655f64656661756c74223b733a323a22656e223b733a343a226e616d65223b613a323a7b733a323a226e6c223b733a353a224475746368223b733a323a22656e223b733a373a22456e676c697368223b7d733a333a2272746c223b613a333a7b693a303b693a313b733a323a22656e223b693a303b733a323a226e6c223b693a303b7d733a363a226e6174697665223b613a323a7b733a323a22656e223b733a373a22456e676c697368223b733a323a226e6c223b733a353a224475746368223b7d733a373a22656e61626c6564223b613a323a7b733a323a22656e223b733a323a22656e223b733a323a226e6c223b733a323a226e6c223b7d7d733a31343a226931386e5f6e6f64655f6e657773223b733a313a2231223b733a31373a226e6f64655f6f7074696f6e735f70616765223b613a313a7b693a303b733a363a22737461747573223b7d733a31323a22636f6d6d656e745f70616765223b733a313a2230223b733a31313a2275706c6f61645f70616765223b733a313a2231223b733a31383a226576656e745f6e6f64656170695f70616765223b733a353a226e65766572223b733a31363a227369676e75705f666f726d5f70616765223b693a303b733a31363a22706174686175746f5f76657273696f6e223b613a323a7b733a343a2274657874223b733a393a22323030352d392d3138223b733a353a226275696c64223b693a353b7d733a33323a22706174686175746f5f696e646578616c69617365735f62756c6b757064617465223b623a303b733a32373a22706174686175746f5f70756e6374756174696f6e5f71756f746573223b733a313a2230223b733a33313a22706174686175746f5f7461786f6e6f6d795f737570706f7274736665656473223b733a363a22302f66656564223b733a33303a22706174686175746f5f747261636b65725f737570706f7274736665656473223b733a343a2266656564223b733a32373a22706174686175746f5f757365725f737570706f7274736665656473223b4e3b733a31393a22706174686175746f5f6d6f64756c656c697374223b613a343a7b693a303b733a343a226e6f6465223b693a313b733a383a227461786f6e6f6d79223b693a323b733a373a22747261636b6572223b693a333b733a343a2275736572223b7d733a31363a22706174686175746f5f766572626f7365223b693a303b733a31383a22706174686175746f5f736570617261746f72223b733a313a222d223b733a31393a22706174686175746f5f6d61785f6c656e677468223b733a333a22313030223b733a32393a22706174686175746f5f6d61785f636f6d706f6e656e745f6c656e677468223b733a333a22313030223b733a32313a22706174686175746f5f696e646578616c6961736573223b693a303b733a32323a22706174686175746f5f7570646174655f616374696f6e223b733a313a2232223b733a32313a22706174686175746f5f69676e6f72655f776f726473223b733a3130383a22612c616e2c61732c61742c6265666f72652c6275742c62792c666f722c66726f6d2c69732c696e2c696e746f2c6c696b652c6f662c6f66662c6f6e2c6f6e746f2c7065722c73696e63652c7468616e2c7468652c746869732c746861742c746f2c75702c7669612c77697468223b733a32313a22706174686175746f5f6e6f64655f7061747465726e223b733a373a225b7469746c655d223b733a32363a22706174686175746f5f6e6f64655f706f6c6c5f7061747465726e223b733a303a22223b733a32373a22706174686175746f5f6e6f64655f6576656e745f7061747465726e223b733a303a22223b733a32373a22706174686175746f5f6e6f64655f696d6167655f7061747465726e223b733a303a22223b733a33323a22706174686175746f5f6e6f64655f73696d706c656e6577735f7061747465726e223b733a303a22223b733a32363a22706174686175746f5f6e6f64655f6e6577735f7061747465726e223b733a303a22223b733a32363a22706174686175746f5f6e6f64655f706167655f7061747465726e223b733a303a22223b733a32393a22706174686175746f5f6e6f64655f706172746e65725f7061747465726e223b733a303a22223b733a32343a22706174686175746f5f6e6f64655f62756c6b757064617465223b623a303b733a32363a22706174686175746f5f6e6f64655f6170706c79746f6665656473223b693a313b733a32353a22706174686175746f5f7461786f6e6f6d795f7061747465726e223b733a31373a225b766f6361625d2f5b636174706174685d223b733a32373a22706174686175746f5f7461786f6e6f6d795f315f7061747465726e223b733a303a22223b733a32383a22706174686175746f5f7461786f6e6f6d795f62756c6b757064617465223b693a303b733a33303a22706174686175746f5f7461786f6e6f6d795f6170706c79746f6665656473223b693a303b733a32343a22706174686175746f5f747261636b65725f7061747465726e223b733a31373a22757365722f5b757365725d2f747261636b223b733a32373a22706174686175746f5f747261636b65725f62756c6b757064617465223b693a303b733a32393a22706174686175746f5f747261636b65725f6170706c79746f6665656473223b693a303b733a32313a22706174686175746f5f757365725f7061747465726e223b733a31313a22757365722f5b757365725d223b733a32343a22706174686175746f5f757365725f62756c6b757064617465223b693a303b7d, 0, 1193045605, ''),
('imagecache:presets', 0x613a333a7b693a333b733a343a226c6f676f223b693a313b733a393a226d61696e696d616765223b693a323b733a393a227468756d626e61696c223b7d, 0, 1193045593, '');

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

INSERT INTO `satellite2_cache_content` (`cid`, `data`, `expire`, `created`, `headers`) VALUES 
('content_type_info', 0x613a343a7b733a31313a226669656c64207479706573223b613a373a7b733a31333a226e6f64657265666572656e6365223b613a333a7b733a353a226c6162656c223b733a31343a224e6f6465205265666572656e6365223b733a363a226d6f64756c65223b733a31333a226e6f64657265666572656e6365223b733a31303a22666f726d617474657273223b613a343a7b733a373a2264656661756c74223b613a333a7b733a353a226c6162656c223b733a31323a225469746c6520286c696e6b29223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a226e6f64657265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a226e6f64657265666572656e6365223b7d733a353a22706c61696e223b613a333a7b733a353a226c6162656c223b733a31353a225469746c6520286e6f206c696e6b29223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a226e6f64657265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a226e6f64657265666572656e6365223b7d733a343a2266756c6c223b613a333a7b733a353a226c6162656c223b733a393a2246756c6c206e6f6465223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a226e6f64657265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a226e6f64657265666572656e6365223b7d733a363a22746561736572223b613a333a7b733a353a226c6162656c223b733a363a22546561736572223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a226e6f64657265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a226e6f64657265666572656e6365223b7d7d7d733a31343a226e756d6265725f696e7465676572223b613a333a7b733a353a226c6162656c223b733a373a22496e7465676572223b733a363a226d6f64756c65223b733a363a226e756d626572223b733a31303a22666f726d617474657273223b613a353a7b733a373a2264656661756c74223b613a333a7b733a353a226c6162656c223b733a343a2239393939223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2275735f30223b613a333a7b733a353a226c6162656c223b733a353a22392c393939223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2262655f30223b613a333a7b733a353a226c6162656c223b733a353a22392e393939223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2266725f30223b613a333a7b733a353a226c6162656c223b733a353a223920393939223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a31313a22756e666f726d6174746564223b613a333a7b733a353a226c6162656c223b733a31313a22756e666f726d6174746564223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d7d7d733a31343a226e756d6265725f646563696d616c223b613a333a7b733a353a226c6162656c223b733a373a22446563696d616c223b733a363a226d6f64756c65223b733a363a226e756d626572223b733a31303a22666f726d617474657273223b613a31313a7b733a373a2264656661756c74223b613a333a7b733a353a226c6162656c223b733a343a2239393939223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2275735f30223b613a333a7b733a353a226c6162656c223b733a353a22392c393939223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2275735f31223b613a333a7b733a353a226c6162656c223b733a373a22392c3939392e39223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2275735f32223b613a333a7b733a353a226c6162656c223b733a383a22392c3939392e3939223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2262655f30223b613a333a7b733a353a226c6162656c223b733a353a22392e393939223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2262655f31223b613a333a7b733a353a226c6162656c223b733a373a22392e3939392c39223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2262655f32223b613a333a7b733a353a226c6162656c223b733a383a22392e3939392c3939223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2266725f30223b613a333a7b733a353a226c6162656c223b733a353a223920393939223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2266725f31223b613a333a7b733a353a226c6162656c223b733a383a2239203939392c2039223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a343a2266725f32223b613a333a7b733a353a226c6162656c223b733a393a2239203939392c203939223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a31313a22756e666f726d6174746564223b613a333a7b733a353a226c6162656c223b733a31313a22756e666f726d6174746564223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d7d7d733a343a2274657874223b613a333a7b733a353a226c6162656c223b733a343a2254657874223b733a363a226d6f64756c65223b733a343a2274657874223b733a31303a22666f726d617474657273223b613a333a7b733a373a2264656661756c74223b613a333a7b733a353a226c6162656c223b733a373a2244656661756c74223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a2274657874223b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a353a22706c61696e223b613a333a7b733a353a226c6162656c223b733a31303a22506c61696e2074657874223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a2274657874223b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a373a227472696d6d6564223b613a333a7b733a353a226c6162656c223b733a373a225472696d6d6564223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a2274657874223b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d7d733a31333a22757365727265666572656e6365223b613a333a7b733a353a226c6162656c223b733a31343a2255736572205265666572656e6365223b733a363a226d6f64756c65223b733a31333a22757365727265666572656e6365223b733a31303a22666f726d617474657273223b613a323a7b733a373a2264656661756c74223b613a333a7b733a353a226c6162656c223b733a373a2244656661756c74223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a22757365727265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a22757365727265666572656e6365223b7d733a353a22706c61696e223b613a333a7b733a353a226c6162656c223b733a31303a22506c61696e2074657874223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a22757365727265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a22757365727265666572656e6365223b7d7d7d733a353a22696d616765223b613a333a7b733a353a226c6162656c223b733a353a22496d616765223b733a363a226d6f64756c65223b733a31303a22696d6167656669656c64223b733a31303a22666f726d617474657273223b613a373a7b733a343a226c6f676f223b613a333a7b733a353a226c6162656c223b733a343a226c6f676f223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a353a22696d616765223b7d733a363a226d6f64756c65223b733a31303a22696d6167656669656c64223b7d733a31313a226c6f676f5f6c696e6b6564223b613a333a7b733a353a226c6162656c223b733a31323a226c6f676f206173206c696e6b223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a353a22696d616765223b7d733a363a226d6f64756c65223b733a31303a22696d6167656361636865223b7d733a393a226d61696e696d616765223b613a333a7b733a353a226c6162656c223b733a393a226d61696e696d616765223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a353a22696d616765223b7d733a363a226d6f64756c65223b733a31303a22696d6167656669656c64223b7d733a31363a226d61696e696d6167655f6c696e6b6564223b613a333a7b733a353a226c6162656c223b733a31373a226d61696e696d616765206173206c696e6b223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a353a22696d616765223b7d733a363a226d6f64756c65223b733a31303a22696d6167656361636865223b7d733a393a227468756d626e61696c223b613a333a7b733a353a226c6162656c223b733a393a227468756d626e61696c223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a353a22696d616765223b7d733a363a226d6f64756c65223b733a31303a22696d6167656669656c64223b7d733a31363a227468756d626e61696c5f6c696e6b6564223b613a333a7b733a353a226c6162656c223b733a31373a227468756d626e61696c206173206c696e6b223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a353a22696d616765223b7d733a363a226d6f64756c65223b733a31303a22696d6167656361636865223b7d733a373a2264656661756c74223b613a333a7b733a353a226c6162656c223b733a373a2244656661756c74223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a353a22696d616765223b7d733a363a226d6f64756c65223b733a31303a22696d6167656669656c64223b7d7d7d733a343a226c696e6b223b613a333a7b733a353a226c6162656c223b733a343a224c696e6b223b733a363a226d6f64756c65223b733a343a226c696e6b223b733a31303a22666f726d617474657273223b613a343a7b733a373a2264656661756c74223b613a333a7b733a353a226c6162656c223b733a32373a2244656661756c742c206173206c696e6b2077697468207469746c65223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a226c696e6b223b7d733a363a226d6f64756c65223b733a343a226c696e6b223b7d733a353a22706c61696e223b613a333a7b733a353a226c6162656c223b733a32323a22506c61696e2c2061732074686520746578742055524c223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a226c696e6b223b7d733a363a226d6f64756c65223b733a343a226c696e6b223b7d733a353a2273686f7274223b613a333a7b733a353a226c6162656c223b733a33323a2253686f72742c206173206c696e6b2077697468207469746c6520224c696e6b22223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a226c696e6b223b7d733a363a226d6f64756c65223b733a343a226c696e6b223b7d733a353a226c6162656c223b613a333a7b733a353a226c6162656c223b733a33343a224c6162656c2c206173206c696e6b2077697468206c6162656c206173207469746c65223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a226c696e6b223b7d733a363a226d6f64756c65223b733a343a226c696e6b223b7d7d7d7d733a31323a22776964676574207479706573223b613a31313a7b733a32303a226e6f64657265666572656e63655f73656c656374223b613a333a7b733a353a226c6162656c223b733a31313a2253656c656374204c697374223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a226e6f64657265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a226e6f64657265666572656e6365223b7d733a32363a226e6f64657265666572656e63655f6175746f636f6d706c657465223b613a333a7b733a353a226c6162656c223b733a32333a224175746f636f6d706c6574652054657874204669656c64223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a226e6f64657265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a226e6f64657265666572656e6365223b7d733a363a226e756d626572223b613a333a7b733a353a226c6162656c223b733a31303a2254657874204669656c64223b733a31313a226669656c64207479706573223b613a323a7b693a303b733a31343a226e756d6265725f696e7465676572223b693a313b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a363a226e756d626572223b7d733a31343a226f7074696f6e735f73656c656374223b613a333a7b733a353a226c6162656c223b733a31313a2253656c656374206c697374223b733a31313a226669656c64207479706573223b613a333a7b693a303b733a343a2274657874223b693a313b733a31343a226e756d6265725f696e7465676572223b693a323b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a31333a226f7074696f6e77696467657473223b7d733a31353a226f7074696f6e735f627574746f6e73223b613a333a7b733a353a226c6162656c223b733a32353a22436865636b20626f7865732f726164696f20627574746f6e73223b733a31313a226669656c64207479706573223b613a333a7b693a303b733a343a2274657874223b693a313b733a31343a226e756d6265725f696e7465676572223b693a323b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a31333a226f7074696f6e77696467657473223b7d733a31333a226f7074696f6e735f6f6e6f6666223b613a333a7b733a353a226c6162656c223b733a32323a2253696e676c65206f6e2f6f666620636865636b626f78223b733a31313a226669656c64207479706573223b613a333a7b693a303b733a343a2274657874223b693a313b733a31343a226e756d6265725f696e7465676572223b693a323b733a31343a226e756d6265725f646563696d616c223b7d733a363a226d6f64756c65223b733a31333a226f7074696f6e77696467657473223b7d733a343a2274657874223b613a333a7b733a353a226c6162656c223b733a31303a2254657874204669656c64223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a2274657874223b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a32303a22757365727265666572656e63655f73656c656374223b613a333a7b733a353a226c6162656c223b733a31313a2253656c656374204c697374223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a22757365727265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a22757365727265666572656e6365223b7d733a32363a22757365727265666572656e63655f6175746f636f6d706c657465223b613a333a7b733a353a226c6162656c223b733a32333a224175746f636f6d706c6574652054657874204669656c64223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a31333a22757365727265666572656e6365223b7d733a363a226d6f64756c65223b733a31333a22757365727265666572656e6365223b7d733a353a22696d616765223b613a333a7b733a353a226c6162656c223b733a353a22496d616765223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a353a22696d616765223b7d733a363a226d6f64756c65223b733a31303a22696d6167656669656c64223b7d733a343a226c696e6b223b613a333a7b733a353a226c6162656c223b733a32393a2254657874204669656c647320666f72205469746c6520616e642055524c223b733a31313a226669656c64207479706573223b613a313a7b693a303b733a343a226c696e6b223b7d733a363a226d6f64756c65223b733a343a226c696e6b223b7d7d733a363a226669656c6473223b613a353a7b733a31313a226669656c645f696d616765223b613a373a7b733a31303a226669656c645f6e616d65223b733a31313a226669656c645f696d616765223b733a343a2274797065223b733a353a22696d616765223b733a383a227265717569726564223b733a313a2231223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a363a22776964676574223b613a313a7b733a353a226c6162656c223b733a353a22496d616765223b7d733a393a22747970655f6e616d65223b733a343a226e657773223b7d733a31333a226669656c645f73756d6d617279223b613a31313a7b733a31303a226669656c645f6e616d65223b733a31333a226669656c645f73756d6d617279223b733a343a2274797065223b733a343a2274657874223b733a383a227265717569726564223b733a313a2231223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a31353a22746578745f70726f63657373696e67223b733a313a2230223b733a31303a226d61785f6c656e677468223b733a333a22353030223b733a31343a22616c6c6f7765645f76616c756573223b733a303a22223b733a31383a22616c6c6f7765645f76616c7565735f706870223b733a303a22223b733a363a22776964676574223b613a313a7b733a353a226c6162656c223b733a373a2253756d6d617279223b7d733a393a22747970655f6e616d65223b733a343a226e657773223b7d733a32323a226669656c645f73686f72746465736372697074696f6e223b613a31313a7b733a31303a226669656c645f6e616d65223b733a32323a226669656c645f73686f72746465736372697074696f6e223b733a343a2274797065223b733a343a2274657874223b733a383a227265717569726564223b733a313a2231223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a31353a22746578745f70726f63657373696e67223b733a313a2230223b733a31303a226d61785f6c656e677468223b733a303a22223b733a31343a22616c6c6f7765645f76616c756573223b733a303a22223b733a31383a22616c6c6f7765645f76616c7565735f706870223b733a303a22223b733a363a22776964676574223b613a313a7b733a353a226c6162656c223b733a31373a2253686f7274204465736372697074696f6e223b7d733a393a22747970655f6e616d65223b733a373a22706172746e6572223b7d733a31303a226669656c645f6c6f676f223b613a373a7b733a31303a226669656c645f6e616d65223b733a31303a226669656c645f6c6f676f223b733a343a2274797065223b733a353a22696d616765223b733a383a227265717569726564223b733a313a2231223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a363a22776964676574223b613a313a7b733a353a226c6162656c223b733a343a224c6f676f223b7d733a393a22747970655f6e616d65223b733a373a22706172746e6572223b7d733a31343a226669656c645f6c6f676f6c696e6b223b613a31303a7b733a31303a226669656c645f6e616d65223b733a31343a226669656c645f6c6f676f6c696e6b223b733a343a2274797065223b733a343a226c696e6b223b733a383a227265717569726564223b733a313a2230223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a31303a2261747472696275746573223b613a333a7b733a363a22746172676574223b733a373a2264656661756c74223b733a333a2272656c223b693a303b733a353a22636c617373223b733a303a22223b7d733a373a22646973706c6179223b613a313a7b733a31303a2275726c5f6375746f6666223b733a323a223830223b7d733a353a227469746c65223b733a383a226f7074696f6e616c223b733a363a22776964676574223b613a313a7b733a353a226c6162656c223b733a31353a22506172746e65722077656273697465223b7d733a393a22747970655f6e616d65223b733a373a22706172746e6572223b7d7d733a31333a22636f6e74656e74207479706573223b613a373a7b733a353a226576656e74223b613a31363a7b733a343a2274797065223b733a353a226576656e74223b733a343a226e616d65223b733a353a224576656e74223b733a363a226d6f64756c65223b733a31303a2262617369636576656e74223b733a31313a226465736372697074696f6e223b733a39393a22416e206576656e7420697320612073746f72792077686963682063616e20626520676976656e206120737461727420616e6420656e6420646174652c207468757320617070656172696e6720696e20746865206576656e74732063616c656e6461722e223b733a343a2268656c70223b733a303a22223b733a393a226861735f7469746c65223b733a313a2231223b733a31313a227469746c655f6c6162656c223b733a353a225469746c65223b733a383a226861735f626f6479223b733a313a2231223b733a31303a22626f64795f6c6162656c223b733a343a22426f6479223b733a31343a226d696e5f776f72645f636f756e74223b733a313a2230223b733a363a22637573746f6d223b733a313a2230223b733a383a226d6f646966696564223b733a313a2230223b733a363a226c6f636b6564223b733a313a2231223b733a393a226f7269675f74797065223b733a353a226576656e74223b733a373a2275726c5f737472223b733a353a226576656e74223b733a363a226669656c6473223b613a303a7b7d7d733a353a22696d616765223b613a31363a7b733a343a2274797065223b733a353a22696d616765223b733a343a226e616d65223b733a353a22496d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a31313a226465736372697074696f6e223b733a38333a22416e20696d616765202877697468207468756d626e61696c292e205468697320697320696465616c20666f72207075626c697368696e672070686f746f677261706873206f722073637265656e73686f74732e223b733a343a2268656c70223b733a303a22223b733a393a226861735f7469746c65223b733a313a2231223b733a31313a227469746c655f6c6162656c223b733a353a225469746c65223b733a383a226861735f626f6479223b733a313a2231223b733a31303a22626f64795f6c6162656c223b733a343a22426f6479223b733a31343a226d696e5f776f72645f636f756e74223b733a313a2230223b733a363a22637573746f6d223b733a313a2230223b733a383a226d6f646966696564223b733a313a2230223b733a363a226c6f636b6564223b733a313a2231223b733a393a226f7269675f74797065223b733a353a22696d616765223b733a373a2275726c5f737472223b733a353a22696d616765223b733a363a226669656c6473223b613a303a7b7d7d733a343a226e657773223b613a31363a7b733a343a2274797065223b733a343a226e657773223b733a343a226e616d65223b733a343a224e657773223b733a363a226d6f64756c65223b733a343a226e6f6465223b733a31313a226465736372697074696f6e223b733a3231383a22416c6c20796f75722045534e2072656c61746564206e6577732e20506f7374696e67206173206e6577732077696c6c2070757420746865206e657773206974656d20696e746f2061206e657773207061676520616e642070726f6d6f7465206120746561736572202873686f72742076657273696f6e206f6620796f7572206e6577732077697468206120736d616c6c20696d6167652920746f20796f75722066726f6e7420706167652e20557365207468697320666f7220616c6c2064796e616d696320636f6e74656e74206f6e20796f757220736974652e223b733a343a2268656c70223b733a37363a2250757420686572652074686520636f6e74656e74206f6620796f7572206e657773206974656d2e20596f75206861766520746f207772697465206174206c6561737420313020776f7264732e223b733a393a226861735f7469746c65223b733a313a2231223b733a31313a227469746c655f6c6162656c223b733a353a225469746c65223b733a383a226861735f626f6479223b733a313a2231223b733a31303a22626f64795f6c6162656c223b733a343a22426f6479223b733a31343a226d696e5f776f72645f636f756e74223b733a323a223130223b733a363a22637573746f6d223b733a313a2231223b733a383a226d6f646966696564223b733a313a2231223b733a363a226c6f636b6564223b733a313a2230223b733a393a226f7269675f74797065223b733a303a22223b733a373a2275726c5f737472223b733a343a226e657773223b733a363a226669656c6473223b613a323a7b733a31313a226669656c645f696d616765223b613a383a7b733a31303a226669656c645f6e616d65223b733a31313a226669656c645f696d616765223b733a343a2274797065223b733a353a22696d616765223b733a383a227265717569726564223b733a313a2231223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a363a22776964676574223b613a31303a7b733a31343a226d61785f7265736f6c7574696f6e223b733a313a2230223b733a31303a22696d6167655f70617468223b733a31313a22696d616765732d6e657773223b733a31303a22637573746f6d5f616c74223b693a313b733a31323a22637573746f6d5f7469746c65223b693a313b733a31333a227465617365725f707265736574223b4e3b733a31313a22626f64795f707265736574223b4e3b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a323a222d32223b733a353a226c6162656c223b733a353a22496d616765223b733a31313a226465736372697074696f6e223b733a36343a2241646420616e20696d6167652e20546869732077696c6c206d616b6520796f757220706f73742076697375616c6c79206d6f726520617474726163746976652e223b7d733a393a22747970655f6e616d65223b733a343a226e657773223b733a31363a22646973706c61795f73657474696e6773223b613a333a7b733a353a226c6162656c223b613a313a7b733a363a22666f726d6174223b733a363a2268696464656e223b7d733a363a22746561736572223b613a313a7b733a363a22666f726d6174223b733a393a227468756d626e61696c223b7d733a343a2266756c6c223b613a313a7b733a363a22666f726d6174223b733a393a226d61696e696d616765223b7d7d7d733a31333a226669656c645f73756d6d617279223b613a31323a7b733a31303a226669656c645f6e616d65223b733a31333a226669656c645f73756d6d617279223b733a343a2274797065223b733a343a2274657874223b733a383a227265717569726564223b733a313a2231223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a31353a22746578745f70726f63657373696e67223b733a313a2230223b733a31303a226d61785f6c656e677468223b733a333a22353030223b733a31343a22616c6c6f7765645f76616c756573223b733a303a22223b733a31383a22616c6c6f7765645f76616c7565735f706870223b733a303a22223b733a363a22776964676574223b613a373a7b733a31333a2264656661756c745f76616c7565223b613a313a7b693a303b613a313a7b733a353a2276616c7565223b733a303a22223b7d7d733a31373a2264656661756c745f76616c75655f706870223b733a303a22223b733a343a22726f7773223b733a323a223130223b733a343a2274797065223b733a343a2274657874223b733a363a22776569676874223b733a323a222d31223b733a353a226c6162656c223b733a373a2253756d6d617279223b733a31313a226465736372697074696f6e223b733a3133313a2241206272696566206465736372697074696f6e206f6620746865206e65777320636f6e74656e742c206d61782e2035303020636861726163746572732e205469703a20596f752063616e20656173696c7920636f707920616e642070617374652074686520666972737420726f77732066726f6d20746865206e65777320626f64792e223b7d733a393a22747970655f6e616d65223b733a343a226e657773223b733a31363a22646973706c61795f73657474696e6773223b613a333a7b733a353a226c6162656c223b613a313a7b733a363a22666f726d6174223b733a363a2268696464656e223b7d733a363a22746561736572223b613a313a7b733a363a22666f726d6174223b733a353a22706c61696e223b7d733a343a2266756c6c223b613a313a7b733a363a22666f726d6174223b733a373a2264656661756c74223b7d7d7d7d7d733a343a2270616765223b613a31363a7b733a343a2274797065223b733a343a2270616765223b733a343a226e616d65223b733a343a2250616765223b733a363a226d6f64756c65223b733a343a226e6f6465223b733a31313a226465736372697074696f6e223b733a38333a22496620796f752077616e7420746f2061646420612073746174696320706167652c206c696b65206120636f6e746163742070616765206f7220616e2061626f757420706167652c20757365206120706167652e223b733a343a2268656c70223b733a303a22223b733a393a226861735f7469746c65223b733a313a2231223b733a31313a227469746c655f6c6162656c223b733a353a225469746c65223b733a383a226861735f626f6479223b733a313a2231223b733a31303a22626f64795f6c6162656c223b733a343a22426f6479223b733a31343a226d696e5f776f72645f636f756e74223b733a313a2230223b733a363a22637573746f6d223b733a313a2231223b733a383a226d6f646966696564223b733a313a2231223b733a363a226c6f636b6564223b733a313a2230223b733a393a226f7269675f74797065223b733a303a22223b733a373a2275726c5f737472223b733a343a2270616765223b733a363a226669656c6473223b613a303a7b7d7d733a373a22706172746e6572223b613a31363a7b733a343a2274797065223b733a373a22706172746e6572223b733a343a226e616d65223b733a373a22506172746e6572223b733a363a226d6f64756c65223b733a343a226e6f6465223b733a31313a226465736372697074696f6e223b733a3135363a224120706172746e65722066726f6d20796f75722045534e2073656374696f6e2c20652e672e20676976696e6720796f752045534e206361726420646973636f756e7473206f722073706f6e736f72696e6720796f75722073656374696f6e2e20506172746e657273206172652067726f7570656420746f67657468657220616e64206665746368656420696e207468652045534e2047616c6178792e223b733a343a2268656c70223b733a303a22223b733a393a226861735f7469746c65223b733a313a2231223b733a31313a227469746c655f6c6162656c223b733a353a225469746c65223b733a383a226861735f626f6479223b733a313a2231223b733a31303a22626f64795f6c6162656c223b733a343a22426f6479223b733a31343a226d696e5f776f72645f636f756e74223b733a313a2230223b733a363a22637573746f6d223b733a313a2231223b733a383a226d6f646966696564223b733a313a2231223b733a363a226c6f636b6564223b733a313a2230223b733a393a226f7269675f74797065223b733a303a22223b733a373a2275726c5f737472223b733a373a22706172746e6572223b733a363a226669656c6473223b613a333a7b733a31303a226669656c645f6c6f676f223b613a383a7b733a31303a226669656c645f6e616d65223b733a31303a226669656c645f6c6f676f223b733a343a2274797065223b733a353a22696d616765223b733a383a227265717569726564223b733a313a2231223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a363a22776964676574223b613a31303a7b733a31343a226d61785f7265736f6c7574696f6e223b733a313a2230223b733a31303a22696d6167655f70617468223b733a31343a22696d616765732d706172746e6572223b733a31303a22637573746f6d5f616c74223b693a313b733a31323a22637573746f6d5f7469746c65223b693a313b733a31333a227465617365725f707265736574223b4e3b733a31313a22626f64795f707265736574223b4e3b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a323a222d33223b733a353a226c6162656c223b733a343a224c6f676f223b733a31313a226465736372697074696f6e223b733a3130303a22507574206865726520746865206c6f676f206f6620796f757220706172746e65722e2054686973206973207265636f6d6d656e6465642061732069742077696c6c20617070656172206f6e20796f757220536174656c6c69746520686f6d657061676521223b7d733a393a22747970655f6e616d65223b733a373a22706172746e6572223b733a31363a22646973706c61795f73657474696e6773223b613a333a7b733a353a226c6162656c223b613a313a7b733a363a22666f726d6174223b733a363a2268696464656e223b7d733a363a22746561736572223b613a313a7b733a363a22666f726d6174223b733a343a226c6f676f223b7d733a343a2266756c6c223b613a313a7b733a363a22666f726d6174223b733a393a226d61696e696d616765223b7d7d7d733a32323a226669656c645f73686f72746465736372697074696f6e223b613a31323a7b733a31303a226669656c645f6e616d65223b733a32323a226669656c645f73686f72746465736372697074696f6e223b733a343a2274797065223b733a343a2274657874223b733a383a227265717569726564223b733a313a2231223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a31353a22746578745f70726f63657373696e67223b733a313a2230223b733a31303a226d61785f6c656e677468223b733a303a22223b733a31343a22616c6c6f7765645f76616c756573223b733a303a22223b733a31383a22616c6c6f7765645f76616c7565735f706870223b733a303a22223b733a363a22776964676574223b613a373a7b733a31333a2264656661756c745f76616c7565223b613a313a7b693a303b613a313a7b733a353a2276616c7565223b733a303a22223b7d7d733a31373a2264656661756c745f76616c75655f706870223b733a303a22223b733a343a22726f7773223b733a313a2237223b733a343a2274797065223b733a343a2274657874223b733a363a22776569676874223b733a323a222d31223b733a353a226c6162656c223b733a31373a2253686f7274204465736372697074696f6e223b733a31313a226465736372697074696f6e223b733a303a22223b7d733a393a22747970655f6e616d65223b733a373a22706172746e6572223b733a31363a22646973706c61795f73657474696e6773223b613a333a7b733a353a226c6162656c223b613a313a7b733a363a22666f726d6174223b733a363a2268696464656e223b7d733a363a22746561736572223b613a313a7b733a363a22666f726d6174223b733a353a22706c61696e223b7d733a343a2266756c6c223b613a313a7b733a363a22666f726d6174223b733a373a2264656661756c74223b7d7d7d733a31343a226669656c645f6c6f676f6c696e6b223b613a31313a7b733a31303a226669656c645f6e616d65223b733a31343a226669656c645f6c6f676f6c696e6b223b733a343a2274797065223b733a343a226c696e6b223b733a383a227265717569726564223b733a313a2230223b733a383a226d756c7469706c65223b733a313a2230223b733a31303a2264625f73746f72616765223b733a313a2231223b733a31303a2261747472696275746573223b613a333a7b733a363a22746172676574223b733a373a2264656661756c74223b733a333a2272656c223b693a303b733a353a22636c617373223b733a303a22223b7d733a373a22646973706c6179223b613a313a7b733a31303a2275726c5f6375746f6666223b733a323a223830223b7d733a353a227469746c65223b733a383a226f7074696f6e616c223b733a363a22776964676574223b613a363a7b733a31333a2264656661756c745f76616c7565223b613a313a7b693a303b613a333a7b733a333a2275726c223b733a303a22223b733a353a227469746c65223b733a303a22223b733a31303a2261747472696275746573223b733a323a224e3b223b7d7d733a31373a2264656661756c745f76616c75655f706870223b733a303a22223b733a343a2274797065223b733a343a226c696e6b223b733a363a22776569676874223b733a313a2231223b733a353a226c6162656c223b733a31353a22506172746e65722077656273697465223b733a31313a226465736372697074696f6e223b733a33373a225075742068657265207468652077656273697465206f6620796f757220706172746e65722e223b7d733a393a22747970655f6e616d65223b733a373a22706172746e6572223b733a31363a22646973706c61795f73657474696e6773223b613a333a7b733a353a226c6162656c223b613a313a7b733a363a22666f726d6174223b733a363a22696e6c696e65223b7d733a363a22746561736572223b613a313a7b733a363a22666f726d6174223b733a353a22706c61696e223b7d733a343a2266756c6c223b613a313a7b733a363a22666f726d6174223b733a353a22706c61696e223b7d7d7d7d7d733a343a22706f6c6c223b613a31363a7b733a343a2274797065223b733a343a22706f6c6c223b733a343a226e616d65223b733a343a22506f6c6c223b733a363a226d6f64756c65223b733a343a22706f6c6c223b733a31313a226465736372697074696f6e223b733a36343a224120706f6c6c2069732061206d756c7469706c652d63686f696365207175657374696f6e2077686963682076697369746f72732063616e20766f7465206f6e2e223b733a343a2268656c70223b733a303a22223b733a393a226861735f7469746c65223b733a313a2231223b733a31313a227469746c655f6c6162656c223b733a383a225175657374696f6e223b733a383a226861735f626f6479223b733a313a2230223b733a31303a22626f64795f6c6162656c223b733a303a22223b733a31343a226d696e5f776f72645f636f756e74223b733a313a2230223b733a363a22637573746f6d223b733a313a2230223b733a383a226d6f646966696564223b733a313a2230223b733a363a226c6f636b6564223b733a313a2231223b733a393a226f7269675f74797065223b733a343a22706f6c6c223b733a373a2275726c5f737472223b733a343a22706f6c6c223b733a363a226669656c6473223b613a303a7b7d7d733a31303a2273696d706c656e657773223b613a31363a7b733a343a2274797065223b733a31303a2273696d706c656e657773223b733a343a226e616d65223b733a31363a224e6577736c6574746572206973737565223b733a363a226d6f64756c65223b733a31303a2273696d706c656e657773223b733a31313a226465736372697074696f6e223b733a36383a224372656174652061206e6577736c657474657220697373756520746f2062652073656e7420746f207375627363726962656420652d6d61696c206164647265737365732e223b733a343a2268656c70223b733a303a22223b733a393a226861735f7469746c65223b733a313a2231223b733a31313a227469746c655f6c6162656c223b733a353a225469746c65223b733a383a226861735f626f6479223b733a313a2231223b733a31303a22626f64795f6c6162656c223b733a343a22426f6479223b733a31343a226d696e5f776f72645f636f756e74223b733a313a2230223b733a363a22637573746f6d223b733a313a2230223b733a383a226d6f646966696564223b733a313a2230223b733a363a226c6f636b6564223b733a313a2231223b733a393a226f7269675f74797065223b733a31303a2273696d706c656e657773223b733a373a2275726c5f737472223b733a31303a2273696d706c656e657773223b733a363a226669656c6473223b613a303a7b7d7d7d7d, 0, 1193045593, ''),
('content:20:20', 0x613a323a7b733a31313a226669656c645f696d616765223b613a313a7b693a303b613a383a7b733a333a22666964223b733a323a223234223b733a353a227469746c65223b733a31373a2245534e20536174656c6c69746520322e30223b733a333a22616c74223b733a31373a2245534e20536174656c6c69746520322e30223b733a333a226e6964223b733a323a223230223b733a383a2266696c656e616d65223b733a31373a2245534e5f617374726f6e6175742e706e67223b733a383a2266696c6570617468223b733a33353a2266696c65732f696d616765732d6e6577732f45534e5f617374726f6e6175742e706e67223b733a383a2266696c656d696d65223b733a393a22696d6167652f706e67223b733a383a2266696c6573697a65223b733a353a223637353837223b7d7d733a31333a226669656c645f73756d6d617279223b613a313a7b693a303b613a313a7b733a353a2276616c7565223b733a3138323a2254727920536174656c6c69746520666f7220796f75722073656374696f6e21205468652045534e20496e7465726e6174696f6e616c205765627465616d20697320737570706f7274696e6720696e74657265737465642073656374696f6e732077696c6c696e6720746f20696e7374616c6c207468652045534e20536174656c6c69746520322e302c2074686572656279206a6f696e696e672074686520666173742067726f77696e672045534e2047616c61787921223b7d7d7d, 0, 1193045594, ''),
('fieldgroup_data', 0x613a323a7b733a363a2267726f757073223b613a303a7b7d733a31333a2267726f7570735f736f72746564223b613a303a7b7d7d, 0, 1193045594, '');

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

INSERT INTO `satellite2_cache_filter` (`cid`, `data`, `expire`, `created`, `headers`) VALUES 
('3:2476c5dabbd58d07c6fc38f02564ded9', 0x3c64697620636c6173733d22636f6e74656e74223e0a3c703e45534e20536174656c6c69746520697320746865206672656520776562736974652074656d706c61746520666f722045534e2073656374696f6e732c20646576656c6f70656420616e64206d61696e7461696e6564206279207468652045534e20496e7465726e6174696f6e616c205765627465616d2e20203c2f703e0a3c68323e426520612045534e20417374726f6e6175743a20496e7374616c6c2045534e20536174656c6c69746520666f7220796f75722073656374696f6e213c2f68323e0a3c703e54727920536174656c6c69746520666f7220796f75722073656374696f6e21205468652045534e20496e7465726e6174696f6e616c205765627465616d20697320737570706f7274696e6720696e74657265737465642073656374696f6e732077696c6c696e6720746f20696e7374616c6c207468652045534e20536174656c6c6974652e20446f63756d656e746174696f6e2077696c6c20616c736f20626520617661696c61626c652e3c2f703e0a3c703e45534e20536174656c6c697465206973206561737920746f20696e7374616c6c2c20627574206974206973207374696c6c206120576562206170706c69636174696f6e20616e6420697473207365747570206973207468757320646966666572656e742066726f6d2061206e6f726d616c2070726f6772616d20696e7374616c6c6174696f6e206f6e796f75722050432e20536f2061206261736963206b6e6f776c65646765206f6620686f7720746f20696e7374616c6c20576562206170706c69636174696f6e7320697320726571756972656420696620796f752077616e7420746f20747279206974206f75742e3c2f703e0a3c703e4a6f696e207468652070726f6a6563742c206765742045534e20536174656c6c69746520616e64207374617274206578706572696d656e74696e67213c2f703e0a3c68323e45534e20536174656c6c697465205265736f75726365733c2f68323e0a3c703e496620796f75206a757374207769736820746f206b6e6f77206d6f72652061626f7574207468652045534e20536174656c6c6974652062757420646f6e27742077616e7420746f20747279206974207269676874206e6f772c207765206861766520736f6d6520646f63756d656e746174696f6e20617661696c61626c652e2057652065787065637420697420746f20626520657874656e64656420616e6420696d70726f76656420647572696e672074686520626574612074657374696e672070686173652c20736f20706c6561736520636865636b206261636b206f6674656e2e203c2f703e0a3c756c3e0a3c6c693e3c6120687265663d22687474703a2f2f7777772e65736e2e6f72672f736174656c6c697465223e536174656c6c69746520446f63756d656e746174696f6e2077696b693c2f613e3c2f6c693e0a3c6c693e3c6120687265663d22687474703a2f2f67726f7570732e676f6f676c652e636f6d2f67726f75702f65736e2d736174656c6c697465223e45534e20536174656c6c69746520476f6f676c652047726f75703c2f613e3c2f6c693e0a3c2f756c3e0a3c68323e4e657720696e2045534e20536174656c6c69746520322e303c2f68323e0a3c703e45534e20536174656c6c69746520322e3020636f6d65732077697468207365766572616c206e65772066656174757265733a3c2f703e0a3c756c3e0a3c6c693e4d756c74696c696e6775616c20696e746572666163653a20697420737570706f727473206c6f63616c697a696e6720796f7572207765627369746520706167657320696e206173206d616e79206c616e67756167657320617320796f7520776973682e2e2e20616e642c20616e797761792c2065766572792073747564656e742077696c6c2062652061626c6520746f207365652074686520776562207369746520696e7465726661636520696e20686572206f776e206c616e6775616765213c2f6c693e0a3c6c693e41206e6577202671756f743b636f6e74726f6c2070616e656c2671756f743b20666f72206661737465722061636365737320746f20746865206d6f737420636f6d6d6f6e2061646d696e697374726174696f6e207461736b732e3c2f6c693e0a3c6c693e4e6577736c657474657220737570706f72742e3c2f6c693e0a3c6c693e4469726563742061636365737320746f207468652045534e2047616c6178792e3c2f6c693e0a3c6c693e416e20696d70726f76656420696e7374616c6c6174696f6e2070726f636573732c20776974682062726f6164657220636f6d7061746962696c6974792e3c2f6c693e0a3c2f756c3e0a3c703e3c2f703e0a3c2f6469763e0a3c64697620636c6173733d22636f6e74656e74223e0a3c68323e4a6f696e207468652045534e2047616c6178793c2f68323e0a3c703e437572696f757320746f207365652077686174207468652045534e2047616c6178792069733f205468656e20636865636b206974206f7574203c6120687265663d223f713d65736e2d67616c617879223e6f6e20796f7572206f776e20536174656c6c6974652077656273697465213c2f613e20416e6420696620796f7520617265206e6f7420796574206f66207468697320666173742067726f77696e67206e6574776f726b206f6620536174656c6c697465732c207468656e20626520717569636b20616e64203c6120687265663d222f3f713d65736e2d67616c617879223e616374697661746520796f757220536174656c6c697465206e6f77213c2f613e3c2f703e0a3c703e3c2f6469763e0a, 1193131994, 1193045594, '');

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

INSERT INTO `satellite2_cache_menu` (`cid`, `data`, `expire`, `created`, `headers`) VALUES 
('1:en', 0x613a343a7b733a31303a227061746820696e646578223b613a3239353a7b733a32343a2261646d696e2f73657474696e67732f626972746864617973223b733a323a223930223b733a33333a2261646d696e2f73657474696e67732f6269727468646179732f73657474696e6773223b693a2d323b733a32393a2261646d696e2f73657474696e67732f6269727468646179732f73796e63223b693a2d333b733a393a22626972746864617973223b733a323a223931223b733a32343a2261646d696e2f636f6e74656e742f61676772656761746f72223b733a323a223730223b733a33333a2261646d696e2f636f6e74656e742f61676772656761746f722f6164642f66656564223b693a2d363b733a33373a2261646d696e2f636f6e74656e742f61676772656761746f722f6164642f63617465676f7279223b693a2d373b733a33313a2261646d696e2f636f6e74656e742f61676772656761746f722f72656d6f7665223b693a2d383b733a33313a2261646d696e2f636f6e74656e742f61676772656761746f722f757064617465223b693a2d393b733a32393a2261646d696e2f636f6e74656e742f61676772656761746f722f6c697374223b693a2d31303b733a33333a2261646d696e2f636f6e74656e742f61676772656761746f722f73657474696e6773223b693a2d31313b733a31303a2261676772656761746f72223b733a323a223731223b733a31383a2261676772656761746f722f736f7572636573223b733a323a223735223b733a32313a2261676772656761746f722f63617465676f72696573223b733a323a223736223b733a31343a2261676772656761746f722f727373223b693a2d31353b733a31353a2261676772656761746f722f6f706d6c223b693a2d31363b733a31373a2261646d696e2f6275696c642f626c6f636b223b733a323a223136223b733a32323a2261646d696e2f6275696c642f626c6f636b2f6c697374223b693a2d31383b733a32373a2261646d696e2f6275696c642f626c6f636b2f636f6e666967757265223b693a2d31393b733a32343a2261646d696e2f6275696c642f626c6f636b2f64656c657465223b693a2d32303b733a32313a2261646d696e2f6275696c642f626c6f636b2f616464223b693a2d32313b733a33313a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6d696e6e656c6c69223b693a2d32323b733a32393a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6d617276696e223b693a2d32333b733a33313a2261646d696e2f6275696c642f626c6f636b2f6c6973742f65736e7468656d65223b693a2d32343b733a33333a2261646d696e2f6275696c642f626c6f636b2f6c6973742f626c75656d6172696e65223b693a2d32353b733a33333a2261646d696e2f6275696c642f626c6f636b2f6c6973742f70757368627574746f6e223b693a2d32363b733a33303a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6761726c616e64223b693a2d32373b733a33323a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6368616d656c656f6e223b693a2d32383b733a32313a2261646d696e2f636f6e74656e742f636f6d6d656e74223b733a323a223137223b733a32363a2261646d696e2f636f6e74656e742f636f6d6d656e742f6c697374223b693a2d33303b733a33303a2261646d696e2f636f6e74656e742f636f6d6d656e742f6c6973742f6e6577223b693a2d33313b733a33353a2261646d696e2f636f6e74656e742f636f6d6d656e742f6c6973742f617070726f76616c223b693a2d33323b733a33303a2261646d696e2f636f6e74656e742f636f6d6d656e742f73657474696e6773223b693a2d33333b733a31343a22636f6d6d656e742f64656c657465223b693a2d33343b733a31323a22636f6d6d656e742f65646974223b693a2d33353b733a31393a2261646d696e2f6275696c642f636f6e74616374223b733a323a223732223b733a32343a2261646d696e2f6275696c642f636f6e746163742f6c697374223b693a2d33373b733a32333a2261646d696e2f6275696c642f636f6e746163742f616464223b693a2d33383b733a32343a2261646d696e2f6275696c642f636f6e746163742f65646974223b693a2d33393b733a32363a2261646d696e2f6275696c642f636f6e746163742f64656c657465223b693a2d34303b733a32383a2261646d696e2f6275696c642f636f6e746163742f73657474696e6773223b693a2d34313b733a373a22636f6e74616374223b733a323a223733223b733a32323a2261646d696e2f73657474696e67732f66696c74657273223b733a323a223138223b733a32373a2261646d696e2f73657474696e67732f66696c746572732f6c697374223b693a2d34343b733a32363a2261646d696e2f73657474696e67732f66696c746572732f616464223b693a2d34353b733a32393a2261646d696e2f73657474696e67732f66696c746572732f64656c657465223b693a2d34363b733a31313a2266696c7465722f74697073223b733a313a2233223b733a31303a2261646d696e2f68656c70223b733a313a2239223b733a32313a2261646d696e2f68656c702f61676772656761746f72223b693a2d34393b733a32303a2261646d696e2f68656c702f626972746864617973223b693a2d35303b733a31363a2261646d696e2f68656c702f626c6f636b223b693a2d35313b733a31363a2261646d696e2f68656c702f636f6c6f72223b693a2d35323b733a31383a2261646d696e2f68656c702f636f6d6d656e74223b693a2d35333b733a31383a2261646d696e2f68656c702f636f6e74616374223b693a2d35343b733a31383a2261646d696e2f68656c702f636f6e74656e74223b693a2d35353b733a31363a2261646d696e2f68656c702f6576656e74223b693a2d35363b733a32343a2261646d696e2f68656c702f6576656e745f616c6c5f646179223b693a2d35373b733a32323a2261646d696e2f68656c702f6576656e745f7669657773223b693a2d35383b733a31373a2261646d696e2f68656c702f66696c746572223b693a2d35393b733a31353a2261646d696e2f68656c702f68656c70223b693a2d36303b733a31383a2261646d696e2f68656c702f69636f6e696679223b693a2d36313b733a31363a2261646d696e2f68656c702f696d616765223b693a2d36323b733a31373a2261646d696e2f68656c702f6c6f63616c65223b693a2d36333b733a31353a2261646d696e2f68656c702f6d656e75223b693a2d36343b733a31353a2261646d696e2f68656c702f6e6f6465223b693a2d36353b733a32343a2261646d696e2f68656c702f6f7074696f6e77696467657473223b693a2d36363b733a31353a2261646d696e2f68656c702f70617468223b693a2d36373b733a31393a2261646d696e2f68656c702f706174686175746f223b693a2d36383b733a31353a2261646d696e2f68656c702f706f6c6c223b693a2d36393b733a32333a2261646d696e2f68656c702f706f6f726d616e7363726f6e223b693a2d37303b733a31383a2261646d696e2f68656c702f70726f66696c65223b693a2d37313b733a31373a2261646d696e2f68656c702f736561726368223b693a2d37323b733a31373a2261646d696e2f68656c702f7369676e7570223b693a2d37333b733a32313a2261646d696e2f68656c702f73746174697374696373223b693a2d37343b733a31373a2261646d696e2f68656c702f73797374656d223b693a2d37353b733a31393a2261646d696e2f68656c702f7461786f6e6f6d79223b693a2d37363b733a31383a2261646d696e2f68656c702f74696e796d6365223b693a2d37373b733a31383a2261646d696e2f68656c702f747261636b6572223b693a2d37383b733a32343a2261646d696e2f68656c702f7570646174655f737461747573223b693a2d37393b733a31373a2261646d696e2f68656c702f75706c6f6164223b693a2d38303b733a31353a2261646d696e2f68656c702f75736572223b693a2d38313b733a31363a2261646d696e2f68656c702f7669657773223b693a2d38323b733a31393a2261646d696e2f68656c702f76696577735f7569223b693a2d38333b733a31393a2261646d696e2f68656c702f7761746368646f67223b693a2d38343b733a32313a2261646d696e2f73657474696e67732f6c6f63616c65223b733a323a223937223b733a33303a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e6775616765223b693a2d38363b733a33353a2261646d696e2f73657474696e67732f6c6f63616c652f737472696e672f736561726368223b693a2d38373b733a33393a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f6f76657276696577223b693a2d38383b733a33343a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f616464223b693a2d38393b733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f696d706f7274223b693a2d39303b733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f6578706f7274223b693a2d39313b733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f64656c657465223b693a2d39323b733a31363a2261646d696e2f6275696c642f6d656e75223b733a323a223139223b733a32313a2261646d696e2f6275696c642f6d656e752f6c697374223b693a2d39343b733a32353a2261646d696e2f6275696c642f6d656e752f6974656d2f616464223b693a2d39353b733a32363a2261646d696e2f6275696c642f6d656e752f6974656d2f65646974223b693a2d39363b733a32373a2261646d696e2f6275696c642f6d656e752f6974656d2f7265736574223b693a2d39373b733a32393a2261646d696e2f6275696c642f6d656e752f6974656d2f64697361626c65223b693a2d39383b733a32383a2261646d696e2f6275696c642f6d656e752f6974656d2f64656c657465223b693a2d39393b733a32353a2261646d696e2f6275696c642f6d656e752f6d656e752f616464223b693a2d3130303b733a32363a2261646d696e2f6275696c642f6d656e752f6d656e752f65646974223b693a2d3130313b733a32383a2261646d696e2f6275696c642f6d656e752f6d656e752f64656c657465223b693a2d3130323b733a32353a2261646d696e2f6275696c642f6d656e752f73657474696e6773223b693a2d3130333b733a31333a2261646d696e2f636f6e74656e74223b733a323a223130223b733a31383a2261646d696e2f636f6e74656e742f6e6f6465223b733a323a223230223b733a32373a2261646d696e2f636f6e74656e742f6e6f64652f6f76657276696577223b693a2d3130363b733a32303a2261646d696e2f636f6e74656e742f736561726368223b733a323a223231223b733a32373a2261646d696e2f636f6e74656e742f6e6f64652d73657474696e6773223b733a323a223232223b733a33353a2261646d696e2f636f6e74656e742f6e6f64652d73657474696e67732f72656275696c64223b693a2d3130393b733a31393a2261646d696e2f636f6e74656e742f7479706573223b733a323a223233223b733a32343a2261646d696e2f636f6e74656e742f74797065732f6c697374223b693a2d3131313b733a32333a2261646d696e2f636f6e74656e742f74797065732f616464223b693a2d3131323b733a343a226e6f6465223b733a313a2234223b733a383a226e6f64652f616464223b733a333a22313032223b733a373a227273732e786d6c223b693a2d3131353b733a31333a226e6f64652f6164642f706f6c6c223b733a323a223737223b733a31343a226e6f64652f6164642f6576656e74223b733a323a223536223b733a31343a226e6f64652f6164642f696d616765223b733a323a223538223b733a31393a226e6f64652f6164642f73696d706c656e657773223b733a323a223932223b733a31333a226e6f64652f6164642f6e657773223b733a323a223739223b733a31333a226e6f64652f6164642f70616765223b733a333a22313030223b733a31363a226e6f64652f6164642f706172746e6572223b733a323a223830223b733a31363a2261646d696e2f6275696c642f70617468223b733a323a223234223b733a32313a2261646d696e2f6275696c642f706174682f65646974223b693a2d3132343b733a32333a2261646d696e2f6275696c642f706174682f64656c657465223b693a2d3132353b733a32313a2261646d696e2f6275696c642f706174682f6c697374223b693a2d3132363b733a32303a2261646d696e2f6275696c642f706174682f616464223b693a2d3132373b733a343a22706f6c6c223b733a323a223738223b733a393a22706f6c6c2f766f7465223b693a2d3132393b733a31313a22706f6c6c2f63616e63656c223b693a2d3133303b733a373a2270726f66696c65223b733a323a223838223b733a31383a2261646d696e2f757365722f70726f66696c65223b733a323a223839223b733a32323a2261646d696e2f757365722f70726f66696c652f616464223b693a2d3133333b733a33313a2261646d696e2f757365722f70726f66696c652f6175746f636f6d706c657465223b693a2d3133343b733a32333a2261646d696e2f757365722f70726f66696c652f65646974223b693a2d3133353b733a32353a2261646d696e2f757365722f70726f66696c652f64656c657465223b693a2d3133363b733a32303a2270726f66696c652f6175746f636f6d706c657465223b693a2d3133373b733a363a22736561726368223b733a313a2235223b733a32313a2261646d696e2f73657474696e67732f736561726368223b733a323a223235223b733a32363a2261646d696e2f73657474696e67732f7365617263682f77697065223b693a2d3134303b733a31373a2261646d696e2f6c6f67732f736561726368223b733a323a223236223b733a31353a2261646d696e2f6c6f67732f68697473223b733a323a223237223b733a31363a2261646d696e2f6c6f67732f7061676573223b733a323a223238223b733a31393a2261646d696e2f6c6f67732f76697369746f7273223b733a323a223239223b733a32303a2261646d696e2f6c6f67732f726566657272657273223b733a323a223330223b733a31373a2261646d696e2f6c6f67732f616363657373223b693a2d3134363b733a31393a2261646d696e2f6c6f67732f73657474696e6773223b733a323a223331223b733a31323a2273797374656d2f66696c6573223b693a2d3134383b733a353a2261646d696e223b733a313a2236223b733a31333a2261646d696e2f636f6d70616374223b693a2d3135303b733a31333a2261646d696e2f62792d7461736b223b693a2d3135313b733a31353a2261646d696e2f62792d6d6f64756c65223b693a2d3135323b733a31343a2261646d696e2f73657474696e6773223b733a323a223132223b733a31313a2261646d696e2f6275696c64223b733a323a223133223b733a32303a2261646d696e2f73657474696e67732f61646d696e223b733a323a223332223b733a31383a2261646d696e2f6275696c642f7468656d6573223b733a323a223333223b733a32353a2261646d696e2f6275696c642f7468656d65732f73656c656374223b693a2d3135373b733a32373a2261646d696e2f6275696c642f7468656d65732f73657474696e6773223b693a2d3135383b733a33343a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f676c6f62616c223b693a2d3135393b733a33363a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f65736e7468656d65223b693a2d3136303b733a33353a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f6761726c616e64223b693a2d3136313b733a31393a2261646d696e2f6275696c642f6d6f64756c6573223b733a323a223334223b733a32343a2261646d696e2f6275696c642f6d6f64756c65732f6c697374223b693a2d3136333b733a33323a2261646d696e2f6275696c642f6d6f64756c65732f6c6973742f636f6e6669726d223b693a2d3136343b733a32393a2261646d696e2f6275696c642f6d6f64756c65732f756e696e7374616c6c223b693a2d3136353b733a33373a2261646d696e2f6275696c642f6d6f64756c65732f756e696e7374616c6c2f636f6e6669726d223b693a2d3136363b733a33313a2261646d696e2f73657474696e67732f736974652d696e666f726d6174696f6e223b733a323a223335223b733a33303a2261646d696e2f73657474696e67732f6572726f722d7265706f7274696e67223b733a323a223336223b733a32363a2261646d696e2f73657474696e67732f706572666f726d616e6365223b733a323a223337223b733a32363a2261646d696e2f73657474696e67732f66696c652d73797374656d223b733a323a223338223b733a32383a2261646d696e2f73657474696e67732f696d6167652d746f6f6c6b6974223b733a323a223339223b733a32383a2261646d696e2f636f6e74656e742f7273732d7075626c697368696e67223b733a323a223430223b733a32343a2261646d696e2f73657474696e67732f646174652d74696d65223b733a323a223431223b733a33313a2261646d696e2f73657474696e67732f736974652d6d61696e74656e616e6365223b733a323a223432223b733a32353a2261646d696e2f73657474696e67732f636c65616e2d75726c73223b733a323a223433223b733a31303a2261646d696e2f6c6f6773223b733a323a223134223b733a31373a2261646d696e2f6c6f67732f737461747573223b733a323a223434223b733a32363a2261646d696e2f6c6f67732f7374617475732f72756e2d63726f6e223b693a2d3137383b733a32313a2261646d696e2f6c6f67732f7374617475732f706870223b693a2d3137393b733a32313a2261646d696e2f6c6f67732f7374617475732f73716c223b693a2d3138303b733a32323a2261646d696e2f636f6e74656e742f7461786f6e6f6d79223b733a323a223435223b733a32373a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f6c697374223b693a2d3138323b733a33373a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f6164642f766f636162756c617279223b693a2d3138333b733a33383a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f656469742f766f636162756c617279223b693a2d3138343b733a33323a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f656469742f7465726d223b693a2d3138353b733a31333a227461786f6e6f6d792f7465726d223b693a2d3138363b733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b693a2d3138373b733a373a22747261636b6572223b733a313a2238223b733a31313a22747261636b65722f616c6c223b693a2d3138393b733a393a22747261636b65722f31223b693a2d3139303b733a393a2275706c6f61642f6a73223b693a2d3139313b733a32323a2261646d696e2f73657474696e67732f75706c6f616473223b733a323a223734223b733a343a2275736572223b693a2d3139333b733a31373a22757365722f6175746f636f6d706c657465223b693a2d3139343b733a31303a22757365722f6c6f67696e223b693a2d3139353b733a31333a22757365722f7265676973746572223b693a2d3139363b733a31333a22757365722f70617373776f7264223b693a2d3139373b733a31303a22757365722f7265736574223b693a2d3139383b733a393a22757365722f68656c70223b693a2d3139393b733a31303a2261646d696e2f75736572223b733a323a223135223b733a31353a2261646d696e2f757365722f75736572223b733a323a223437223b733a32303a2261646d696e2f757365722f757365722f6c697374223b693a2d3230323b733a32323a2261646d696e2f757365722f757365722f637265617465223b693a2d3230333b733a31393a2261646d696e2f757365722f73657474696e6773223b733a323a223438223b733a31373a2261646d696e2f757365722f616363657373223b733a323a223439223b733a31363a2261646d696e2f757365722f726f6c6573223b733a323a223530223b733a32313a2261646d696e2f757365722f726f6c65732f65646974223b693a2d3230373b733a31363a2261646d696e2f757365722f72756c6573223b733a323a223531223b733a32313a2261646d696e2f757365722f72756c65732f6c697374223b693a2d3230393b733a32303a2261646d696e2f757365722f72756c65732f616464223b693a2d3231303b733a32323a2261646d696e2f757365722f72756c65732f636865636b223b693a2d3231313b733a32313a2261646d696e2f757365722f72756c65732f65646974223b693a2d3231323b733a32333a2261646d696e2f757365722f72756c65732f64656c657465223b693a2d3231333b733a31373a2261646d696e2f757365722f736561726368223b733a323a223532223b733a363a22757365722f31223b693a2d3231353b733a363a226c6f676f7574223b733a313a2237223b733a31393a2261646d696e2f6c6f67732f7761746368646f67223b733a323a223533223b733a32353a2261646d696e2f6c6f67732f706167652d6e6f742d666f756e64223b733a323a223534223b733a32343a2261646d696e2f6c6f67732f6163636573732d64656e696564223b733a323a223535223b733a31363a2261646d696e2f6c6f67732f6576656e74223b693a2d3232303b733a32363a2261646d696e2f636f6e74656e742f74797065732f6669656c6473223b693a2d3232313b733a32363a2261646d696e2f636f6e74656e742f74797065732f6578706f7274223b693a2d3232323b733a32363a2261646d696e2f636f6e74656e742f74797065732f696d706f7274223b693a2d3232333b733a32363a226e6f64657265666572656e63652f6175746f636f6d706c657465223b693a2d3232343b733a353a226576656e74223b733a323a223835223b733a31303a226576656e742f74797065223b693a2d3232373b733a31303a226576656e742f7465726d223b693a2d3232383b733a31303a226576656e742f66656564223b693a2d3232393b733a393a226576656e742f647374223b693a2d3233303b733a31303a226576656e742f6963616c223b693a2d3233313b733a32303a2261646d696e2f73657474696e67732f6576656e74223b733a323a223537223b733a32393a2261646d696e2f73657474696e67732f6576656e742f74696d657a6f6e65223b733a323a223638223b733a32393a2261646d696e2f73657474696e67732f6576656e742f6f76657276696577223b733a323a223639223b733a31303a22696d6167652f76696577223b693a2d3233363b733a32303a2261646d696e2f73657474696e67732f696d616765223b733a323a223539223b733a31363a2266696c65732f696d6167656361636865223b693a2d3233383b733a32353a2261646d696e2f73657474696e67732f696d6167656361636865223b733a323a223834223b733a31313a22696d63652f62726f777365223b693a2d3234303b733a31393a2261646d696e2f73657474696e67732f696d6365223b733a323a223630223b733a32383a2261646d696e2f73657474696e67732f696d63652f73657474696e6773223b693a2d3234323b733a32393a2261646d696e2f73657474696e67732f696d63652f737562666f6c646572223b693a2d3234333b733a31343a226c696e6b2f7769646765742f6a73223b693a2d3234343b733a383a226d656e7574726565223b693a2d3234353b733a32333a2261646d696e2f73657474696e67732f6d656e7574726565223b693a2d3234363b733a32373a2261646d696e2f73657474696e67732f706f6f726d616e7363726f6e223b733a323a223837223b733a32313a2261646d696e2f73657474696e67732f7369676e7570223b733a323a223633223b733a32303a2261646d696e2f636f6e74656e742f7369676e7570223b733a323a223634223b733a32393a2261646d696e2f636f6e74656e742f7369676e75702f6f76657276696577223b693a2d3235303b733a32353a2261646d696e2f636f6e74656e742f7369676e75702f6f70656e223b693a2d3235313b733a32373a2261646d696e2f636f6e74656e742f7369676e75702f636c6f736564223b693a2d3235323b733a31313a22636c6f73657369676e7570223b693a2d3235333b733a31303a226f70656e7369676e7570223b693a2d3235343b733a32353a2261646d696e2f73657474696e67732f73696d706c656d656e75223b733a323a223635223b733a32353a2261646d696e2f636f6e74656e742f6e6577736c657474657273223b733a323a223933223b733a33303a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f73656e74223b693a2d3235383b733a33333a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f6e6f7473656e74223b693a2d3235393b733a33313a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f7479706573223b693a2d3236303b733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f65646974223b693a2d3236313b733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f64656c657465223b693a2d3236323b733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f6c697374223b693a2d3236333b733a33353a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f616464223b693a2d3236343b733a33313a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f7573657273223b693a2d3236353b733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f65646974223b693a2d3236363b733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f64656c657465223b693a2d3236373b733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f6c697374223b693a2d3236383b733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f696d706f7274223b693a2d3236393b733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f6578706f7274223b693a2d3237303b733a34303a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f6163746976617465223b693a2d3237313b733a34323a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f696e6163746976617465223b693a2d3237323b733a33343a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f73657474696e6773223b693a2d3237333b733a34323a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f73657474696e67732f67656e6572616c223b693a2d3237343b733a31383a226e6577736c65747465722f636f6e6669726d223b693a2d3237353b733a32343a226e6577736c65747465722f737562736372697074696f6e73223b693a2d3237363b733a32323a2261646d696e2f73657474696e67732f74696e796d6365223b733a323a223636223b733a31383a2261646d696e2f6c6f67732f75706461746573223b733a323a223836223b733a32333a2261646d696e2f6c6f67732f757064617465732f6c697374223b693a2d3237393b733a32373a2261646d696e2f6c6f67732f757064617465732f73657474696e6773223b693a2d3238303b733a32343a2261646d696e2f6c6f67732f757064617465732f636865636b223b693a2d3238313b733a32343a2261646d696e2f6275696c642f76696577732f77697a617264223b693a2d3238323b733a31373a2261646d696e2f6275696c642f7669657773223b733a323a223637223b733a32323a2261646d696e2f6275696c642f76696577732f6c697374223b693a2d3238343b733a32313a2261646d696e2f6275696c642f76696577732f616464223b693a2d3238353b733a32343a2261646d696e2f6275696c642f76696577732f696d706f7274223b693a2d3238363b733a32333a2261646d696e2f6275696c642f76696577732f746f6f6c73223b693a2d3238373b733a32343a2261646d696e2f6275696c642f76696577732f64656c657465223b693a2d3238383b733a32343a2261646d696e2f6275696c642f76696577732f656e61626c65223b693a2d3238393b733a32353a2261646d696e2f6275696c642f76696577732f64697361626c65223b693a2d3239303b733a32333a2261646d696e2f73657474696e67732f706174686175746f223b733a323a223632223b733a31333a22706174686175746f2f6e6f6465223b693a2d3239323b733a343a226e657773223b733a323a223832223b733a383a22706172746e657273223b733a323a223833223b733a343a22686f6d65223b693a2d3239353b733a393a2266726f6e7470616765223b693a2d3239363b733a373a223c66726f6e743e223b733a323a223831223b733a373a226e6f64652f3132223b733a333a22313031223b7d733a353a226974656d73223b613a3239393a7b693a303b613a353a7b733a343a2270617468223b733a303a22223b733a353a227469746c65223b733a303a22223b733a343a2274797065223b693a313b733a333a22706964223b693a313b733a383a226368696c6472656e223b613a323a7b693a303b693a313b693a313b693a323b7d7d693a313b613a373a7b733a333a22706964223b693a303b733a343a2270617468223b733a303a22223b733a353a227469746c65223b733a31303a224e617669676174696f6e223b733a363a22776569676874223b693a2d35303b733a363a22616363657373223b623a313b733a343a2274797065223b693a333b733a383a226368696c6472656e223b613a33323a7b693a303b693a2d33343b693a313b693a2d33353b693a323b693a2d3131353b693a333b693a2d3134383b693a343b693a2d3138363b693a353b693a2d3138373b693a363b693a2d3139313b693a373b693a2d3139333b693a383b693a2d3232343b693a393b693a2d3233363b693a31303b693a2d3233383b693a31313b693a2d3234303b693a31323b693a2d3234343b693a31333b693a2d3234353b693a31343b693a2d3235333b693a31353b693a2d3235343b693a31363b693a2d3237353b693a31373b693a2d3237363b693a31383b693a2d3239323b693a31393b693a2d3239353b693a32303b693a2d3239363b693a32313b693a333b693a32323b693a343b693a32333b693a353b693a32343b693a363b693a32353b693a373b693a32363b693a383b693a32373b693a37313b693a32383b693a37333b693a32393b693a37383b693a33303b693a38383b693a33313b693a39313b7d7d693a2d323b613a363a7b733a343a2270617468223b733a33333a2261646d696e2f73657474696e67732f6269727468646179732f73657474696e6773223b733a353a227469746c65223b733a383a2253657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223930223b7d693a2d333b613a373a7b733a343a2270617468223b733a32393a2261646d696e2f73657474696e67732f6269727468646179732f73796e63223b733a353a227469746c65223b733a31313a2253796e6368726f6e697a65223b733a31313a226465736372697074696f6e223b733a3138333a2253796e6368726f6e697a652062697274686461797320696e666f726d6174696f6e206f662050726f66696c65206d6f64756c6520616e6420426972746864617973206d6f64756c652e205573656420656974686572207768656e207570646174696e6720746f2061206e657765722076657273696f6e206f6620426972746864617973206f72207768656e20696e746567726174696e67207769746820616e206578697374696e672050726f66696c65204669656c642e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223930223b7d693a2d363b613a363a7b733a343a2270617468223b733a33333a2261646d696e2f636f6e74656e742f61676772656761746f722f6164642f66656564223b733a353a227469746c65223b733a383a224164642066656564223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223730223b7d693a2d373b613a363a7b733a343a2270617468223b733a33373a2261646d696e2f636f6e74656e742f61676772656761746f722f6164642f63617465676f7279223b733a353a227469746c65223b733a31323a224164642063617465676f7279223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223730223b7d693a2d383b613a363a7b733a343a2270617468223b733a33313a2261646d696e2f636f6e74656e742f61676772656761746f722f72656d6f7665223b733a353a227469746c65223b733a31323a2252656d6f7665206974656d73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223730223b7d693a2d393b613a363a7b733a343a2270617468223b733a33313a2261646d696e2f636f6e74656e742f61676772656761746f722f757064617465223b733a353a227469746c65223b733a31323a22557064617465206974656d73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223730223b7d693a2d31303b613a353a7b733a343a2270617468223b733a32393a2261646d696e2f636f6e74656e742f61676772656761746f722f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223730223b7d693a2d31313b613a363a7b733a343a2270617468223b733a33333a2261646d696e2f636f6e74656e742f61676772656761746f722f73657474696e6773223b733a353a227469746c65223b733a383a2253657474696e6773223b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a31303b733a363a22616363657373223b623a313b733a333a22706964223b733a323a223730223b7d693a2d31353b613a363a7b733a343a2270617468223b733a31343a2261676772656761746f722f727373223b733a353a227469746c65223b733a383a225253532066656564223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223731223b7d693a2d31363b613a363a7b733a343a2270617468223b733a31353a2261676772656761746f722f6f706d6c223b733a353a227469746c65223b733a393a224f504d4c2066656564223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223731223b7d693a2d31383b613a363a7b733a343a2270617468223b733a32323a2261646d696e2f6275696c642f626c6f636b2f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223136223b733a383a226368696c6472656e223b613a373a7b693a303b693a2d32323b693a313b693a2d32333b693a323b693a2d32343b693a333b693a2d32353b693a343b693a2d32363b693a353b693a2d32373b693a363b693a2d32383b7d7d693a2d31393b613a363a7b733a343a2270617468223b733a32373a2261646d696e2f6275696c642f626c6f636b2f636f6e666967757265223b733a353a227469746c65223b733a31353a22436f6e66696775726520626c6f636b223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223136223b7d693a2d32303b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f6275696c642f626c6f636b2f64656c657465223b733a353a227469746c65223b733a31323a2244656c65746520626c6f636b223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223136223b7d693a2d32313b613a363a7b733a343a2270617468223b733a32313a2261646d696e2f6275696c642f626c6f636b2f616464223b733a353a227469746c65223b733a393a2241646420626c6f636b223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223136223b7d693a2d32323b613a363a7b733a343a2270617468223b733a33313a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6d696e6e656c6c69223b733a353a227469746c65223b733a31373a226d696e6e656c6c692073657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d31383b7d693a2d32333b613a363a7b733a343a2270617468223b733a32393a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6d617276696e223b733a353a227469746c65223b733a31353a226d617276696e2073657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d31383b7d693a2d32343b613a363a7b733a343a2270617468223b733a33313a2261646d696e2f6275696c642f626c6f636b2f6c6973742f65736e7468656d65223b733a353a227469746c65223b733a31373a2265736e7468656d652073657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b693a2d31383b7d693a2d32353b613a363a7b733a343a2270617468223b733a33333a2261646d696e2f6275696c642f626c6f636b2f6c6973742f626c75656d6172696e65223b733a353a227469746c65223b733a31393a22626c75656d6172696e652073657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d31383b7d693a2d32363b613a363a7b733a343a2270617468223b733a33333a2261646d696e2f6275696c642f626c6f636b2f6c6973742f70757368627574746f6e223b733a353a227469746c65223b733a31393a2270757368627574746f6e2073657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d31383b7d693a2d32373b613a363a7b733a343a2270617468223b733a33303a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6761726c616e64223b733a353a227469746c65223b733a31363a226761726c616e642073657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d31383b7d693a2d32383b613a363a7b733a343a2270617468223b733a33323a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6368616d656c656f6e223b733a353a227469746c65223b733a31383a226368616d656c656f6e2073657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d31383b7d693a2d33303b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f636f6e74656e742f636f6d6d656e742f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223137223b733a383a226368696c6472656e223b613a323a7b693a303b693a2d33313b693a313b693a2d33323b7d7d693a2d33313b613a353a7b733a343a2270617468223b733a33303a2261646d696e2f636f6e74656e742f636f6d6d656e742f6c6973742f6e6577223b733a353a227469746c65223b733a31383a225075626c697368656420636f6d6d656e7473223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b693a2d33303b7d693a2d33323b613a363a7b733a343a2270617468223b733a33353a2261646d696e2f636f6e74656e742f636f6d6d656e742f6c6973742f617070726f76616c223b733a353a227469746c65223b733a31343a22417070726f76616c207175657565223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d33303b7d693a2d33333b613a363a7b733a343a2270617468223b733a33303a2261646d696e2f636f6e74656e742f636f6d6d656e742f73657474696e6773223b733a353a227469746c65223b733a383a2253657474696e6773223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a31303b733a343a2274797065223b693a3132383b733a333a22706964223b733a323a223137223b7d693a2d33343b613a363a7b733a343a2270617468223b733a31343a22636f6d6d656e742f64656c657465223b733a353a227469746c65223b733a31343a2244656c65746520636f6d6d656e74223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d33353b613a363a7b733a343a2270617468223b733a31323a22636f6d6d656e742f65646974223b733a353a227469746c65223b733a31323a224564697420636f6d6d656e74223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d33373b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f6275696c642f636f6e746163742f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223732223b7d693a2d33383b613a363a7b733a343a2270617468223b733a32333a2261646d696e2f6275696c642f636f6e746163742f616464223b733a353a227469746c65223b733a31323a224164642063617465676f7279223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a313b733a333a22706964223b733a323a223732223b7d693a2d33393b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f6275696c642f636f6e746163742f65646974223b733a353a227469746c65223b733a32313a224564697420636f6e746163742063617465676f7279223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223732223b7d693a2d34303b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f6275696c642f636f6e746163742f64656c657465223b733a353a227469746c65223b733a31343a2244656c65746520636f6e74616374223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223732223b7d693a2d34313b613a363a7b733a343a2270617468223b733a32383a2261646d696e2f6275696c642f636f6e746163742f73657474696e6773223b733a353a227469746c65223b733a383a2253657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a323b733a333a22706964223b733a323a223732223b7d693a2d34343b613a363a7b733a343a2270617468223b733a32373a2261646d696e2f73657474696e67732f66696c746572732f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223138223b7d693a2d34353b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f73657474696e67732f66696c746572732f616464223b733a353a227469746c65223b733a31363a2241646420696e70757420666f726d6174223b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a313b733a363a22616363657373223b623a313b733a333a22706964223b733a323a223138223b7d693a2d34363b613a363a7b733a343a2270617468223b733a32393a2261646d696e2f73657474696e67732f66696c746572732f64656c657465223b733a353a227469746c65223b733a31393a2244656c65746520696e70757420666f726d6174223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223138223b7d693a2d34393b613a363a7b733a343a2270617468223b733a32313a2261646d696e2f68656c702f61676772656761746f72223b733a353a227469746c65223b733a31303a2261676772656761746f72223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35303b613a363a7b733a343a2270617468223b733a32303a2261646d696e2f68656c702f626972746864617973223b733a353a227469746c65223b733a393a22626972746864617973223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35313b613a363a7b733a343a2270617468223b733a31363a2261646d696e2f68656c702f626c6f636b223b733a353a227469746c65223b733a353a22626c6f636b223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35323b613a363a7b733a343a2270617468223b733a31363a2261646d696e2f68656c702f636f6c6f72223b733a353a227469746c65223b733a353a22636f6c6f72223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35333b613a363a7b733a343a2270617468223b733a31383a2261646d696e2f68656c702f636f6d6d656e74223b733a353a227469746c65223b733a373a22636f6d6d656e74223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35343b613a363a7b733a343a2270617468223b733a31383a2261646d696e2f68656c702f636f6e74616374223b733a353a227469746c65223b733a373a22636f6e74616374223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35353b613a363a7b733a343a2270617468223b733a31383a2261646d696e2f68656c702f636f6e74656e74223b733a353a227469746c65223b733a373a22636f6e74656e74223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35363b613a363a7b733a343a2270617468223b733a31363a2261646d696e2f68656c702f6576656e74223b733a353a227469746c65223b733a353a226576656e74223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35373b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f68656c702f6576656e745f616c6c5f646179223b733a353a227469746c65223b733a31333a226576656e745f616c6c5f646179223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35383b613a363a7b733a343a2270617468223b733a32323a2261646d696e2f68656c702f6576656e745f7669657773223b733a353a227469746c65223b733a31313a226576656e745f7669657773223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d35393b613a363a7b733a343a2270617468223b733a31373a2261646d696e2f68656c702f66696c746572223b733a353a227469746c65223b733a363a2266696c746572223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36303b613a363a7b733a343a2270617468223b733a31353a2261646d696e2f68656c702f68656c70223b733a353a227469746c65223b733a343a2268656c70223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36313b613a363a7b733a343a2270617468223b733a31383a2261646d696e2f68656c702f69636f6e696679223b733a353a227469746c65223b733a373a2269636f6e696679223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36323b613a363a7b733a343a2270617468223b733a31363a2261646d696e2f68656c702f696d616765223b733a353a227469746c65223b733a353a22696d616765223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36333b613a363a7b733a343a2270617468223b733a31373a2261646d696e2f68656c702f6c6f63616c65223b733a353a227469746c65223b733a363a226c6f63616c65223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36343b613a363a7b733a343a2270617468223b733a31353a2261646d696e2f68656c702f6d656e75223b733a353a227469746c65223b733a343a226d656e75223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36353b613a363a7b733a343a2270617468223b733a31353a2261646d696e2f68656c702f6e6f6465223b733a353a227469746c65223b733a343a226e6f6465223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36363b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f68656c702f6f7074696f6e77696467657473223b733a353a227469746c65223b733a31333a226f7074696f6e77696467657473223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36373b613a363a7b733a343a2270617468223b733a31353a2261646d696e2f68656c702f70617468223b733a353a227469746c65223b733a343a2270617468223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36383b613a363a7b733a343a2270617468223b733a31393a2261646d696e2f68656c702f706174686175746f223b733a353a227469746c65223b733a383a22706174686175746f223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d36393b613a363a7b733a343a2270617468223b733a31353a2261646d696e2f68656c702f706f6c6c223b733a353a227469746c65223b733a343a22706f6c6c223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37303b613a363a7b733a343a2270617468223b733a32333a2261646d696e2f68656c702f706f6f726d616e7363726f6e223b733a353a227469746c65223b733a31323a22706f6f726d616e7363726f6e223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37313b613a363a7b733a343a2270617468223b733a31383a2261646d696e2f68656c702f70726f66696c65223b733a353a227469746c65223b733a373a2270726f66696c65223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37323b613a363a7b733a343a2270617468223b733a31373a2261646d696e2f68656c702f736561726368223b733a353a227469746c65223b733a363a22736561726368223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37333b613a363a7b733a343a2270617468223b733a31373a2261646d696e2f68656c702f7369676e7570223b733a353a227469746c65223b733a363a227369676e7570223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37343b613a363a7b733a343a2270617468223b733a32313a2261646d696e2f68656c702f73746174697374696373223b733a353a227469746c65223b733a31303a2273746174697374696373223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37353b613a363a7b733a343a2270617468223b733a31373a2261646d696e2f68656c702f73797374656d223b733a353a227469746c65223b733a363a2273797374656d223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37363b613a363a7b733a343a2270617468223b733a31393a2261646d696e2f68656c702f7461786f6e6f6d79223b733a353a227469746c65223b733a383a227461786f6e6f6d79223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37373b613a363a7b733a343a2270617468223b733a31383a2261646d696e2f68656c702f74696e796d6365223b733a353a227469746c65223b733a373a2274696e796d6365223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37383b613a363a7b733a343a2270617468223b733a31383a2261646d696e2f68656c702f747261636b6572223b733a353a227469746c65223b733a373a22747261636b6572223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d37393b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f68656c702f7570646174655f737461747573223b733a353a227469746c65223b733a31333a227570646174655f737461747573223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d38303b613a363a7b733a343a2270617468223b733a31373a2261646d696e2f68656c702f75706c6f6164223b733a353a227469746c65223b733a363a2275706c6f6164223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d38313b613a363a7b733a343a2270617468223b733a31353a2261646d696e2f68656c702f75736572223b733a353a227469746c65223b733a343a2275736572223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d38323b613a363a7b733a343a2270617468223b733a31363a2261646d696e2f68656c702f7669657773223b733a353a227469746c65223b733a353a227669657773223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d38333b613a363a7b733a343a2270617468223b733a31393a2261646d696e2f68656c702f76696577735f7569223b733a353a227469746c65223b733a383a2276696577735f7569223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d38343b613a363a7b733a343a2270617468223b733a31393a2261646d696e2f68656c702f7761746368646f67223b733a353a227469746c65223b733a383a227761746368646f67223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2239223b7d693a2d38363b613a373a7b733a343a2270617468223b733a33303a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e6775616765223b733a353a227469746c65223b733a31363a224d616e616765206c616e677561676573223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a2d31303b733a343a2274797065223b693a3634303b733a333a22706964223b733a323a223937223b733a383a226368696c6472656e223b613a353a7b693a303b693a2d38383b693a313b693a2d38393b693a323b693a2d39303b693a333b693a2d39313b693a343b693a2d39323b7d7d693a2d38373b613a363a7b733a343a2270617468223b733a33353a2261646d696e2f73657474696e67732f6c6f63616c652f737472696e672f736561726368223b733a353a227469746c65223b733a31343a224d616e61676520737472696e6773223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a31303b733a343a2274797065223b693a3132383b733a333a22706964223b733a323a223937223b7d693a2d38383b613a363a7b733a343a2270617468223b733a33393a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f6f76657276696577223b733a353a227469746c65223b733a343a224c697374223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a343a2274797065223b693a3634303b733a333a22706964223b693a2d38363b7d693a2d38393b613a363a7b733a343a2270617468223b733a33343a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f616464223b733a353a227469746c65223b733a31323a22416464206c616e6775616765223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a353b733a343a2274797065223b693a3132383b733a333a22706964223b693a2d38363b7d693a2d39303b613a363a7b733a343a2270617468223b733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f696d706f7274223b733a353a227469746c65223b733a363a22496d706f7274223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a31303b733a343a2274797065223b693a3132383b733a333a22706964223b693a2d38363b7d693a2d39313b613a363a7b733a343a2270617468223b733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f6578706f7274223b733a353a227469746c65223b733a363a224578706f7274223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a32303b733a343a2274797065223b693a3132383b733a333a22706964223b693a2d38363b7d693a2d39323b613a363a7b733a343a2270617468223b733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f64656c657465223b733a353a227469746c65223b733a373a22436f6e6669726d223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d38363b7d693a2d39343b613a353a7b733a343a2270617468223b733a32313a2261646d696e2f6275696c642f6d656e752f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223139223b7d693a2d39353b613a363a7b733a343a2270617468223b733a32353a2261646d696e2f6275696c642f6d656e752f6974656d2f616464223b733a353a227469746c65223b733a31333a22416464206d656e75206974656d223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223139223b7d693a2d39363b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f6275696c642f6d656e752f6974656d2f65646974223b733a353a227469746c65223b733a31343a2245646974206d656e75206974656d223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223139223b7d693a2d39373b613a363a7b733a343a2270617468223b733a32373a2261646d696e2f6275696c642f6d656e752f6974656d2f7265736574223b733a353a227469746c65223b733a31353a225265736574206d656e75206974656d223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223139223b7d693a2d39383b613a363a7b733a343a2270617468223b733a32393a2261646d696e2f6275696c642f6d656e752f6974656d2f64697361626c65223b733a353a227469746c65223b733a31373a2244697361626c65206d656e75206974656d223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223139223b7d693a2d39393b613a363a7b733a343a2270617468223b733a32383a2261646d696e2f6275696c642f6d656e752f6974656d2f64656c657465223b733a353a227469746c65223b733a31363a2244656c657465206d656e75206974656d223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223139223b7d693a2d3130303b613a363a7b733a343a2270617468223b733a32353a2261646d696e2f6275696c642f6d656e752f6d656e752f616464223b733a353a227469746c65223b733a383a22416464206d656e75223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223139223b7d693a2d3130313b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f6275696c642f6d656e752f6d656e752f65646974223b733a353a227469746c65223b733a393a2245646974206d656e75223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223139223b7d693a2d3130323b613a363a7b733a343a2270617468223b733a32383a2261646d696e2f6275696c642f6d656e752f6d656e752f64656c657465223b733a353a227469746c65223b733a31313a2244656c657465206d656e75223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223139223b7d693a2d3130333b613a353a7b733a343a2270617468223b733a32353a2261646d696e2f6275696c642f6d656e752f73657474696e6773223b733a353a227469746c65223b733a383a2253657474696e6773223b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a353b733a333a22706964223b733a323a223139223b7d693a2d3130363b613a353a7b733a343a2270617468223b733a32373a2261646d696e2f636f6e74656e742f6e6f64652f6f76657276696577223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223230223b7d693a2d3130393b613a363a7b733a343a2270617468223b733a33353a2261646d696e2f636f6e74656e742f6e6f64652d73657474696e67732f72656275696c64223b733a353a227469746c65223b733a31393a2272656275696c64207065726d697373696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223232223b7d693a2d3131313b613a353a7b733a343a2270617468223b733a32343a2261646d696e2f636f6e74656e742f74797065732f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223233223b7d693a2d3131323b613a353a7b733a343a2270617468223b733a32333a2261646d696e2f636f6e74656e742f74797065732f616464223b733a353a227469746c65223b733a31363a2241646420636f6e74656e742074797065223b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223233223b7d693a2d3131353b613a363a7b733a343a2270617468223b733a373a227273732e786d6c223b733a353a227469746c65223b733a383a225253532066656564223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3132343b613a363a7b733a343a2270617468223b733a32313a2261646d696e2f6275696c642f706174682f65646974223b733a353a227469746c65223b733a31303a224564697420616c696173223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223234223b7d693a2d3132353b613a363a7b733a343a2270617468223b733a32333a2261646d696e2f6275696c642f706174682f64656c657465223b733a353a227469746c65223b733a31323a2244656c65746520616c696173223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223234223b7d693a2d3132363b613a353a7b733a343a2270617468223b733a32313a2261646d696e2f6275696c642f706174682f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223234223b7d693a2d3132373b613a363a7b733a343a2270617468223b733a32303a2261646d696e2f6275696c642f706174682f616464223b733a353a227469746c65223b733a393a2241646420616c696173223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223234223b7d693a2d3132393b613a363a7b733a343a2270617468223b733a393a22706f6c6c2f766f7465223b733a353a227469746c65223b733a343a22566f7465223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223738223b7d693a2d3133303b613a363a7b733a343a2270617468223b733a31313a22706f6c6c2f63616e63656c223b733a353a227469746c65223b733a363a2243616e63656c223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223738223b7d693a2d3133333b613a353a7b733a343a2270617468223b733a32323a2261646d696e2f757365722f70726f66696c652f616464223b733a353a227469746c65223b733a393a22416464206669656c64223b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223839223b7d693a2d3133343b613a363a7b733a343a2270617468223b733a33313a2261646d696e2f757365722f70726f66696c652f6175746f636f6d706c657465223b733a353a227469746c65223b733a32393a2250726f66696c652063617465676f7279206175746f636f6d706c657465223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223839223b7d693a2d3133353b613a353a7b733a343a2270617468223b733a32333a2261646d696e2f757365722f70726f66696c652f65646974223b733a353a227469746c65223b733a31303a2245646974206669656c64223b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223839223b7d693a2d3133363b613a353a7b733a343a2270617468223b733a32353a2261646d696e2f757365722f70726f66696c652f64656c657465223b733a353a227469746c65223b733a31323a2244656c657465206669656c64223b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223839223b7d693a2d3133373b613a363a7b733a343a2270617468223b733a32303a2270726f66696c652f6175746f636f6d706c657465223b733a353a227469746c65223b733a32303a2250726f66696c65206175746f636f6d706c657465223b733a363a22616363657373223b693a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223838223b7d693a2d3134303b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f73657474696e67732f7365617263682f77697065223b733a353a227469746c65223b733a31313a22436c65617220696e646578223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223235223b7d693a2d3134363b613a373a7b733a343a2270617468223b733a31373a2261646d696e2f6c6f67732f616363657373223b733a353a227469746c65223b733a373a2244657461696c73223b733a31313a226465736372697074696f6e223b733a31363a225669657720616363657373206c6f672e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223134223b7d693a2d3134383b613a363a7b733a343a2270617468223b733a31323a2273797374656d2f66696c6573223b733a353a227469746c65223b733a31333a2246696c6520646f776e6c6f6164223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3135303b613a363a7b733a343a2270617468223b733a31333a2261646d696e2f636f6d70616374223b733a353a227469746c65223b733a31323a22436f6d70616374206d6f6465223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2236223b7d693a2d3135313b613a353a7b733a343a2270617468223b733a31333a2261646d696e2f62792d7461736b223b733a353a227469746c65223b733a373a224279207461736b223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2236223b7d693a2d3135323b613a353a7b733a343a2270617468223b733a31353a2261646d696e2f62792d6d6f64756c65223b733a353a227469746c65223b733a393a224279206d6f64756c65223b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a323b733a333a22706964223b733a313a2236223b7d693a2d3135373b613a373a7b733a343a2270617468223b733a32353a2261646d696e2f6275696c642f7468656d65732f73656c656374223b733a353a227469746c65223b733a343a224c697374223b733a31313a226465736372697074696f6e223b733a32353a2253656c656374207468652064656661756c74207468656d652e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d313b733a333a22706964223b733a323a223333223b7d693a2d3135383b613a373a7b733a343a2270617468223b733a32373a2261646d696e2f6275696c642f7468656d65732f73657474696e6773223b733a353a227469746c65223b733a393a22436f6e666967757265223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223333223b733a383a226368696c6472656e223b613a333a7b693a303b693a2d3135393b693a313b693a2d3136303b693a323b693a2d3136313b7d7d693a2d3135393b613a363a7b733a343a2270617468223b733a33343a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f676c6f62616c223b733a353a227469746c65223b733a31353a22476c6f62616c2073657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d313b733a333a22706964223b693a2d3135383b7d693a2d3136303b613a363a7b733a343a2270617468223b733a33363a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f65736e7468656d65223b733a353a227469746c65223b733a383a2265736e7468656d65223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3135383b7d693a2d3136313b613a363a7b733a343a2270617468223b733a33353a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f6761726c616e64223b733a353a227469746c65223b733a373a226761726c616e64223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3135383b7d693a2d3136333b613a373a7b733a343a2270617468223b733a32343a2261646d696e2f6275696c642f6d6f64756c65732f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223334223b733a383a226368696c6472656e223b613a313a7b693a303b693a2d3136343b7d7d693a2d3136343b613a363a7b733a343a2270617468223b733a33323a2261646d696e2f6275696c642f6d6f64756c65732f6c6973742f636f6e6669726d223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3136333b7d693a2d3136353b613a373a7b733a343a2270617468223b733a32393a2261646d696e2f6275696c642f6d6f64756c65732f756e696e7374616c6c223b733a353a227469746c65223b733a393a22556e696e7374616c6c223b733a343a2274797065223b693a3132383b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223334223b733a383a226368696c6472656e223b613a313a7b693a303b693a2d3136363b7d7d693a2d3136363b613a363a7b733a343a2270617468223b733a33373a2261646d696e2f6275696c642f6d6f64756c65732f756e696e7374616c6c2f636f6e6669726d223b733a353a227469746c65223b733a393a22556e696e7374616c6c223b733a343a2274797065223b693a343b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3136353b7d693a2d3137383b613a353a7b733a343a2270617468223b733a32363a2261646d696e2f6c6f67732f7374617475732f72756e2d63726f6e223b733a353a227469746c65223b733a383a2252756e2063726f6e223b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223434223b7d693a2d3137393b613a353a7b733a343a2270617468223b733a32313a2261646d696e2f6c6f67732f7374617475732f706870223b733a353a227469746c65223b733a333a22504850223b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223434223b7d693a2d3138303b613a353a7b733a343a2270617468223b733a32313a2261646d696e2f6c6f67732f7374617475732f73716c223b733a353a227469746c65223b733a333a2253514c223b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223434223b7d693a2d3138323b613a353a7b733a343a2270617468223b733a32373a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223435223b7d693a2d3138333b613a363a7b733a343a2270617468223b733a33373a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f6164642f766f636162756c617279223b733a353a227469746c65223b733a31343a2241646420766f636162756c617279223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223435223b7d693a2d3138343b613a363a7b733a343a2270617468223b733a33383a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f656469742f766f636162756c617279223b733a353a227469746c65223b733a31353a224564697420766f636162756c617279223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223435223b7d693a2d3138353b613a363a7b733a343a2270617468223b733a33323a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f656469742f7465726d223b733a353a227469746c65223b733a393a2245646974207465726d223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223435223b7d693a2d3138363b613a363a7b733a343a2270617468223b733a31333a227461786f6e6f6d792f7465726d223b733a353a227469746c65223b733a31333a225461786f6e6f6d79207465726d223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3138373b613a363a7b733a343a2270617468223b733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b733a353a227469746c65223b733a32313a224175746f636f6d706c657465207461786f6e6f6d79223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3138393b613a353a7b733a343a2270617468223b733a31313a22747261636b65722f616c6c223b733a353a227469746c65223b733a31363a22416c6c20726563656e7420706f737473223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2238223b7d693a2d3139303b613a353a7b733a343a2270617468223b733a393a22747261636b65722f31223b733a353a227469746c65223b733a31353a224d7920726563656e7420706f737473223b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2238223b7d693a2d3139313b613a353a7b733a343a2270617468223b733a393a2275706c6f61642f6a73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3139333b613a373a7b733a343a2270617468223b733a343a2275736572223b733a353a227469746c65223b733a31323a2255736572206163636f756e74223b733a363a22616363657373223b623a303b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b733a383a226368696c6472656e223b613a373a7b693a303b693a2d3139343b693a313b693a2d3139353b693a323b693a2d3139363b693a333b693a2d3139373b693a343b693a2d3139383b693a353b693a2d3139393b693a363b693a2d3231353b7d7d693a2d3139343b613a363a7b733a343a2270617468223b733a31373a22757365722f6175746f636f6d706c657465223b733a353a227469746c65223b733a31373a2255736572206175746f636f6d706c657465223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3139333b7d693a2d3139353b613a363a7b733a343a2270617468223b733a31303a22757365722f6c6f67696e223b733a353a227469746c65223b733a363a224c6f6720696e223b733a363a22616363657373223b623a303b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3139333b7d693a2d3139363b613a363a7b733a343a2270617468223b733a31333a22757365722f7265676973746572223b733a353a227469746c65223b733a31383a22437265617465206e6577206163636f756e74223b733a363a22616363657373223b623a303b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3139333b7d693a2d3139373b613a363a7b733a343a2270617468223b733a31333a22757365722f70617373776f7264223b733a353a227469746c65223b733a32303a2252657175657374206e65772070617373776f7264223b733a363a22616363657373223b623a303b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3139333b7d693a2d3139383b613a363a7b733a343a2270617468223b733a31303a22757365722f7265736574223b733a353a227469746c65223b733a31343a2252657365742070617373776f7264223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3139333b7d693a2d3139393b613a353a7b733a343a2270617468223b733a393a22757365722f68656c70223b733a353a227469746c65223b733a343a2248656c70223b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3139333b7d693a2d3230323b613a353a7b733a343a2270617468223b733a32303a2261646d696e2f757365722f757365722f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223437223b7d693a2d3230333b613a363a7b733a343a2270617468223b733a32323a2261646d696e2f757365722f757365722f637265617465223b733a353a227469746c65223b733a383a224164642075736572223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223437223b7d693a2d3230373b613a363a7b733a343a2270617468223b733a32313a2261646d696e2f757365722f726f6c65732f65646974223b733a353a227469746c65223b733a393a224564697420726f6c65223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223530223b7d693a2d3230393b613a363a7b733a343a2270617468223b733a32313a2261646d696e2f757365722f72756c65732f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223531223b7d693a2d3231303b613a363a7b733a343a2270617468223b733a32303a2261646d696e2f757365722f72756c65732f616464223b733a353a227469746c65223b733a383a224164642072756c65223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223531223b7d693a2d3231313b613a363a7b733a343a2270617468223b733a32323a2261646d696e2f757365722f72756c65732f636865636b223b733a353a227469746c65223b733a31313a22436865636b2072756c6573223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223531223b7d693a2d3231323b613a363a7b733a343a2270617468223b733a32313a2261646d696e2f757365722f72756c65732f65646974223b733a353a227469746c65223b733a393a22456469742072756c65223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223531223b7d693a2d3231333b613a363a7b733a343a2270617468223b733a32333a2261646d696e2f757365722f72756c65732f64656c657465223b733a353a227469746c65223b733a31313a2244656c6574652072756c65223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223531223b7d693a2d3231353b613a363a7b733a343a2270617468223b733a363a22757365722f31223b733a353a227469746c65223b733a31303a224d79206163636f756e74223b733a363a22616363657373223b623a313b733a343a2274797065223b693a363b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3139333b7d693a2d3232303b613a353a7b733a343a2270617468223b733a31363a2261646d696e2f6c6f67732f6576656e74223b733a353a227469746c65223b733a373a2244657461696c73223b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223134223b7d693a2d3232313b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f636f6e74656e742f74797065732f6669656c6473223b733a353a227469746c65223b733a363a224669656c6473223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223233223b7d693a2d3232323b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f636f6e74656e742f74797065732f6578706f7274223b733a353a227469746c65223b733a363a224578706f7274223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a333b733a333a22706964223b733a323a223233223b7d693a2d3232333b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f636f6e74656e742f74797065732f696d706f7274223b733a353a227469746c65223b733a363a22496d706f7274223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a343b733a333a22706964223b733a323a223233223b7d693a2d3232343b613a363a7b733a343a2270617468223b733a32363a226e6f64657265666572656e63652f6175746f636f6d706c657465223b733a353a227469746c65223b733a32373a226e6f6465207265666572656e6365206175746f636f6d706c657465223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3232373b613a363a7b733a343a2270617468223b733a31303a226576656e742f74797065223b733a353a227469746c65223b733a32323a2246696c74657220627920636f6e74656e742074797065223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223835223b7d693a2d3232383b613a363a7b733a343a2270617468223b733a31303a226576656e742f7465726d223b733a353a227469746c65223b733a31383a2246696c746572206279207461786f6e6f6d79223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223835223b7d693a2d3232393b613a363a7b733a343a2270617468223b733a31303a226576656e742f66656564223b733a353a227469746c65223b733a31343a224576656e74207273732066656564223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223835223b7d693a2d3233303b613a363a7b733a343a2270617468223b733a393a226576656e742f647374223b733a353a227469746c65223b733a31343a224576656e74206473742076696577223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223835223b7d693a2d3233313b613a363a7b733a343a2270617468223b733a31303a226576656e742f6963616c223b733a353a227469746c65223b733a31353a224576656e74206963616c2066656564223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223835223b7d693a2d3233363b613a363a7b733a343a2270617468223b733a31303a22696d6167652f76696577223b733a353a227469746c65223b733a353a22696d616765223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3233383b613a353a7b733a343a2270617468223b733a31363a2266696c65732f696d6167656361636865223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3234303b613a363a7b733a343a2270617468223b733a31313a22696d63652f62726f777365223b733a353a227469746c65223b733a31313a22494d43452062726f777365223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3234323b613a353a7b733a343a2270617468223b733a32383a2261646d696e2f73657474696e67732f696d63652f73657474696e6773223b733a353a227469746c65223b733a383a2253657474696e6773223b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223630223b7d693a2d3234333b613a363a7b733a343a2270617468223b733a32393a2261646d696e2f73657474696e67732f696d63652f737562666f6c646572223b733a353a227469746c65223b733a31353a225375622d666f6c64657220746f6f6c223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a313b733a333a22706964223b733a323a223630223b7d693a2d3234343b613a353a7b733a343a2270617468223b733a31343a226c696e6b2f7769646765742f6a73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3234353b613a363a7b733a343a2270617468223b733a383a226d656e7574726565223b733a353a227469746c65223b733a373a22536974656d6170223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3234363b613a363a7b733a343a2270617468223b733a32333a2261646d696e2f73657474696e67732f6d656e7574726565223b733a353a227469746c65223b733a393a224d656e752074726565223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a2d3235303b613a363a7b733a343a2270617468223b733a32393a2261646d696e2f636f6e74656e742f7369676e75702f6f76657276696577223b733a353a227469746c65223b733a383a224f76657276696577223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223634223b7d693a2d3235313b613a363a7b733a343a2270617468223b733a32353a2261646d696e2f636f6e74656e742f7369676e75702f6f70656e223b733a353a227469746c65223b733a343a224f70656e223b733a343a2274797065223b693a3132383b733a363a22616363657373223b623a313b733a363a22776569676874223b693a2d383b733a333a22706964223b733a323a223634223b7d693a2d3235323b613a363a7b733a343a2270617468223b733a32373a2261646d696e2f636f6e74656e742f7369676e75702f636c6f736564223b733a353a227469746c65223b733a363a22436c6f736564223b733a343a2274797065223b693a3132383b733a363a22616363657373223b623a313b733a363a22776569676874223b693a2d363b733a333a22706964223b733a323a223634223b7d693a2d3235333b613a353a7b733a343a2270617468223b733a31313a22636c6f73657369676e7570223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3235343b613a353a7b733a343a2270617468223b733a31303a226f70656e7369676e7570223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3235383b613a363a7b733a343a2270617468223b733a33303a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f73656e74223b733a353a227469746c65223b733a31313a2253656e7420697373756573223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b733a323a223933223b7d693a2d3235393b613a363a7b733a343a2270617468223b733a33333a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f6e6f7473656e74223b733a353a227469746c65223b733a363a22447261667473223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a2d393b733a333a22706964223b733a323a223933223b7d693a2d3236303b613a373a7b733a343a2270617468223b733a33313a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f7479706573223b733a353a227469746c65223b733a31313a224e6577736c657474657273223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a2d383b733a333a22706964223b733a323a223933223b733a383a226368696c6472656e223b613a343a7b693a303b693a2d3236313b693a313b693a2d3236323b693a323b693a2d3236333b693a333b693a2d3236343b7d7d693a2d3236313b613a363a7b733a343a2270617468223b733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f65646974223b733a353a227469746c65223b733a31313a224e6577736c657474657273223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3236303b7d693a2d3236323b613a363a7b733a343a2270617468223b733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f64656c657465223b733a353a227469746c65223b733a31313a224e6577736c657474657273223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3236303b7d693a2d3236333b613a363a7b733a343a2270617468223b733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f6c697374223b733a353a227469746c65223b733a31363a224c697374206e6577736c657474657273223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b693a2d3236303b7d693a2d3236343b613a363a7b733a343a2270617468223b733a33353a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f616464223b733a353a227469746c65223b733a31343a22416464206e6577736c6574746572223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a2d393b733a333a22706964223b693a2d3236303b7d693a2d3236353b613a373a7b733a343a2270617468223b733a33313a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f7573657273223b733a353a227469746c65223b733a31333a22537562736372697074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a2d373b733a333a22706964223b733a323a223933223b733a383a226368696c6472656e223b613a373a7b693a303b693a2d3236363b693a313b693a2d3236373b693a323b693a2d3236383b693a333b693a2d3236393b693a343b693a2d3237303b693a353b693a2d3237313b693a363b693a2d3237323b7d7d693a2d3236363b613a363a7b733a343a2270617468223b733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f65646974223b733a353a227469746c65223b733a31333a22537562736372697074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3236353b7d693a2d3236373b613a363a7b733a343a2270617468223b733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f64656c657465223b733a353a227469746c65223b733a31333a22537562736372697074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3236353b7d693a2d3236383b613a363a7b733a343a2270617468223b733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f6c697374223b733a353a227469746c65223b733a31383a224c69737420737562736372697074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b693a2d3236353b7d693a2d3236393b613a363a7b733a343a2270617468223b733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f696d706f7274223b733a353a227469746c65223b733a32303a22496d706f727420737562736372697074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a2d393b733a333a22706964223b693a2d3236353b7d693a2d3237303b613a363a7b733a343a2270617468223b733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f6578706f7274223b733a353a227469746c65223b733a32303a224578706f727420737562736372697074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a2d383b733a333a22706964223b693a2d3236353b7d693a2d3237313b613a363a7b733a343a2270617468223b733a34303a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f6163746976617465223b733a353a227469746c65223b733a32313a22416374697661746520737562736372697074696f6e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3236353b7d693a2d3237323b613a363a7b733a343a2270617468223b733a34323a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f696e6163746976617465223b733a353a227469746c65223b733a32333a22496e616374697661746520737562736372697074696f6e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a2d3236353b7d693a2d3237333b613a373a7b733a343a2270617468223b733a33343a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f73657474696e6773223b733a353a227469746c65223b733a383a2253657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a2d363b733a333a22706964223b733a323a223933223b733a383a226368696c6472656e223b613a313a7b693a303b693a2d3237343b7d7d693a2d3237343b613a363a7b733a343a2270617468223b733a34323a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f73657474696e67732f67656e6572616c223b733a353a227469746c65223b733a373a2247656e6572616c223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a2d31303b733a333a22706964223b693a2d3237333b7d693a2d3237353b613a363a7b733a343a2270617468223b733a31383a226e6577736c65747465722f636f6e6669726d223b733a353a227469746c65223b733a33323a22436f6e6669726d206e6577736c657474657220737562736372697074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3237363b613a363a7b733a343a2270617468223b733a32343a226e6577736c65747465722f737562736372697074696f6e73223b733a353a227469746c65223b733a33313a224d616e616765206e6577736c657474657220737562736372697074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3237393b613a363a7b733a343a2270617468223b733a32333a2261646d696e2f6c6f67732f757064617465732f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223836223b7d693a2d3238303b613a363a7b733a343a2270617468223b733a32373a2261646d696e2f6c6f67732f757064617465732f73657474696e6773223b733a353a227469746c65223b733a383a2253657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223836223b7d693a2d3238313b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f6c6f67732f757064617465732f636865636b223b733a353a227469746c65223b733a31393a224d616e75616c2075706461746520636865636b223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223836223b7d693a2d3238323b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f6275696c642f76696577732f77697a617264223b733a363a22616363657373223b623a313b733a353a227469746c65223b733a31323a225468656d652077697a617264223b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223637223b7d693a2d3238343b613a363a7b733a343a2270617468223b733a32323a2261646d696e2f6275696c642f76696577732f6c697374223b733a353a227469746c65223b733a343a224c697374223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3634303b733a363a22776569676874223b733a323a222d31223b733a333a22706964223b733a323a223637223b7d693a2d3238353b613a363a7b733a343a2270617468223b733a32313a2261646d696e2f6275696c642f76696577732f616464223b733a353a227469746c65223b733a333a22416464223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223637223b7d693a2d3238363b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f6275696c642f76696577732f696d706f7274223b733a353a227469746c65223b733a363a22496d706f7274223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223637223b7d693a2d3238373b613a363a7b733a343a2270617468223b733a32333a2261646d696e2f6275696c642f76696577732f746f6f6c73223b733a353a227469746c65223b733a353a22546f6f6c73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a3132383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223637223b7d693a2d3238383b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f6275696c642f76696577732f64656c657465223b733a353a227469746c65223b733a393a22456469742076696577223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223637223b7d693a2d3238393b613a353a7b733a343a2270617468223b733a32343a2261646d696e2f6275696c642f76696577732f656e61626c65223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223637223b7d693a2d3239303b613a353a7b733a343a2270617468223b733a32353a2261646d696e2f6275696c642f76696577732f64697361626c65223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223637223b7d693a2d3239323b613a363a7b733a343a2270617468223b733a31333a22706174686175746f2f6e6f6465223b733a353a227469746c65223b733a383a22506174686175746f223b733a363a22616363657373223b693a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3239353b613a363a7b733a343a2270617468223b733a343a22686f6d65223b733a353a227469746c65223b733a303a22223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a2d3239363b613a363a7b733a343a2270617468223b733a393a2266726f6e7470616765223b733a353a227469746c65223b733a303a22223b733a363a22616363657373223b623a313b733a343a2274797065223b693a343b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a323b613a373a7b733a343a2270617468223b733a303a22223b733a353a227469746c65223b733a31333a225072696d617279206c696e6b73223b733a31313a226465736372697074696f6e223b733a303a22223b733a333a22706964223b733a313a2230223b733a363a22776569676874223b733a313a2230223b733a343a2274797065223b733a333a22313135223b733a383a226368696c6472656e223b613a363a7b693a303b693a38313b693a313b693a38323b693a323b693a38333b693a333b693a38353b693a343b693a39343b693a353b693a3130313b7d7d693a333b613a363a7b733a343a2270617468223b733a31313a2266696c7465722f74697073223b733a353a227469746c65223b733a31323a22436f6d706f73652074697073223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32303b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a343b613a373a7b733a343a2270617468223b733a343a226e6f6465223b733a353a227469746c65223b733a373a22436f6e74656e74223b733a363a22616363657373223b623a313b733a343a2274797065223b693a31363b733a363a22776569676874223b693a303b733a333a22706964223b693a313b733a383a226368696c6472656e223b613a313a7b693a303b693a3130323b7d7d693a353b613a363a7b733a343a2270617468223b733a363a22736561726368223b733a353a227469746c65223b733a363a22536561726368223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32303b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a363b613a373a7b733a343a2270617468223b733a353a2261646d696e223b733a353a227469746c65223b733a31303a2241646d696e6973746572223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a393b733a343a2274797065223b693a32323b733a383a226368696c6472656e223b613a393a7b693a303b693a2d3135303b693a313b693a2d3135313b693a323b693a2d3135323b693a333b693a393b693a343b693a31303b693a353b693a31323b693a363b693a31333b693a373b693a31343b693a383b693a31353b7d733a333a22706964223b693a313b7d693a373b613a363a7b733a343a2270617468223b733a363a226c6f676f7574223b733a353a227469746c65223b733a373a224c6f67206f7574223b733a363a22616363657373223b733a313a2231223b733a363a22776569676874223b693a31303b733a343a2274797065223b693a32323b733a333a22706964223b693a313b7d693a383b613a373a7b733a343a2270617468223b733a373a22747261636b6572223b733a353a227469746c65223b733a31323a22526563656e7420706f737473223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d3138393b693a313b693a2d3139303b7d733a333a22706964223b693a313b7d693a393b613a373a7b733a343a2270617468223b733a31303a2261646d696e2f68656c70223b733a353a227469746c65223b733a343a2248656c70223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a393b733a343a2274797065223b693a32323b733a383a226368696c6472656e223b613a33363a7b693a303b693a2d34393b693a313b693a2d35303b693a323b693a2d35313b693a333b693a2d35323b693a343b693a2d35333b693a353b693a2d35343b693a363b693a2d35353b693a373b693a2d35363b693a383b693a2d35373b693a393b693a2d35383b693a31303b693a2d35393b693a31313b693a2d36303b693a31323b693a2d36313b693a31333b693a2d36323b693a31343b693a2d36333b693a31353b693a2d36343b693a31363b693a2d36353b693a31373b693a2d36363b693a31383b693a2d36373b693a31393b693a2d36383b693a32303b693a2d36393b693a32313b693a2d37303b693a32323b693a2d37313b693a32333b693a2d37323b693a32343b693a2d37333b693a32353b693a2d37343b693a32363b693a2d37353b693a32373b693a2d37363b693a32383b693a2d37373b693a32393b693a2d37383b693a33303b693a2d37393b693a33313b693a2d38303b693a33323b693a2d38313b693a33333b693a2d38323b693a33343b693a2d38333b693a33353b693a2d38343b7d733a333a22706964223b733a313a2236223b7d693a31303b613a393a7b733a343a2270617468223b733a31333a2261646d696e2f636f6e74656e74223b733a353a227469746c65223b733a31383a22436f6e74656e74206d616e6167656d656e74223b733a31313a226465736372697074696f6e223b733a32373a224d616e61676520796f75722073697465277320636f6e74656e742e223b733a383a22706f736974696f6e223b733a343a226c656674223b733a363a22776569676874223b693a2d31303b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a333a22706964223b733a313a2236223b733a383a226368696c6472656e223b613a31303a7b693a303b693a31373b693a313b693a32303b693a323b693a32313b693a333b693a32323b693a343b693a32333b693a353b693a34303b693a363b693a34353b693a373b693a36343b693a383b693a37303b693a393b693a39333b7d7d693a31323b613a393a7b733a343a2270617468223b733a31343a2261646d696e2f73657474696e6773223b733a353a227469746c65223b733a31383a225369746520636f6e66696775726174696f6e223b733a31313a226465736372697074696f6e223b733a34303a2241646a757374206261736963207369746520636f6e66696775726174696f6e206f7074696f6e732e223b733a383a22706f736974696f6e223b733a353a227269676874223b733a363a22776569676874223b693a2d353b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a383a226368696c6472656e223b613a32343a7b693a303b693a2d3234363b693a313b693a31383b693a323b693a32353b693a333b693a33323b693a343b693a33353b693a353b693a33363b693a363b693a33373b693a373b693a33383b693a383b693a33393b693a393b693a34313b693a31303b693a34323b693a31313b693a34333b693a31323b693a35373b693a31333b693a35393b693a31343b693a36303b693a31353b693a36323b693a31363b693a36333b693a31373b693a36353b693a31383b693a36363b693a31393b693a37343b693a32303b693a38343b693a32313b693a38373b693a32323b693a39303b693a32333b693a39373b7d733a333a22706964223b733a313a2236223b7d693a31333b613a393a7b733a343a2270617468223b733a31313a2261646d696e2f6275696c64223b733a353a227469746c65223b733a31333a2253697465206275696c64696e67223b733a31313a226465736372697074696f6e223b733a33383a22436f6e74726f6c20686f7720796f75722073697465206c6f6f6b7320616e64206665656c732e223b733a383a22706f736974696f6e223b733a353a227269676874223b733a363a22776569676874223b693a2d31303b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a333a22706964223b733a313a2236223b733a383a226368696c6472656e223b613a373a7b693a303b693a31363b693a313b693a31393b693a323b693a32343b693a333b693a33333b693a343b693a33343b693a353b693a36373b693a363b693a37323b7d7d693a31343b613a383a7b733a343a2270617468223b733a31303a2261646d696e2f6c6f6773223b733a353a227469746c65223b733a343a224c6f6773223b733a31313a226465736372697074696f6e223b733a34363a22566965772073797374656d206c6f677320616e64206f746865722073746174757320696e666f726d6174696f6e2e223b733a363a22776569676874223b693a353b733a383a22706f736974696f6e223b733a343a226c656674223b733a343a2274797065223b693a32323b733a383a226368696c6472656e223b613a31333a7b693a303b693a2d3134363b693a313b693a2d3232303b693a323b693a32363b693a333b693a32373b693a343b693a32383b693a353b693a32393b693a363b693a33303b693a373b693a33313b693a383b693a34343b693a393b693a35333b693a31303b693a35343b693a31313b693a35353b693a31323b693a38363b7d733a333a22706964223b733a313a2236223b7d693a31353b613a393a7b733a343a2270617468223b733a31303a2261646d696e2f75736572223b733a353a227469746c65223b733a31353a2255736572206d616e6167656d656e74223b733a31313a226465736372697074696f6e223b733a36313a224d616e61676520796f7572207369746527732075736572732c2067726f75707320616e642061636365737320746f20736974652066656174757265732e223b733a383a22706f736974696f6e223b733a343a226c656674223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a313a2236223b733a383a226368696c6472656e223b613a373a7b693a303b693a34373b693a313b693a34383b693a323b693a34393b693a333b693a35303b693a343b693a35313b693a353b693a35323b693a363b693a38393b7d7d693a31363b613a383a7b733a343a2270617468223b733a31373a2261646d696e2f6275696c642f626c6f636b223b733a353a227469746c65223b733a363a22426c6f636b73223b733a363a22616363657373223b623a313b733a31313a226465736372697074696f6e223b733a37393a22436f6e666967757265207768617420626c6f636b20636f6e74656e74206170706561727320696e20796f75722073697465277320736964656261727320616e64206f7468657220726567696f6e732e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a343a7b693a303b693a2d31383b693a313b693a2d31393b693a323b693a2d32303b693a333b693a2d32313b7d733a333a22706964223b733a323a223133223b7d693a31373b613a383a7b733a343a2270617468223b733a32313a2261646d696e2f636f6e74656e742f636f6d6d656e74223b733a353a227469746c65223b733a383a22436f6d6d656e7473223b733a31313a226465736372697074696f6e223b733a36313a224c69737420616e642065646974207369746520636f6d6d656e747320616e642074686520636f6d6d656e74206d6f6465726174696f6e2071756575652e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d33303b693a313b693a2d33333b7d733a333a22706964223b733a323a223130223b7d693a31383b613a383a7b733a343a2270617468223b733a32323a2261646d696e2f73657474696e67732f66696c74657273223b733a353a227469746c65223b733a31333a22496e70757420666f726d617473223b733a31313a226465736372697074696f6e223b733a3134323a22436f6e66696775726520686f7720636f6e74656e7420696e7075742062792075736572732069732066696c74657265642c20696e636c7564696e6720616c6c6f7765642048544d4c20746167732c2050485020636f646520746167732e20416c736f20616c6c6f777320656e61626c696e67206f66206d6f64756c652d70726f76696465642066696c746572732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a333a7b693a303b693a2d34343b693a313b693a2d34353b693a323b693a2d34363b7d733a333a22706964223b733a323a223132223b7d693a31393b613a383a7b733a343a2270617468223b733a31363a2261646d696e2f6275696c642f6d656e75223b733a353a227469746c65223b733a353a224d656e7573223b733a31313a226465736372697074696f6e223b733a3131363a22436f6e74726f6c20796f757220736974652773206e617669676174696f6e206d656e752c207072696d617279206c696e6b7320616e64207365636f6e64617279206c696e6b732e2061732077656c6c2061732072656e616d6520616e642072656f7267616e697a65206d656e75206974656d732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a31303a7b693a303b693a2d39343b693a313b693a2d39353b693a323b693a2d39363b693a333b693a2d39373b693a343b693a2d39383b693a353b693a2d39393b693a363b693a2d3130303b693a373b693a2d3130313b693a383b693a2d3130323b693a393b693a2d3130333b7d733a333a22706964223b733a323a223133223b7d693a32303b613a383a7b733a343a2270617468223b733a31383a2261646d696e2f636f6e74656e742f6e6f6465223b733a353a227469746c65223b733a373a22436f6e74656e74223b733a31313a226465736372697074696f6e223b733a34333a22566965772c20656469742c20616e642064656c65746520796f75722073697465277320636f6e74656e742e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a313a7b693a303b693a2d3130363b7d733a333a22706964223b733a323a223130223b7d693a32313b613a373a7b733a343a2270617468223b733a32303a2261646d696e2f636f6e74656e742f736561726368223b733a353a227469746c65223b733a31343a2253656172636820636f6e74656e74223b733a31313a226465736372697074696f6e223b733a32363a2253656172636820636f6e74656e74206279206b6579776f72642e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223130223b7d693a32323b613a383a7b733a343a2270617468223b733a32373a2261646d696e2f636f6e74656e742f6e6f64652d73657474696e6773223b733a353a227469746c65223b733a31333a22506f73742073657474696e6773223b733a31313a226465736372697074696f6e223b733a3132363a22436f6e74726f6c20706f7374696e67206265686176696f722c207375636820617320746561736572206c656e6774682c20726571756972696e67207072657669657773206265666f726520706f7374696e672c20616e6420746865206e756d626572206f6620706f737473206f6e207468652066726f6e7420706167652e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a313a7b693a303b693a2d3130393b7d733a333a22706964223b733a323a223130223b7d693a32333b613a383a7b733a343a2270617468223b733a31393a2261646d696e2f636f6e74656e742f7479706573223b733a353a227469746c65223b733a31333a22436f6e74656e74207479706573223b733a31313a226465736372697074696f6e223b733a38323a224d616e61676520706f73747320627920636f6e74656e7420747970652c20696e636c7564696e672064656661756c74207374617475732c2066726f6e7420706167652070726f6d6f74696f6e2c206574632e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a353a7b693a303b693a2d3131313b693a313b693a2d3131323b693a323b693a2d3232313b693a333b693a2d3232323b693a343b693a2d3232333b7d733a333a22706964223b733a323a223130223b7d693a32343b613a383a7b733a343a2270617468223b733a31363a2261646d696e2f6275696c642f70617468223b733a353a227469746c65223b733a31313a2255524c20616c6961736573223b733a31313a226465736372697074696f6e223b733a34363a224368616e676520796f7572207369746527732055524c20706174687320627920616c696173696e67207468656d2e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a343a7b693a303b693a2d3132343b693a313b693a2d3132353b693a323b693a2d3132363b693a333b693a2d3132373b7d733a333a22706964223b733a323a223133223b7d693a32353b613a383a7b733a343a2270617468223b733a32313a2261646d696e2f73657474696e67732f736561726368223b733a353a227469746c65223b733a31353a225365617263682073657474696e6773223b733a31313a226465736372697074696f6e223b733a36363a22436f6e6669677572652072656c6576616e63652073657474696e677320666f722073656172636820616e64206f7468657220696e646578696e67206f7074696f6e73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a313a7b693a303b693a2d3134303b7d733a333a22706964223b733a323a223132223b7d693a32363b613a363a7b733a343a2270617468223b733a31373a2261646d696e2f6c6f67732f736561726368223b733a353a227469746c65223b733a31383a22546f70207365617263682070687261736573223b733a31313a226465736372697074696f6e223b733a33333a2256696577206d6f737420706f70756c61722073656172636820706872617365732e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223134223b7d693a32373b613a373a7b733a343a2270617468223b733a31353a2261646d696e2f6c6f67732f68697473223b733a353a227469746c65223b733a31313a22526563656e742068697473223b733a31313a226465736372697074696f6e223b733a34333a22566965772070616765732074686174206861766520726563656e746c79206265656e20766973697465642e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223134223b7d693a32383b613a373a7b733a343a2270617468223b733a31363a2261646d696e2f6c6f67732f7061676573223b733a353a227469746c65223b733a393a22546f70207061676573223b733a31313a226465736372697074696f6e223b733a34313a225669657720706167657320746861742068617665206265656e20686974206672657175656e746c792e223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a313b733a343a2274797065223b693a32323b733a333a22706964223b733a323a223134223b7d693a32393b613a373a7b733a343a2270617468223b733a31393a2261646d696e2f6c6f67732f76697369746f7273223b733a353a227469746c65223b733a31323a22546f702076697369746f7273223b733a31313a226465736372697074696f6e223b733a33343a22566965772076697369746f7273207468617420686974206d616e792070616765732e223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a323b733a343a2274797065223b693a32323b733a333a22706964223b733a323a223134223b7d693a33303b613a373a7b733a343a2270617468223b733a32303a2261646d696e2f6c6f67732f726566657272657273223b733a353a227469746c65223b733a31333a22546f7020726566657272657273223b733a31313a226465736372697074696f6e223b733a31393a225669657720746f70207265666572726572732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223134223b7d693a33313b613a373a7b733a343a2270617468223b733a31393a2261646d696e2f6c6f67732f73657474696e6773223b733a353a227469746c65223b733a31393a22416363657373206c6f672073657474696e6773223b733a31313a226465736372697074696f6e223b733a35303a22436f6e74726f6c2064657461696c732061626f7574207768617420616e6420686f7720796f75722073697465206c6f67732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a333b733a333a22706964223b733a323a223134223b7d693a33323b613a393a7b733a343a2270617468223b733a32303a2261646d696e2f73657474696e67732f61646d696e223b733a353a227469746c65223b733a32303a2241646d696e697374726174696f6e207468656d65223b733a31313a226465736372697074696f6e223b733a35353a2253657474696e677320666f7220686f7720796f75722061646d696e6973747261746976652070616765732073686f756c64206c6f6f6b2e223b733a383a22706f736974696f6e223b733a343a226c656674223b733a31343a22626c6f636b2063616c6c6261636b223b733a32373a2273797374656d5f61646d696e5f7468656d655f73657474696e6773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a33333b613a383a7b733a343a2270617468223b733a31383a2261646d696e2f6275696c642f7468656d6573223b733a353a227469746c65223b733a363a225468656d6573223b733a31313a226465736372697074696f6e223b733a35373a224368616e6765207768696368207468656d6520796f757220736974652075736573206f7220616c6c6f777320757365727320746f207365742e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d3135373b693a313b693a2d3135383b7d733a333a22706964223b733a323a223133223b7d693a33343b613a383a7b733a343a2270617468223b733a31393a2261646d696e2f6275696c642f6d6f64756c6573223b733a353a227469746c65223b733a373a224d6f64756c6573223b733a31313a226465736372697074696f6e223b733a34373a22456e61626c65206f722064697361626c65206164642d6f6e206d6f64756c657320666f7220796f757220736974652e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d3136333b693a313b693a2d3136353b7d733a333a22706964223b733a323a223133223b7d693a33353b613a363a7b733a343a2270617468223b733a33313a2261646d696e2f73657474696e67732f736974652d696e666f726d6174696f6e223b733a353a227469746c65223b733a31363a225369746520696e666f726d6174696f6e223b733a31313a226465736372697074696f6e223b733a3130373a224368616e6765206261736963207369746520696e666f726d6174696f6e2c2073756368206173207468652073697465206e616d652c20736c6f67616e2c20652d6d61696c20616464726573732c206d697373696f6e2c2066726f6e74207061676520616e64206d6f72652e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a33363b613a363a7b733a343a2270617468223b733a33303a2261646d696e2f73657474696e67732f6572726f722d7265706f7274696e67223b733a353a227469746c65223b733a31353a224572726f72207265706f7274696e67223b733a31313a226465736372697074696f6e223b733a39333a22436f6e74726f6c20686f772044727570616c206465616c732077697468206572726f727320696e636c7564696e67203430332f343034206572726f72732061732077656c6c20617320504850206572726f72207265706f7274696e672e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a33373b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f73657474696e67732f706572666f726d616e6365223b733a353a227469746c65223b733a31313a22506572666f726d616e6365223b733a31313a226465736372697074696f6e223b733a39313a22456e61626c65206f722064697361626c6520706167652063616368696e6720666f7220616e6f6e796d6f75732075736572732c20616e6420656e61626c65206f722064697361626c65204353532070726570726f636573736f722e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a33383b613a363a7b733a343a2270617468223b733a32363a2261646d696e2f73657474696e67732f66696c652d73797374656d223b733a353a227469746c65223b733a31313a2246696c652073797374656d223b733a31313a226465736372697074696f6e223b733a36383a2254656c6c2044727570616c20776865726520746f2073746f72652075706c6f616465642066696c657320616e6420686f772074686579206172652061636365737365642e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a33393b613a363a7b733a343a2270617468223b733a32383a2261646d696e2f73657474696e67732f696d6167652d746f6f6c6b6974223b733a353a227469746c65223b733a31333a22496d61676520746f6f6c6b6974223b733a31313a226465736372697074696f6e223b733a37343a2243686f6f736520776869636820696d61676520746f6f6c6b697420746f2075736520696620796f75206861766520696e7374616c6c6564206f7074696f6e616c20746f6f6c6b6974732e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a34303b613a363a7b733a343a2270617468223b733a32383a2261646d696e2f636f6e74656e742f7273732d7075626c697368696e67223b733a353a227469746c65223b733a31343a22525353207075626c697368696e67223b733a31313a226465736372697074696f6e223b733a39323a22436f6e66696775726520746865206e756d626572206f66206974656d7320706572206665656420616e6420776865746865722066656564732073686f756c64206265207469746c65732f746561736572732f66756c6c2d746578742e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223130223b7d693a34313b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f73657474696e67732f646174652d74696d65223b733a353a227469746c65223b733a31333a224461746520616e642074696d65223b733a31313a226465736372697074696f6e223b733a38393a2253657474696e677320666f7220686f772044727570616c20646973706c617973206461746520616e642074696d652c2061732077656c6c206173207468652073797374656d27732064656661756c742074696d657a6f6e652e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a34323b613a363a7b733a343a2270617468223b733a33313a2261646d696e2f73657474696e67732f736974652d6d61696e74656e616e6365223b733a353a227469746c65223b733a31363a2253697465206d61696e74656e616e6365223b733a31313a226465736372697074696f6e223b733a36333a2254616b65207468652073697465206f66662d6c696e6520666f72206d61696e74656e616e6365206f72206272696e67206974206261636b206f6e6c696e652e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a34333b613a363a7b733a343a2270617468223b733a32353a2261646d696e2f73657474696e67732f636c65616e2d75726c73223b733a353a227469746c65223b733a31303a22436c65616e2055524c73223b733a31313a226465736372697074696f6e223b733a34333a22456e61626c65206f722064697361626c6520636c65616e2055524c7320666f7220796f757220736974652e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a34343b613a383a7b733a343a2270617468223b733a31373a2261646d696e2f6c6f67732f737461747573223b733a353a227469746c65223b733a31333a22537461747573207265706f7274223b733a31313a226465736372697074696f6e223b733a37343a22476574206120737461747573207265706f72742061626f757420796f757220736974652773206f7065726174696f6e20616e6420616e792064657465637465642070726f626c656d732e223b733a363a22776569676874223b693a31303b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a383a226368696c6472656e223b613a333a7b693a303b693a2d3137383b693a313b693a2d3137393b693a323b693a2d3138303b7d733a333a22706964223b733a323a223134223b7d693a34353b613a383a7b733a343a2270617468223b733a32323a2261646d696e2f636f6e74656e742f7461786f6e6f6d79223b733a353a227469746c65223b733a31303a2243617465676f72696573223b733a31313a226465736372697074696f6e223b733a35373a2243726561746520766f636162756c617269657320616e64207465726d7320746f2063617465676f72697a6520796f757220636f6e74656e742e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a343a7b693a303b693a2d3138323b693a313b693a2d3138333b693a323b693a2d3138343b693a333b693a2d3138353b7d733a333a22706964223b733a323a223130223b7d693a34373b613a383a7b733a343a2270617468223b733a31353a2261646d696e2f757365722f75736572223b733a353a227469746c65223b733a353a225573657273223b733a31313a226465736372697074696f6e223b733a32363a224c6973742c206164642c20616e6420656469742075736572732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d3230323b693a313b693a2d3230333b7d733a333a22706964223b733a323a223135223b7d693a34383b613a363a7b733a343a2270617468223b733a31393a2261646d696e2f757365722f73657474696e6773223b733a353a227469746c65223b733a31333a22557365722073657474696e6773223b733a31313a226465736372697074696f6e223b733a3130313a22436f6e6669677572652064656661756c74206265686176696f72206f662075736572732c20696e636c7564696e6720726567697374726174696f6e20726571756972656d656e74732c20652d6d61696c732c20616e6420757365722070696374757265732e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223135223b7d693a34393b613a373a7b733a343a2270617468223b733a31373a2261646d696e2f757365722f616363657373223b733a353a227469746c65223b733a31343a2241636365737320636f6e74726f6c223b733a31313a226465736372697074696f6e223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223135223b7d693a35303b613a383a7b733a343a2270617468223b733a31363a2261646d696e2f757365722f726f6c6573223b733a353a227469746c65223b733a353a22526f6c6573223b733a31313a226465736372697074696f6e223b733a33303a224c6973742c20656469742c206f7220616464207573657220726f6c65732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a313a7b693a303b693a2d3230373b7d733a333a22706964223b733a323a223135223b7d693a35313b613a383a7b733a343a2270617468223b733a31363a2261646d696e2f757365722f72756c6573223b733a353a227469746c65223b733a31323a224163636573732072756c6573223b733a31313a226465736372697074696f6e223b733a38303a224c69737420616e64206372656174652072756c657320746f20646973616c6c6f7720757365726e616d65732c20652d6d61696c206164647265737365732c20616e64204950206164647265737365732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a353a7b693a303b693a2d3230393b693a313b693a2d3231303b693a323b693a2d3231313b693a333b693a2d3231323b693a343b693a2d3231333b7d733a333a22706964223b733a323a223135223b7d693a35323b613a373a7b733a343a2270617468223b733a31373a2261646d696e2f757365722f736561726368223b733a353a227469746c65223b733a31323a22536561726368207573657273223b733a31313a226465736372697074696f6e223b733a32313a22536561726368207573657273206279206e616d652e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223135223b7d693a35333b613a363a7b733a343a2270617468223b733a31393a2261646d696e2f6c6f67732f7761746368646f67223b733a353a227469746c65223b733a31383a22526563656e74206c6f6720656e7472696573223b733a31313a226465736372697074696f6e223b733a34333a2256696577206576656e74732074686174206861766520726563656e746c79206265656e206c6f676765642e223b733a363a22776569676874223b693a2d313b733a343a2274797065223b693a32323b733a333a22706964223b733a323a223134223b7d693a35343b613a363a7b733a343a2270617468223b733a32353a2261646d696e2f6c6f67732f706167652d6e6f742d666f756e64223b733a353a227469746c65223b733a32373a22546f70202770616765206e6f7420666f756e6427206572726f7273223b733a31313a226465736372697074696f6e223b733a33363a2256696577202770616765206e6f7420666f756e6427206572726f7273202834303473292e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223134223b7d693a35353b613a363a7b733a343a2270617468223b733a32343a2261646d696e2f6c6f67732f6163636573732d64656e696564223b733a353a227469746c65223b733a32363a22546f7020276163636573732064656e69656427206572726f7273223b733a31313a226465736372697074696f6e223b733a33353a225669657720276163636573732064656e69656427206572726f7273202834303373292e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223134223b7d693a35363b613a363a7b733a343a2270617468223b733a31343a226e6f64652f6164642f6576656e74223b733a353a227469746c65223b733a353a224576656e74223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a333a22313032223b7d693a35373b613a383a7b733a343a2270617468223b733a32303a2261646d696e2f73657474696e67732f6576656e74223b733a353a227469746c65223b733a363a224576656e7473223b733a31313a226465736372697074696f6e223b733a33363a2253657420757020686f7720796f757220736974652068616e646c6573206576656e74732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b733a383a226368696c6472656e223b613a323a7b693a303b693a36383b693a313b693a36393b7d7d693a35383b613a363a7b733a343a2270617468223b733a31343a226e6f64652f6164642f696d616765223b733a353a227469746c65223b733a353a22496d616765223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a333a22313032223b7d693a35393b613a373a7b733a343a2270617468223b733a32303a2261646d696e2f73657474696e67732f696d616765223b733a353a227469746c65223b733a353a22496d616765223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a31313a226465736372697074696f6e223b733a32323a22496d616765206d6f64756c652073657474696e67732e223b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a36303b613a383a7b733a343a2270617468223b733a31393a2261646d696e2f73657474696e67732f696d6365223b733a353a227469746c65223b733a31333a22494d43452073657474696e6773223b733a31313a226465736372697074696f6e223b733a34323a22436f6e74726f6c20686f7720796f757220696d6167652f66696c652062726f7773657220776f726b732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d3234323b693a313b693a2d3234333b7d733a333a22706964223b733a323a223132223b7d693a36323b613a373a7b733a343a2270617468223b733a32333a2261646d696e2f73657474696e67732f706174686175746f223b733a353a227469746c65223b733a383a22506174686175746f223b733a31313a226465736372697074696f6e223b733a36313a22436f6e66696775726520686f7720706174686175746f2067656e65726174657320636c65616e2055524c7320666f7220796f757220636f6e74656e742e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a36333b613a373a7b733a343a2270617468223b733a32313a2261646d696e2f73657474696e67732f7369676e7570223b733a31313a226465736372697074696f6e223b733a33313a22436f6e6669677572652073657474696e677320666f72207369676e7570732e223b733a363a22616363657373223b623a313b733a353a227469746c65223b733a363a225369676e7570223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a36343b613a383a7b733a343a2270617468223b733a32303a2261646d696e2f636f6e74656e742f7369676e7570223b733a31313a226465736372697074696f6e223b733a36353a225669657720616c6c207369676e75702d656e61626c656420706f7374732c20616e64206f70656e206f7220636c6f7365207369676e757073206f6e207468656d2e223b733a363a22616363657373223b623a313b733a353a227469746c65223b733a31353a225369676e7570206f76657276696577223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a333a7b693a303b693a2d3235303b693a313b693a2d3235313b693a323b693a2d3235323b7d733a333a22706964223b733a323a223130223b7d693a36353b613a373a7b733a343a2270617468223b733a32353a2261646d696e2f73657474696e67732f73696d706c656d656e75223b733a353a227469746c65223b733a31303a2253696d706c654d656e75223b733a31313a226465736372697074696f6e223b733a32373a2253656c65637420746865206d656e7520746f20646973706c61792e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a36363b613a373a7b733a343a2270617468223b733a32323a2261646d696e2f73657474696e67732f74696e796d6365223b733a353a227469746c65223b733a373a2254696e794d4345223b733a31313a226465736372697074696f6e223b733a32363a22436f6e66696775726520746865207269636820656469746f722e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a36373b613a383a7b733a343a2270617468223b733a31373a2261646d696e2f6275696c642f7669657773223b733a353a227469746c65223b733a353a225669657773223b733a363a22616363657373223b623a313b733a31313a226465736372697074696f6e223b733a3134343a2256696577732061726520637573746f6d697a6564206c69737473206f6620636f6e74656e74206f6e20796f75722073797374656d3b20746865792061726520686967686c7920636f6e666967757261626c6520616e64206769766520796f7520636f6e74726f6c206f76657220686f77206c69737473206f6620636f6e74656e74206172652070726573656e7465642e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a383a7b693a303b693a2d3238323b693a313b693a2d3238343b693a323b693a2d3238353b693a333b693a2d3238363b693a343b693a2d3238373b693a353b693a2d3238383b693a363b693a2d3238393b693a373b693a2d3239303b7d733a333a22706964223b733a323a223133223b7d693a36383b613a373a7b733a343a2270617468223b733a32393a2261646d696e2f73657474696e67732f6576656e742f74696d657a6f6e65223b733a353a227469746c65223b733a31373a2254696d657a6f6e652068616e646c696e67223b733a31313a226465736372697074696f6e223b733a35353a224368616e676520686f772074696d657a6f6e6520696e666f726d6174696f6e20697320736176656420616e6420646973706c617965642e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223537223b7d693a36393b613a373a7b733a343a2270617468223b733a32393a2261646d696e2f73657474696e67732f6576656e742f6f76657276696577223b733a353a227469746c65223b733a31343a224576656e74206f76657276696577223b733a31313a226465736372697074696f6e223b733a35303a224368616e676520686f77206576656e742073756d6d61727920696e666f726d6174696f6e20697320646973706c617965642e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223537223b7d693a37303b613a383a7b733a343a2270617468223b733a32343a2261646d696e2f636f6e74656e742f61676772656761746f72223b733a353a227469746c65223b733a31353a224e6577732061676772656761746f72223b733a31313a226465736372697074696f6e223b733a3131363a22436f6e66696775726520776869636820636f6e74656e7420796f7572207369746520616767726567617465732066726f6d206f746865722073697465732c20686f77206f6674656e20697420706f6c6c73207468656d2c20616e6420686f7720746865792772652063617465676f72697a65642e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a363a7b693a303b693a2d363b693a313b693a2d373b693a323b693a2d383b693a333b693a2d393b693a343b693a2d31303b693a353b693a2d31313b7d733a333a22706964223b733a323a223130223b7d693a37313b613a383a7b733a343a2270617468223b733a31303a2261676772656761746f72223b733a353a227469746c65223b733a31353a224e6577732061676772656761746f72223b733a363a22616363657373223b623a313b733a363a22776569676874223b733a313a2235223b733a343a2274797065223b733a323a223438223b733a31313a226465736372697074696f6e223b733a303a22223b733a333a22706964223b733a313a2231223b733a383a226368696c6472656e223b613a343a7b693a303b693a2d31353b693a313b693a2d31363b693a323b693a37353b693a333b693a37363b7d7d693a37323b613a383a7b733a343a2270617468223b733a31393a2261646d696e2f6275696c642f636f6e74616374223b733a353a227469746c65223b733a31323a22436f6e7461637420666f726d223b733a31313a226465736372697074696f6e223b733a37313a2243726561746520612073797374656d20636f6e7461637420666f726d20616e64207365742075702063617465676f7269657320666f722074686520666f726d20746f207573652e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a353a7b693a303b693a2d33373b693a313b693a2d33383b693a323b693a2d33393b693a333b693a2d34303b693a343b693a2d34313b7d733a333a22706964223b733a323a223133223b7d693a37333b613a363a7b733a343a2270617468223b733a373a22636f6e74616374223b733a353a227469746c65223b733a373a22436f6e74616374223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32303b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a37343b613a373a7b733a343a2270617468223b733a32323a2261646d696e2f73657474696e67732f75706c6f616473223b733a353a227469746c65223b733a31323a2246696c652075706c6f616473223b733a31313a226465736372697074696f6e223b733a34353a22436f6e74726f6c20686f772066696c6573206d617920626520617474616368656420746f20636f6e74656e742e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a37353b613a373a7b733a343a2270617468223b733a31383a2261676772656761746f722f736f7572636573223b733a353a227469746c65223b733a373a22536f7572636573223b733a363a22616363657373223b623a313b733a343a2274797065223b733a323a223438223b733a363a22776569676874223b733a313a2230223b733a31313a226465736372697074696f6e223b733a303a22223b733a333a22706964223b733a323a223731223b7d693a37363b613a363a7b733a343a2270617468223b733a32313a2261676772656761746f722f63617465676f72696573223b733a353a227469746c65223b733a31303a2243617465676f72696573223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32383b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223731223b7d693a37373b613a363a7b733a343a2270617468223b733a31333a226e6f64652f6164642f706f6c6c223b733a353a227469746c65223b733a343a22506f6c6c223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a333a22313032223b7d693a37383b613a373a7b733a343a2270617468223b733a343a22706f6c6c223b733a353a227469746c65223b733a353a22506f6c6c73223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32303b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d3132393b693a313b693a2d3133303b7d733a333a22706964223b693a313b7d693a37393b613a363a7b733a343a2270617468223b733a31333a226e6f64652f6164642f6e657773223b733a353a227469746c65223b733a343a224e657773223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a333a22313032223b7d693a38303b613a363a7b733a343a2270617468223b733a31363a226e6f64652f6164642f706172746e6572223b733a353a227469746c65223b733a373a22506172746e6572223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a333a22313032223b7d693a38313b613a363a7b733a343a2270617468223b733a373a223c66726f6e743e223b733a353a227469746c65223b733a343a22486f6d65223b733a31313a226465736372697074696f6e223b733a32383a22476f20746f2074686520536174656c6c69746520686f6d6570616765223b733a333a22706964223b733a313a2232223b733a363a22776569676874223b733a333a222d3130223b733a343a2274797065223b733a333a22313138223b7d693a38323b613a373a7b733a343a2270617468223b733a343a226e657773223b733a353a227469746c65223b733a343a224e657773223b733a363a22616363657373223b623a313b733a343a2274797065223b733a333a22313138223b733a363a22776569676874223b733a323a222d37223b733a31313a226465736372697074696f6e223b733a393a224e6577732070616765223b733a333a22706964223b733a313a2232223b7d693a38333b613a373a7b733a343a2270617468223b733a383a22706172746e657273223b733a353a227469746c65223b733a383a22506172746e657273223b733a363a22616363657373223b623a313b733a343a2274797065223b733a333a22313138223b733a363a22776569676874223b733a323a222d34223b733a31313a226465736372697074696f6e223b733a383a22506172746e657273223b733a333a22706964223b733a313a2232223b7d693a38343b613a373a7b733a343a2270617468223b733a32353a2261646d696e2f73657474696e67732f696d6167656361636865223b733a353a227469746c65223b733a31313a22496d616765206361636865223b733a31313a226465736372697074696f6e223b733a34363a22436f6e6669677572652072756c657365747320616e6420616374696f6e7320666f7220696d61676563616368652e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a38353b613a383a7b733a343a2270617468223b733a353a226576656e74223b733a353a227469746c65223b733a363a224576656e7473223b733a363a22616363657373223b623a313b733a343a2274797065223b733a333a22313138223b733a363a22776569676874223b733a323a222d36223b733a31313a226465736372697074696f6e223b733a363a224576656e7473223b733a333a22706964223b733a313a2232223b733a383a226368696c6472656e223b613a353a7b693a303b693a2d3232373b693a313b693a2d3232383b693a323b693a2d3232393b693a333b693a2d3233303b693a343b693a2d3233313b7d7d693a38363b613a383a7b733a343a2270617468223b733a31383a2261646d696e2f6c6f67732f75706461746573223b733a353a227469746c65223b733a31373a22417661696c61626c652075706461746573223b733a31313a226465736372697074696f6e223b733a36333a22476574206120737461747573207265706f7274206f6e20696e7374616c6c6564206d6f64756c657320616e6420617661696c61626c6520757064617465732e223b733a363a22776569676874223b693a31303b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a383a226368696c6472656e223b613a333a7b693a303b693a2d3237393b693a313b693a2d3238303b693a323b693a2d3238313b7d733a333a22706964223b733a323a223134223b7d693a38373b613a373a7b733a343a2270617468223b733a32373a2261646d696e2f73657474696e67732f706f6f726d616e7363726f6e223b733a353a227469746c65223b733a31323a22506f6f726d616e7363726f6e223b733a31313a226465736372697074696f6e223b733a36363a2241206d6f64756c652077686963682072756e732044727570616c2063726f6e206a6f627320776974686f7574207468652063726f6e206170706c69636174696f6e2e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a323a223132223b7d693a38383b613a373a7b733a343a2270617468223b733a373a2270726f66696c65223b733a353a227469746c65223b733a393a2255736572206c697374223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32303b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a313a7b693a303b693a2d3133373b7d733a333a22706964223b693a313b7d693a38393b613a373a7b733a343a2270617468223b733a31383a2261646d696e2f757365722f70726f66696c65223b733a353a227469746c65223b733a383a2250726f66696c6573223b733a31313a226465736372697074696f6e223b733a34323a2243726561746520637573746f6d697a61626c65206669656c647320666f7220796f75722075736572732e223b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a343a7b693a303b693a2d3133333b693a313b693a2d3133343b693a323b693a2d3133353b693a333b693a2d3133363b7d733a333a22706964223b733a323a223135223b7d693a39303b613a383a7b733a343a2270617468223b733a32343a2261646d696e2f73657474696e67732f626972746864617973223b733a353a227469746c65223b733a393a22426972746864617973223b733a31313a226465736372697074696f6e223b733a37383a225365742075736572206269727468646179206d61696c20616e6420746f67676c652075736572206d61696c2c207570636f6d696e6720626972746864617973206d61696c20616e64206d6f72652e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d323b693a313b693a2d333b7d733a333a22706964223b733a323a223132223b7d693a39313b613a373a7b733a343a2270617468223b733a393a22626972746864617973223b733a353a227469746c65223b733a393a22426972746864617973223b733a31313a226465736372697074696f6e223b733a33323a224c6973742074686520626972746864617973206f6620616c6c2075736572732e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32303b733a363a22776569676874223b693a303b733a333a22706964223b693a313b7d693a39323b613a363a7b733a343a2270617468223b733a31393a226e6f64652f6164642f73696d706c656e657773223b733a353a227469746c65223b733a31363a224e6577736c6574746572206973737565223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a333a22313032223b7d693a39333b613a383a7b733a343a2270617468223b733a32353a2261646d696e2f636f6e74656e742f6e6577736c657474657273223b733a353a227469746c65223b733a31313a224e6577736c657474657273223b733a343a2274797065223b693a32323b733a31313a226465736372697074696f6e223b733a36313a224d616e616765206e6577736c6574746572732c20737562736372697074696f6e732c20616e6420636f6e66696775726174696f6e206f7074696f6e732e223b733a363a22616363657373223b623a313b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a353a7b693a303b693a2d3235383b693a313b693a2d3235393b693a323b693a2d3236303b693a333b693a2d3236353b693a343b693a2d3237333b7d733a333a22706964223b733a323a223130223b7d693a39343b613a363a7b733a343a2270617468223b733a373a22636f6e74616374223b733a353a227469746c65223b733a373a22436f6e74616374223b733a31313a226465736372697074696f6e223b733a373a22436f6e74616374223b733a333a22706964223b733a313a2232223b733a363a22776569676874223b733a323a223130223b733a343a2274797065223b733a333a22313138223b7d693a39373b613a383a7b733a343a2270617468223b733a32313a2261646d696e2f73657474696e67732f6c6f63616c65223b733a353a227469746c65223b733a31323a224c6f63616c697a6174696f6e223b733a31313a226465736372697074696f6e223b733a35393a22436f6e6669677572652073697465206c6f63616c697a6174696f6e20616e64207573657220696e74657266616365207472616e736c6174696f6e2e223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a383a226368696c6472656e223b613a323a7b693a303b693a2d38363b693a313b693a2d38373b7d733a333a22706964223b733a323a223132223b7d693a3130303b613a363a7b733a343a2270617468223b733a31333a226e6f64652f6164642f70616765223b733a353a227469746c65223b733a343a2250616765223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32323b733a363a22776569676874223b693a303b733a333a22706964223b733a333a22313032223b7d693a3130313b613a363a7b733a343a2270617468223b733a373a226e6f64652f3132223b733a353a227469746c65223b733a31303a2245534e2047616c617879223b733a31313a226465736372697074696f6e223b733a31303a2245534e2047616c617879223b733a333a22706964223b733a313a2232223b733a363a22776569676874223b733a313a2235223b733a343a2274797065223b733a333a22313138223b7d693a3130323b613a373a7b733a343a2270617468223b733a383a226e6f64652f616464223b733a353a227469746c65223b733a31343a2243726561746520636f6e74656e74223b733a363a22616363657373223b623a313b733a343a2274797065223b693a32383b733a363a22776569676874223b693a313b733a383a226368696c6472656e223b613a373a7b693a303b693a35363b693a313b693a35383b693a323b693a37373b693a333b693a37393b693a343b693a38303b693a353b693a39323b693a363b693a3130303b7d733a333a22706964223b733a313a2234223b7d7d733a393a2263616c6c6261636b73223b613a3236343a7b733a32343a2261646d696e2f73657474696e67732f626972746864617973223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32343a226269727468646179735f61646d696e5f73657474696e6773223b7d7d733a33333a2261646d696e2f73657474696e67732f6269727468646179732f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32343a226269727468646179735f61646d696e5f73657474696e6773223b7d7d733a32393a2261646d696e2f73657474696e67732f6269727468646179732f73796e63223b613a313a7b733a383a2263616c6c6261636b223b733a31393a226269727468646179735f73796e635f70616765223b7d733a393a22626972746864617973223b613a313a7b733a383a2263616c6c6261636b223b733a31393a226269727468646179735f766965775f70616765223b7d733a32343a2261646d696e2f636f6e74656e742f61676772656761746f72223b613a313a7b733a383a2263616c6c6261636b223b733a32353a2261676772656761746f725f61646d696e5f6f76657276696577223b7d733a33333a2261646d696e2f636f6e74656e742f61676772656761746f722f6164642f66656564223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32303a2261676772656761746f725f666f726d5f66656564223b7d7d733a33373a2261646d696e2f636f6e74656e742f61676772656761746f722f6164642f63617465676f7279223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32343a2261676772656761746f725f666f726d5f63617465676f7279223b7d7d733a33313a2261646d696e2f636f6e74656e742f61676772656761746f722f72656d6f7665223b613a313a7b733a383a2263616c6c6261636b223b733a32383a2261676772656761746f725f61646d696e5f72656d6f76655f66656564223b7d733a33313a2261646d696e2f636f6e74656e742f61676772656761746f722f757064617465223b613a313a7b733a383a2263616c6c6261636b223b733a32393a2261676772656761746f725f61646d696e5f726566726573685f66656564223b7d733a33333a2261646d696e2f636f6e74656e742f61676772656761746f722f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a2261676772656761746f725f61646d696e5f73657474696e6773223b7d7d733a31303a2261676772656761746f72223b613a313a7b733a383a2263616c6c6261636b223b733a32303a2261676772656761746f725f706167655f6c617374223b7d733a31383a2261676772656761746f722f736f7572636573223b613a313a7b733a383a2263616c6c6261636b223b733a32333a2261676772656761746f725f706167655f736f7572636573223b7d733a32313a2261676772656761746f722f63617465676f72696573223b613a313a7b733a383a2263616c6c6261636b223b733a32363a2261676772656761746f725f706167655f63617465676f72696573223b7d733a31343a2261676772656761746f722f727373223b613a313a7b733a383a2263616c6c6261636b223b733a31393a2261676772656761746f725f706167655f727373223b7d733a31353a2261676772656761746f722f6f706d6c223b613a313a7b733a383a2263616c6c6261636b223b733a32303a2261676772656761746f725f706167655f6f706d6c223b7d733a31373a2261646d696e2f6275696c642f626c6f636b223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31393a22626c6f636b5f61646d696e5f646973706c6179223b7d7d733a32373a2261646d696e2f6275696c642f626c6f636b2f636f6e666967757265223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a22626c6f636b5f61646d696e5f636f6e666967757265223b7d7d733a32343a2261646d696e2f6275696c642f626c6f636b2f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31363a22626c6f636b5f626f785f64656c657465223b7d7d733a32313a2261646d696e2f6275696c642f626c6f636b2f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31343a22626c6f636b5f626f785f666f726d223b7d7d733a33313a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6d696e6e656c6c69223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a22626c6f636b5f61646d696e5f646973706c6179223b693a313b733a383a226d696e6e656c6c69223b7d7d733a32393a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6d617276696e223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a22626c6f636b5f61646d696e5f646973706c6179223b693a313b733a363a226d617276696e223b7d7d733a33313a2261646d696e2f6275696c642f626c6f636b2f6c6973742f65736e7468656d65223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a22626c6f636b5f61646d696e5f646973706c6179223b693a313b733a383a2265736e7468656d65223b7d7d733a33333a2261646d696e2f6275696c642f626c6f636b2f6c6973742f626c75656d6172696e65223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a22626c6f636b5f61646d696e5f646973706c6179223b693a313b733a31303a22626c75656d6172696e65223b7d7d733a33333a2261646d696e2f6275696c642f626c6f636b2f6c6973742f70757368627574746f6e223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a22626c6f636b5f61646d696e5f646973706c6179223b693a313b733a31303a2270757368627574746f6e223b7d7d733a33303a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6761726c616e64223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a22626c6f636b5f61646d696e5f646973706c6179223b693a313b733a373a226761726c616e64223b7d7d733a33323a2261646d696e2f6275696c642f626c6f636b2f6c6973742f6368616d656c656f6e223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a22626c6f636b5f61646d696e5f646973706c6179223b693a313b733a393a226368616d656c656f6e223b7d7d733a32313a2261646d696e2f636f6e74656e742f636f6d6d656e74223b613a313a7b733a383a2263616c6c6261636b223b733a31333a22636f6d6d656e745f61646d696e223b7d733a33353a2261646d696e2f636f6e74656e742f636f6d6d656e742f6c6973742f617070726f76616c223b613a323a7b733a383a2263616c6c6261636b223b733a31333a22636f6d6d656e745f61646d696e223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a383a22617070726f76616c223b7d7d733a33303a2261646d696e2f636f6e74656e742f636f6d6d656e742f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32323a22636f6d6d656e745f61646d696e5f73657474696e6773223b7d7d733a31343a22636f6d6d656e742f64656c657465223b613a313a7b733a383a2263616c6c6261636b223b733a31343a22636f6d6d656e745f64656c657465223b7d733a31323a22636f6d6d656e742f65646974223b613a313a7b733a383a2263616c6c6261636b223b733a31323a22636f6d6d656e745f65646974223b7d733a31393a2261646d696e2f6275696c642f636f6e74616374223b613a313a7b733a383a2263616c6c6261636b223b733a32343a22636f6e746163745f61646d696e5f63617465676f72696573223b7d733a32343a2261646d696e2f6275696c642f636f6e746163742f6c697374223b613a313a7b733a383a2263616c6c6261636b223b733a32343a22636f6e746163745f61646d696e5f63617465676f72696573223b7d733a32333a2261646d696e2f6275696c642f636f6e746163742f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31383a22636f6e746163745f61646d696e5f65646974223b7d7d733a32343a2261646d696e2f6275696c642f636f6e746163742f65646974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31383a22636f6e746163745f61646d696e5f65646974223b7d7d733a32363a2261646d696e2f6275696c642f636f6e746163742f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32303a22636f6e746163745f61646d696e5f64656c657465223b7d7d733a32383a2261646d696e2f6275696c642f636f6e746163742f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32323a22636f6e746163745f61646d696e5f73657474696e6773223b7d7d733a373a22636f6e74616374223b613a313a7b733a383a2263616c6c6261636b223b733a31373a22636f6e746163745f736974655f70616765223b7d733a32323a2261646d696e2f73657474696e67732f66696c74657273223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a2266696c7465725f61646d696e5f6f76657276696577223b7d7d733a32373a2261646d696e2f73657474696e67732f66696c746572732f6c697374223b613a313a7b733a383a2263616c6c6261636b223b733a32313a2266696c7465725f61646d696e5f6f76657276696577223b7d733a32363a2261646d696e2f73657474696e67732f66696c746572732f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32343a2266696c7465725f61646d696e5f666f726d61745f666f726d223b7d7d733a32393a2261646d696e2f73657474696e67732f66696c746572732f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31393a2266696c7465725f61646d696e5f64656c657465223b7d7d733a31313a2266696c7465722f74697073223b613a313a7b733a383a2263616c6c6261636b223b733a31363a2266696c7465725f746970735f6c6f6e67223b7d733a31303a2261646d696e2f68656c70223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f6d61696e223b7d733a32313a2261646d696e2f68656c702f61676772656761746f72223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a32303a2261646d696e2f68656c702f626972746864617973223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31363a2261646d696e2f68656c702f626c6f636b223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31363a2261646d696e2f68656c702f636f6c6f72223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31383a2261646d696e2f68656c702f636f6d6d656e74223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31383a2261646d696e2f68656c702f636f6e74616374223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31383a2261646d696e2f68656c702f636f6e74656e74223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31363a2261646d696e2f68656c702f6576656e74223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a32343a2261646d696e2f68656c702f6576656e745f616c6c5f646179223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a32323a2261646d696e2f68656c702f6576656e745f7669657773223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31373a2261646d696e2f68656c702f66696c746572223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31353a2261646d696e2f68656c702f68656c70223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31383a2261646d696e2f68656c702f69636f6e696679223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31363a2261646d696e2f68656c702f696d616765223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31373a2261646d696e2f68656c702f6c6f63616c65223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31353a2261646d696e2f68656c702f6d656e75223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31353a2261646d696e2f68656c702f6e6f6465223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a32343a2261646d696e2f68656c702f6f7074696f6e77696467657473223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31353a2261646d696e2f68656c702f70617468223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31393a2261646d696e2f68656c702f706174686175746f223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31353a2261646d696e2f68656c702f706f6c6c223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a32333a2261646d696e2f68656c702f706f6f726d616e7363726f6e223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31383a2261646d696e2f68656c702f70726f66696c65223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31373a2261646d696e2f68656c702f736561726368223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31373a2261646d696e2f68656c702f7369676e7570223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a32313a2261646d696e2f68656c702f73746174697374696373223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31373a2261646d696e2f68656c702f73797374656d223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31393a2261646d696e2f68656c702f7461786f6e6f6d79223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31383a2261646d696e2f68656c702f74696e796d6365223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31383a2261646d696e2f68656c702f747261636b6572223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a32343a2261646d696e2f68656c702f7570646174655f737461747573223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31373a2261646d696e2f68656c702f75706c6f6164223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31353a2261646d696e2f68656c702f75736572223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31363a2261646d696e2f68656c702f7669657773223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31393a2261646d696e2f68656c702f76696577735f7569223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a31393a2261646d696e2f68656c702f7761746368646f67223b613a313a7b733a383a2263616c6c6261636b223b733a393a2268656c705f70616765223b7d733a32313a2261646d696e2f73657474696e67732f6c6f63616c65223b613a313a7b733a383a2263616c6c6261636b223b733a31393a226c6f63616c655f61646d696e5f6d616e616765223b7d733a33353a2261646d696e2f73657474696e67732f6c6f63616c652f737472696e672f736561726368223b613a313a7b733a383a2263616c6c6261636b223b733a32303a226c6f63616c655f737472696e675f736561726368223b7d733a33393a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f6f76657276696577223b613a313a7b733a383a2263616c6c6261636b223b733a31393a226c6f63616c655f61646d696e5f6d616e616765223b7d733a33343a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f616464223b613a313a7b733a383a2263616c6c6261636b223b733a32333a226c6f63616c655f61646d696e5f6d616e6167655f616464223b7d733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f696d706f7274223b613a313a7b733a383a2263616c6c6261636b223b733a31393a226c6f63616c655f61646d696e5f696d706f7274223b7d733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f6578706f7274223b613a313a7b733a383a2263616c6c6261636b223b733a31393a226c6f63616c655f61646d696e5f6578706f7274223b7d733a33373a2261646d696e2f73657474696e67732f6c6f63616c652f6c616e67756167652f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a33313a226c6f63616c655f61646d696e5f6d616e6167655f64656c6574655f666f726d223b7d7d733a31363a2261646d696e2f6275696c642f6d656e75223b613a313a7b733a383a2263616c6c6261636b223b733a31333a226d656e755f6f76657276696577223b7d733a32353a2261646d696e2f6275696c642f6d656e752f6974656d2f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a226d656e755f656469745f6974656d5f666f726d223b693a313b733a333a22616464223b7d7d733a32363a2261646d696e2f6275696c642f6d656e752f6974656d2f65646974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a226d656e755f656469745f6974656d5f666f726d223b693a313b733a343a2265646974223b7d7d733a32373a2261646d696e2f6275696c642f6d656e752f6974656d2f7265736574223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31353a226d656e755f72657365745f6974656d223b7d7d733a32393a2261646d696e2f6275696c642f6d656e752f6974656d2f64697361626c65223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a226d656e755f636f6e6669726d5f64697361626c655f6974656d223b7d7d733a32383a2261646d696e2f6275696c642f6d656e752f6974656d2f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a226d656e755f6974656d5f64656c6574655f666f726d223b7d7d733a32353a2261646d696e2f6275696c642f6d656e752f6d656e752f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a226d656e755f656469745f6d656e755f666f726d223b693a313b733a333a22616464223b7d7d733a32363a2261646d696e2f6275696c642f6d656e752f6d656e752f65646974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a31393a226d656e755f656469745f6d656e755f666f726d223b693a313b733a343a2265646974223b7d7d733a32383a2261646d696e2f6275696c642f6d656e752f6d656e752f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a226d656e755f6974656d5f64656c6574655f666f726d223b7d7d733a32353a2261646d696e2f6275696c642f6d656e752f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31343a226d656e755f636f6e666967757265223b7d7d733a31333a2261646d696e2f636f6e74656e74223b613a313a7b733a383a2263616c6c6261636b223b733a32383a2273797374656d5f61646d696e5f6d656e755f626c6f636b5f70616765223b7d733a31383a2261646d696e2f636f6e74656e742f6e6f6465223b613a313a7b733a383a2263616c6c6261636b223b733a31383a226e6f64655f61646d696e5f636f6e74656e74223b7d733a32303a2261646d696e2f636f6e74656e742f736561726368223b613a313a7b733a383a2263616c6c6261636b223b733a31373a226e6f64655f61646d696e5f736561726368223b7d733a32373a2261646d696e2f636f6e74656e742f6e6f64652d73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31343a226e6f64655f636f6e666967757265223b7d7d733a33353a2261646d696e2f636f6e74656e742f6e6f64652d73657474696e67732f72656275696c64223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a33303a226e6f64655f636f6e6669677572655f72656275696c645f636f6e6669726d223b7d7d733a31393a2261646d696e2f636f6e74656e742f7479706573223b613a313a7b733a383a2263616c6c6261636b223b733a31393a226e6f64655f6f766572766965775f7479706573223b7d733a32333a2261646d696e2f636f6e74656e742f74797065732f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31343a226e6f64655f747970655f666f726d223b7d7d733a343a226e6f6465223b613a313a7b733a383a2263616c6c6261636b223b733a31373a226e6f64655f706167655f64656661756c74223b7d733a383a226e6f64652f616464223b613a313a7b733a383a2263616c6c6261636b223b733a383a226e6f64655f616464223b7d733a373a227273732e786d6c223b613a313a7b733a383a2263616c6c6261636b223b733a393a226e6f64655f66656564223b7d733a31363a2261646d696e2f6275696c642f70617468223b613a313a7b733a383a2263616c6c6261636b223b733a31303a22706174685f61646d696e223b7d733a32313a2261646d696e2f6275696c642f706174682f65646974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31353a22706174685f61646d696e5f65646974223b7d7d733a32333a2261646d696e2f6275696c642f706174682f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a22706174685f61646d696e5f64656c6574655f636f6e6669726d223b7d7d733a32303a2261646d696e2f6275696c642f706174682f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31353a22706174685f61646d696e5f65646974223b7d7d733a343a22706f6c6c223b613a313a7b733a383a2263616c6c6261636b223b733a393a22706f6c6c5f70616765223b7d733a393a22706f6c6c2f766f7465223b613a313a7b733a383a2263616c6c6261636b223b733a393a22706f6c6c5f766f7465223b7d733a31313a22706f6c6c2f63616e63656c223b613a313a7b733a383a2263616c6c6261636b223b733a31313a22706f6c6c5f63616e63656c223b7d733a373a2270726f66696c65223b613a313a7b733a383a2263616c6c6261636b223b733a31343a2270726f66696c655f62726f777365223b7d733a31383a2261646d696e2f757365722f70726f66696c65223b613a313a7b733a383a2263616c6c6261636b223b733a32323a2270726f66696c655f61646d696e5f6f76657276696577223b7d733a32323a2261646d696e2f757365722f70726f66696c652f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31383a2270726f66696c655f6669656c645f666f726d223b7d7d733a33313a2261646d696e2f757365722f70726f66696c652f6175746f636f6d706c657465223b613a313a7b733a383a2263616c6c6261636b223b733a33353a2270726f66696c655f61646d696e5f73657474696e67735f6175746f636f6d706c657465223b7d733a32333a2261646d696e2f757365722f70726f66696c652f65646974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31383a2270726f66696c655f6669656c645f666f726d223b7d7d733a32353a2261646d696e2f757365722f70726f66696c652f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32303a2270726f66696c655f6669656c645f64656c657465223b7d7d733a32303a2270726f66696c652f6175746f636f6d706c657465223b613a313a7b733a383a2263616c6c6261636b223b733a32303a2270726f66696c655f6175746f636f6d706c657465223b7d733a363a22736561726368223b613a313a7b733a383a2263616c6c6261636b223b733a31313a227365617263685f76696577223b7d733a32313a2261646d696e2f73657474696e67732f736561726368223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a227365617263685f61646d696e5f73657474696e6773223b7d7d733a32363a2261646d696e2f73657474696e67732f7365617263682f77697065223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31393a227365617263685f776970655f636f6e6669726d223b7d7d733a31373a2261646d696e2f6c6f67732f736561726368223b613a323a7b733a383a2263616c6c6261636b223b733a31323a227761746368646f675f746f70223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a363a22736561726368223b7d7d733a31353a2261646d696e2f6c6f67732f68697473223b613a313a7b733a383a2263616c6c6261636b223b733a32323a22737461746973746963735f726563656e745f68697473223b7d733a31363a2261646d696e2f6c6f67732f7061676573223b613a313a7b733a383a2263616c6c6261636b223b733a32303a22737461746973746963735f746f705f7061676573223b7d733a31393a2261646d696e2f6c6f67732f76697369746f7273223b613a313a7b733a383a2263616c6c6261636b223b733a32333a22737461746973746963735f746f705f76697369746f7273223b7d733a32303a2261646d696e2f6c6f67732f726566657272657273223b613a313a7b733a383a2263616c6c6261636b223b733a32343a22737461746973746963735f746f705f726566657272657273223b7d733a31373a2261646d696e2f6c6f67732f616363657373223b613a313a7b733a383a2263616c6c6261636b223b733a32313a22737461746973746963735f6163636573735f6c6f67223b7d733a31393a2261646d696e2f6c6f67732f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a33343a22737461746973746963735f6163636573735f6c6f6767696e675f73657474696e6773223b7d7d733a31323a2273797374656d2f66696c6573223b613a313a7b733a383a2263616c6c6261636b223b733a31333a2266696c655f646f776e6c6f6164223b7d733a353a2261646d696e223b613a313a7b733a383a2263616c6c6261636b223b733a32323a2273797374656d5f6d61696e5f61646d696e5f70616765223b7d733a31333a2261646d696e2f636f6d70616374223b613a313a7b733a383a2263616c6c6261636b223b733a32353a2273797374656d5f61646d696e5f636f6d706163745f70616765223b7d733a31333a2261646d696e2f62792d7461736b223b613a313a7b733a383a2263616c6c6261636b223b733a32323a2273797374656d5f6d61696e5f61646d696e5f70616765223b7d733a31353a2261646d696e2f62792d6d6f64756c65223b613a313a7b733a383a2263616c6c6261636b223b733a32323a2273797374656d5f61646d696e5f62795f6d6f64756c65223b7d733a31343a2261646d696e2f73657474696e6773223b613a313a7b733a383a2263616c6c6261636b223b733a32343a2273797374656d5f73657474696e67735f6f76657276696577223b7d733a31313a2261646d696e2f6275696c64223b613a313a7b733a383a2263616c6c6261636b223b733a32383a2273797374656d5f61646d696e5f6d656e755f626c6f636b5f70616765223b7d733a32303a2261646d696e2f73657474696e67732f61646d696e223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32373a2273797374656d5f61646d696e5f7468656d655f73657474696e6773223b7d7d733a31383a2261646d696e2f6275696c642f7468656d6573223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31333a2273797374656d5f7468656d6573223b7d7d733a32353a2261646d696e2f6275696c642f7468656d65732f73656c656374223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31333a2273797374656d5f7468656d6573223b7d7d733a32373a2261646d696e2f6275696c642f7468656d65732f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b7d7d733a33343a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f676c6f62616c223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b7d7d733a33363a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f65736e7468656d65223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a383a2265736e7468656d65223b7d7d733a33353a2261646d696e2f6275696c642f7468656d65732f73657474696e67732f6761726c616e64223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a373a226761726c616e64223b7d7d733a31393a2261646d696e2f6275696c642f6d6f64756c6573223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d7d733a33323a2261646d696e2f6275696c642f6d6f64756c65732f6c6973742f636f6e6669726d223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d7d733a32393a2261646d696e2f6275696c642f6d6f64756c65732f756e696e7374616c6c223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32343a2273797374656d5f6d6f64756c65735f756e696e7374616c6c223b7d7d733a33373a2261646d696e2f6275696c642f6d6f64756c65732f756e696e7374616c6c2f636f6e6669726d223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32343a2273797374656d5f6d6f64756c65735f756e696e7374616c6c223b7d7d733a33313a2261646d696e2f73657474696e67732f736974652d696e666f726d6174696f6e223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a33323a2273797374656d5f736974655f696e666f726d6174696f6e5f73657474696e6773223b7d7d733a33303a2261646d696e2f73657474696e67732f6572726f722d7265706f7274696e67223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a33313a2273797374656d5f6572726f725f7265706f7274696e675f73657474696e6773223b7d7d733a32363a2261646d696e2f73657474696e67732f706572666f726d616e6365223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32373a2273797374656d5f706572666f726d616e63655f73657474696e6773223b7d7d733a32363a2261646d696e2f73657474696e67732f66696c652d73797374656d223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32373a2273797374656d5f66696c655f73797374656d5f73657474696e6773223b7d7d733a32383a2261646d696e2f73657474696e67732f696d6167652d746f6f6c6b6974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32393a2273797374656d5f696d6167655f746f6f6c6b69745f73657474696e6773223b7d7d733a32383a2261646d696e2f636f6e74656e742f7273732d7075626c697368696e67223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a2273797374656d5f7273735f66656564735f73657474696e6773223b7d7d733a32343a2261646d696e2f73657474696e67732f646174652d74696d65223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a2273797374656d5f646174655f74696d655f73657474696e6773223b7d7d733a33313a2261646d696e2f73657474696e67732f736974652d6d61696e74656e616e6365223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a33323a2273797374656d5f736974655f6d61696e74656e616e63655f73657474696e6773223b7d7d733a32353a2261646d696e2f73657474696e67732f636c65616e2d75726c73223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a2273797374656d5f636c65616e5f75726c5f73657474696e6773223b7d7d733a31303a2261646d696e2f6c6f6773223b613a313a7b733a383a2263616c6c6261636b223b733a32383a2273797374656d5f61646d696e5f6d656e755f626c6f636b5f70616765223b7d733a31373a2261646d696e2f6c6f67732f737461747573223b613a313a7b733a383a2263616c6c6261636b223b733a31333a2273797374656d5f737461747573223b7d733a32363a2261646d696e2f6c6f67732f7374617475732f72756e2d63726f6e223b613a313a7b733a383a2263616c6c6261636b223b733a31353a2273797374656d5f72756e5f63726f6e223b7d733a32313a2261646d696e2f6c6f67732f7374617475732f706870223b613a313a7b733a383a2263616c6c6261636b223b733a31303a2273797374656d5f706870223b7d733a32313a2261646d696e2f6c6f67732f7374617475732f73716c223b613a313a7b733a383a2263616c6c6261636b223b733a31303a2273797374656d5f73716c223b7d733a32323a2261646d696e2f636f6e74656e742f7461786f6e6f6d79223b613a313a7b733a383a2263616c6c6261636b223b733a33303a227461786f6e6f6d795f6f766572766965775f766f636162756c6172696573223b7d733a33373a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f6164642f766f636162756c617279223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32343a227461786f6e6f6d795f666f726d5f766f636162756c617279223b7d7d733a33383a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f656469742f766f636162756c617279223b613a313a7b733a383a2263616c6c6261636b223b733a33303a227461786f6e6f6d795f61646d696e5f766f636162756c6172795f65646974223b7d733a33323a2261646d696e2f636f6e74656e742f7461786f6e6f6d792f656469742f7465726d223b613a313a7b733a383a2263616c6c6261636b223b733a32343a227461786f6e6f6d795f61646d696e5f7465726d5f65646974223b7d733a31333a227461786f6e6f6d792f7465726d223b613a313a7b733a383a2263616c6c6261636b223b733a31383a227461786f6e6f6d795f7465726d5f70616765223b7d733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b613a313a7b733a383a2263616c6c6261636b223b733a32313a227461786f6e6f6d795f6175746f636f6d706c657465223b7d733a373a22747261636b6572223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2276696577735f766965775f70616765223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a373a22747261636b6572223b7d7d733a393a2275706c6f61642f6a73223b613a313a7b733a383a2263616c6c6261636b223b733a393a2275706c6f61645f6a73223b7d733a32323a2261646d696e2f73657474696e67732f75706c6f616473223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a2275706c6f61645f61646d696e5f73657474696e6773223b7d7d733a343a2275736572223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31303a22757365725f6c6f67696e223b7d7d733a31373a22757365722f6175746f636f6d706c657465223b613a313a7b733a383a2263616c6c6261636b223b733a31373a22757365725f6175746f636f6d706c657465223b7d733a31303a22757365722f6c6f67696e223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31303a22757365725f6c6f67696e223b7d7d733a31333a22757365722f7265676973746572223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31333a22757365725f7265676973746572223b7d7d733a31333a22757365722f70617373776f7264223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a393a22757365725f70617373223b7d7d733a31303a22757365722f7265736574223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31353a22757365725f706173735f7265736574223b7d7d733a393a22757365722f68656c70223b613a313a7b733a383a2263616c6c6261636b223b733a31343a22757365725f68656c705f70616765223b7d733a31303a2261646d696e2f75736572223b613a313a7b733a383a2263616c6c6261636b223b733a32383a2273797374656d5f61646d696e5f6d656e755f626c6f636b5f70616765223b7d733a31353a2261646d696e2f757365722f75736572223b613a323a7b733a383a2263616c6c6261636b223b733a31303a22757365725f61646d696e223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a343a226c697374223b7d7d733a32323a2261646d696e2f757365722f757365722f637265617465223b613a323a7b733a383a2263616c6c6261636b223b733a31303a22757365725f61646d696e223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a363a22637265617465223b7d7d733a31393a2261646d696e2f757365722f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31393a22757365725f61646d696e5f73657474696e6773223b7d7d733a31373a2261646d696e2f757365722f616363657373223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31353a22757365725f61646d696e5f7065726d223b7d7d733a31363a2261646d696e2f757365722f726f6c6573223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31393a22757365725f61646d696e5f6e65775f726f6c65223b7d7d733a32313a2261646d696e2f757365722f726f6c65732f65646974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31353a22757365725f61646d696e5f726f6c65223b7d7d733a31363a2261646d696e2f757365722f72756c6573223b613a313a7b733a383a2263616c6c6261636b223b733a31373a22757365725f61646d696e5f616363657373223b7d733a32303a2261646d696e2f757365722f72756c65732f616464223b613a313a7b733a383a2263616c6c6261636b223b733a32313a22757365725f61646d696e5f6163636573735f616464223b7d733a32323a2261646d696e2f757365722f72756c65732f636865636b223b613a313a7b733a383a2263616c6c6261636b223b733a32333a22757365725f61646d696e5f6163636573735f636865636b223b7d733a32313a2261646d696e2f757365722f72756c65732f65646974223b613a313a7b733a383a2263616c6c6261636b223b733a32323a22757365725f61646d696e5f6163636573735f65646974223b7d733a32333a2261646d696e2f757365722f72756c65732f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a33323a22757365725f61646d696e5f6163636573735f64656c6574655f636f6e6669726d223b7d7d733a31373a2261646d696e2f757365722f736561726368223b613a323a7b733a383a2263616c6c6261636b223b733a31303a22757365725f61646d696e223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a363a22736561726368223b7d7d733a363a22757365722f31223b613a323a7b733a383a2263616c6c6261636b223b733a393a22757365725f76696577223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a323a223230223b7d7d733a363a226c6f676f7574223b613a313a7b733a383a2263616c6c6261636b223b733a31313a22757365725f6c6f676f7574223b7d733a31393a2261646d696e2f6c6f67732f7761746368646f67223b613a313a7b733a383a2263616c6c6261636b223b733a31373a227761746368646f675f6f76657276696577223b7d733a32353a2261646d696e2f6c6f67732f706167652d6e6f742d666f756e64223b613a323a7b733a383a2263616c6c6261636b223b733a31323a227761746368646f675f746f70223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31343a2270616765206e6f7420666f756e64223b7d7d733a32343a2261646d696e2f6c6f67732f6163636573732d64656e696564223b613a323a7b733a383a2263616c6c6261636b223b733a31323a227761746368646f675f746f70223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31333a226163636573732064656e696564223b7d7d733a31363a2261646d696e2f6c6f67732f6576656e74223b613a313a7b733a383a2263616c6c6261636b223b733a31343a227761746368646f675f6576656e74223b7d733a32363a2261646d696e2f636f6e74656e742f74797065732f6669656c6473223b613a313a7b733a383a2263616c6c6261636b223b733a32363a225f636f6e74656e745f61646d696e5f747970655f6669656c6473223b7d733a32363a2261646d696e2f636f6e74656e742f74797065732f6578706f7274223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b733a32343a22636f6e74656e745f636f70795f6578706f72745f666f726d223b7d733a32363a2261646d696e2f636f6e74656e742f74797065732f696d706f7274223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b733a32343a22636f6e74656e745f636f70795f696d706f72745f666f726d223b7d733a32363a226e6f64657265666572656e63652f6175746f636f6d706c657465223b613a313a7b733a383a2263616c6c6261636b223b733a32363a226e6f64657265666572656e63655f6175746f636f6d706c657465223b7d733a353a226576656e74223b613a313a7b733a383a2263616c6c6261636b223b733a31303a226576656e745f70616765223b7d733a31303a226576656e742f74797065223b613a313a7b733a383a2263616c6c6261636b223b733a31303a226576656e745f74797065223b7d733a31303a226576656e742f7465726d223b613a313a7b733a383a2263616c6c6261636b223b733a31303a226576656e745f7465726d223b7d733a31303a226576656e742f66656564223b613a313a7b733a383a2263616c6c6261636b223b733a31303a226576656e745f66656564223b7d733a393a226576656e742f647374223b613a313a7b733a383a2263616c6c6261636b223b733a393a226576656e745f647374223b7d733a31303a226576656e742f6963616c223b613a313a7b733a383a2263616c6c6261636b223b733a31303a226576656e745f6963616c223b7d733a32303a2261646d696e2f73657474696e67732f6576656e74223b613a313a7b733a383a2263616c6c6261636b223b733a32383a2273797374656d5f61646d696e5f6d656e755f626c6f636b5f70616765223b7d733a32393a2261646d696e2f73657474696e67732f6576656e742f74696d657a6f6e65223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32393a226576656e745f61646d696e5f74696d657a6f6e655f73657474696e6773223b7d7d733a32393a2261646d696e2f73657474696e67732f6576656e742f6f76657276696577223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32393a226576656e745f61646d696e5f6f766572766965775f73657474696e6773223b7d7d733a31303a22696d6167652f76696577223b613a313a7b733a383a2263616c6c6261636b223b733a31313a22696d6167655f6665746368223b7d733a32303a2261646d696e2f73657474696e67732f696d616765223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32303a22696d6167655f61646d696e5f73657474696e6773223b7d7d733a31363a2266696c65732f696d6167656361636865223b613a313a7b733a383a2263616c6c6261636b223b733a31363a22696d61676563616368655f6361636865223b7d733a32353a2261646d696e2f73657474696e67732f696d6167656361636865223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a31363a22696d61676563616368655f61646d696e223b7d7d733a31313a22696d63652f62726f777365223b613a313a7b733a383a2263616c6c6261636b223b733a31313a22696d63655f62726f777365223b7d733a31393a2261646d696e2f73657474696e67732f696d6365223b613a313a7b733a383a2263616c6c6261636b223b733a31353a22696d63655f666f726d5f61646d696e223b7d733a32393a2261646d696e2f73657474696e67732f696d63652f737562666f6c646572223b613a313a7b733a383a2263616c6c6261636b223b733a31393a22696d63655f666f726d5f737562666f6c646572223b7d733a31343a226c696e6b2f7769646765742f6a73223b613a313a7b733a383a2263616c6c6261636b223b733a31343a226c696e6b5f7769646765745f6a73223b7d733a383a226d656e7574726565223b613a313a7b733a383a2263616c6c6261636b223b733a31363a226d656e75747265655f646973706c6179223b7d733a32333a2261646d696e2f73657474696e67732f6d656e7574726565223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b733a31373a226d656e75747265655f73657474696e6773223b7d733a32373a2261646d696e2f73657474696e67732f706f6f726d616e7363726f6e223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b733a32373a22706f6f726d616e7363726f6e5f61646d696e5f73657474696e6773223b7d733a32313a2261646d696e2f73657474696e67732f7369676e7570223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32303a227369676e75705f73657474696e67735f70616765223b7d7d733a32303a2261646d696e2f636f6e74656e742f7369676e7570223b613a313a7b733a383a2263616c6c6261636b223b733a31373a227369676e75705f61646d696e5f70616765223b7d733a31313a22636c6f73657369676e7570223b613a313a7b733a383a2263616c6c6261636b223b733a32353a227369676e75705f636c6f73655f7369676e75705f61646d696e223b7d733a31303a226f70656e7369676e7570223b613a313a7b733a383a2263616c6c6261636b223b733a32343a227369676e75705f6f70656e5f7369676e75705f61646d696e223b7d733a32353a2261646d696e2f73657474696e67732f73696d706c656d656e75223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a2273696d706c656d656e755f61646d696e5f73657474696e6773223b7d7d733a32353a2261646d696e2f636f6e74656e742f6e6577736c657474657273223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a2273696d706c656e6577735f61646d696e5f6e657773223b7d7d733a33303a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f73656e74223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a2273696d706c656e6577735f61646d696e5f6e657773223b7d7d733a33333a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f6e6f7473656e74223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a323a7b693a303b733a32313a2273696d706c656e6577735f61646d696e5f6e657773223b693a313b733a373a226e6f7473656e74223b7d7d733a33313a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f7479706573223b613a313a7b733a383a2263616c6c6261636b223b733a32353a2273696d706c656e6577735f74797065735f6f76657276696577223b7d733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f65646974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32373a2273696d706c656e6577735f61646d696e5f74797065735f666f726d223b7d7d733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32393a2273696d706c656e6577735f61646d696e5f74797065735f64656c657465223b7d7d733a33353a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f74797065732f616464223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32373a2273696d706c656e6577735f61646d696e5f74797065735f666f726d223b7d7d733a33313a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f7573657273223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32313a2273696d706c656e6577735f61646d696e5f6c697374223b7d7d733a33363a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f65646974223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32373a2273696d706c656e6577735f61646d696e5f75736572735f666f726d223b7d7d733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32393a2273696d706c656e6577735f61646d696e5f75736572735f64656c657465223b7d7d733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f696d706f7274223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a2273696d706c656e6577735f61646d696e5f6c6973745f616464223b7d7d733a33383a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f6578706f7274223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32383a2273696d706c656e6577735f61646d696e5f6c6973745f6578706f7274223b7d7d733a34303a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f6163746976617465223b613a313a7b733a383a2263616c6c6261636b223b733a33323a2273696d706c656e6577735f61637469766174655f737562736372697074696f6e223b7d733a34323a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f75736572732f696e6163746976617465223b613a313a7b733a383a2263616c6c6261636b223b733a33343a2273696d706c656e6577735f696e61637469766174655f737562736372697074696f6e223b7d733a33343a2261646d696e2f636f6e74656e742f6e6577736c6574746572732f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32353a2273696d706c656e6577735f61646d696e5f73657474696e6773223b7d7d733a31383a226e6577736c65747465722f636f6e6669726d223b613a313a7b733a383a2263616c6c6261636b223b733a33313a2273696d706c656e6577735f636f6e6669726d5f737562736372697074696f6e223b7d733a32343a226e6577736c65747465722f737562736372697074696f6e73223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a33363a2273696d706c656e6577735f737562736372697074696f6e5f6d616e616765725f666f726d223b7d7d733a32323a2261646d696e2f73657474696e67732f74696e796d6365223b613a313a7b733a383a2263616c6c6261636b223b733a31333a2274696e796d63655f61646d696e223b7d733a31383a2261646d696e2f6c6f67732f75706461746573223b613a313a7b733a383a2263616c6c6261636b223b733a32303a227570646174655f7374617475735f737461747573223b7d733a32333a2261646d696e2f6c6f67732f757064617465732f6c697374223b613a313a7b733a383a2263616c6c6261636b223b733a32303a227570646174655f7374617475735f737461747573223b7d733a32373a2261646d696e2f6c6f67732f757064617465732f73657474696e6773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32323a227570646174655f7374617475735f73657474696e6773223b7d7d733a32343a2261646d696e2f6c6f67732f757064617465732f636865636b223b613a313a7b733a383a2263616c6c6261636b223b733a32373a227570646174655f7374617475735f6d616e75616c5f737461747573223b7d733a32343a2261646d696e2f6275696c642f76696577732f77697a617264223b613a313a7b733a383a2263616c6c6261636b223b733a32333a2276696577735f7468656d655f77697a6172645f70616765223b7d733a31373a2261646d696e2f6275696c642f7669657773223b613a313a7b733a383a2263616c6c6261636b223b733a31393a2276696577735f75695f61646d696e5f70616765223b7d733a32323a2261646d696e2f6275696c642f76696577732f6c697374223b613a313a7b733a383a2263616c6c6261636b223b733a31393a2276696577735f75695f61646d696e5f70616765223b7d733a32313a2261646d696e2f6275696c642f76696577732f616464223b613a313a7b733a383a2263616c6c6261636b223b733a32333a2276696577735f75695f61646d696e5f6164645f70616765223b7d733a32343a2261646d696e2f6275696c642f76696577732f696d706f7274223b613a313a7b733a383a2263616c6c6261636b223b733a32363a2276696577735f75695f61646d696e5f696d706f72745f70616765223b7d733a32333a2261646d696e2f6275696c642f76696577732f746f6f6c73223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32303a2276696577735f75695f61646d696e5f746f6f6c73223b7d7d733a32343a2261646d696e2f6275696c642f76696577732f64656c657465223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32393a2276696577735f75695f61646d696e5f64656c6574655f636f6e6669726d223b7d7d733a32343a2261646d696e2f6275696c642f76696577732f656e61626c65223b613a313a7b733a383a2263616c6c6261636b223b733a32363a2276696577735f75695f61646d696e5f656e61626c655f70616765223b7d733a32353a2261646d696e2f6275696c642f76696577732f64697361626c65223b613a313a7b733a383a2263616c6c6261636b223b733a32373a2276696577735f75695f61646d696e5f64697361626c655f70616765223b7d733a32333a2261646d696e2f73657474696e67732f706174686175746f223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2264727570616c5f6765745f666f726d223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a32333a22706174686175746f5f61646d696e5f73657474696e6773223b7d7d733a31333a22706174686175746f2f6e6f6465223b613a313a7b733a383a2263616c6c6261636b223b733a31383a226e6f64655f706174686175746f5f70616765223b7d733a343a226e657773223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2276696577735f766965775f70616765223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a343a224e657773223b7d7d733a383a22706172746e657273223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2276696577735f766965775f70616765223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a383a22506172746e657273223b7d7d733a343a22686f6d65223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2276696577735f766965775f70616765223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a383a22486f6d6570616765223b7d7d733a393a2266726f6e7470616765223b613a323a7b733a383a2263616c6c6261636b223b733a31353a2276696577735f766965775f70616765223b733a31383a2263616c6c6261636b20617267756d656e7473223b613a313a7b693a303b733a393a2266726f6e7470616765223b7d7d7d733a373a2276697369626c65223b613a38383a7b693a35363b613a353a7b733a353a227469746c65223b733a353a224576656e74223b733a343a2270617468223b733a31343a226e6f64652f6164642f6576656e74223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a3130323b7d693a35383b613a353a7b733a353a227469746c65223b733a353a22496d616765223b733a343a2270617468223b733a31343a226e6f64652f6164642f696d616765223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a3130323b7d693a37393b613a353a7b733a353a227469746c65223b733a343a224e657773223b733a343a2270617468223b733a31333a226e6f64652f6164642f6e657773223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a3130323b7d693a39323b613a353a7b733a353a227469746c65223b733a31363a224e6577736c6574746572206973737565223b733a343a2270617468223b733a31393a226e6f64652f6164642f73696d706c656e657773223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a3130323b7d693a3130303b613a353a7b733a353a227469746c65223b733a343a2250616765223b733a343a2270617468223b733a31333a226e6f64652f6164642f70616765223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a3130323b7d693a38303b613a353a7b733a353a227469746c65223b733a373a22506172746e6572223b733a343a2270617468223b733a31363a226e6f64652f6164642f706172746e6572223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a3130323b7d693a37373b613a353a7b733a353a227469746c65223b733a343a22506f6c6c223b733a343a2270617468223b733a31333a226e6f64652f6164642f706f6c6c223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a3130323b7d693a3130323b613a353a7b733a353a227469746c65223b733a31343a2243726561746520636f6e74656e74223b733a343a2270617468223b733a383a226e6f64652f616464223b733a383a226368696c6472656e223b613a373a7b693a303b693a35363b693a313b693a35383b693a323b693a37393b693a333b693a39323b693a343b693a3130303b693a353b693a38303b693a363b693a37373b7d733a343a2274797065223b693a32383b733a333a22706964223b693a313b7d693a2d3231353b613a353a7b733a353a227469746c65223b733a31303a224d79206163636f756e74223b733a343a2270617468223b733a363a22757365722f31223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a363b733a333a22706964223b693a313b7d693a383b613a353a7b733a353a227469746c65223b733a31323a22526563656e7420706f737473223b733a343a2270617468223b733a373a22747261636b6572223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a313b7d693a34353b613a353a7b733a353a227469746c65223b733a31303a2243617465676f72696573223b733a343a2270617468223b733a32323a2261646d696e2f636f6e74656e742f7461786f6e6f6d79223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a31373b613a353a7b733a353a227469746c65223b733a383a22436f6d6d656e7473223b733a343a2270617468223b733a32313a2261646d696e2f636f6e74656e742f636f6d6d656e74223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a32303b613a353a7b733a353a227469746c65223b733a373a22436f6e74656e74223b733a343a2270617468223b733a31383a2261646d696e2f636f6e74656e742f6e6f6465223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a32333b613a353a7b733a353a227469746c65223b733a31333a22436f6e74656e74207479706573223b733a343a2270617468223b733a31393a2261646d696e2f636f6e74656e742f7479706573223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a37303b613a353a7b733a353a227469746c65223b733a31353a224e6577732061676772656761746f72223b733a343a2270617468223b733a32343a2261646d696e2f636f6e74656e742f61676772656761746f72223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a39333b613a353a7b733a353a227469746c65223b733a31313a224e6577736c657474657273223b733a343a2270617468223b733a32353a2261646d696e2f636f6e74656e742f6e6577736c657474657273223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a32323b613a353a7b733a353a227469746c65223b733a31333a22506f73742073657474696e6773223b733a343a2270617468223b733a32373a2261646d696e2f636f6e74656e742f6e6f64652d73657474696e6773223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a34303b613a353a7b733a353a227469746c65223b733a31343a22525353207075626c697368696e67223b733a343a2270617468223b733a32383a2261646d696e2f636f6e74656e742f7273732d7075626c697368696e67223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a32313b613a353a7b733a353a227469746c65223b733a31343a2253656172636820636f6e74656e74223b733a343a2270617468223b733a32303a2261646d696e2f636f6e74656e742f736561726368223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a36343b613a353a7b733a353a227469746c65223b733a31353a225369676e7570206f76657276696577223b733a343a2270617468223b733a32303a2261646d696e2f636f6e74656e742f7369676e7570223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31303b7d693a31303b613a353a7b733a353a227469746c65223b733a31383a22436f6e74656e74206d616e6167656d656e74223b733a343a2270617468223b733a31333a2261646d696e2f636f6e74656e74223b733a383a226368696c6472656e223b613a31303a7b693a303b693a34353b693a313b693a31373b693a323b693a32303b693a333b693a32333b693a343b693a37303b693a353b693a39333b693a363b693a32323b693a373b693a34303b693a383b693a32313b693a393b693a36343b7d733a343a2274797065223b693a32323b733a333a22706964223b693a363b7d693a31363b613a353a7b733a353a227469746c65223b733a363a22426c6f636b73223b733a343a2270617468223b733a31373a2261646d696e2f6275696c642f626c6f636b223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31333b7d693a37323b613a353a7b733a353a227469746c65223b733a31323a22436f6e7461637420666f726d223b733a343a2270617468223b733a31393a2261646d696e2f6275696c642f636f6e74616374223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31333b7d693a31393b613a353a7b733a353a227469746c65223b733a353a224d656e7573223b733a343a2270617468223b733a31363a2261646d696e2f6275696c642f6d656e75223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31333b7d693a33343b613a353a7b733a353a227469746c65223b733a373a224d6f64756c6573223b733a343a2270617468223b733a31393a2261646d696e2f6275696c642f6d6f64756c6573223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31333b7d693a33333b613a353a7b733a353a227469746c65223b733a363a225468656d6573223b733a343a2270617468223b733a31383a2261646d696e2f6275696c642f7468656d6573223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31333b7d693a32343b613a353a7b733a353a227469746c65223b733a31313a2255524c20616c6961736573223b733a343a2270617468223b733a31363a2261646d696e2f6275696c642f70617468223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31333b7d693a36373b613a353a7b733a353a227469746c65223b733a353a225669657773223b733a343a2270617468223b733a31373a2261646d696e2f6275696c642f7669657773223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31333b7d693a31333b613a353a7b733a353a227469746c65223b733a31333a2253697465206275696c64696e67223b733a343a2270617468223b733a31313a2261646d696e2f6275696c64223b733a383a226368696c6472656e223b613a373a7b693a303b693a31363b693a313b693a37323b693a323b693a31393b693a333b693a33343b693a343b693a33333b693a353b693a32343b693a363b693a36373b7d733a343a2274797065223b693a32323b733a333a22706964223b693a363b7d693a33323b613a353a7b733a353a227469746c65223b733a32303a2241646d696e697374726174696f6e207468656d65223b733a343a2270617468223b733a32303a2261646d696e2f73657474696e67732f61646d696e223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a39303b613a353a7b733a353a227469746c65223b733a393a22426972746864617973223b733a343a2270617468223b733a32343a2261646d696e2f73657474696e67732f626972746864617973223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a34333b613a353a7b733a353a227469746c65223b733a31303a22436c65616e2055524c73223b733a343a2270617468223b733a32353a2261646d696e2f73657474696e67732f636c65616e2d75726c73223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a34313b613a353a7b733a353a227469746c65223b733a31333a224461746520616e642074696d65223b733a343a2270617468223b733a32343a2261646d696e2f73657474696e67732f646174652d74696d65223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a33363b613a353a7b733a353a227469746c65223b733a31353a224572726f72207265706f7274696e67223b733a343a2270617468223b733a33303a2261646d696e2f73657474696e67732f6572726f722d7265706f7274696e67223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a36393b613a353a7b733a353a227469746c65223b733a31343a224576656e74206f76657276696577223b733a343a2270617468223b733a32393a2261646d696e2f73657474696e67732f6576656e742f6f76657276696577223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a35373b7d693a36383b613a353a7b733a353a227469746c65223b733a31373a2254696d657a6f6e652068616e646c696e67223b733a343a2270617468223b733a32393a2261646d696e2f73657474696e67732f6576656e742f74696d657a6f6e65223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a35373b7d693a35373b613a353a7b733a353a227469746c65223b733a363a224576656e7473223b733a343a2270617468223b733a32303a2261646d696e2f73657474696e67732f6576656e74223b733a383a226368696c6472656e223b613a323a7b693a303b693a36393b693a313b693a36383b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a33383b613a353a7b733a353a227469746c65223b733a31313a2246696c652073797374656d223b733a343a2270617468223b733a32363a2261646d696e2f73657474696e67732f66696c652d73797374656d223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a37343b613a353a7b733a353a227469746c65223b733a31323a2246696c652075706c6f616473223b733a343a2270617468223b733a32323a2261646d696e2f73657474696e67732f75706c6f616473223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a35393b613a353a7b733a353a227469746c65223b733a353a22496d616765223b733a343a2270617468223b733a32303a2261646d696e2f73657474696e67732f696d616765223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a38343b613a353a7b733a353a227469746c65223b733a31313a22496d616765206361636865223b733a343a2270617468223b733a32353a2261646d696e2f73657474696e67732f696d6167656361636865223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a33393b613a353a7b733a353a227469746c65223b733a31333a22496d61676520746f6f6c6b6974223b733a343a2270617468223b733a32383a2261646d696e2f73657474696e67732f696d6167652d746f6f6c6b6974223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a36303b613a353a7b733a353a227469746c65223b733a31333a22494d43452073657474696e6773223b733a343a2270617468223b733a31393a2261646d696e2f73657474696e67732f696d6365223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a31383b613a353a7b733a353a227469746c65223b733a31333a22496e70757420666f726d617473223b733a343a2270617468223b733a32323a2261646d696e2f73657474696e67732f66696c74657273223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a39373b613a353a7b733a353a227469746c65223b733a31323a224c6f63616c697a6174696f6e223b733a343a2270617468223b733a32313a2261646d696e2f73657474696e67732f6c6f63616c65223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a2d3234363b613a353a7b733a353a227469746c65223b733a393a224d656e752074726565223b733a343a2270617468223b733a32333a2261646d696e2f73657474696e67732f6d656e7574726565223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a36323b613a353a7b733a353a227469746c65223b733a383a22506174686175746f223b733a343a2270617468223b733a32333a2261646d696e2f73657474696e67732f706174686175746f223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a33373b613a353a7b733a353a227469746c65223b733a31313a22506572666f726d616e6365223b733a343a2270617468223b733a32363a2261646d696e2f73657474696e67732f706572666f726d616e6365223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a38373b613a353a7b733a353a227469746c65223b733a31323a22506f6f726d616e7363726f6e223b733a343a2270617468223b733a32373a2261646d696e2f73657474696e67732f706f6f726d616e7363726f6e223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a32353b613a353a7b733a353a227469746c65223b733a31353a225365617263682073657474696e6773223b733a343a2270617468223b733a32313a2261646d696e2f73657474696e67732f736561726368223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a36333b613a353a7b733a353a227469746c65223b733a363a225369676e7570223b733a343a2270617468223b733a32313a2261646d696e2f73657474696e67732f7369676e7570223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a36353b613a353a7b733a353a227469746c65223b733a31303a2253696d706c654d656e75223b733a343a2270617468223b733a32353a2261646d696e2f73657474696e67732f73696d706c656d656e75223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a33353b613a353a7b733a353a227469746c65223b733a31363a225369746520696e666f726d6174696f6e223b733a343a2270617468223b733a33313a2261646d696e2f73657474696e67732f736974652d696e666f726d6174696f6e223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a34323b613a353a7b733a353a227469746c65223b733a31363a2253697465206d61696e74656e616e6365223b733a343a2270617468223b733a33313a2261646d696e2f73657474696e67732f736974652d6d61696e74656e616e6365223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a36363b613a353a7b733a353a227469746c65223b733a373a2254696e794d4345223b733a343a2270617468223b733a32323a2261646d696e2f73657474696e67732f74696e796d6365223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31323b7d693a31323b613a353a7b733a353a227469746c65223b733a31383a225369746520636f6e66696775726174696f6e223b733a343a2270617468223b733a31343a2261646d696e2f73657474696e6773223b733a383a226368696c6472656e223b613a32343a7b693a303b693a33323b693a313b693a39303b693a323b693a34333b693a333b693a34313b693a343b693a33363b693a353b693a35373b693a363b693a33383b693a373b693a37343b693a383b693a35393b693a393b693a38343b693a31303b693a33393b693a31313b693a36303b693a31323b693a31383b693a31333b693a39373b693a31343b693a2d3234363b693a31353b693a36323b693a31363b693a33373b693a31373b693a38373b693a31383b693a32353b693a31393b693a36333b693a32303b693a36353b693a32313b693a33353b693a32323b693a34323b693a32333b693a36363b7d733a343a2274797065223b693a32323b733a333a22706964223b693a363b7d693a34393b613a353a7b733a353a227469746c65223b733a31343a2241636365737320636f6e74726f6c223b733a343a2270617468223b733a31373a2261646d696e2f757365722f616363657373223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31353b7d693a35313b613a353a7b733a353a227469746c65223b733a31323a224163636573732072756c6573223b733a343a2270617468223b733a31363a2261646d696e2f757365722f72756c6573223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31353b7d693a38393b613a353a7b733a353a227469746c65223b733a383a2250726f66696c6573223b733a343a2270617468223b733a31383a2261646d696e2f757365722f70726f66696c65223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31353b7d693a35303b613a353a7b733a353a227469746c65223b733a353a22526f6c6573223b733a343a2270617468223b733a31363a2261646d696e2f757365722f726f6c6573223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31353b7d693a35323b613a353a7b733a353a227469746c65223b733a31323a22536561726368207573657273223b733a343a2270617468223b733a31373a2261646d696e2f757365722f736561726368223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31353b7d693a34373b613a353a7b733a353a227469746c65223b733a353a225573657273223b733a343a2270617468223b733a31353a2261646d696e2f757365722f75736572223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31353b7d693a34383b613a353a7b733a353a227469746c65223b733a31333a22557365722073657474696e6773223b733a343a2270617468223b733a31393a2261646d696e2f757365722f73657474696e6773223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31353b7d693a31353b613a353a7b733a353a227469746c65223b733a31353a2255736572206d616e6167656d656e74223b733a343a2270617468223b733a31303a2261646d696e2f75736572223b733a383a226368696c6472656e223b613a373a7b693a303b693a34393b693a313b693a35313b693a323b693a38393b693a333b693a35303b693a343b693a35323b693a353b693a34373b693a363b693a34383b7d733a343a2274797065223b693a32323b733a333a22706964223b693a363b7d693a35333b613a353a7b733a353a227469746c65223b733a31383a22526563656e74206c6f6720656e7472696573223b733a343a2270617468223b733a31393a2261646d696e2f6c6f67732f7761746368646f67223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a32373b613a353a7b733a353a227469746c65223b733a31313a22526563656e742068697473223b733a343a2270617468223b733a31353a2261646d696e2f6c6f67732f68697473223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a35353b613a353a7b733a353a227469746c65223b733a32363a22546f7020276163636573732064656e69656427206572726f7273223b733a343a2270617468223b733a32343a2261646d696e2f6c6f67732f6163636573732d64656e696564223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a35343b613a353a7b733a353a227469746c65223b733a32373a22546f70202770616765206e6f7420666f756e6427206572726f7273223b733a343a2270617468223b733a32353a2261646d696e2f6c6f67732f706167652d6e6f742d666f756e64223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a33303b613a353a7b733a353a227469746c65223b733a31333a22546f7020726566657272657273223b733a343a2270617468223b733a32303a2261646d696e2f6c6f67732f726566657272657273223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a32363b613a353a7b733a353a227469746c65223b733a31383a22546f70207365617263682070687261736573223b733a343a2270617468223b733a31373a2261646d696e2f6c6f67732f736561726368223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a32383b613a353a7b733a353a227469746c65223b733a393a22546f70207061676573223b733a343a2270617468223b733a31363a2261646d696e2f6c6f67732f7061676573223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a32393b613a353a7b733a353a227469746c65223b733a31323a22546f702076697369746f7273223b733a343a2270617468223b733a31393a2261646d696e2f6c6f67732f76697369746f7273223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a33313b613a353a7b733a353a227469746c65223b733a31393a22416363657373206c6f672073657474696e6773223b733a343a2270617468223b733a31393a2261646d696e2f6c6f67732f73657474696e6773223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a38363b613a353a7b733a353a227469746c65223b733a31373a22417661696c61626c652075706461746573223b733a343a2270617468223b733a31383a2261646d696e2f6c6f67732f75706461746573223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a34343b613a353a7b733a353a227469746c65223b733a31333a22537461747573207265706f7274223b733a343a2270617468223b733a31373a2261646d696e2f6c6f67732f737461747573223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a31343b7d693a31343b613a353a7b733a353a227469746c65223b733a343a224c6f6773223b733a343a2270617468223b733a31303a2261646d696e2f6c6f6773223b733a383a226368696c6472656e223b613a31313a7b693a303b693a35333b693a313b693a32373b693a323b693a35353b693a333b693a35343b693a343b693a33303b693a353b693a32363b693a363b693a32383b693a373b693a32393b693a383b693a33313b693a393b693a38363b693a31303b693a34343b7d733a343a2274797065223b693a32323b733a333a22706964223b693a363b7d693a393b613a353a7b733a353a227469746c65223b733a343a2248656c70223b733a343a2270617468223b733a31303a2261646d696e2f68656c70223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a363b7d693a363b613a353a7b733a353a227469746c65223b733a31303a2241646d696e6973746572223b733a343a2270617468223b733a353a2261646d696e223b733a383a226368696c6472656e223b613a363a7b693a303b693a31303b693a313b693a31333b693a323b693a31323b693a333b693a31353b693a343b693a31343b693a353b693a393b7d733a343a2274797065223b693a32323b733a333a22706964223b693a313b7d693a373b613a353a7b733a353a227469746c65223b733a373a224c6f67206f7574223b733a343a2270617468223b733a363a226c6f676f7574223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b693a32323b733a333a22706964223b693a313b7d693a313b613a353a7b733a353a227469746c65223b733a31303a224e617669676174696f6e223b733a343a2270617468223b733a303a22223b733a383a226368696c6472656e223b613a353a7b693a303b693a3130323b693a313b693a2d3231353b693a323b693a383b693a333b693a363b693a343b693a373b7d733a343a2274797065223b693a333b733a333a22706964223b693a303b7d693a38313b613a353a7b733a353a227469746c65223b733a343a22486f6d65223b733a343a2270617468223b733a373a223c66726f6e743e223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b733a333a22313138223b733a333a22706964223b693a323b7d693a38323b613a353a7b733a353a227469746c65223b733a343a224e657773223b733a343a2270617468223b733a343a226e657773223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b733a333a22313138223b733a333a22706964223b693a323b7d693a38353b613a353a7b733a353a227469746c65223b733a363a224576656e7473223b733a343a2270617468223b733a353a226576656e74223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b733a333a22313138223b733a333a22706964223b693a323b7d693a38333b613a353a7b733a353a227469746c65223b733a383a22506172746e657273223b733a343a2270617468223b733a383a22706172746e657273223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b733a333a22313138223b733a333a22706964223b693a323b7d693a3130313b613a353a7b733a353a227469746c65223b733a31303a2245534e2047616c617879223b733a343a2270617468223b733a373a226e6f64652f3132223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b733a333a22313138223b733a333a22706964223b693a323b7d693a39343b613a353a7b733a353a227469746c65223b733a373a22436f6e74616374223b733a343a2270617468223b733a373a22636f6e74616374223b733a383a226368696c6472656e223b613a303a7b7d733a343a2274797065223b733a333a22313138223b733a333a22706964223b693a323b7d693a323b613a353a7b733a353a227469746c65223b733a31333a225072696d617279206c696e6b73223b733a343a2270617468223b733a303a22223b733a383a226368696c6472656e223b613a363a7b693a303b693a38313b693a313b693a38323b693a323b693a38353b693a333b693a38333b693a343b693a3130313b693a353b693a39343b7d733a343a2274797065223b733a333a22313135223b733a333a22706964223b693a303b7d693a303b613a343a7b733a353a227469746c65223b733a303a22223b733a343a2270617468223b733a303a22223b733a383a226368696c6472656e223b613a323a7b693a303b693a313b693a313b693a323b7d733a343a2274797065223b693a313b7d7d7d, 1193131994, 1193045594, '');

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

INSERT INTO `satellite2_cache_views` (`cid`, `data`, `expire`, `created`, `headers`) VALUES 
('views_default_views:en', 0x613a393a7b733a31353a22636f6d6d656e74735f726563656e74223b4f3a383a22737464436c617373223a32353a7b733a343a226e616d65223b733a31353a22636f6d6d656e74735f726563656e74223b733a31313a226465736372697074696f6e223b733a32393a22446973706c617920726563656e7420636f6d6d656e747320626c6f636b223b733a363a22616363657373223b613a303a7b7d733a31333a22766965775f617267735f706870223b733a303a22223b733a353a22626c6f636b223b623a313b733a31313a22626c6f636b5f7469746c65223b733a31353a22526563656e7420636f6d6d656e7473223b733a31323a22626c6f636b5f686561646572223b733a303a22223b733a31393a22626c6f636b5f6865616465725f666f726d6174223b733a313a2231223b733a31323a22626c6f636b5f666f6f746572223b733a303a22223b733a31393a22626c6f636b5f666f6f7465725f666f726d6174223b733a313a2231223b733a31313a22626c6f636b5f656d707479223b733a303a22223b733a31383a22626c6f636b5f656d7074795f666f726d6174223b733a313a2231223b733a31303a22626c6f636b5f74797065223b733a343a226c697374223b733a31353a226e6f6465735f7065725f626c6f636b223b733a323a223130223b733a31303a22626c6f636b5f6d6f7265223b733a313a2230223b733a32313a22626c6f636b5f7573655f706167655f686561646572223b623a303b733a32313a22626c6f636b5f7573655f706167655f666f6f746572223b623a303b733a32303a22626c6f636b5f7573655f706167655f656d707479223b623a303b733a343a22736f7274223b613a313a7b693a303b613a353a7b733a393a227461626c656e616d65223b733a383a22636f6d6d656e7473223b733a353a226669656c64223b733a31383a22636f6d6d656e74732e74696d657374616d70223b733a393a22736f72746f72646572223b733a343a2244455343223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a31383a22636f6d6d656e74732e74696d657374616d70223b7d7d733a383a22617267756d656e74223b613a303a7b7d733a353a226669656c64223b613a333a7b693a303b613a383a7b733a393a227461626c656e616d65223b733a383a22636f6d6d656e7473223b733a353a226669656c64223b733a373a227375626a656374223b733a353a226c6162656c223b733a303a22223b733a373a2268616e646c6572223b733a33313a2276696577735f68616e646c65725f6669656c645f636f6d6d656e746c696e6b223b733a373a226f7074696f6e73223b733a343a226c696e6b223b733a383a2266756c6c6e616d65223b733a31363a22636f6d6d656e74732e7375626a656374223b733a323a226964223b733a31363a22636f6d6d656e74732e7375626a656374223b733a393a2271756572796e616d65223b733a31363a22636f6d6d656e74735f7375626a656374223b7d693a313b613a363a7b733a393a227461626c656e616d65223b733a383a22636f6d6d656e7473223b733a353a226669656c64223b733a343a226e616d65223b733a353a226c6162656c223b733a303a22223b733a383a2266756c6c6e616d65223b733a31333a22636f6d6d656e74732e6e616d65223b733a323a226964223b733a31333a22636f6d6d656e74732e6e616d65223b733a393a2271756572796e616d65223b733a31333a22636f6d6d656e74735f6e616d65223b7d693a323b613a373a7b733a393a227461626c656e616d65223b733a383a22636f6d6d656e7473223b733a353a226669656c64223b733a393a2274696d657374616d70223b733a353a226c6162656c223b733a303a22223b733a373a2268616e646c6572223b733a33303a2276696577735f68616e646c65725f6669656c645f646174655f736d616c6c223b733a383a2266756c6c6e616d65223b733a31383a22636f6d6d656e74732e74696d657374616d70223b733a323a226964223b733a31383a22636f6d6d656e74732e74696d657374616d70223b733a393a2271756572796e616d65223b733a31383a22636f6d6d656e74735f74696d657374616d70223b7d7d733a363a2266696c746572223b613a323a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a32333a226e6f64655f636f6d6d656e745f73746174697374696373223b733a353a226669656c64223b733a33373a226e6f64655f636f6d6d656e745f737461746973746963732e636f6d6d656e745f636f756e74223b733a383a226f70657261746f72223b733a323a223e3d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a33373a226e6f64655f636f6d6d656e745f737461746973746963732e636f6d6d656e745f636f756e74223b7d693a313b613a363a7b733a393a227461626c656e616d65223b733a383a22636f6d6d656e7473223b733a353a226669656c64223b733a31353a22636f6d6d656e74732e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2230223b733a323a226964223b733a31353a22636f6d6d656e74732e737461747573223b7d7d733a31343a226578706f7365645f66696c746572223b613a303a7b7d733a383a227265717569726573223b613a323a7b693a303b733a383a22636f6d6d656e7473223b693a313b733a32333a226e6f64655f636f6d6d656e745f73746174697374696373223b7d733a31303a2269735f64656661756c74223b623a313b7d733a31303a226576656e745f64617465223b4f3a383a22737464436c617373223a32393a7b733a343a226e616d65223b733a31303a226576656e745f64617465223b733a31313a226465736372697074696f6e223b733a33383a224576656e7473206c6973742066696c74657265642062792075726c20617267756d656e74732e223b733a383a2264697361626c6564223b623a313b733a363a22616363657373223b613a303a7b7d733a31333a22766965775f617267735f706870223b733a303a22223b733a343a2270616765223b623a313b733a31303a22706167655f7469746c65223b733a31303a226576656e74206c697374223b733a31313a22706167655f686561646572223b733a303a22223b733a31383a22706167655f6865616465725f666f726d6174223b733a313a2231223b733a31313a22706167655f666f6f746572223b733a303a22223b733a31383a22706167655f666f6f7465725f666f726d6174223b733a313a2231223b733a31303a22706167655f656d707479223b733a303a22223b733a31373a22706167655f656d7074795f666f726d6174223b733a313a2231223b733a393a22706167655f74797065223b733a353a227461626c65223b733a333a2275726c223b733a31303a226576656e742f64617465223b733a393a227573655f7061676572223b623a313b733a31343a226e6f6465735f7065725f70616765223b733a323a223130223b733a343a226d656e75223b623a303b733a31303a226d656e755f7469746c65223b733a303a22223b733a383a226d656e755f746162223b623a303b733a31363a226d656e755f7461625f64656661756c74223b623a303b733a31313a226d656e755f776569676874223b733a303a22223b733a343a22736f7274223b613a303a7b7d733a383a22617267756d656e74223b613a333a7b693a303b613a353a7b733a343a2274797065223b733a31303a226576656e745f79656172223b733a31303a2261726764656661756c74223b733a313a2236223b733a353a227469746c65223b733a343a2259656172223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a31303a226576656e745f79656172223b7d693a313b613a353a7b733a343a2274797065223b733a31313a226576656e745f6d6f6e7468223b733a31303a2261726764656661756c74223b733a313a2236223b733a353a227469746c65223b733a353a224d6f6e7468223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a31313a226576656e745f6d6f6e7468223b7d693a323b613a353a7b733a343a2274797065223b733a393a226576656e745f646179223b733a31303a2261726764656661756c74223b733a313a2236223b733a353a227469746c65223b733a333a22446179223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a393a226576656e745f646179223b7d7d733a353a226669656c64223b613a333a7b693a303b613a383a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a353a227469746c65223b733a353a226c6162656c223b733a353a225469746c65223b733a373a2268616e646c6572223b733a32383a2276696577735f68616e646c65725f6669656c645f6e6f64656c696e6b223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31303a226e6f64652e7469746c65223b733a323a226964223b733a31303a226e6f64652e7469746c65223b733a393a2271756572796e616d65223b733a31303a226e6f64655f7469746c65223b7d693a313b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31313a226576656e745f7374617274223b733a353a226c6162656c223b733a31313a2253746172742054696d653a223b733a373a2268616e646c6572223b733a33303a2276696577735f68616e646c65725f6669656c645f646174655f736d616c6c223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31373a226576656e742e6576656e745f7374617274223b733a323a226964223b733a31373a226576656e742e6576656e745f7374617274223b733a393a2271756572796e616d65223b733a31373a226576656e745f6576656e745f7374617274223b7d693a323b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a393a226576656e745f656e64223b733a353a226c6162656c223b733a393a22456e642054696d653a223b733a373a2268616e646c6572223b733a33303a2276696577735f68616e646c65725f6669656c645f646174655f736d616c6c223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31353a226576656e742e6576656e745f656e64223b733a323a226964223b733a31353a226576656e742e6576656e745f656e64223b733a393a2271756572796e616d65223b733a31353a226576656e745f6576656e745f656e64223b7d7d733a363a2266696c746572223b613a323a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31313a226e6f64652e737461747573223b7d693a313b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a393a226e6f64652e74797065223b733a383a226f70657261746f72223b733a323a224f52223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b613a313a7b693a303b733a353a226576656e74223b7d733a323a226964223b733a393a226e6f64652e74797065223b7d7d733a31343a226578706f7365645f66696c746572223b613a303a7b7d733a383a227265717569726573223b613a323a7b693a303b733a343a226e6f6465223b693a313b733a353a226576656e74223b7d733a31303a2269735f64656661756c74223b623a313b7d733a383a226576656e745f6a73223b4f3a383a22737464436c617373223a32393a7b733a343a226e616d65223b733a383a226576656e745f6a73223b733a31313a226465736372697074696f6e223b733a34313a224576656e7473206c6973742066696c7465726564206279206a7320646174652073656c6563746f722e223b733a383a2264697361626c6564223b623a313b733a363a22616363657373223b613a303a7b7d733a31333a22766965775f617267735f706870223b733a303a22223b733a343a2270616765223b623a313b733a31303a22706167655f7469746c65223b733a31303a226576656e74206c697374223b733a31313a22706167655f686561646572223b733a303a22223b733a31383a22706167655f6865616465725f666f726d6174223b733a313a2231223b733a31313a22706167655f666f6f746572223b733a303a22223b733a31383a22706167655f666f6f7465725f666f726d6174223b733a313a2231223b733a31303a22706167655f656d707479223b733a303a22223b733a31373a22706167655f656d7074795f666f726d6174223b733a313a2231223b733a393a22706167655f74797065223b733a353a227461626c65223b733a333a2275726c223b733a31343a226576656e742f73656c6563746f72223b733a393a227573655f7061676572223b623a313b733a31343a226e6f6465735f7065725f70616765223b733a323a223130223b733a343a226d656e75223b623a303b733a31303a226d656e755f7469746c65223b733a303a22223b733a383a226d656e755f746162223b623a303b733a31363a226d656e755f7461625f64656661756c74223b623a303b733a31313a226d656e755f776569676874223b733a303a22223b733a343a22736f7274223b613a303a7b7d733a383a22617267756d656e74223b613a303a7b7d733a353a226669656c64223b613a333a7b693a303b613a383a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a353a227469746c65223b733a353a226c6162656c223b733a353a225469746c65223b733a373a2268616e646c6572223b733a32383a2276696577735f68616e646c65725f6669656c645f6e6f64656c696e6b223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31303a226e6f64652e7469746c65223b733a323a226964223b733a31303a226e6f64652e7469746c65223b733a393a2271756572796e616d65223b733a31303a226e6f64655f7469746c65223b7d693a313b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31313a226576656e745f7374617274223b733a353a226c6162656c223b733a31313a2253746172742054696d653a223b733a373a2268616e646c6572223b733a33303a2276696577735f68616e646c65725f6669656c645f646174655f736d616c6c223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31373a226576656e742e6576656e745f7374617274223b733a323a226964223b733a31373a226576656e742e6576656e745f7374617274223b733a393a2271756572796e616d65223b733a31373a226576656e745f6576656e745f7374617274223b7d693a323b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a393a226576656e745f656e64223b733a353a226c6162656c223b733a393a22456e642054696d653a223b733a373a2268616e646c6572223b733a33303a2276696577735f68616e646c65725f6669656c645f646174655f736d616c6c223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31353a226576656e742e6576656e745f656e64223b733a323a226964223b733a31353a226576656e742e6576656e745f656e64223b733a393a2271756572796e616d65223b733a31353a226576656e745f6576656e745f656e64223b7d7d733a363a2266696c746572223b613a343a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31313a226e6f64652e737461747573223b7d693a313b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a393a226e6f64652e74797065223b733a383a226f70657261746f72223b733a323a224f52223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b613a313a7b693a303b733a353a226576656e74223b7d733a323a226964223b733a393a226e6f64652e74797065223b7d693a323b613a363a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31373a226576656e742e6576656e745f7374617274223b733a383a226f70657261746f72223b733a313a223e223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a333a226e6f77223b733a323a226964223b733a31373a226576656e742e6576656e745f7374617274223b7d693a333b613a363a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31353a226576656e742e6576656e745f656e64223b733a383a226f70657261746f72223b733a313a223e223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a333a226e6f77223b733a323a226964223b733a31353a226576656e742e6576656e745f656e64223b7d7d733a31343a226578706f7365645f66696c746572223b613a323a7b693a303b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31373a226576656e742e6576656e745f7374617274223b733a353a226c6162656c223b733a31303a2253746172742044617465223b733a383a226f7074696f6e616c223b693a303b733a31303a2269735f64656661756c74223b693a303b733a383a226f70657261746f72223b693a303b733a363a2273696e676c65223b693a303b733a323a226964223b733a31373a226576656e742e6576656e745f7374617274223b7d693a313b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31353a226576656e742e6576656e745f656e64223b733a353a226c6162656c223b733a383a22456e642044617465223b733a383a226f7074696f6e616c223b693a303b733a31303a2269735f64656661756c74223b693a303b733a383a226f70657261746f72223b693a303b733a363a2273696e676c65223b693a303b733a323a226964223b733a31353a226576656e742e6576656e745f656e64223b7d7d733a383a227265717569726573223b613a323a7b693a303b733a343a226e6f6465223b693a313b733a353a226576656e74223b7d733a31303a2269735f64656661756c74223b623a313b7d733a31323a226576656e745f73656c656374223b4f3a383a22737464436c617373223a32393a7b733a343a226e616d65223b733a31323a226576656e745f73656c656374223b733a31313a226465736372697074696f6e223b733a34383a224576656e7473206c6973742066696c74657265642062792064726f702d646f776e20646174652073656c6563746f722e223b733a383a2264697361626c6564223b623a313b733a363a22616363657373223b613a303a7b7d733a31333a22766965775f617267735f706870223b733a303a22223b733a343a2270616765223b623a313b733a31303a22706167655f7469746c65223b733a31303a226576656e74206c697374223b733a31313a22706167655f686561646572223b733a303a22223b733a31383a22706167655f6865616465725f666f726d6174223b733a313a2231223b733a31313a22706167655f666f6f746572223b733a303a22223b733a31383a22706167655f666f6f7465725f666f726d6174223b733a313a2231223b733a31303a22706167655f656d707479223b733a303a22223b733a31373a22706167655f656d7074795f666f726d6174223b733a313a2231223b733a393a22706167655f74797065223b733a353a227461626c65223b733a333a2275726c223b733a31323a226576656e742f73656c656374223b733a393a227573655f7061676572223b623a313b733a31343a226e6f6465735f7065725f70616765223b733a323a223130223b733a343a226d656e75223b623a303b733a31303a226d656e755f7469746c65223b733a303a22223b733a383a226d656e755f746162223b623a303b733a31363a226d656e755f7461625f64656661756c74223b623a303b733a31313a226d656e755f776569676874223b733a303a22223b733a343a22736f7274223b613a303a7b7d733a383a22617267756d656e74223b613a303a7b7d733a353a226669656c64223b613a333a7b693a303b613a383a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a353a227469746c65223b733a353a226c6162656c223b733a353a225469746c65223b733a373a2268616e646c6572223b733a32383a2276696577735f68616e646c65725f6669656c645f6e6f64656c696e6b223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31303a226e6f64652e7469746c65223b733a323a226964223b733a31303a226e6f64652e7469746c65223b733a393a2271756572796e616d65223b733a31303a226e6f64655f7469746c65223b7d693a313b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31313a226576656e745f7374617274223b733a353a226c6162656c223b733a31313a2253746172742054696d653a223b733a373a2268616e646c6572223b733a33303a2276696577735f68616e646c65725f6669656c645f646174655f736d616c6c223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31373a226576656e742e6576656e745f7374617274223b733a323a226964223b733a31373a226576656e742e6576656e745f7374617274223b733a393a2271756572796e616d65223b733a31373a226576656e745f6576656e745f7374617274223b7d693a323b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a393a226576656e745f656e64223b733a353a226c6162656c223b733a393a22456e642054696d653a223b733a373a2268616e646c6572223b733a33303a2276696577735f68616e646c65725f6669656c645f646174655f736d616c6c223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31353a226576656e742e6576656e745f656e64223b733a323a226964223b733a31353a226576656e742e6576656e745f656e64223b733a393a2271756572796e616d65223b733a31353a226576656e745f6576656e745f656e64223b7d7d733a363a2266696c746572223b613a353a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31313a226e6f64652e737461747573223b7d693a313b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a393a226e6f64652e74797065223b733a383a226f70657261746f72223b733a323a224f52223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b613a313a7b693a303b733a353a226576656e74223b7d733a323a226964223b733a393a226e6f64652e74797065223b7d693a323b613a363a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31303a226576656e742e79656172223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a31383a222a2a2a43555252454e545f54494d452a2a2a223b733a323a226964223b733a31303a226576656e742e79656172223b7d693a333b613a363a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31313a226576656e742e6d6f6e7468223b733a383a226f70657261746f72223b733a323a223e3d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a31383a222a2a2a43555252454e545f54494d452a2a2a223b733a323a226964223b733a31313a226576656e742e6d6f6e7468223b7d693a343b613a363a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a393a226576656e742e646179223b733a383a226f70657261746f72223b733a323a223e3d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a393a226576656e742e646179223b7d7d733a31343a226578706f7365645f66696c746572223b613a333a7b693a303b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31303a226576656e742e79656172223b733a353a226c6162656c223b733a31313a22537461727420596561723a223b733a383a226f7074696f6e616c223b693a303b733a31303a2269735f64656661756c74223b693a303b733a383a226f70657261746f72223b693a303b733a363a2273696e676c65223b693a303b733a323a226964223b733a31303a226576656e742e79656172223b7d693a313b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a31313a226576656e742e6d6f6e7468223b733a353a226c6162656c223b733a31323a225374617274204d6f6e74683a223b733a383a226f7074696f6e616c223b693a303b733a31303a2269735f64656661756c74223b693a303b733a383a226f70657261746f72223b693a303b733a363a2273696e676c65223b693a303b733a323a226964223b733a31313a226576656e742e6d6f6e7468223b7d693a323b613a383a7b733a393a227461626c656e616d65223b733a353a226576656e74223b733a353a226669656c64223b733a393a226576656e742e646179223b733a353a226c6162656c223b733a31303a225374617274204461793a223b733a383a226f7074696f6e616c223b693a303b733a31303a2269735f64656661756c74223b693a303b733a383a226f70657261746f72223b693a303b733a363a2273696e676c65223b693a303b733a323a226964223b733a393a226576656e742e646179223b7d7d733a383a227265717569726573223b613a323a7b693a303b733a343a226e6f6465223b693a313b733a353a226576656e74223b7d733a31303a2269735f64656661756c74223b623a313b7d733a393a2266726f6e7470616765223b4f3a383a22737464436c617373223a31383a7b733a343a226e616d65223b733a393a2266726f6e7470616765223b733a31313a226465736372697074696f6e223b733a32363a225468652062617369632066726f6e74207061676520766965772e223b733a343a2270616765223b623a313b733a333a2275726c223b733a393a2266726f6e7470616765223b733a31303a22706167655f7469746c65223b733a303a22223b733a393a22706167655f74797065223b733a363a22746561736572223b733a393a227573655f7061676572223b623a313b733a31343a226e6f6465735f7065725f70616765223b693a31303b733a353a22626c6f636b223b623a303b733a343a226d656e75223b623a303b733a31383a2262726561646372756d625f6e6f5f686f6d65223b623a313b733a343a22736f7274223b613a323a7b693a303b613a353a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737469636b79223b733a393a22736f72746f72646572223b733a343a2244455343223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a31313a226e6f64652e737469636b79223b7d693a313b613a353a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31323a226e6f64652e63726561746564223b733a393a22736f72746f72646572223b733a343a2244455343223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a31323a226e6f64652e63726561746564223b7d7d733a383a22617267756d656e74223b613a313a7b693a303b613a373a7b733a343a2274797065223b733a393a226e6f64655f66656564223b733a31303a2261726764656661756c74223b733a313a2232223b733a353a227469746c65223b733a33363a2245534e20536174656c6c69746520322e30202d204a6f696e207468652047616c61787921223b733a373a226f7074696f6e73223b733a303a22223b733a383a2277696c6463617264223b733a303a22223b733a32313a2277696c64636172645f737562737469747574696f6e223b733a303a22223b733a323a226964223b733a393a226e6f64655f66656564223b7d7d733a353a226669656c64223b613a303a7b7d733a363a2266696c746572223b613a323a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31323a226e6f64652e70726f6d6f7465223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31323a226e6f64652e70726f6d6f7465223b7d693a313b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31313a226e6f64652e737461747573223b7d7d733a31343a226578706f7365645f66696c746572223b613a303a7b7d733a363a22616363657373223b613a303a7b7d733a31303a2269735f64656661756c74223b623a313b7d733a31353a22706f70756c61725f616c6c74696d65223b4f3a383a22737464436c617373223a34333a7b733a343a226e616d65223b733a31353a22706f70756c61725f616c6c74696d65223b733a383a2264697361626c6564223b623a313b733a31313a226465736372697074696f6e223b733a33323a224e6f64657320736f7274656420627920746f74616c20706167652d7669657773223b733a363a22616363657373223b613a303a7b7d733a31333a22766965775f617267735f706870223b733a303a22223b733a343a2270616765223b623a313b733a31303a22706167655f7469746c65223b733a32343a22416c6c2d74696d6520706f70756c617220636f6e74656e74223b733a31313a22706167655f686561646572223b733a303a22223b733a31383a22706167655f6865616465725f666f726d6174223b733a313a2231223b733a31313a22706167655f666f6f746572223b733a303a22223b733a31383a22706167655f666f6f7465725f666f726d6174223b733a313a2231223b733a31303a22706167655f656d707479223b733a303a22223b733a31373a22706167655f656d7074795f666f726d6174223b733a313a2231223b733a393a22706167655f74797065223b733a353a227461626c65223b733a333a2275726c223b733a31353a22706f70756c61722f616c6c74696d65223b733a393a227573655f7061676572223b623a313b733a31343a226e6f6465735f7065725f70616765223b733a323a223230223b733a343a226d656e75223b623a313b733a31303a226d656e755f7469746c65223b733a303a22223b733a383a226d656e755f746162223b623a313b733a31363a226d656e755f7461625f64656661756c74223b623a303b733a31313a226d656e755f776569676874223b733a313a2231223b733a353a22626c6f636b223b623a313b733a31313a22626c6f636b5f7469746c65223b733a32343a22416c6c2d74696d6520706f70756c617220636f6e74656e74223b733a31323a22626c6f636b5f686561646572223b733a303a22223b733a31393a22626c6f636b5f6865616465725f666f726d6174223b733a313a2231223b733a31323a22626c6f636b5f666f6f746572223b733a303a22223b733a31393a22626c6f636b5f666f6f7465725f666f726d6174223b733a313a2231223b733a31313a22626c6f636b5f656d707479223b733a303a22223b733a31383a22626c6f636b5f656d7074795f666f726d6174223b733a313a2231223b733a31303a22626c6f636b5f74797065223b733a343a226c697374223b733a31353a226e6f6465735f7065725f626c6f636b223b733a313a2235223b733a31303a22626c6f636b5f6d6f7265223b733a313a2231223b733a32313a22626c6f636b5f7573655f706167655f686561646572223b623a303b733a32313a22626c6f636b5f7573655f706167655f666f6f746572223b623a303b733a32303a22626c6f636b5f7573655f706167655f656d707479223b623a303b733a343a22736f7274223b613a303a7b7d733a383a22617267756d656e74223b613a303a7b7d733a353a226669656c64223b613a353a7b693a303b613a373a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a343a2274797065223b733a353a226c6162656c223b733a343a2254797065223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a393a226e6f64652e74797065223b733a323a226964223b733a393a226e6f64652e74797065223b733a393a2271756572796e616d65223b733a393a226e6f64655f74797065223b7d693a313b613a383a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a353a227469746c65223b733a353a226c6162656c223b733a353a225469746c65223b733a373a2268616e646c6572223b733a32383a2276696577735f68616e646c65725f6669656c645f6e6f64656c696e6b223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31303a226e6f64652e7469746c65223b733a323a226964223b733a31303a226e6f64652e7469746c65223b733a393a2271756572796e616d65223b733a31303a226e6f64655f7469746c65223b7d693a323b613a373a7b733a393a227461626c656e616d65223b733a353a227573657273223b733a353a226669656c64223b733a343a226e616d65223b733a353a226c6162656c223b733a363a22417574686f72223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31303a2275736572732e6e616d65223b733a323a226964223b733a31303a2275736572732e6e616d65223b733a393a2271756572796e616d65223b733a31303a2275736572735f6e616d65223b7d693a333b613a383a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a373a2263726561746564223b733a353a226c6162656c223b733a373a2243726561746564223b733a373a2268616e646c6572223b733a32353a2276696577735f68616e646c65725f6669656c645f73696e6365223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31323a226e6f64652e63726561746564223b733a323a226964223b733a31323a226e6f64652e63726561746564223b733a393a2271756572796e616d65223b733a31323a226e6f64655f63726561746564223b7d693a343b613a383a7b733a393a227461626c656e616d65223b733a31323a226e6f64655f636f756e746572223b733a353a226669656c64223b733a31303a22746f74616c636f756e74223b733a353a226c6162656c223b733a353a225265616473223b733a383a22736f727461626c65223b733a313a2231223b733a31313a2264656661756c74736f7274223b733a343a2244455343223b733a383a2266756c6c6e616d65223b733a32333a226e6f64655f636f756e7465722e746f74616c636f756e74223b733a323a226964223b733a32333a226e6f64655f636f756e7465722e746f74616c636f756e74223b733a393a2271756572796e616d65223b733a32333a226e6f64655f636f756e7465725f746f74616c636f756e74223b7d7d733a363a2266696c746572223b613a313a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31313a226e6f64652e737461747573223b7d7d733a383a227265717569726573223b613a333a7b693a303b733a31323a226e6f64655f636f756e746572223b693a313b733a343a226e6f6465223b693a323b733a353a227573657273223b7d733a31343a226578706f7365645f66696c746572223b613a303a7b7d733a31303a2269735f64656661756c74223b623a313b7d733a31343a22706f70756c61725f726563656e74223b4f3a383a22737464436c617373223a34333a7b733a343a226e616d65223b733a31343a22706f70756c61725f726563656e74223b733a383a2264697361626c6564223b623a313b733a31313a226465736372697074696f6e223b733a33333a224e6f64657320736f7274656420627920726563656e7420706167652d7669657773223b733a363a22616363657373223b613a303a7b7d733a31333a22766965775f617267735f706870223b733a303a22223b733a343a2270616765223b623a313b733a31303a22706167655f7469746c65223b733a32323a22526563656e7420706f70756c617220636f6e74656e74223b733a31313a22706167655f686561646572223b733a303a22223b733a31383a22706167655f6865616465725f666f726d6174223b733a313a2231223b733a31313a22706167655f666f6f746572223b733a303a22223b733a31383a22706167655f666f6f7465725f666f726d6174223b733a313a2231223b733a31303a22706167655f656d707479223b733a303a22223b733a31373a22706167655f656d7074795f666f726d6174223b733a313a2231223b733a393a22706167655f74797065223b733a353a227461626c65223b733a333a2275726c223b733a31343a22706f70756c61722f6c6174657374223b733a393a227573655f7061676572223b623a313b733a31343a226e6f6465735f7065725f70616765223b733a323a223230223b733a343a226d656e75223b623a313b733a31303a226d656e755f7469746c65223b733a303a22223b733a383a226d656e755f746162223b623a313b733a31363a226d656e755f7461625f64656661756c74223b623a313b733a31313a226d656e755f776569676874223b733a323a222d31223b733a353a22626c6f636b223b623a313b733a31313a22626c6f636b5f7469746c65223b733a32323a22526563656e7420706f70756c617220636f6e74656e74223b733a31323a22626c6f636b5f686561646572223b733a303a22223b733a31393a22626c6f636b5f6865616465725f666f726d6174223b733a313a2231223b733a31323a22626c6f636b5f666f6f746572223b733a303a22223b733a31393a22626c6f636b5f666f6f7465725f666f726d6174223b733a313a2231223b733a31313a22626c6f636b5f656d707479223b733a303a22223b733a31383a22626c6f636b5f656d7074795f666f726d6174223b733a313a2231223b733a31303a22626c6f636b5f74797065223b733a343a226c697374223b733a31353a226e6f6465735f7065725f626c6f636b223b733a313a2235223b733a31303a22626c6f636b5f6d6f7265223b733a313a2231223b733a32313a22626c6f636b5f7573655f706167655f686561646572223b623a303b733a32313a22626c6f636b5f7573655f706167655f666f6f746572223b623a303b733a32303a22626c6f636b5f7573655f706167655f656d707479223b623a303b733a343a22736f7274223b613a303a7b7d733a383a22617267756d656e74223b613a303a7b7d733a353a226669656c64223b613a353a7b693a303b613a373a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a343a2274797065223b733a353a226c6162656c223b733a343a2254797065223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a393a226e6f64652e74797065223b733a323a226964223b733a393a226e6f64652e74797065223b733a393a2271756572796e616d65223b733a393a226e6f64655f74797065223b7d693a313b613a383a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a353a227469746c65223b733a353a226c6162656c223b733a353a225469746c65223b733a373a2268616e646c6572223b733a32383a2276696577735f68616e646c65725f6669656c645f6e6f64656c696e6b223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31303a226e6f64652e7469746c65223b733a323a226964223b733a31303a226e6f64652e7469746c65223b733a393a2271756572796e616d65223b733a31303a226e6f64655f7469746c65223b7d693a323b613a373a7b733a393a227461626c656e616d65223b733a353a227573657273223b733a353a226669656c64223b733a343a226e616d65223b733a353a226c6162656c223b733a363a22417574686f72223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31303a2275736572732e6e616d65223b733a323a226964223b733a31303a2275736572732e6e616d65223b733a393a2271756572796e616d65223b733a31303a2275736572735f6e616d65223b7d693a333b613a383a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a373a2263726561746564223b733a353a226c6162656c223b733a373a2243726561746564223b733a373a2268616e646c6572223b733a33303a2276696577735f68616e646c65725f6669656c645f646174655f736d616c6c223b733a383a22736f727461626c65223b733a313a2231223b733a383a2266756c6c6e616d65223b733a31323a226e6f64652e63726561746564223b733a323a226964223b733a31323a226e6f64652e63726561746564223b733a393a2271756572796e616d65223b733a31323a226e6f64655f63726561746564223b7d693a343b613a383a7b733a393a227461626c656e616d65223b733a31323a226e6f64655f636f756e746572223b733a353a226669656c64223b733a383a22646179636f756e74223b733a353a226c6162656c223b733a31313a22526563656e742068697473223b733a383a22736f727461626c65223b733a313a2231223b733a31313a2264656661756c74736f7274223b733a343a2244455343223b733a383a2266756c6c6e616d65223b733a32313a226e6f64655f636f756e7465722e646179636f756e74223b733a323a226964223b733a32313a226e6f64655f636f756e7465722e646179636f756e74223b733a393a2271756572796e616d65223b733a32313a226e6f64655f636f756e7465725f646179636f756e74223b7d7d733a363a2266696c746572223b613a313a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31313a226e6f64652e737461747573223b7d7d733a383a227265717569726573223b613a333a7b693a303b733a31323a226e6f64655f636f756e746572223b693a313b733a343a226e6f6465223b693a323b733a353a227573657273223b7d733a31343a226578706f7365645f66696c746572223b613a303a7b7d733a31303a2269735f64656661756c74223b623a313b7d733a31333a227461786f6e6f6d795f7465726d223b4f3a383a22737464436c617373223a31393a7b733a343a226e616d65223b733a31333a227461786f6e6f6d795f7465726d223b733a383a2264697361626c6564223b623a313b733a31313a226465736372697074696f6e223b733a33363a22546865207461786f6e6f6d79207669657720776974682061206465707468206f6620302e223b733a363a22616363657373223b613a303a7b7d733a343a2270616765223b623a313b733a31303a22706167655f7469746c65223b733a383a225461786f6e6f6d79223b733a31313a22706167655f686561646572223b733a303a22223b733a31383a22706167655f6865616465725f666f726d6174223b733a313a2231223b733a393a22706167655f74797065223b733a363a22746561736572223b733a333a2275726c223b733a31333a227461786f6e6f6d792f7465726d223b733a393a227573655f7061676572223b623a313b733a31343a226e6f6465735f7065725f70616765223b733a323a223130223b733a343a22736f7274223b613a323a7b693a303b613a353a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737469636b79223b733a393a22736f72746f72646572223b733a343a2244455343223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a31313a226e6f64652e737469636b79223b7d693a313b613a353a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31323a226e6f64652e63726561746564223b733a393a22736f72746f72646572223b733a343a2244455343223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a31323a226e6f64652e63726561746564223b7d7d733a383a22617267756d656e74223b613a323a7b693a303b613a353a7b733a343a2274797065223b733a353a227461786964223b733a31303a2261726764656661756c74223b733a313a2231223b733a353a227469746c65223b733a323a222531223b733a373a226f7074696f6e73223b733a313a2230223b733a323a226964223b733a353a227461786964223b7d693a313b613a353a7b733a343a2274797065223b733a393a226e6f64655f66656564223b733a31303a2261726764656661756c74223b733a313a2232223b733a353a227469746c65223b733a303a22223b733a373a226f7074696f6e73223b733a303a22223b733a323a226964223b733a393a226e6f64655f66656564223b7d7d733a353a226669656c64223b613a303a7b7d733a363a2266696c746572223b613a313a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a373a226f7074696f6e73223b733a303a22223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31313a226e6f64652e737461747573223b7d7d733a383a227265717569726573223b613a313a7b693a303b733a343a226e6f6465223b7d733a31343a226578706f7365645f66696c746572223b613a303a7b7d733a31303a2269735f64656661756c74223b623a313b7d733a373a22747261636b6572223b4f3a383a22737464436c617373223a31393a7b733a343a226e616d65223b733a373a22747261636b6572223b733a383a227265717569726573223b613a313a7b693a303b733a32333a226e6f64655f636f6d6d656e745f73746174697374696373223b7d733a31313a226465736372697074696f6e223b733a33333a2253686f777320616c6c206e6577206163746976697479206f6e2073797374656d2e223b733a343a2270616765223b623a313b733a333a2275726c223b733a373a22747261636b6572223b733a31303a22706167655f7469746c65223b733a31323a22526563656e7420706f737473223b733a393a22706167655f74797065223b733a353a227461626c65223b733a393a227573655f7061676572223b623a313b733a31343a226e6f6465735f7065725f70616765223b733a323a223235223b733a343a226d656e75223b623a313b733a31303a226d656e755f7469746c65223b733a31323a22526563656e7420706f737473223b733a353a22626c6f636b223b623a303b733a353a226669656c64223b613a353a7b693a303b613a363a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a343a2274797065223b733a353a226c6162656c223b733a343a2254797065223b733a383a2266756c6c6e616d65223b733a393a226e6f64652e74797065223b733a323a226964223b733a393a226e6f64652e74797065223b733a393a2271756572796e616d65223b733a393a226e6f64655f74797065223b7d693a313b613a373a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a353a227469746c65223b733a353a226c6162656c223b733a353a225469746c65223b733a373a2268616e646c6572223b733a33383a2276696577735f68616e646c65725f6669656c645f6e6f64656c696e6b5f776974685f6d61726b223b733a383a2266756c6c6e616d65223b733a31303a226e6f64652e7469746c65223b733a323a226964223b733a31303a226e6f64652e7469746c65223b733a393a2271756572796e616d65223b733a31303a226e6f64655f7469746c65223b7d693a323b613a363a7b733a393a227461626c656e616d65223b733a353a227573657273223b733a353a226669656c64223b733a343a226e616d65223b733a353a226c6162656c223b733a363a22417574686f72223b733a383a2266756c6c6e616d65223b733a31303a2275736572732e6e616d65223b733a323a226964223b733a31303a2275736572732e6e616d65223b733a393a2271756572796e616d65223b733a31303a2275736572735f6e616d65223b7d693a333b613a373a7b733a393a227461626c656e616d65223b733a32333a226e6f64655f636f6d6d656e745f73746174697374696373223b733a353a226669656c64223b733a31333a22636f6d6d656e745f636f756e74223b733a353a226c6162656c223b733a373a225265706c696573223b733a373a2268616e646c6572223b733a33313a2276696577735f68616e646c65725f636f6d6d656e74735f776974685f6e6577223b733a383a2266756c6c6e616d65223b733a33373a226e6f64655f636f6d6d656e745f737461746973746963732e636f6d6d656e745f636f756e74223b733a323a226964223b733a33373a226e6f64655f636f6d6d656e745f737461746973746963732e636f6d6d656e745f636f756e74223b733a393a2271756572796e616d65223b733a33373a226e6f64655f636f6d6d656e745f737461746973746963735f636f6d6d656e745f636f756e74223b7d693a343b613a373a7b733a393a227461626c656e616d65223b733a32333a226e6f64655f636f6d6d656e745f73746174697374696373223b733a353a226669656c64223b733a32323a226c6173745f636f6d6d656e745f74696d657374616d70223b733a353a226c6162656c223b733a393a224c61737420506f7374223b733a373a2268616e646c6572223b733a32353a2276696577735f68616e646c65725f6669656c645f73696e6365223b733a383a2266756c6c6e616d65223b733a34363a226e6f64655f636f6d6d656e745f737461746973746963732e6c6173745f636f6d6d656e745f74696d657374616d70223b733a323a226964223b733a34363a226e6f64655f636f6d6d656e745f737461746973746963732e6c6173745f636f6d6d656e745f74696d657374616d70223b733a393a2271756572796e616d65223b733a34363a226e6f64655f636f6d6d656e745f737461746973746963735f6c6173745f636f6d6d656e745f74696d657374616d70223b7d7d733a343a22736f7274223b613a313a7b693a303b613a343a7b733a393a227461626c656e616d65223b733a32333a226e6f64655f636f6d6d656e745f73746174697374696373223b733a353a226669656c64223b733a34363a226e6f64655f636f6d6d656e745f737461746973746963732e6c6173745f636f6d6d656e745f74696d657374616d70223b733a393a22736f72746f72646572223b733a343a2244455343223b733a323a226964223b733a34363a226e6f64655f636f6d6d656e745f737461746973746963732e6c6173745f636f6d6d656e745f74696d657374616d70223b7d7d733a383a22617267756d656e74223b613a313a7b693a303b613a343a7b733a343a2274797065223b733a333a22756964223b733a31303a2261726764656661756c74223b733a313a2232223b733a353a227469746c65223b733a31393a22726563656e7420706f73747320666f72202531223b733a323a226964223b733a333a22756964223b7d7d733a363a2266696c746572223b613a313a7b693a303b613a353a7b733a393a227461626c656e616d65223b733a343a226e6f6465223b733a353a226669656c64223b733a31313a226e6f64652e737461747573223b733a383a226f70657261746f72223b733a313a223d223b733a353a2276616c7565223b733a313a2231223b733a323a226964223b733a31313a226e6f64652e737461747573223b7d7d733a31343a226578706f7365645f66696c746572223b613a303a7b7d733a363a22616363657373223b613a303a7b7d733a31303a2269735f64656661756c74223b623a313b7d7d, 0, 1193045594, '');
INSERT INTO `satellite2_cache_views` (`cid`, `data`, `expire`, `created`, `headers`) VALUES 
('views_arguments:en', 0x613a323a7b733a343a2262617365223b613a32373a7b733a393a226576656e745f646179223b733a31363a224576656e743a20537461727420446179223b733a31313a226576656e745f6d6f6e7468223b733a31383a224576656e743a205374617274204d6f6e7468223b733a31303a226576656e745f7765656b223b733a31373a224576656e743a205374617274205765656b223b733a31303a226576656e745f79656172223b733a31373a224576656e743a2053746172742059656172223b733a32303a22636f6e74656e743a206669656c645f696d616765223b733a32363a22496d6167653a20496d61676520286669656c645f696d61676529223b733a31393a22636f6e74656e743a206669656c645f6c6f676f223b733a32343a22496d6167653a204c6f676f20286669656c645f6c6f676f29223b733a33303a22636f6e74656e743a206669656c645f6c6f676f6c696e6b5f746172676574223b733a34353a224c696e6b205461726765743a20506172746e6572207765627369746520286669656c645f6c6f676f6c696e6b29223b733a32393a22636f6e74656e743a206669656c645f6c6f676f6c696e6b5f7469746c65223b733a34343a224c696e6b205469746c653a20506172746e6572207765627369746520286669656c645f6c6f676f6c696e6b29223b733a32373a22636f6e74656e743a206669656c645f6c6f676f6c696e6b5f75726c223b733a34323a224c696e6b2055524c3a20506172746e6572207765627369746520286669656c645f6c6f676f6c696e6b29223b733a393a226e6f64655f66656564223b733a31393a224e6f64653a20466565642053656c6563746f72223b733a333a226e6964223b733a383a224e6f64653a204944223b733a383a2266756c6c64617465223b733a32323a224e6f64653a20506f737465642046756c6c2044617465223b733a353a226d6f6e7468223b733a31383a224e6f64653a20506f73746564204d6f6e7468223b733a393a226d6f6e746879656172223b733a32353a224e6f64653a20506f73746564204d6f6e7468202b2059656172223b733a343a227765656b223b733a31373a224e6f64653a20506f73746564205765656b223b733a343a2279656172223b733a31373a224e6f64653a20506f737465642059656172223b733a31303a226e6f64656c6574746572223b733a31313a224e6f64653a205469746c65223b733a383a226e6f646574797065223b733a31303a224e6f64653a2054797065223b733a383a227273735f66656564223b733a32323a225253533a2052535320466565642053656c6563746f72223b733a353a227461786964223b733a31373a225461786f6e6f6d793a205465726d204944223b733a393a227461786c6574746572223b733a31393a225461786f6e6f6d793a205465726d204e616d65223b733a353a22766f636964223b733a32333a225461786f6e6f6d793a20566f636162756c617279204944223b733a33313a22636f6e74656e743a206669656c645f73686f72746465736372697074696f6e223b733a34383a22546578743a2053686f7274204465736372697074696f6e20286669656c645f73686f72746465736372697074696f6e29223b733a32323a22636f6e74656e743a206669656c645f73756d6d617279223b733a32393a22546578743a2053756d6d61727920286669656c645f73756d6d61727929223b733a383a22756964746f756368223b733a33313a22557365723a2055494420417574686f726564206f7220436f6d6d656e746564223b733a333a22756964223b733a31393a22557365723a2055494420697320417574686f72223b733a383a22757365726e616d65223b733a32343a22557365723a20557365726e616d6520697320417574686f72223b7d733a353a227469746c65223b613a32373a7b733a393a226576656e745f646179223b613a333a7b733a343a226e616d65223b733a31363a224576656e743a20537461727420446179223b733a373a2268616e646c6572223b733a32373a226576656e745f76696577735f68616e646c65725f6172675f646179223b733a343a2268656c70223b733a39303a2246696c74657220627920746865206576656e74206461792028312d3331292e20506c616365207468697320617267756d656e7420616674657220612027596561722720616e64206120274d6f6e74682720617267756d656e742e223b7d733a31313a226576656e745f6d6f6e7468223b613a333a7b733a343a226e616d65223b733a31383a224576656e743a205374617274204d6f6e7468223b733a373a2268616e646c6572223b733a32393a226576656e745f76696577735f68616e646c65725f6172675f6d6f6e7468223b733a343a2268656c70223b733a37383a2246696c74657220627920746865206576656e74206d6f6e74682028312d3132292e20506c616365207468697320617267756d656e7420616674657220612027596561722720617267756d656e742e223b7d733a31303a226576656e745f7765656b223b613a333a7b733a343a226e616d65223b733a31373a224576656e743a205374617274205765656b223b733a373a2268616e646c6572223b733a32383a226576656e745f76696577735f68616e646c65725f6172675f7765656b223b733a343a2268656c70223b733a37383a2246696c74657220627920746865207765656b206e756d6265722028312d3532292e20506c616365207468697320617267756d656e7420616674657220612027596561722720617267756d656e742e223b7d733a31303a226576656e745f79656172223b613a333a7b733a343a226e616d65223b733a31373a224576656e743a2053746172742059656172223b733a373a2268616e646c6572223b733a32383a226576656e745f76696577735f68616e646c65725f6172675f79656172223b733a343a2268656c70223b733a33323a2246696c74657220627920746865206576656e742079656172202859595959292e223b7d733a32303a22636f6e74656e743a206669656c645f696d616765223b613a323a7b733a343a226e616d65223b733a32363a22496d6167653a20496d61676520286669656c645f696d61676529223b733a373a2268616e646c6572223b733a33303a22636f6e74656e745f76696577735f617267756d656e745f68616e646c6572223b7d733a31393a22636f6e74656e743a206669656c645f6c6f676f223b613a323a7b733a343a226e616d65223b733a32343a22496d6167653a204c6f676f20286669656c645f6c6f676f29223b733a373a2268616e646c6572223b733a33303a22636f6e74656e745f76696577735f617267756d656e745f68616e646c6572223b7d733a33303a22636f6e74656e743a206669656c645f6c6f676f6c696e6b5f746172676574223b613a323a7b733a343a226e616d65223b733a34353a224c696e6b205461726765743a20506172746e6572207765627369746520286669656c645f6c6f676f6c696e6b29223b733a373a2268616e646c6572223b733a32373a226c696e6b5f76696577735f617267756d656e745f68616e646c6572223b7d733a32393a22636f6e74656e743a206669656c645f6c6f676f6c696e6b5f7469746c65223b613a323a7b733a343a226e616d65223b733a34343a224c696e6b205469746c653a20506172746e6572207765627369746520286669656c645f6c6f676f6c696e6b29223b733a373a2268616e646c6572223b733a32373a226c696e6b5f76696577735f617267756d656e745f68616e646c6572223b7d733a32373a22636f6e74656e743a206669656c645f6c6f676f6c696e6b5f75726c223b613a323a7b733a343a226e616d65223b733a34323a224c696e6b2055524c3a20506172746e6572207765627369746520286669656c645f6c6f676f6c696e6b29223b733a373a2268616e646c6572223b733a32373a226c696e6b5f76696577735f617267756d656e745f68616e646c6572223b7d733a393a226e6f64655f66656564223b613a343a7b733a343a226e616d65223b733a31393a224e6f64653a20466565642053656c6563746f72223b733a373a2268616e646c6572223b733a32373a2276696577735f68616e646c65725f6172675f6e6f64655f66656564223b733a363a226f7074696f6e223b613a333a7b733a353a222374797065223b733a393a22746578746669656c64223b733a353a222373697a65223b693a31303b733a31303a22236d61786c656e677468223b693a3235353b7d733a343a2268656c70223b733a3333343a225468697320617267756d656e7420616c6c6f777320706c75676761626c65202266656564222073656c6563746f72732e204966207573696e672076696577735f727373206d6f64756c652c202266656564222077696c6c207475726e20746865207669657720696e746f20616e2052535320666565642e204f74686572206d6f64756c6573206d61792070726f76696465207468656972206f776e2066656564732e20596f75206d617920656e74657220746865207469746c652074686520666565642077696c6c2061647665727469736520696e20746865207469746c65206669656c6420686572652e2049662074686520666565642074797065206f66666572732061206465736372697074696f6e2c20656e74657220746865206465736372697074696f6e206f6620746865206665656420696e20746865206f7074696f6e206669656c6420686572652e223b7d733a333a226e6964223b613a343a7b733a343a226e616d65223b733a383a224e6f64653a204944223b733a373a2268616e646c6572223b733a32313a2276696577735f68616e646c65725f6172675f6e6964223b733a363a226f7074696f6e223b613a323a7b733a353a222374797065223b733a363a2273656c656374223b733a383a22236f7074696f6e73223b613a323a7b693a303b733a353a22657175616c223b693a313b733a393a226e6f7420657175616c223b7d7d733a343a2268656c70223b733a33343a225468697320617267756d656e7420697320612073696e676c65204e6f64652049442e223b7d733a383a2266756c6c64617465223b613a333a7b733a343a226e616d65223b733a32323a224e6f64653a20506f737465642046756c6c2044617465223b733a373a2268616e646c6572223b733a32363a2276696577735f68616e646c65725f6172675f66756c6c64617465223b733a343a2268656c70223b733a35373a225468697320617267756d656e74206973206120636f6d706c657465206461746520696e2074686520666f726d206f6620434359594d4d44442e223b7d733a353a226d6f6e7468223b613a333a7b733a343a226e616d65223b733a31383a224e6f64653a20506f73746564204d6f6e7468223b733a373a2268616e646c6572223b733a32333a2276696577735f68616e646c65725f6172675f6d6f6e7468223b733a343a2268656c70223b733a3134363a224d6f6e746873206172652073706563696669656420627920746865206e756d6265727320312d31322e2053696e6365207468697320617267756d656e7420646f6573206e6f742073706563696679206120796561722c206974206973207265636f6d6d656e646564207468617420697420757375616c6c7920666f6c6c6f7720612027596561722720617267756d656e742e223b7d733a393a226d6f6e746879656172223b613a333a7b733a343a226e616d65223b733a32353a224e6f64653a20506f73746564204d6f6e7468202b2059656172223b733a373a2268616e646c6572223b733a32373a2276696577735f68616e646c65725f6172675f6d6f6e746879656172223b733a343a2268656c70223b733a39313a225468697320617267756d656e7420636f6d62696e6573204d6f6e746820616e64205965617220696e746f20612073696e676c6520617267756d656e742c2073706563696669656420696e2074686520666f726d20434359594d4d2e223b7d733a343a227765656b223b613a333a7b733a343a226e616d65223b733a31373a224e6f64653a20506f73746564205765656b223b733a373a2268616e646c6572223b733a32323a2276696577735f68616e646c65725f6172675f7765656b223b733a343a2268656c70223b733a3132353a225468697320616c6c6f777320746865207573657220746f2066696c7465722061207669657720627920746865207765656b206e756d6265722066726f6d20312d35322e204974206973207265636f6d6d656e646564207468697320617267756d656e7420666f6c6c6f7720612027596561722720617267756d656e742e223b7d733a343a2279656172223b613a333a7b733a343a226e616d65223b733a31373a224e6f64653a20506f737465642059656172223b733a373a2268616e646c6572223b733a32323a2276696577735f68616e646c65725f6172675f79656172223b733a343a2268656c70223b733a39313a225468697320617267756d656e7420616c6c6f777320757365727320746f2066696c7465722062792077686174207965617220746865206e6f64652077617320706f737465642c20696e2074686520666f726d206f6620434359592e223b7d733a31303a226e6f64656c6574746572223b613a343a7b733a343a226e616d65223b733a31313a224e6f64653a205469746c65223b733a373a2268616e646c6572223b733a32383a2276696577735f68616e646c65725f6172675f6e6f64656c6574746572223b733a363a226f7074696f6e223b613a333a7b733a353a222374797065223b733a393a22746578746669656c64223b733a353a222373697a65223b693a31303b733a31303a22236d61786c656e677468223b693a3235353b7d733a343a2268656c70223b733a3136343a2254686520617267756d656e742077696c6c2066696c74657220627920746865206e6f6465207469746c652e20466f72207468697320617267756d656e742c2073657420746865206f7074696f6e20746f20746865206e756d626572206f6620636861726163746572732c207573696e67203020666f722066756c6c207465726d3b20757365203120666f7220616e20412f422f43207374796c6520676c6f73736172792e223b7d733a383a226e6f646574797065223b613a333a7b733a343a226e616d65223b733a31303a224e6f64653a2054797065223b733a373a2268616e646c6572223b733a32363a2276696577735f68616e646c65725f6172675f6e6f646574797065223b733a343a2268656c70223b733a38343a22546865206e6f6465207479706520617267756d656e7420616c6c6f777320757365727320746f2066696c746572206120766965772062792073706563696679696e67207468652074797065206f66206e6f64652e223b7d733a383a227273735f66656564223b613a343a7b733a343a226e616d65223b733a32323a225253533a2052535320466565642053656c6563746f72223b733a373a2268616e646c6572223b733a32363a2276696577735f68616e646c65725f6172675f7273735f66656564223b733a363a226f7074696f6e223b613a333a7b733a353a222374797065223b733a393a22746578746669656c64223b733a353a222373697a65223b693a31303b733a31303a22236d61786c656e677468223b693a3235353b7d733a343a2268656c70223b733a3237383a225468697320617267756d656e742073706563696669657320612073706563696669632052535320666565642073656c6563746f723b2069742077696c6c206f6e6c792073656c656374205253532066656564732c20756e6c696b6520746865206275696c742d696e2073656c6563746f722077686963682063616e2073656c65637420706c75676761626c652066656564732e20596f75206d617920656e74657220746865207469746c652074686520666565642077696c6c2061647665727469736520696e20746865207469746c65206669656c6420686572652c20616e6420746865206465736372697074696f6e206f6620746865206665656420696e20746865206f7074696f6e206669656c6420686572652e223b7d733a353a227461786964223b613a343a7b733a343a226e616d65223b733a31373a225461786f6e6f6d793a205465726d204944223b733a373a2268616e646c6572223b733a32333a2276696577735f68616e646c65725f6172675f7461786964223b733a363a226f7074696f6e223b613a333a7b733a353a222374797065223b733a393a22746578746669656c64223b733a353a222373697a65223b693a31303b733a31303a22236d61786c656e677468223b693a3235353b7d733a343a2268656c70223b733a3134303a2254686520617267756d656e742077696c6c2066696c7465722062792061207461786f6e6f6d79207465726d2049442e20466f72207468697320617267756d656e742c2073657420746865206f7074696f6e20746f2074686520646570746820746f207365617263682e20536565207461786f6e6f6d7920666f72206d6f726520696e666f726d6174696f6e2e223b7d733a393a227461786c6574746572223b613a343a7b733a343a226e616d65223b733a31393a225461786f6e6f6d793a205465726d204e616d65223b733a373a2268616e646c6572223b733a32373a2276696577735f68616e646c65725f6172675f7461786c6574746572223b733a363a226f7074696f6e223b613a333a7b733a353a222374797065223b733a393a22746578746669656c64223b733a353a222373697a65223b693a31303b733a31303a22236d61786c656e677468223b693a3235353b7d733a343a2268656c70223b733a3137303a2254686520617267756d656e742077696c6c2066696c7465722062792061207461786f6e6f6d79207465726d206e616d652e20466f72207468697320617267756d656e742c2073657420746865206f7074696f6e20746f20746865206e756d626572206f6620636861726163746572732c207573696e67203020666f722066756c6c207465726d3b20757365203120666f7220616e20412f422f43207374796c6520676c6f73736172792e223b7d733a353a22766f636964223b613a333a7b733a343a226e616d65223b733a32333a225461786f6e6f6d793a20566f636162756c617279204944223b733a373a2268616e646c6572223b733a32333a2276696577735f68616e646c65725f6172675f766f636964223b733a343a2268656c70223b733a36313a2254686520617267756d656e742077696c6c2066696c74657220746f206e6f6465732077697468207465726d7320696e206120766f636162756c6172792e223b7d733a33313a22636f6e74656e743a206669656c645f73686f72746465736372697074696f6e223b613a323a7b733a343a226e616d65223b733a34383a22546578743a2053686f7274204465736372697074696f6e20286669656c645f73686f72746465736372697074696f6e29223b733a373a2268616e646c6572223b733a33303a22636f6e74656e745f76696577735f617267756d656e745f68616e646c6572223b7d733a32323a22636f6e74656e743a206669656c645f73756d6d617279223b613a323a7b733a343a226e616d65223b733a32393a22546578743a2053756d6d61727920286669656c645f73756d6d61727929223b733a373a2268616e646c6572223b733a33303a22636f6e74656e745f76696577735f617267756d656e745f68616e646c6572223b7d733a383a22756964746f756368223b613a333a7b733a343a226e616d65223b733a33313a22557365723a2055494420417574686f726564206f7220436f6d6d656e746564223b733a373a2268616e646c6572223b733a32373a2276696577735f68616e646c65725f6172675f7569645f746f756368223b733a343a2268656c70223b733a3130323a22546865205573657220494420617267756d656e7420616c6c6f777320757365727320746f2066696c746572206120746f206e6f64657320617574686f726564206f7220636f6d6d656e746564206f6e207468652073706563696669656420757365722049442e223b7d733a333a22756964223b613a333a7b733a343a226e616d65223b733a31393a22557365723a2055494420697320417574686f72223b733a373a2268616e646c6572223b733a32313a2276696577735f68616e646c65725f6172675f756964223b733a343a2268656c70223b733a38373a22546865205573657220494420617267756d656e7420616c6c6f777320757365727320746f2066696c74657220746f206e6f64657320617574686f726564206279207468652073706563696669656420757365722049442e223b7d733a383a22757365726e616d65223b613a333a7b733a343a226e616d65223b733a32343a22557365723a20557365726e616d6520697320417574686f72223b733a373a2268616e646c6572223b733a32363a2276696577735f68616e646c65725f6172675f757365726e616d65223b733a343a2268656c70223b733a38393a2254686520557365726e616d6520617267756d656e7420616c6c6f777320757365727320746f2066696c6520746f2061206e6f64657320617574686f726564206279207468652073706563696669656420757365726e616d652e223b7d7d7d, 0, 1193045594, ''),
('views_urls', 0x613a353a7b733a343a224e657773223b733a343a226e657773223b733a383a22506172746e657273223b733a383a22706172746e657273223b733a383a22486f6d6570616765223b733a343a22686f6d65223b733a393a2266726f6e7470616765223b733a393a2266726f6e7470616765223b733a373a22747261636b6572223b733a373a22747261636b6572223b7d, 0, 1193045594, '');

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
  PRIMARY KEY  (`vid`)
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
  PRIMARY KEY  (`vid`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_content_type_news`
-- 

INSERT INTO `satellite2_content_type_news` (`vid`, `nid`, `field_summary_value`, `field_image_fid`, `field_image_title`, `field_image_alt`) VALUES 
(20, 20, 'Try Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite 2.0, thereby joining the fast growing ESN Galaxy!', 24, 'ESN Satellite 2.0', 'ESN Satellite 2.0'),
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
  PRIMARY KEY  (`vid`)
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
  PRIMARY KEY  (`vid`)
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
  PRIMARY KEY  (`vid`)
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
) TYPE=MyISAM  AUTO_INCREMENT=4 ;

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
) TYPE=MyISAM;

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

INSERT INTO `satellite2_history` (`uid`, `nid`, `timestamp`) VALUES 
(1, 1, 1190814729),
(1, 2, 1190814719),
(1, 7, 1190991003),
(1, 3, 1190990983),
(1, 5, 1190814709),
(1, 6, 1190814763),
(2, 8, 1190811053),
(1, 8, 1190814786),
(1, 9, 1190814745),
(1, 10, 1190463645),
(1, 11, 1190463378),
(1, 12, 1191060575),
(2, 13, 1190810977),
(2, 14, 1190812211),
(2, 15, 1190811098),
(2, 16, 1190812200),
(2, 17, 1190812288),
(2, 18, 1190813340),
(2, 19, 1190813529),
(1, 19, 1190813574),
(1, 18, 1190814754),
(1, 14, 1190814776),
(1, 20, 1193045594),
(1, 21, 1191052083),
(1, 22, 1191052452),
(1, 23, 1191052869);

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
) TYPE=MyISAM;

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
(101, 2, 'node/12', 'ESN Galaxy', 'ESN Galaxy', 5, 118, '');

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

INSERT INTO `satellite2_node` (`nid`, `vid`, `type`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`) VALUES 
(20, 20, 'news', 'Welcome to ESN Satellite 2.0 and ESN Galaxy', 1, 1, 1190992527, 1191082431, 0, 1, 0, 0),
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
) TYPE=MyISAM;

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
) TYPE=MyISAM  AUTO_INCREMENT=24 ;

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
) TYPE=MyISAM;

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

INSERT INTO `satellite2_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES 
(20, 20, 1, 'Welcome to ESN Satellite 2.0 and ESN Galaxy', '<div class="content"><p>ESN Satellite is the free website template for ESN sections, developed and maintained by the ESN International Webteam.  </p><h2>Be a ESN Astronaut: Install ESN Satellite for your section!</h2><p>Try Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite. Documentation will also be available.</p><p>ESN Satellite is easy to install, but it is still a Web application and its setup is thus different from a normal program installation onyour PC. So a basic knowledge of how to install Web applications is required if you want to try it out.</p><p>Join the project, get ESN Satellite and start experimenting!</p><h2>ESN Satellite Resources</h2><p>If you just wish to know more about the ESN Satellite but don''t want to try it right now, we have some documentation available. We expect it to be extended and improved during the beta testing phase, so please check back often. </p><ul>	<li><a href="http://www.esn.org/satellite">Satellite Documentation wiki</a></li>			<li><a href="http://groups.google.com/group/esn-satellite">ESN Satellite Google Group</a></li></ul><h2>New in ESN Satellite 2.0</h2><p>ESN Satellite 2.0 comes with several new features:</p><ul>	<li>Multilingual interface: it supports localizing your website pages in as many languages as you wish... and, anyway, every student will be able to see the web site interface in her own language!</li>	<li>A new &quot;control panel&quot; for faster access to the most common administration tasks.</li>	<li>Newsletter support.</li>	<li>Direct access to the ESN Galaxy.</li>	<li>An improved installation process, with broader compatibility.</li></ul><p> </p></div><div class="content"><h2>Join the ESN Galaxy</h2><p>Curious to see what the ESN Galaxy is? Then check it out <a href="?q=esn-galaxy">on your own Satellite website!</a> And if you are not yet of this fast growing network of Satellites, then be quick and <a href="/?q=esn-galaxy">activate your Satellite now!</a></p><br /></div>', '<div class="content"><p>ESN Satellite is the free website template for ESN sections, developed and maintained by the ESN International Webteam.  </p><h2>Be a ESN Astronaut: Install ESN Satellite for your section!</h2><p>Try Satellite for your section! The ESN International Webteam is supporting interested sections willing to install the ESN Satellite. Documentation will also be available.</p>', '', 1191082431, 3),
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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_sequences`
-- 

INSERT INTO `satellite2_sequences` (`name`, `id`) VALUES 
('satellite2_users_uid', 3),
('satellite2_menu_mid', 102),
('satellite2_view_view_vid', 3),
('satellite2_node_nid', 23),
('satellite2_node_revisions_vid', 23),
('satellite2_files_fid', 32),
('satellite2_imagecache_preset_presetid', 3),
('satellite2_imagecache_action_actionid', 3),
('satellite2_aggregator_feed_fid', 1),
('satellite2_aggregator_item_iid', 867),
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
) TYPE=MyISAM;

-- 
-- Dumping data for table `satellite2_sessions`
-- 

INSERT INTO `satellite2_sessions` (`uid`, `sid`, `hostname`, `timestamp`, `cache`, `session`) VALUES 
(1, 'd085b58618ec4020fb6edcaa21739b06', '62.218.228.5', 1193026730, 0, ''),
(1, '73ee66e3e3f635434fe6f1d7fe2cf465', '134.184.84.139', 1193045608, 0, 'form|a:4:{s:32:"5f36e78a5d56c012dd83d8f7b98edd52";a:2:{s:9:"timestamp";i:1193043799;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"356cf94e19defbe850ed7d2a3f7bbf87";a:2:{s:9:"timestamp";i:1193043831;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"fa3285f4e70ed76a9f7c281d83c5e18a";a:2:{s:9:"timestamp";i:1193043839;s:4:"args";a:1:{i:0;s:14:"system_modules";}}s:32:"067bdf3c80aa94f910bcb047c60ca4ad";a:2:{s:9:"timestamp";i:1193043852;s:4:"args";a:1:{i:0;s:14:"system_modules";}}}');

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
  PRIMARY KEY  (`snid`)
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
('sites/all/modules/simplenews/simplenews.module', 'simplenews', 'module', 'Send newsletters to subscribed e-mail addresses.', 1, 0, 0, 2, 0),
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
) TYPE=MyISAM  AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `satellite2_term_data`
-- 

INSERT INTO `satellite2_term_data` (`tid`, `vid`, `name`, `description`, `weight`, `language`, `trid`) VALUES 
(1, 1, 'ESN Satellite 2.0 newsletter', '', 0, '', 0);

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
) TYPE=MyISAM;

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
) TYPE=MyISAM  AUTO_INCREMENT=102 ;

-- 
-- Dumping data for table `satellite2_url_alias`
-- 

INSERT INTO `satellite2_url_alias` (`pid`, `src`, `dst`) VALUES 
(101, 'node/20', 'welcome-esn-satellite-2-0-and-esn-galaxy'),
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
(53, 'node/19/feed', 'example-poll/feed');

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

INSERT INTO `satellite2_users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES 
(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, NULL, '', '', '', NULL),
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', 0, 0, 0, '', '', 1187592689, 1193045608, 1193043785, 1, NULL, 'en', '', '', 'a:3:{s:7:"contact";i:0;s:14:"picture_delete";s:0:"";s:14:"picture_upload";s:0:"";}');

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
) TYPE=MyISAM;

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
('statistics_day_timestamp', 'i:1193026705;'),
('file_directory_temp', 's:4:"/tmp";'),
('cron_last', 'i:1193045594;'),
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
('site_footer', 's:362:"Powered by <b>ESN Satellite 2.0</b> - 2005-2007 \r\n<a href="http://satellite.esn.org" target="_blank">\r\n<img src="sites/all/themes/custom/esntheme/img/ESN.satellite.power.png" style="display: inline;"/></a>&nbsp;\r\n<a href="http://galaxy.esn.org" target="_blank">\r\n<img src="sites/all/themes/custom/esntheme/img/ESN.galaxy.power.png" style="display: inline;"/></a>";'),
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
('site_name', 's:17:"ESN Satellite 2.0";'),
('poormanscron_lastrun', 'i:1193045594;'),
('update_status_last', 'i:1193043852;'),
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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM  AUTO_INCREMENT=2 ;

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
) TYPE=MyISAM;

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
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `satellite2_watchdog`
-- 

