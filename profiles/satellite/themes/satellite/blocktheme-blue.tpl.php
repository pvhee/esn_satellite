<div id="block-<?php print $block->module .'-'. $block->delta; ?>" class="clear-block block block-<?php print $block->module ?> blue">
	<div class="inner">
	<?php
	  // print out an 'Edit Block' link for users with administer blocks privilege
	  if ($block->module == 'block'):
	    if (user_access('administer blocks')) :?>
	    <div class="block-tabs-wrapper">
	      <ul class="tabs">
	        <li>
	          <?php print l('Edit Block','admin/build/block/configure/' . $block->module . '/' . $block->delta.'?'.drupal_get_destination()); ?>
	        </li>
	      </ul>
	    </div>
	    <?php
	    endif;
	  endif;
	?>		
		
	<?php if (!empty($block->subject)): ?>
	  <h2><?php print $block->subject ?></h2>
	<?php endif;?>

	  <div class="content"><?php print $block->content ?></div>
	</div>
	</div>
