<div id="block-<?php print $block->module .'-'. $block->delta; ?>" class="clear-block block block-<?php print $block->module ?> pink-fill">
	<div class="inner">
		<?php print satellite_block_edit_link($block); ?>
		
	<?php if (!empty($block->subject)): ?>
	  <h2><span class="title-outer"><span class="title-inner"><?php print $block->subject ?></span></span></h2>
	<?php endif;?>

	  <div class="content"><?php print $block->content ?></div>
	</div>
	</div>
