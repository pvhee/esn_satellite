<?php
// $Id: gallery_search.inc,v 1.1 2006/03/24 14:04:52 kiz0987 Exp $
/**
 * gallery.module search functions
 */
 
/**
 * implementation of hook_search
 */
function _gallery_search($op = 'search', $keys = null) {
  switch ($op) {
  case 'name':
    return t('gallery');
  case 'search':
    $find = array();
    $g2_head = array();
    
    list ($success, $ret) = _gallery_init(true);
    if (!$success) {
      $err_msg = t('Unable to initialize embedded Gallery. You need to <a href="%link">
                    configure your embedded Gallery</a>.', 
                    array('%link' => url('admin/settings/gallery')));
      gallery_error($err_msg, $ret);
      return;
    }

    // Image block options for search
    $params['blocks'] = "specificItem"; 
    $param_show_array = variable_get('gallery_search_block_show', array());
    $params['show'] = is_array($param_show_array) ? implode('|', $param_show_array) : ""; 
    $params['maxSize'] = variable_get('gallery_search_maxsize', 160);
    $params['albumFrame'] =  variable_get('gallery_search_album_frame', 'none');
    $params['itemFrame'] =  variable_get('gallery_search_item_frame', 'none');
    $params['linkTarget'] =  variable_get('gallery_search_link_target', '');
    $show_g2_thumbs = variable_get('gallery_search_show_thumbs', 1);
    $max_items = variable_get('gallery_search_max_items', 50);

    list ($ret, $results) = GalleryEmbed::searchScan($keys, $max_items);
    if (!$ret) {
      /**
       * Format of $results is:
       * [GalleryCoreSearch] => Array(
            [start] => 1
            [end] => 13
            [count] => 13
            [results] => Array(
                [0] => Array(
                            [itemId] => 46
                            [fields] => Array(
                                    [0] => Array([key] => Title, [value] => DSCN2884.JPG)
                                    [1] => Array([key] => Summary, [value] =>  )
                                    [2] => Array([key] => Keywords, [value] =>  )
                                    [3] => Array([key] => Description, [value] =>  )
                                    [4] => Array([key] => Owner, [value] => Me )
                                    )
                        )
                [1] => ...
            [name] => Gallery Core
        ) 
        [comment] => ...
        [CustomField] => ...
        [MultiLang] => ...
        Other modules
        )
        
       * You can set the maximum number of items, but not a start offset, unfortunately.
       */
      $urlGenerator =& $GLOBALS['gallery']->getUrlGenerator();
      // Copy the results to a new array, and overwrite the results portions to a new format
      $find = $results;
      $g2_thumb = '';
      foreach ($results as $name => $module) {
        if (count($module['results']) > 0) {
          $this_module_results = array();
          foreach ($module['results'] as $result) {
            $excerpt = array();
            $g2_thumb = '';
            foreach ($result['fields'] as $field) {
              if (preg_match("/$keys/i", $field['value'])) {
                $excerpt[] = '<em>'.$field['key'] .':</em> '.
                  search_excerpt($keys, $field['value']);
              }
            }
            $link = $urlGenerator->generateUrl(array('itemId' => $result['itemId']), 
                        array('htmlEntities' => false));
            if ($show_g2_thumbs) {
              $params['itemId'] = $result['itemId'];
              // No error checking. If it failed then no thumb is returned. Should be OK 
              // (maybe there is no thumb for that item)
              list($ret, $g2_thumb, $head) = GalleryEmbed::getImageBlock($params);
              if ($head) {
                $g2_head[] = $head;
              }          
            }
            $this_module_results[] = array(
              'title' => $result['fields'][0]['value'],
              'link'  => $link,
              'type'  => '',
              'snippet' => implode('<br />', $excerpt),
              'extra' => array(),
              'g2_thumb' => $g2_thumb,
               );
          } 
          $find[$name]['results'] = $this_module_results;
        }
      }
      // Try not to send the G2 head information multiple times
      if ($g2_head) {
        drupal_set_html_head(implode("\n", array_unique($g2_head)));
      }
      return $find;
    }
  }
}

