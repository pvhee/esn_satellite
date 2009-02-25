<?php

$header = array(t('Attachments'));
$rows = array();
foreach ($files as $file) {
	$file = (object)$file;
	// dprint_r($file);
	$filesize = format_size($file->filesize);
	if ($file->list && !$file->remove) {
		// Generate valid URL for both existing attachments and preview of new attachments (these have 'upload' in fid)
		$href = file_create_url((strpos($file->fid, 'upload') === FALSE ? $file->filepath : file_create_filename($file->filename, file_create_path())));
		$text = $file->description ? $file->description : $file->filename;
		$description = $file->filename." ($filesize)";
		$out = theme('file_icon', $file).'<div><div class="file_name">'.l($text, $href).'</div><div class="file_description">'.$description.'</div></div>';
		$rows[] = array($out);
	}
}
if (count($rows)) {
	print theme('table', $header, $rows, array('id' => 'attachments'));
}

?>