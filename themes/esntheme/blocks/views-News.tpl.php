<?php $style = 'orange'; ?>
<div id="left_box">
	<div class="box <?php print $style; ?>">
		<div class="w1">
			<div class="w2">
				<div class="w3" style="<?php if($block->shape) print "background-image: url(themes/esntheme/css/images/corners/br_$style.gif"; ?>);">
					<div class="w4 ">
					  <div class="block block-<?php print $block->module; ?>" id="block-<?php print $block->module; ?>-<?php print $block->delta; ?>">
					    <div class="block_title"><?php print $block->subject; ?></div>
					    <div class="content"><?php print $block->content; ?></div>
					 </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>