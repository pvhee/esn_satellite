<div style=" padding: 5px;">
		<div class="block_title" style="font-size: 14px;"><?php print $title?></div>
		<table>
			<tr valign="top">
				<td>
					<?php
					$file = _imagefield_file_load($node->node_data_field_image_field_image_fid); 
					$img_alt = $node->node_data_field_image_field_image_alt;
					$img_title = $node->node_data_field_image_field_image_title;
					$img_attributes = array('style' => 'border: 3px solid #F2C89C; float: left; margin: 0 7px 7px 0;');
					$img = theme('imagecache', 'thumbnail', $file['filepath'], $img_alt, $img_title, $img_attributes);
					print l($img, "node/$node->nid", null, null, null, false, true);
					?>
				</td>
				<td>
					<div id="news">						
					  <?php print html_entity_decode($field_summary_value);?> 
					   <b> <?php print l('Read more &raquo;', "node/$node->nid", array('style' => 'color: #C5631A;'), null, null, false, true); ?></b>
					</div>					
				</td>
			</tr>
		</table>
</div>
