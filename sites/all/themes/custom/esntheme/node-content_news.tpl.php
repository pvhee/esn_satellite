<div>
<?php
if (count($node->field_image)) {
	foreach ($node->field_image as $image) {
		if ($image['filepath']) print '<img src="'.base_path().$image['filepath'].'" class="image" width="200px;"/>';
	}
}
print $node->field_body[0]['view'];

?>
</div>
<?php
	if ($node->field_links) {
		foreach ($node->field_links as $link) {
			print '<div>'.$link['view'].'</div>';
		}
	}

	print theme_upload_attachments($node->files);

?>