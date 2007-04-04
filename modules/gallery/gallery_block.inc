<?php
// $Id: gallery_block.inc,v 1.1.2.2 2006/09/14 10:31:24 kiz0987 Exp $

/**
 * gallery.module : gallery_block.inc
 * Block functions
 */
 
 /**
 * Implementation of hook_block
 *
 * 0 - gallery imageblock (random, most viewed, etc)
 * 1 - gallery navigation block (recommended)
 * 2 - gallery grid block
 */
function _gallery_block($op = 'list', $delta = 0, $edit = array()) {
  $typeMap = array('none' => t('None'),
                    'randomImage' => t('Random Image'),
                    'recentImage' => t('Newest Image'),
                    'viewedImage' => t('Most Viewed Image'),
                    'randomAlbum' => t('Random Album'),
                    'recentAlbum' => t('Newest Album'),
                    'viewedAlbum' => t('Most Viewed Album'),
                    'dailyImage' => t('Picture of the Day'),
                    'weeklyImage' => t('Picture of the Week'),
                    'monthlyImage' => t('Picture of the Month'),
                    'dailyAlbum' => t('Album of the Day'),
                    'weeklyAlbum' => t('Album of the Week'),
                    'monthlyAlbum' => t('Album of the Month'));

  switch ($op) {
  case 'list':
    $blocks[0]['info'] = t('Gallery Block');
    $blocks[1]['info'] = t('Gallery Navigation'); 
    $blocks[2]['info'] = t('Gallery Grid Block'); 
   return $blocks;

  case 'view':
    list ($success, $ret) = _gallery_init(true);
    if (!$success) {
      $err_msg = t('Unable to initialize embedded Gallery. You need to <a href="%link">
                    configure your embedded Gallery</a>.', 
                   array('%link' => url('admin/settings/gallery')));
      gallery_error($err_msg, $ret);
      return;
    }
    switch ($delta) {
    // 0 = Image Block
      case 0: 
        // Allow for multiple image types
        $param_blocks_array = variable_get('gallery_block_block', array('randomImage'));        
        $params['blocks'] = is_array($param_blocks_array) ? implode('|', $param_blocks_array) : ""; 
        $param_show_array = variable_get('gallery_block_show', array());
        $params['show'] = is_array($param_show_array) ? implode('|', $param_show_array) : ""; 
        $params['maxSize'] = variable_get('gallery_maxsize', 160);
        // Add frames and link target using g2_filter code from MichelleC
        $params['albumFrame'] =  variable_get('gallery_album_frame', 'none');
        $params['itemFrame'] =  variable_get('gallery_item_frame', 'none');
        $params['linkTarget'] =  variable_get('gallery_link_target', '');
        if (variable_get('gallery_item_id', '') != '') {
            $params['itemId'] =  variable_get('gallery_item_id', '');
        }
        $block = array();
        list($ret, $content, $head) = GalleryEmbed::getImageBlock($params);
        if ($ret) {
          gallery_error(t('Unable to get Gallery image block'), $ret);
          return;
        } else {
          if ($content) {
            // If more than one image type selected then default the subject to 'Gallery' 
            if (count(variable_get('gallery_block_block', 'randomImage')) > 1) {
              $block['subject'] = t('Gallery');
            } else {
              $block['subject'] = $typeMap[$params['blocks']]; 
            }
            // TODO: This should not be hardcoded, but included in the CSS.
            $block['content'] = '<center>' . $content . '</center>';
          }
        }
        if ($head) {
          gallery_set_html_head($head);
        }
        break;
    // 1 = Navigation Block
      case 1:
        global $gallery_sidebar;
        if ((arg(0) == 'gallery') && (isset($gallery_sidebar) && !empty($gallery_sidebar))) {
          $block['subject'] = t('Gallery Navigation');
          $block['content'] = '<div id="gsSidebar" class="gcBorder1">' . join('', $gallery_sidebar) . '</div>';    
        }
        break;
      // 2 = Image Grid Block
      case 2:     
        $num_cols = variable_get('gallery_grid_num_cols', 2);
        $num_rows = variable_get('gallery_grid_num_rows', 2);
        $num_images = $num_cols * $num_rows; 
        // Allow for multiple image types
        $param_blocks_array = array_fill(0, $num_images, variable_get('gallery_grid_block_block', 
          'randomImage'));        
        $params['blocks'] = is_array($param_blocks_array) ? implode('|', $param_blocks_array) : ""; 
        $param_show_array = variable_get('gallery_grid_block_show', array());
        $params['show'] = is_array($param_show_array) ? implode('|', $param_show_array) : ""; 
        $params['maxSize'] = variable_get('gallery_grid_maxsize', 90);
        $params['albumFrame'] =  variable_get('gallery_grid_album_frame', 'none');
        $params['itemFrame'] =  variable_get('gallery_grid_item_frame', 'none');
        $params['linkTarget'] =  variable_get('gallery_grid_link_target', '');
        if (variable_get('gallery_grid_item_id', '') != '') {
            $params['itemId'] =  variable_get('gallery_grid_item_id', '');
        }
        $block = array();
        list($ret, $content, $head) = GalleryEmbed::getImageBlock($params);
        if ($ret) {
          gallery_error(t('Unable to get Gallery image block'), $ret);
          return;
        } else {
          if ($content) {
            $block['subject'] = t('Gallery');       
            // Split the images from the html so that can put each only in a <td>            
            $images = _gallery_split_imageblock($content);
            $new_html =  '<div class="gallery-grid-block"><div class="image-grid">';
            $new_html .= '<table>';
            $col = 0;
            foreach ($images as $current_image) {
              if ($col == 0) {
                $new_html .= '<tr>';
              }
              $new_html .= '<td style="text-align:center;">' . $current_image . '</td>';
              $col++;
              if ($col >= $num_cols) {
                $col = 0;
                $new_html .= '</tr>';
              }
            }
            $new_html .= '</table>'; 
            $new_html .= '</div></div>';
            $block['content'] .= $new_html;                 
          }
        }
        if ($head) {
          gallery_set_html_head($head);
        }
        break;
      }
    $ret = GalleryEmbed::done();
    if ($ret) {
      gallery_error(t('Unable to complete Gallery request'), $ret);
      return;
    }
    return $block;
  }
}

?>