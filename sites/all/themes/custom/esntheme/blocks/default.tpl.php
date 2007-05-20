<?php
	switch ($block->region) {
		
		case 'content_bottom':			
			?>
			<?php if ($block->subject) 	print '<h1>'.$block->subject.'</h1>'; ?>
			<div class="block block-<?php print $block->module; ?>" id="block-<?php print $block->module; ?>-<?php print $block->delta; ?>">
				<div class="content"><?php print $block->content; ?></div>
			</div>
			<?php
			break;
		case 'content':
		case 'content_top':
			?>
			<div id="left_box">
				<div class="box content_blu">
					<div class="w1">
						<div class="w2">
							<div class="w3">
								<div class="w4 ">			
									<div class="block_title" sstyle="font-size: 21px;"><?php print $block->subject; ?></div>
									<div class="block block-<?php print $block->module; ?>" id="block-<?php print $block->module; ?>-<?php print $block->delta; ?>">
										<div class="content"><?php print $block->content; ?></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>					
			<?php
		break;	
		
		case 'header':
		case 'footer_message':
			?>
			<div class="content"><?php print $block->content; ?></div>
			<?php			
		break;
		
		default:
			?>
			<div id="left_box">
				<div class="box blu">
					<div class="w1">
						<div class="w2">
							<div class="w3">
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
			<?php
		break;
	}
?>

