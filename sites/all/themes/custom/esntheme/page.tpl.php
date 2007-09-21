<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><?php print $head_title ?></title>

		<link rel="shortcut icon" href="misc/favicon.ico" type="image/x-icon" />

		<script type="text/javascript"><?php /* Needed to avoid Flash of Unstyle Content in IE */ ?> </script>
		
		
		
		
		<style type="text/css">
			#wrap {padding-bottom: 0px;}
		</style>
		 
		
		<?php print $styles;?>
		<?php print $head; ?>
    	<?php print $scripts; ?>
		<script type="text/javascript" src="<?php print $base_path . path_to_theme() ?>/js/jdMenu/jquery.dimensions.js"></script>
		<script type="text/javascript" src="<?php print $base_path . path_to_theme() ?>/js/jdMenu/jquery.jdMenu.js"></script>	

		<style type="text/css" media="all">@import "<?php print $base_path . path_to_theme() ?>/main.css";</style>
		<style type="text/css" media="all">@import "<?php print $base_path . path_to_theme() ?>/jdMenu.css";</style>
		<style type="text/css" media="all">@import "<?php print $base_path . path_to_theme() ?>/event.css";</style>
		<style type="text/css" media="all">@import "<?php print $base_path . path_to_theme() ?>/satellite.css";</style>


	</head>
	
	<body id="type-b">
	
		<div id="wrap" style="background: #fff url(<?php print $base_path . path_to_theme() ?>/img/stripes_bg.gif) repeat-y top; padding-top: 0px;">
		
			<div style="background: url(<?php print $base_path . path_to_theme() ?>/img/header.jpg) no-repeat top; padding-top: 10px;">
			
				<div id="content-wrap" style="padding-top: 0px;">
					
					<!-- Header table -->
					<table border="0" width="100%" cellpadding="0" cellspacing="0" height="170px" iid="header">
						<tr>
							<td id="logo">
								<?php if ($logo) { ?><a href="<?php print $base_path ?>" title="<?php print t('Home') ?>"><img style="float: left;" src="<?php print $logo ?>" alt="<?php print t('Home') ?>" /></a><?php } ?>
								<?php if ($site_name) { ?><div id='site-name'><?php print $site_name ?></div><?php } ?>
								<?php if ($site_slogan) { ?><div class='site-slogan'><?php print $site_slogan ?></div><?php } ?>
							</td>
							<td id="menu">
								<?php print $search_box ?>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div>
								<?php print theme('primarylink_menu'); ?>
								<?php print $header ?>
								</div>
							</td>
						</tr>
					</table>
					
					<!-- Header table closure -->
					
					<!-- Body table-->	
					<table width="100%" cellpadding="5" style="margin-top: 20px;">
						<tr>
							<!-- Left Sidebar -->
							
							<td  valign="top" id="utility" width="180px">
								<?php 
									print theme('side_navigation');
									if ($sidebar_left) print $sidebar_left;
								?>
							</td>	
							
							
							<!-- Content Area-->
							<td  valign="top" id="content" style="<?php if (!$sidebar_right) print 'padding-right: 5px;'?>">
								<?php 
									print $messages;
									print $breadcrumb;
									print $content_top;									
									if($title) print '<h1 class="title">'.$title.'</h1>';
									if($tabs) print '<div id="local-tasks">'.$tabs.'</div>';
									print $help;
									print $content;
									print $content_bottom;
								?>
							</td>
							
							<!-- right sidebar -->
							<td valign="top" style="width: <?php print ($sidebar_right) ? '180px' : '130px';?>;">
								<?php
								if ($sidebar_right)	print $sidebar_right;
								else print '&nbsp;';
								?>
							</td>
						</tr>
						<tr>
							<td colspan="3" valign="top" height="340px" style="padding: 30px 170px 0 0;background: #fff url(<?php print $base_path . path_to_theme() ?>/img/footer.jpg) no-repeat;">
								<div id="footer" style="color: #999; text-align: right;"><?php print $footer_message;?></div> 
							</td>
						</tr>
						
					</table> <!-- Body table closure -->	
					
				</div> <!-- content-wrap closure -->
			
			</div>
			
		</div> <!-- wrap closure -->
		<?php print $closure ?>
	</body>
</html>