/**
 * Implementation of hook_search_page to override how to display the search results
 */
function _gallery_search_page($results) {
  $num_items_per_row = variable_get('gallery_search_num_per_row', 3);
  $max_rows_per_pager = variable_get('gallery_search_max_rows_per_pager', 5);
  $max_items = variable_get('gallery_search_max_items', 50);
  $header = array_fill(0, $num_items_per_row, '');  

  $output = '<dl class="search-results">';

  foreach ($results as $entry) {
    $output .= gallery_search_item($entry);
  }
  $output .= '</dl>';


/**
 * From /drupal/includes/pager.inc
 * $pager_page_array[i] = page number (starts at 0) (eg 7)
 * $pager_total[i] = total number of pages = ceil($pager_total_items[i] / limit) (eg 15)
 * $pager_total_items[i] = total number of items in the pager (eg 75)
 * where i is the pager ID (must be a number!!!) (for multiple pagers on a page)
 * eg ?page=1,2,1
 * => page 2 for pager1, page 3 for pager2, page 2 for pager 3
 */
  global $pager_page_array, $pager_total, $pager_total_items;
  $page = isset($_GET['page']) ? $_GET['page'] : '';
  $pager_page_array = explode(',', $page);

  $output = '';
  $element = 0;
  // Split the search results from each module into individual pagers
  foreach ($results as $module => $table) {
    $search_items = array();
    $row = 0;
    $col = 0;
    foreach ($table['results'] as $key => $item){
      // Format the search results
      $search_items[$row][$col++] = gallery_search_item($item);
      if ($col >= $num_items_per_row) {
        $row++;
        $col = 0;
      }
    }
    // Add the title for that pager
    $output .= '<h2>';
    $count = $table['count'];
    if ($count > $max_items) {
      $count = $max_items;
      $count_text = t(' (>%count items found)', array(
        '%count' => $count));
    } else {
      $count_text = t(' (%count %item found)', array(
        '%item' => ($count == 1) ? t('item') : t('items'),
        '%count' => $count));
    }      
    $output .= t('%name Results', array('%name' => $table['name']));
    $output .= $count_text . '</h2>';

    if ($count > 0) {
      $pager_total_items[$element] = ceil($count/ $num_items_per_row);
      $pager_total[$element] = ceil($pager_total_items[$element] / $max_rows_per_pager);
      $first_item = $pager_page_array[$element] * $max_rows_per_pager;
      // Slice the array to display only the results for this page of the pager
      $search_items = array_slice($search_items, $first_item, $max_rows_per_pager);          
      // Add empty cells if needed to complete the last row
      $last_row = count($search_items) - 1;
      if (count($search_items[$last_row]) < $num_items_per_row) {
        $search_items[$last_row] = array_merge(
          $search_items[$last_row], 
          array_fill(0, $num_items_per_row - count($search_items[$last_row]), ''));
       }

      $output .= theme('table', $header, $search_items);
      $output .= theme('pager', NULL, $max_rows_per_pager, $element);
      $element++;
    }
  }
  return $output;
}  
 
function gallery_search_item($item) { 
  $output = ''; 
  if ($item['g2_thumb']) {
    $output .= ' <dd>' . $item['g2_thumb'] . '</dd>';
  } else {
    $output = '<dt class="title"><a href="'. check_url($item['link']) .'">'. 
      check_plain($item['title']) .'</a></dt>';
  }
    
  $info = array();
  if ($item['type']) {
    $info[] = $item['type'];
  }
  if ($item['user']) {
    $info[] = $item['user'];
  }
  if ($item['date']) {
    $info[] = format_date($item['date'], 'small');
  }
  if (is_array($item['extra'])) {
    $info = array_merge($info, $item['extra']);
  }
  $output .= ' <dd>'. ($item['snippet'] ? '<p>'. $item['snippet'] . '</p>' : '') . 
    '<p class="search-info">' . implode(' - ', $info) .'</p></dd>';

  return $output; 
} 

?>