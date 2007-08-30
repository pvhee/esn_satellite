<?php 
/**
 * views template to output one 'row' of a view.
 * This code was generated by the views theming wizard
 * Date: Sun, 2007-03-04 09:52
 * View: Partners
 *
 * Variables available:
 * $view -- the entire view object. Important parts of this object are
 *   Partners, .
 * $view_type -- The type of the view. Probably 'page' or 'block' but could
 *   also be 'embed' or other string passed in from a custom view creator.
 * $node -- the raw data. This is not a real node object, but will contain
 *   the nid as well as other support fields that might be necessary.
 * $count -- the current row in the view (not TOTAL but for this page) starting
 *   from 0.
 * $stripe -- 'odd' or 'even', alternating.
 * $field_logo_fid -- 
 * $field_logo_fid_label -- The assigned label for $field_logo_fid
 * $field_short_description_value -- 
 * $field_short_description_value_label -- The assigned label for $field_short_description_value
 * $field_logo_link_url -- 
 * $field_logo_link_url_label -- The assigned label for $field_logo_link_url
 * $field_description_value -- 
 * $field_description_value_label -- The assigned label for $field_description_value
 *
 * This function goes in your views-list-Partners.tpl.php file
 */
  ?>

 <?php 
 switch ($view_type) {
	/*****************************************
	 * PAGE VIEW 
	 *****************************************/
 	case 'page':
	?> 	
		<div style="border: 1px solid rgb(208, 239, 251); padding: 15px; margin-top: 25px;clear: both;">
				<div class="view-field view-data-created">
				  <?php print $created?>
				</div>
				<h3><?php print $title?></h3>
				
				<?php //print pr($node) ?>
				
				<table>
					<tr valign="top">
						<td>
							<div class="thumbnail">
								<?php
									$file = _imagefield_file_load($node->node_data_field_logo_field_logo_fid); 
									if(!empty($file)) {
										$img_alt = $node->node_data_field_logo_field_logo_alt;
										$img_title = $node->node_data_field_logo_field_logo_title;
										$img_attributes = array();
										$img = theme('imagecache', 'logo', $file['filepath'], $img_alt, $img_title, $img_attributes);
										print l($img, "node/$node->nid", null, null, null, false, true);
									}
								?>
							</div>
						</td>
						<td>
							<div style="font-size: 12px;">
							  <?php print html_entity_decode($node->node_data_field_shortdescription_field_shortdescription_value); ?> 
							   <b> <?php print l('Read more &raquo;', "node/$node->nid", array(), null, null, false, true); ?></b>
							</div>				
						</td>
					</tr>
				</table>
				<b>Partner website</b>: <?php print l($node->node_data_field_logolink_field_logolink_title, $node->node_data_field_logolink_field_logolink_url, null, null, null, false, true)?>
		</div>
	<?php 		
 	break;
	
 	/*****************************************
 	 * BLOCK VIEW
 	 *****************************************/
 	case 'block':
	?> 	
		<div style="margin-top: 15px; line-height: 21px; text-align: center;">	
			<?php 
				//list($width, $height, $type, $attr) = getimagesize(extract_src($field_logo_fid));
				//$style = ($width > 145) ? 'width="145px;"' : '';
				//if ($field_logo_fid) {
				//	$img = '<img src="'.extract_src($field_logo_fid).'" style="margin-top: 7px; margin-left: -10px;" '.$style.'/><br>';
				//	print l($img, "node/$node->nid", null, null, null, false, true);
				//}
				
				// pr($node);
				// print $title;
				
				$file = _imagefield_file_load($node->node_data_field_logo_field_logo_fid); 
				if(!empty($file)) {				
					$img_alt = $node->node_data_field_logo_field_logo_alt;
					$img_title = $node->node_data_field_logo_field_logo_title;
					$img_attributes = array('style' => 'margin-top: 7px; margin-left: -10px;');
					$img = theme('imagecache', 'logo', $file['filepath'], $img_alt, $img_title, $img_attributes);
					print l($img, "node/$node->nid", null, null, null, false, true);
				}
				print l($node->node_data_field_logolink_field_logolink_title, $node->node_data_field_logolink_field_logolink_url, array('style' => 'font-family: arial; text-decoration: none; font-size: 12px;font-weight: bold;'));
			?>
		</div>
	<?php 	 		
 	break;
 	
 	default:
 	break;
 }
  
 ?>

