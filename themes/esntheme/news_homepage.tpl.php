<div style=" padding: 5px;">
		<div class="block_title" style="font-size: 14px;"><?php print $title?></div>
		<table>		
			<tr valign="top">
				<td>
					<?php if ($field_image_fid): ?>
						<img src="<?php print extract_src($field_image_fid)?>" style="border: 3px solid #F2C89C; height: 81px; float: left; margin: 0 7px 7px 0;"/>
					
					<?php endif; ?>				
				</td>
				<td>
					<div style="font-size: 11px;">
					  <?php print html_entity_decode($field_summary_value);?> 
					   <b> <?php print l('Read more &raquo;', "node/$node->nid", array('style' => 'color: #C5631A;'), null, null, false, true); ?></b>
					</div>					
				</td>
			</tr>
		</table>
</div>