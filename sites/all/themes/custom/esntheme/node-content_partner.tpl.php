<?php
/*****************************************
 * MULTI NODE VIEW (USED IN /partners)
 *****************************************/
if ($page == 0) {
?>
	<div style="padding-top: 25px; clear: both;">
		<?php 
			print "<h3>$node->title</h3>";
		 	if ($node->field_logo[0]['filepath']) {
		 		list($width, $height, $type, $attr) = getimagesize(extract_src(base_path().$node->field_logo[0]['filepath']));
				$style = ($height > 145) ? 'height="150px;"' : '';
		 		print '<img src="'.base_path().$node->field_logo[0]['filepath'].'" class="image" '.$style.'/>'; 
		 	}
			print $node->field_short_description[0]['value']; 
			print '<br>'.l('<b>Read more &raquo;</b>', "node/$node->nid", null, null, null, false, true);  ?>
	</div>
<?php	
} 
/*****************************************
 * SINGLE NODE VIEW 
 *****************************************/
else {
	
	if (count($node->field_logo))
	foreach ($node->field_logo as $image) {
		if ($image['filepath']) {
			$img = '<img src="'.base_path().$image['filepath'].'" class="image" style="margin: 0 25px 25px 0;"/>';
			
			if ($node->field_logo_link[0]['url']) {
				print l($img, $node->field_logo_link[0]['url'], unserialize($node->field_logo_link[0]['attributes']), null, null, true, true);
			} else {
				print $img;
			}
			
		}
	}
	
	print $node->field_description[0]['view'];
	
	if ($node->field_logo_link) {
		foreach ($node->field_logo_link as $link) {
			print '<div>'.$link['view'].'</div>';
		}
	}
	
	print theme_upload_attachments($node->files);
}
?>