<?php
// $Id: page.tpl.php,v 1.18 2008/01/24 09:42:53 goba Exp $
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
	<head>
		<title><?php print $head_title ?></title>
		<?php print $head ?>
		<?php print $styles ?>
		<?php print satellite_get_ie_styles(); ?>
		<?php print $scripts ?>
		<!--[if lt IE 7]>
			<?php print phptemplate_get_ie_styles(); ?>
		<![endif]-->
    <?php print satellite_footer_change(); ?>
    <?php print satellite_header_background(); ?>
	</head>
<body<?php print base_body_class($left_top, $left, $left_bottom, $right_top, $right, $right_top); ?>>
	
	<!-- Layout -->
	<div class="clear-block"></div>

	<div id="wrapper">
			<div id="container" class="clear-block">
				<div id="shadow">
					<div id="shadow-top">
						<div id="shadow-footer">
							<div id="footer-fade">

								<div id="header">
									<div id="header-top">
										<div class="inner">
											<?php print $header_top; ?>
										</div>
									</div>
									<!-- <div class="clear-block"></div> -->
									<div id="header-title">
										<?php
											if ($logo || $site_title) {
												print '<a href="'. check_url($front_page) .'" title="'. $site_title .'">';
												if ($logo) {
													print '<img src="'. check_url($logo) .'" alt="'. $site_title .'" id="logo" />';
												}
												print '<span class="site_title">'.check_plain($site_name).'</span>'.'</a>';
											}
										?>
									</div>
									<!-- <div class="clear-block"></div> -->
									<?php print $header; ?>
								</div> <!-- /header -->

								<?php if ($left_top || $left || $left_bottom): ?>
									<div id="sidebar-left" class="sidebar">
										<?php print $left_top; ?>
										<?php print $left; ?>
										<?php print $left_bottom; ?>
									</div>
								<?php endif; ?>

								<div id="center"><div id="squeeze">
									<div class="<?php if ($title): print 'content-inner'; endif; ?>">

										<?php if ($breadcrumb): print $breadcrumb.''; endif; ?>
										<?php if ($mission): print '<div id="mission">'. $mission .'</div>'; endif; ?>

										<?php if ($tabs): print '<div id="tabs-wrapper" class="clear-block">'; endif; ?>
										<?php if ($title): print '<h1'. ($tabs ? ' class="with-tabs"' : '') .'>'. $title .'</h1>'; endif; ?>
										<?php if ($tabs): print '<ul class="tabs primary">'. $tabs .'</ul></div>'; endif; ?>
										<?php if ($tabs2): print '<ul class="tabs secondary">'. $tabs2 .'</ul>'; endif; ?>
										<?php if ($show_messages && $messages): print $messages; endif; ?>
										<?php if ($content_top): print $content_top; endif; ?>
										<?php print $help; ?>
										<div class="clear-block">											
											<?php print $content ?>
										</div>
										<div class="container">  
											<div class="span-8 colborder">
												<div class="span-inner">
													<?php print $content_left ?>
												</div>
											</div>
											<div class="span-8 last">
												<div class="span-inner">
													<?php print $content_right ?>
												</div>
											</div>
										</div>
										<div class="clear-block">
											<?php print $content_bottom ?>											
										</div>
									</div>
								</div></div> <!-- /.left-corner, /.right-corner, /#squeeze, /#center -->

								<?php if ($right_top || $right || $right_bottom): ?>
									<div id="sidebar-right" class="sidebar">
										<?php print $right_top; ?>
										<?php print $right; ?>
										<?php print $right_bottom; ?>
									</div>
								<?php endif; ?>

								<!-- <div class="clear-block"></div> -->
								<div id="footer">
									<div id="inner-footer">
										<div class="container">  
											<div class="span-23 last">
												<div class="span-inner">
													<?php print $footer_top ?>
												</div>
											</div>
											<div class="span-7 colborder">
												<div class="span-inner">
													<?php print $footer_left ?>
												</div>
											</div>
											<div class="span-8 colborder">
												<div class="span-inner">
													<?php print $footer_center ?>
												</div>
											</div>
											<div class="span-7 last">
												<div class="span-inner">
													<?php print $footer_right ?>
												</div>
											</div>
											<div class="span-23 last">
												<div class="span-inner">
													<?php print $footer_bottom . $footer_message ?>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div> 
						</div> 
					</div> 
				</div> 
			</div> 
	</div>

	<?php print $closure ?>
</body>
</html>
