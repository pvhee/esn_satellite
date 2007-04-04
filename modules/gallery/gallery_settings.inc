<?php
// $Id: gallery_settings.inc,v 1.4.2.1 2006/07/17 11:09:37 kiz0987 Exp $

/**
 * gallery.module : gallery_settings.inc
 * Settings functions
 */
 
/**
 * Implementation of hook_settings
 */
function _gallery_settings() {
  $output = '';
  $extra = l(t('More information about directory settings (including examples).'), 
    'admin/help/gallery');             
  $form['directory'] = array(
    '#type' => 'fieldset',
    '#title' => t('Directory settings'),
    '#description' => $extra,
    '#collapsible' => TRUE, 
    '#collapsed' => variable_get('gallery_valid', 0),
  );  
      
  $form['directory']['gallery_uri'] = array(
    '#type' => 'textfield',
    '#title' => t('URI of Gallery2'),
    '#default_value' =>  variable_get('gallery_uri', '/gallery2/'),
    '#size' => 64,
    '#maxlength' => 128,
    '#description' => t('URI of the G2 standalone location. Path from docroot to the 
                         Gallery2 directory where main.php is located. Protocol/hostname are 
                         both optional.'),
  ); 
  
  $form['directory']['gallery_autodetect_dir'] = array(
      '#type' => 'checkbox',
      '#title' => t('Autodetect Settings'),
      '#return_value' => 1,
      '#default_value' => variable_get('gallery_autodetect_dir', 1),
      '#description' => t('Autodetect the Gallery2 and Drupal settings (recommended). When 
                           selected the values below are updated with the autodetect settings 
                           when the submit button is clicked.'),
      );
  
  if (variable_get('gallery_autodetect_dir', 1)) {
    $extra = t(' (Autodetected value)');
  } else {
    $extra = t(' (Manually entered value)');
  }
  $form['directory']['gallery_dir'] = array(
    '#type' => 'textfield',
    '#title' => t('Location of Gallery2') . $extra,
    '#default_value' => variable_get('gallery_dir', './gallery2/'),
    '#size' => 64,
    '#maxlength' => 128,
    '#description' => t('Location of your gallery2 directory (absolute path or relative to the root 
                         directory of your drupal installation).'),
  );  
  
  $form['directory']['gallery_embed_uri'] = array(
    '#type' => 'textfield',
    '#title' => t('Embed URI') . $extra,
    '#default_value' => variable_get('gallery_embed_uri', '?q=gallery'),
    '#size' => 64,
    '#maxlength' => 128,
    '#description' => t('URI to access G2 via drupal. Don\'t worry if you are using clean urls in drupal and this still ends in \'index.php?q=gallery\'. This is needed to get the Gallery2 URL rewrite module to work correctly and will not be visible.'),
  ); 
  
/**
 * Remove this for now. It is not necessary when URL rewrite is working. Without URL rewrite there
 * can still be issues, but these will be addressed in the documentation for now.
 */
/*
    $form['directory']['gallery_cookie_path'] = array(
    '#type' => 'textfield',
    '#title' => t('Cookie Path') . $extra,
    '#default_value' => variable_get('gallery_cookie_path', ''),
    '#size' => 64,
    '#maxlength' => 128,
    '#description' => t('Cookie path for embedded Gallery2 sessions.'),
  ); */

  // Fullname settings
  if (module_exist('profile')) {
    $form['fullname'] = array(
      '#type' => 'fieldset',
      '#title' => t('Full Name settings'),
      '#description' => '',
      '#collapsible' => TRUE, 
      '#collapsed' => TRUE,
    );

    $form['fullname']['gallery_use_full_name'] = array(
          '#type' => 'checkbox',
          '#title' => t('Enable Full Name support'),
          '#return_value' => 1,
          '#default_value' => variable_get('gallery_use_full_name', 0),
          '#description' => t('Use full name from profile module in Gallery2 user data. Note that
                               enabling/disabling this only updates Gallery2 user data when the
                               Drupal user is updated (ie no sync is done immediately).'),
          );

    $form['fullname']['gallery_profile_full_name_field'] = array(
          '#type' => 'textfield',
          '#title' => t('Full name profile field'),
          '#default_value' => variable_get('gallery_profile_full_name_field', 'profile_full_name'),
          '#size' => 64,
          '#maxlength' => 64,
          '#description' => t('Name of "Full Name" field in profile module.'),
          );
  } else {
    $form['fullname'] = array(
      '#type' => 'fieldset',
      '#title' => t('Full Name settings'),
      '#description' => t('Full names in G2 can be supported using the profile module 
                              with a "Full Name" field. However the profile module is not 
                              installed, so this functionality is not available. If you install 
                              it you will have more options here.'),
      '#collapsible' => TRUE, 
      '#collapsed' => FALSE,
    );
  }
  
  // Image Block settings
  $typeMap = array(
    'randomImage' => t('Random image'),
    'recentImage' => t('Recent image'),
    'viewedImage' => t('Viewed image'),
    'randomAlbum' => t('Random album'),
    'recentAlbum' => t('Recent album'),
    'viewedAlbum' => t('Viewed album'),
    'dailyImage' => t('Daily image'),
    'weeklyImage' => t('Weekly image'),
    'monthlyImage' => t('Monthly image'),
    'dailyAlbum' => t('Daily album'),
    'weeklyAlbum' => t('Weekly album'),
    'monthlyAlbum' => t('Monthly album'),
    );
    
  $paramMap = array(
    'title' => t('Title'),
    'date' => t('Date'),
    'views' => t('View Count'),
    'owner' => t('Item owner'),
    'heading' => t('Heading'),
    'fullSize' => t('Full Size'),
  );
    
  $form['block'] = _gallery_block_settings($typeMap , $paramMap);
  $form['grid'] = _gallery_grid_block_settings($typeMap , $paramMap);
  $form['filter'] = _gallery_filter_settings($typeMap , $paramMap);
  $form['g2image'] = _gallery_g2image_settings();
  $form['search'] = _gallery_search_settings($typeMap , $paramMap);
  $form['links'] = _gallery_links_settings();   
       
  // Debug Settings
  $form['error'] = array(
    '#type' => 'fieldset',
    '#title' => t('Error Logging settings'),
    '#description' => '',
    '#collapsible' => TRUE, 
    '#collapsed' => TRUE,
  );             

  $form['error']['gallery_error_mode'] = array(
    '#type' => 'checkboxes',
    '#title' => t('Error logging'),
    '#default_value' => variable_get('gallery_error_mode', array(1)),
    '#options' => array(1 => t('Watchdog'),
                        2 => t('Output to the browser')),
    '#description' => t('Choose where errors are displayed.'),
  );

  $form['gallery_valid'] = array(
    '#type' => 'value', 
    '#value' => variable_get('gallery_valid', 0),
  );

  return $form;
}

/**
 * Settings for gallery image block
 *
 */
function _gallery_block_settings($typeMap , $paramMap) {    
  $form['block'] = array(
    '#type' => 'fieldset',
    '#title' => t('Gallery Image Block settings'),
    '#description' => '',
    '#collapsible' => TRUE, 
    '#collapsed' => TRUE,
  );   
  
  $numimages = variable_get('gallery_block_num_images', 3);
  $form['block']['gallery_block_num_images'] = array(
    '#type' => 'textfield',
    '#title' => t('Number of images in block'),
    '#default_value' => $numimages,
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Choose the number of images to appear. You will need to submit the form if you have increased the number in order to choose the image types.'),
  );                     

  $gallery_block_block = variable_get('gallery_block_block', array('randomImage'));
  $form['block']['gallery_block_block'] = array(
    '#tree' => 1,
    );  
  $typeMap2 = array_merge(array('none' => t('None')), $typeMap);
  for ($i=0; $i<$numimages; $i++) {
    $form['block']['gallery_block_block'][$i] = array(
      '#type' => 'select',
      '#title' => '',
      '#default_value' => $gallery_block_block[$i],
      '#options' => $typeMap2,
      '#description' => '',
    );   
  }
  $form['block']['gallery_block_block'][0]['#title'] = t('Image types');
  $form['block']['gallery_block_block'][$i-1]['#description'] = 
    t('Pick the type of images you\'d like to see. You can select the same type more than once.');

  $form['block']['gallery_item_id'] = array(
    '#type' => 'textfield',
    '#title' => t('Album or Item ID'),
    '#default_value' => variable_get('gallery_item_id', ''),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter the Gallery image or album ID (or blank).  If an album or item ID is specified, random images will only be selected from that album and its sub-albums.'),
  );

  $form['block']['gallery_block_show'] = array(
  '#type' => 'checkboxes',
  '#title' => t('Image data'),
  '#default_value' => variable_get('gallery_block_show', array('title', 'heading')),
  '#options' =>  $paramMap,
  '#description' => t('Choose the item metadata you\'d like to display.'),
  );

  $form['block']['gallery_maxsize'] = array(
    '#type' => 'textfield',
    '#title' => t('Thumbnail size'),
    '#default_value' => variable_get('gallery_maxsize', 150),
    '#size' => 10,
    '#maxlength' => 10,
    '#description' => t('If you want your size to be bigger than the thumbnail size for that image as defined in your Gallery2, you must select "Full Size" above (but note that the full image will be returned and then resized by the browser, so it may take a while to download).'),        
    );   
    
  $form['block']['gallery_album_frame'] = array(
    '#type' => 'textfield',
    '#title' => t('Album frame'),
    '#default_value' => variable_get('gallery_album_frame', 'none'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a frame name like notebook, polaroid, shadow, slide, wood, etc. See your Gallery2 install for a complete list. Use "none" or blank for no frame.'),
  );

  $form['block']['gallery_item_frame'] = array(
    '#type' => 'textfield',
    '#title' => t('Item frame'),
    '#default_value' => variable_get('gallery_item_frame', 'none'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a frame name like notebook, polaroid, shadow, slide, wood, etc. See your Gallery2 install for a complete list. Use "none" or blank for no frame.'),
  );

  $form['block']['gallery_link_target'] = array(
    '#type' => 'textfield',
    '#title' => t('Link target'),
    '#default_value' => variable_get('gallery_link_target', ''),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a link target (eg "_blank", "_new").'),
  );
  return $form['block'];
}

/**
 * Settings for gallery grid block
 *
 */
function _gallery_grid_block_settings($typeMap , $paramMap) {
  $form['grid'] = array(
    '#type' => 'fieldset',
    '#title' => t('Gallery Grid Image Block settings'),
    '#description' => '',
    '#collapsible' => TRUE, 
    '#collapsed' => TRUE,
  );   
      
  $form['grid']['gallery_grid_num_cols'] = array(
    '#type' => 'select',
    '#title' => t('Number of columns'),
    '#default_value' => variable_get('gallery_grid_num_cols', 2),
    '#options' => array(1=>1, 2=>2, 3=>3, 4=>4, 5=>5),
    '#description' => t('Enter the number of columns in the grid.'),
  );
  
  $form['grid']['gallery_grid_num_rows'] = array(
    '#type' => 'select',
    '#title' => t('Number of rows'),
    '#default_value' => variable_get('gallery_grid_num_rows', 2),
    '#options' => array(1=>1, 2=>2, 3=>3, 4=>4, 5=>5),
    '#description' => t('Enter the number of rows in the grid.'),
  );              

  $form['grid']['gallery_grid_block_block'] = array(
      '#type' => 'select',
      '#title' => 'Image types',
      '#default_value' => variable_get('gallery_grid_block_block', 'randomImage'),
      '#options' => $typeMap,
      '#description' => 'Pick the type of images you\'d like to see in the grid.',
    );   

  $form['grid']['gallery_grid_item_id'] = array(
    '#type' => 'textfield',
    '#title' => t('Album or Item ID'),
    '#default_value' => variable_get('gallery_grid_item_id', ''),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter the Gallery image or album ID (or blank).  If an album or item ID is specified, random images will only be selected from that album and its sub-albums.'),
  );

  $form['grid']['gallery_grid_block_show'] = array(
  '#type' => 'checkboxes',
  '#title' => t('Image data'),
  '#default_value' => variable_get('gallery_grid_block_show', array()),
  '#options' =>  $paramMap,
  '#description' => t('Choose the item metadata you\'d like to display.'),
  );

  $form['grid']['gallery_grid_maxsize'] = array(
    '#type' => 'textfield',
    '#title' => t('Thumbnail size'),
    '#default_value' => variable_get('gallery_grid_maxsize', 90),
    '#size' => 10,
    '#maxlength' => 10,
    '#description' => t('If you want your size to be bigger than the thumbnail size for that image as defined in your Gallery2, you must select "Full Size" above (but note that the full image will be returned and then resized by the browser, so it may take a while to download).'),        
    );   
    
  $form['grid']['gallery_grid_album_frame'] = array(
    '#type' => 'textfield',
    '#title' => t('Album frame'),
    '#default_value' => variable_get('gallery_grid_album_frame', 'none'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a frame name like notebook, polaroid, shadow, slide, wood, etc. See your Gallery2 install for a complete list. Use "none" or blank for no frame.'),
  );

  $form['grid']['gallery_grid_item_frame'] = array(
    '#type' => 'textfield',
    '#title' => t('Item frame'),
    '#default_value' => variable_get('gallery_grid_item_frame', 'none'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a frame name like notebook, polaroid, shadow, slide, wood, etc. See your Gallery2 install for a complete list. Use "none" or blank for no frame.'),
  );

  $form['grid']['gallery_grid_link_target'] = array(
    '#type' => 'textfield',
    '#title' => t('Link target'),
    '#default_value' => variable_get('gallery_grid_link_target', ''),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a link target (eg "_blank", "_new").'),
  );
  return $form;
}

/**
 * Settings for gallery filter
 *
 */
function _gallery_filter_settings($typeMap , $paramMap) {    
  $form['filter'] = array(
    '#type' => 'fieldset',
    '#title' => t('Gallery Filter settings'),
    '#description' => '',
    '#collapsible' => TRUE, 
    '#collapsed' => TRUE,
  ); 
//we don't include specificItem, since it can be selected automatically if n=1
  $form['filter']['gallery_filter_prefix'] = array(
    '#type' => 'textfield',
    '#title' => t('Filter prefix'),
    '#default_value' => variable_get('gallery_filter_prefix', 'G2'),
    '#size' => 10,
    '#maxlength' => 10,
    '#description' => t('Prefix to use with filter. Example: \'G2\' means you use [G2: 999].'),
  );

  $form['filter']['gallery_filter_default_block_type'] = array(
    '#type' => 'select',
    '#title' => t('Image Block Type'),
    '#default_value' => variable_get('gallery_filter_default_block_type', 'viewedImage'),
    '#options' => $typeMap,
    '#description' => t('Pick default type of image block you\'d like to use, default is Recent image. Viewed image is by most clicks.'),
  );
  
  $form['filter']['gallery_filter_can_cache'] = array(
    '#type' => 'checkbox',
    '#title' => t('Cache gallery filter pages'),
    '#default_value' => variable_get('gallery_filter_can_cache', 1),
    '#description' => t('By default the gallery filter output is cached by Drupal to speed up page loading. However, it will not cache the css class info for the frames. The best approach is the make sure that the sidebar image block and the gallery filter images use the same frames. If you are unable to do this you will have to deselect this option to force Drupal not to cache the pages, or else your frames will not appear. If you change this option you will need to go to <a href="%link">admin/filters</a> and re-save the image formats that use gallery filter.', array('%link' => url('admin/filters'))),
  );  
  
  $form['filter']['gallery_filter_n_images'] = array(
    '#type' => 'textfield',
    '#title' => t('Default Number of Images'),
    '#default_value' => variable_get('gallery_filter_n_images', 1),
    '#size' => 3,
    '#maxlength' => 3,
    '#description' => t('How many images you want the default block to show.  Best to keep at 1 and use the n parameter.'),
  );
//////*********in fact, should we remove this option all together?  because the way it is now, if you change this to n>1
//then instances where n was not specified and item_id is a specific item, the block breaks and nothing is shown.
  $form['filter']['gallery_filter_default_show'] = array(
    '#type' => 'checkboxes',
    '#title' => t('Default Image Block Settings'),
    '#default_value' => variable_get('gallery_filter_default_show', array('none')),
    '#options' => $paramMap,
    '#description' => t('Choose the item metadata you\'d like to display by default.  This will change all instances where show parameter was not specified.'),
  );
  
  $form['filter']['gallery_filter_default_size'] = array(
    '#type' => 'textfield',
    '#title' => t('Default thumbnail size'),
    '#default_value' => variable_get("gallery_filter_default_size", "150"),
    '#size' => 10,
    '#maxlength' => 10,
    '#description' => t('If no size is specified when calling the filter, this size will be used. If you want your size to be bigger than the thumbnail size for that image as defined in your Gallery2, you must select "Full Size" above (but note that the full image will be returned and then resized by the browser, so it may take a while to download).'),        
  );
  
  $form['filter']['gallery_filter_default_album_frame'] = array(
    '#type' => 'textfield',
    '#title' => t('Default album frame'),
    '#default_value' => variable_get('gallery_filter_default_album_frame', 'none'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a frame name like notebook, polaroid, shadow, slide, wood, etc. See your G2 install for a complete list. Use \'none\' or blank for no frame. '),
  );
  
  $form['filter']['gallery_filter_default_item_frame'] = array(
    '#type' => 'textfield',
    '#title' => t('Default item frame'),
    '#default_value' => variable_get('gallery_filter_default_item_frame', 'none'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a frame name like notebook, polaroid, shadow, slide, wood, etc. See your G2 install for a complete list. Use \'none\' or blank for no frame.'),
  );
  
  $form['filter']['gallery_filter_default_link_target'] = array(
    '#type' => 'textfield',
    '#title' => t('Default Link target'),
    '#default_value' => variable_get('gallery_filter_default_link_target', ''),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a link target (eg "_blank", "_new").'),
  );
  
  $form['filter']['gallery_filter_default_div_class'] = array(
    '#type' => 'textfield',
    '#title' => t('Default class'),
    '#default_value' => variable_get('gallery_filter_default_div_class', 'nowrap'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('left, right, or nowrap. (See gallery_filter.css to add more or modify these.)'),
  );
  return $form['filter'];
}

/**
 * Settings for gallery search
 *
 */
function _gallery_search_settings($typeMap , $paramMap) {  
  $form['search'] = array(
    '#type' => 'fieldset',
    '#title' => t('Search settings'),
    '#description' => '',
    '#collapsible' => TRUE, 
    '#collapsed' => TRUE,
  ); 
  
  $form['search']['gallery_search_max_items'] = array(
    '#type' => 'select',
    '#title' => t('Max number of search results'),
    '#default_value' => variable_get('gallery_search_max_items', 50),
    '#options' => array(25=>25, 50=>50, 100=>100, 250=>250),
    '#description' => t('Enter the maximum number of search results returned per Gallery2 Module. Higher numbers will give slower searching.'),
  );

  $form['search']['gallery_search_num_per_row'] = array(
    '#type' => 'select',
    '#title' => t('Number of search results per table row'),
    '#default_value' => variable_get('gallery_search_num_per_row', 3),
    '#options' => array(1=>1, 2=>2, 3=>3, 4=>4, 5=>5),
    '#description' => t('Enter the number of search results per row in the paged table.'),
  );

  $form['search']['gallery_search_max_rows_per_pager'] = array(
    '#type' => 'textfield',
    '#title' => t('Number of rows per page'),
    '#default_value' => variable_get('gallery_search_max_rows_per_pager', 5),
    '#size' => 10,
    '#maxlength' => 10,
    '#description' => t('Enter the number of search results per row in the paged table.'),
  );
  
  $form['search']['gallery_search_show_thumbs'] = array(
    '#type' => 'checkbox',
    '#title' => t('Display thumbnails'),
    '#default_value' => variable_get('gallery_search_show_thumbs', 1),
    '#description' => t('Display thumbnail images for the search results.'),
  );
          
  $form['search']['gallery_search_block_show'] = array(
    '#type' => 'checkboxes',
    '#title' => t('Image data'),
    '#default_value' => variable_get('gallery_search_block_show', array('title' => t('Title'))),
    '#options' => $paramMap,
    '#description' => t('Choose the item metadata you\'d like to display.'),
    ); 

  $form['search']['gallery_search_maxsize'] = array(
    '#type' => 'textfield',
    '#title' => t('Thumbnail size'),
    '#default_value' => variable_get('gallery_search_maxsize', 150),
    '#size' => 10,
    '#maxlength' => 10,
    '#description' => t('If you want your size to be bigger than the thumbnail size for that image as defined in your G2, you must select "Full Size" above (but note that the full image will be returned and then resized by the browser, so it may take a while to download).'),
  );
  
  // Add album frames, item frames and link target (using modified code from MichelleC)
  $form['search']['gallery_search_album_frame'] = array(
    '#type' => 'textfield',
    '#title' => t('Album frame'),
    '#default_value' => variable_get('gallery_search_album_frame', 'none'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a frame name like notebook, polaroid, shadow, slide, wood, etc. See your G2 install for a complete list. Use "none" or blank for no frame.'),
  );

  $form['search']['gallery_search_item_frame'] = array(
    '#type' => 'textfield',
    '#title' => t('Item frame'),
    '#default_value' => variable_get('gallery_search_item_frame', 'none'),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a frame name like notebook, polaroid, shadow, slide, wood, etc. See your G2 install for a complete list. Use "none" or blank for no frame.'),
  );

  $form['search']['gallery_search_link_target'] = array(
    '#type' => 'textfield',
    '#title' => t('Link target'),
    '#default_value' => variable_get('gallery_search_link_target_', ''),
    '#size' => 20,
    '#maxlength' => 20,
    '#description' => t('Enter a link target (eg "_blank", "_new").'),
  );
  return $form['search'];
}

/**
 * Settings for g2image
 *
 */
function _gallery_g2image_settings() {
  $form['g2image'] = array(
    '#type' => 'fieldset',
    '#title' => t('Gallery Image Assist (g2image) settings'),
    '#description' => '',
    '#collapsible' => TRUE, 
    '#collapsed' => TRUE,
  );   
  
  $form['g2image']['gallery_g2image_mode'] = array(
    '#type' => 'select',
    '#title' => t('Mode'),
    '#default_value' => variable_get('gallery_g2image_mode', 'disabled'),
    '#options' => array(
      'disabled' => t('Disabled'),
      'standalone' => t('Standalone'),
      'tinymce' => t('TinyMCE'),
      ),
    '#description' => t('Determines the mode of operation. For anything other than \'Disabled\' the g2image application has to be installed. See the INSTALL.txt instructions. In \'Standalone\' mode a button will be visible under textfields to launch the g2image window. In \'TinyMCE\' mode the g2image button can be used in the tinymce toolbar. Note that the TinyMCE version will NOT work wih Safari - use the standalone version instead.'),
  );  

  $options = array(
    t('Show on every page except the listed pages.'), 
    t('Show on only the listed pages.')
  );
  $description = t("Enter one page per line as Drupal paths. The '*' character is a wildcard. Example paths are '%blog' for the blog page and %blog-wildcard for every personal blog. %front is the front page.", array('%blog' => theme('placeholder', 'blog'), '%blog-wildcard' =>  theme('placeholder', 'blog/*'), '%front' => theme('placeholder', '<front>')));
 
  $form['g2image']['gallery_g2image_only_listed_pages'] = array(
    '#type' => 'radios', 
    '#title' => t('Show g2image link on specific pages (Standalone mode only)'),
    '#default_value' => variable_get('gallery_g2image_only_listed_pages', 1), 
    '#options' => $options,
  );
  
  $form['g2image']['gallery_g2image_std_pages'] = array(
    '#type' => 'textarea', 
    '#title' => t('Pages (Standalone mode only)'), 
    '#default_value' => variable_get('gallery_g2image_std_pages', gallery_help('admin/settings/gallery_g2image#pages')),
    '#description' => $description
  );

  $form['g2image']['gallery_g2image_regex'] = array(
    '#type' => 'textfield',
    '#title' => t('Image Types Regular Expression'),
    '#default_value' => variable_get('gallery_g2image_regex', '@(jpg|jpeg|png|gif|bmp|svg|mov|mpg|mpeg)$@i'),
    '#size' => 50,
    '#maxlength' => 50,
    '#description' => t('Images with these file extensions will be displayed in g2image'),
  );

  $form['g2image']['gallery_g2image_sortby'] = array(
    '#type' => 'select',
    '#title' => t('Default Sort Order'),
    '#default_value' => variable_get('gallery_g2image_sortby', 'title_asc'),
    '#options' => array(
      'title_asc' => t('Gallery2 Title (A-z)'),
      'title_desc' => t('Gallery2 Title (z-A)'),
      'name_asc' => t('Filename (A-z)'),
      'name_desc' => t('Filename (z-A)'),
      'mtime_desc' => t('Last Modification (newest first)'),
      'mtime_asc' => t('Last Modification (oldest first)'),
      ),
    '#description' => t('Determines the default sorting order.'),
  );  
  
  $form['g2image']['gallery_g2image_images_per_page'] = array(
    '#type' => 'select',
    '#title' => t('Default Number of images per page'),
    '#default_value' => variable_get('gallery_g2image_images_per_page', 20),
    '#options' => array(10=>10, 20=>20, 30=>30, 40=>40, 50=>50, 60=>60),
    '#description' => t('Choose the default number of images per page.'),
  );
  
  $form['g2image']['gallery_g2image_display_filenames'] = array(
    '#type' => 'select',
    '#title' => t('Default Display Options'),
    '#default_value' => variable_get('gallery_g2image_display_filenames', 'thumbnails'),
    '#options' => array(
      'thumbnails' => t('Thumbnails only'),
      'filenames' => t('Thumbnails with title and filename'),
      ),
    '#description' => t('Choose the default display option for images.'),
  );  
  
  $form['g2image']['gallery_g2image_click_mode'] = array(
    '#type' => 'select',
    '#title' => t('Default Click Mode'),
    '#default_value' => variable_get('gallery_g2image_click_mode', 'one_click_insert'),
    '#options' => array(
      'one_click_insert' => t('Insert using Default settings'),
      'show_advanced_options' => t('Open the Advanced Options Menu'),
      ),
    '#description' => t('The default settings for the "Results of clicking on an image:" option'),
  );  
  
    $form['g2image']['gallery_g2image_click_mode_variable'] = array(
    '#type' => 'checkbox',
    '#title' => t('"Results of clicking on an image:" option is available to user'),
    '#default_value' => variable_get('gallery_g2image_click_mode_variable', 1),
    '#description' => t('Determines if the user can change the "Results of clicking on an image:" option.'),
  );     
 
  $form['g2image']['gallery_g2image_default_action'] = array(
    '#type' => 'select',
    '#title' => t('Default Action'),
    '#default_value' => variable_get('gallery_g2image_default_action', 'drupal_g2_filter'),
    '#options' => array(
      'drupal_g2_filter' => t('Gallery Filter ID'),
      'thumbnail_image' => t('Thumbnail with link to image'),
      'thumbnail_album' => t('Thumbnail with link to parent album'),
      'thumbnail_custom_url' => t('Thumbnail with link to custom URL'),
      'thumbnail_only' => t('Thumbnail only'),
      'link_image' => t('Text link to image'),
      'link_parent' => t('Text link to parent album'),
      ),
    '#description' => t('Choose the default method of inserting the image info.'),
  );  
  
  $form['g2image']['gallery_g2image_custom_url'] = array(
    '#type' => 'textfield',
    '#title' => t('Default custom url'),
    '#default_value' => variable_get('gallery_g2image_custom_url', 'http://'),
    '#size' => 50,
    '#maxlength' => 50,
    '#description' => t('The default custom url. Used with \'Thumbnail with link to custom URL\' action setting'),
  );
  
  // Fix - G2 prefix

  $gallery_g2image_custom_class = variable_get('gallery_g2image_custom_class', array());
  $css_options =  array(
    'none' => t('None'),
    'g2image_normal' => t('Normal'),
    'g2image_float_left' => t('Float Left'),
    'g2image_float_right' => t('Float Right'),
    'g2image_centered' => t('Centered'),
    );

  $add_css_options = array();
  foreach ($gallery_g2image_custom_class as $key => $value) {
    if ($value) {
      $add_css_options[$value] = $value;
    }
  }
  $css_options = array_merge($css_options, $add_css_options);

  $form['g2image']['gallery_g2image_default_alignment'] = array(
    '#type' => 'select',
    '#title' => t('Default Alignment'),
    '#default_value' => variable_get('gallery_g2image_default_alignment', 'none'),
    '#options' => $css_options,
    '#description' => t('Choose the default alignment of images.'),
  );

  $form['g2image']['gallery_g2image_custom_class'] = array(
    '#tree' => 1,
    );  
    
  for ($i=1; $i<=4; $i++) {
    $form['g2image']['gallery_g2image_custom_class'][$i] = array(
      '#type' => 'textfield',
      '#title' => t('Custom Class %index', array('%index' => $i)),
      '#default_value' => $gallery_g2image_custom_class[$i],
      '#size' => 20,
      '#maxlength' => 50,
    );   
  }
  $form['g2image']['gallery_g2image_custom_class'][$i-1]['#description'] = 
    t('Additional css classes to be available for selection (must be defined in .css file).');

  $form['g2image']['gallery_g2image_class_mode'] = array(
    '#type' => 'select',
    '#title' => t('Alignment Class Insertion Point'),
    '#default_value' => variable_get('gallery_g2image_class_mode', 'img'),
    '#options' => array(
      'img' => t('<img class=...>'),
      'div' => t('<div class=...><img ...>'),
      ),
    '#description' => t('Determines where the alignment class will be inserted. If you choose \'&lt;div class=...&gt;&lt;img ...&gt;\', you will have to manually delete any &lt;div&gt; tags manually after deleting images from the TinyMCE window.'),
  );
  return $form['g2image'];
}

/**
 * Settings for links section
 *
 */
function _gallery_links_settings() {
  if (variable_get('gallery_valid', 0)) {
    $g2Uri = variable_get('gallery_embed_uri', '?q=gallery');
    $desc = t('Here are some links to the parts of Gallery2 Site Admin most relevant to gallery.module.');
    $desc .= '<ul>';
    $desc .= '<li><a href= "' . $g2Uri . '&g2_view=core.SiteAdmin&g2_subView=core.AdminModules">Modules</a> : ' . t('To install, activate or configure the required and optional modules relating to gallery.module (Image Block, Image Frame, URL Rewrite, Album Select).') . '</li>';
    $desc .= '<li><a href= "' . $g2Uri . '&g2_view=core.SiteAdmin&g2_subView=core.AdminThemes&g2_mode=defaults">Themes</a> : ' . t('To add/remove blocks in the sidebar.') . '</li>';    $desc .= '<li><a href= "' . $g2Uri . '&g2_view=core.SiteAdmin&g2_subView=rewrite.AdminRewrite&g2_mode=setup">Embedded URL Rewrite settings</a> : ' . t('To configure the correct .htaccess path and define the rewrite rules.') . '</li>';
    $desc .= '<li><a href= "' . $g2Uri . '&g2_view=core.SiteAdmin&g2_subView=core.AdminCore">Cookie Settings</a> : '. t('Only needed for a small number of site configurations, such as the use of different subdomains for Gallery2 and Drupal.') . '</li>';
    $desc .= '</ul>';
  } else {
    $desc = t('This section will contain links to the parts of Gallery2 Site Admin most relevant to gallery.module. It is only available when your Embedded Gallery installation is valid, which it currently is not.');
  }  
  $form['links'] = array(
    '#type' => 'fieldset',
    '#title' => t('Links to Gallery2 Site Admin sections most relevant to Drupal (advanced)'),
    '#description' => $desc,
    '#collapsible' => TRUE, 
    '#collapsed' => TRUE,
  );   
  return $form['links'];
}


/**
 * Validate the gallery form settings
 */
function gallery_settings_form_validate($form_id, &$form) {
  global $form_values;
  include_once(drupal_get_path('module', 'gallery') . '/G2EmbedDiscoveryUtilities.class');
  include_once(drupal_get_path('module', 'gallery') . '/G2EmbedTestUtilities.class');
  
   $gallery_valid = 1;

  // Store the original values for the variables
  $orig['g2Uri'] = $form_values['gallery_uri'];
  $orig['g2EmbedPath'] = $form_values['gallery_dir'];
  $orig['embedUri'] = $form_values['gallery_embed_uri'];
  
  // Check these variables
  list($num_errors, $num_warnings, $new, $results) = 
    G2EmbedTestUtilities::checkLocations($orig, $form_values['gallery_autodetect_dir']);
  if ($num_errors) {
    $gallery_valid = 0;
  }
  
  // Update the variables with the new validated ones
  $form_values['gallery_uri'] = $new['g2Uri'];
  $form_values['gallery_dir'] = $new['g2EmbedPath'];
  $form_values['gallery_embed_uri'] = $new['embedUri'];

  // Perform pre-init tests. If they fail then do not init the gallery as there may be an issue  
  list($num_errors, $num_warnings, $pre_init_results) = G2EmbedTestUtilities::preInitTests();
  $results = array_merge($results, $pre_init_results);
  if ($num_errors) {
    $gallery_valid = 0;
  }

  // If the filepaths seem correct then check Gallery2 works and has the correct module configs
  // This code is modified from the WPG2 integration code -- Thanks.
  if ($gallery_valid) {
    // Gallery install is thought valid, so init it.
    $title = t('Gallery2 Init:');
    $vars['gallery_uri'] = $form_values['gallery_uri'];
    $vars['gallery_dir'] = $form_values['gallery_dir'];
    $vars['gallery_embed_uri'] = $form_values['gallery_embed_uri'];
    $vars['gallery_valid'] = true;
    list ($success, $ret) = _gallery_init(true, $vars);
    if (!$success) {
      // Gallery install was supposed to be valid, but it still failed. Something is wrong.
      $results['gallery_init']['title'] = $title;
      $results['gallery_init']['error'] = true;       
      $results['gallery_init']['notice'] = t('Everything seemed OK, but the Gallery could still not be initialised. Perhaps a manually entered value is incorrect.');
      $gallery_valid = 0;
    } else {
      $results['gallery_init']['title'] = $title;
      $results['gallery_init']['success'] = true;

      list($num_errors, $num_warnings, $post_init_results) = G2EmbedTestUtilities::postInitTests();
      if ($num_errors) {
        $gallery_valid = 0;
      }
      // Check for changed embedUri
      /* No longer needed as the URL Rewrite config below will do it 
      if ($form_values['gallery_embed_uri'] != variable_get('gallery_embed_uri', '?q=gallery')) {
        $post_init_results['urlrewrite3']['title'] = t('Gallery2 URL Rewrite rules:');
        $post_init_results['urlrewrite3']['warning'] = true;       
        $post_init_results['urlrewrite3']['notice'] = t('The \'Embed URI\' setting has changed. If you are using the URL Rewrite module in Gallery2 you will need to regenerate the rules (just click the \'save\' button on the Embedded URL Rewrite page).');
      }*/
      
      // Update the URL Rewrite Configuration
      if ($post_init_results['urlrewrite']['success']) {
        list($url_conf_num_errors, $url_conf_num_warnings, $post_init_results['urlrewrite2']) = 
          _gallery_configure_url_rewrite();
      }
        
      $results = array_merge($results, $post_init_results);
      
      // Setup the cookie path - removed for now (see above)
      /*
      $path = $form_values['gallery_cookie_path'];
      $ret = GalleryCoreApi::setPluginParameter('module', 'core', 'cookie.path', $path);
      */
      
      GalleryEmbed::done();
    }
  }
  // Validate the g2image settings
  list($num_errors, $num_warnings, $results_g2image) =
    _gallery_g2image_settings_form_validate($form_values);
  if ($results_g2image) {
    $results['gallery_g2image'] = $results_g2image;
  }
 
  // Test again for validity
  if ($gallery_valid) {
      $results['gallery_valid']['title'] = t('Overall Status:');
      $results['gallery_valid']['success'] = true; 
   } else {
    $results['gallery_valid']['title'] = t('Overall Status:');
    $results['gallery_valid']['error'] = true;       
    $results['gallery_valid']['notice'] = t('You need to fix the above errors before Gallery2 will be embedded in Drupal.');
  }

  $message = t('Embedded Gallery2 Status: ').'<ul>';
  foreach ($results as $key=>$result) {
    $message .= '<li>' . t($result['title']) . ' ';
    if (isset($result['success']) && $result['success']) {
      $message .= '<span class=\'g2_embed_success\'>' . t('Success') . '</span>';
    } else if (isset($result['warning']) && $result['warning']) {
      $message .= '<span class=\'g2_embed_warning\'>' . t('Warning') . '</span>';
      $message .= '<ul><li>' . t($result['notice']) . '</li></ul>';
    } else if (isset($result['error']) && $result['error']) {
      $message .= '<span class=\'g2_embed_error\'>' . t('Error') . '</span>';
      $message .= '<ul><li>' . t($result['notice']) . '</li></ul>';
    } else if (isset($result['advise']) && $result['advise']) {
      $message .= '<span class=\'g2_embed_warning\'>' . t('Advisory') . '</span>';
      $message .= '<ul><li>' . t($result['notice']) . '</li></ul>';
    }
  }
  $message .= '</ul>';
  drupal_set_message($message);
  $form_values['gallery_valid'] = $gallery_valid;
  
  // Gallery Image Block Settings validation
  // Need to truncate the gallery_block_block variable to the entered number of blocks
  if (count($form_values['gallery_block_block']) != $form_values['gallery_block_num_images']) {
    $form_values['gallery_block_block'] = array_slice(
      $form_values['gallery_block_block'], 0, $form_values['gallery_block_num_images']);
  }
}

/**
 * Configure URL rewrite (from WPG2 code)
 */
function _gallery_configure_url_rewrite() {
  $num_errors = 0;
  $num_warnings = 0;
  
  // Find the public path to drupal from the base_url
  global $base_url;
  $http = 'http' . (isset($_SERVER['HTTPS']) ? $_SERVER['HTTPS'] == 'on' ? 's' : '' : '');
	$public_path = str_replace($http . '://' . $_SERVER['HTTP_HOST'],'', $base_url);

  // Find the path to drupal. Will this always work?
  // FIX NEEDED: This will fail if the module is installed in the sites/XXX/modules dir.
  // Probably not a big deal for 99% of people.
  $drupal_root = dirname(__FILE__);
  $gallery_path = drupal_get_path('module', 'gallery');  
  $htaccess_path = str_replace($gallery_path, '', $drupal_root);
  
  $title = t('Gallery2 URL Rewrite Module Auto-Configuration:');
  $results['urlrewrite']['title'] = $title;

  list ($ret, $rewriteApi) = GalleryCoreApi::newFactoryInstance('RewriteApi');
  if ($ret) {
  /* G2 Error handling */
  // All other tests were run already
   $results['urlrewrite']['error'] = true;
   $results['urlrewrite']['notice'] =t(
                'Gallery2 Error when trying to access URL Rewrite Module status. %ret',
                array('%ret' => $ret->getAsHtml()));
  }
	list ($ret, $params) = $rewriteApi->fetchEmbedConfig();

	// Check if .htaccess exists.  If not and path is writable, create it.
	// This should only occur for multi-site installs as the main drupal dir always has a .htaccess
	if (!file_exists($htaccess_path . '.htaccess')) {
    // Better to check for the file, not the dir as if not writable fopen returns a visible warning
		if (is_writable($htaccess_path . '.htaccess')) {
			$f = fopen($htaccess_path . '.htaccess', 'w');
			fclose($f);
		}	else {
      $results['urlrewrite']['error'] = true;
      $results['urlrewrite']['notice'] = t('There is no .htaccess file in your defined Drupal directory (%dir) and the directory is not writable. Please create a writable .htaccess file in that directory.', array('%dir' => $htaccess_path));
      $num_errors++;
      return array($num_errors, $num_warnings, $results['urlrewrite']);
    }
  }

	if (file_exists($htaccess_path . '.htaccess'))   {
		if (is_writable($htaccess_path . '.htaccess')) {

			// Set the G2 rewrite Values
			$params['embeddedLocation'] = $public_path;
			$params['embeddedHtaccess'] = $htaccess_path;

			// Save the G2 rewrite Values
			list ($ret, $code, $err) = $rewriteApi->saveEmbedConfig($params);

			if ( $code > 0 ) {
				list ($ret, $errstr) = $err;
				$errstr =  $code." - ".$errstr;
        $results['urlrewrite']['error'] = true;
        $results['urlrewrite']['notice'] = t('The Gallery2 URL Rewrite module returned the following error') . '<pre>' . $errstr . '</pre>';
        $num_errors++;
			}
       $results['urlrewrite']['success'] = true;
		} else {
        $results['urlrewrite']['error'] = true;
        $results['urlrewrite']['notice'] =  t('The .htaccess file in your defined Drupal directory (%dir) is not writable. Please CHMOD it to 644 (or 666 if 644 does not work).', array('%dir' => $htaccess_path));
        $num_errors++;
			}
	}
  return array($num_errors, $num_warnings, $results['urlrewrite']);
}

/**
 * Validate the gallery g2image settings and saves the config file if needed.
 */
function _gallery_g2image_settings_form_validate(&$form_values) {
  switch ($form_values['gallery_g2image_mode']) {
    case 'tinymce':
      $mode = t('TinyMCE');
      $path = drupal_get_path('module', 'tinymce');
      $path .= '/tinymce/jscripts/tiny_mce/plugins/g2image';
      break;
    case 'standalone':
      $mode = t('Standalone');
      $path = drupal_get_path('module', 'gallery');
      $path .= '/g2image';
      break;
    default: 
      return array(0, 0, array());
  }
  $title = 'Gallery2 Image Assist (g2image) Status:';
  // Note that file_check_directory uses &$path and will strip the trailing '/'
  if (!file_check_directory($path)) {
    $results['gallery_g2image']['title'] = $title;
    $results['gallery_g2image']['warning'] = true;       
    $results['gallery_g2image']['notice'] = t('g2image does not seem to be installed for %mode mode in the required directory (%dir), or the directory is not writable. Please see the INSTALL.txt for instructions.', array('%mode' => $mode, '%dir' => '&lt;drupal_path&gt;'.$path));
    $num_warnings++;
    return array($num_errors, $num_warnings, $results['gallery_g2image']);    
  }  
  $cr = "\n";
  $g2ic_gallery2_path = $form_values['gallery_dir'];
  $g2ic_use_full_path = (substr($g2ic_gallery2_path, 0, 1) == '/') ? 'TRUE' : 'FALSE';
  $form_values['gallery_g2image_custom_url'] = 
    check_url($form_values['gallery_g2image_custom_url']);
  $g2ic_display_filenames =  ($form_values['gallery_g2image_display_filenames'] == 'filenames') ?
    'TRUE' : 'FALSE';
  $g2ic_custom_class = array();
  foreach ($form_values['gallery_g2image_custom_class'] as $key => $value) {
    $g2ic_custom_class[$key] = ($value) ? $value : 'not_used';
  }
  
  $g2ic_custom_class_1 = ($form_values['gallery_g2image_custom_class_1']) ?
    $form_values['gallery_g2image_custom_class_1'] : 'not_used';
  $g2ic_custom_class_2 = ($form_values['gallery_g2image_custom_class_2']) ?
    $form_values['gallery_g2image_custom_class_2'] : 'not_used';
  $g2ic_custom_class_3 = ($form_values['gallery_g2image_custom_class_3']) ?
    $form_values['gallery_g2image_custom_class_3'] : 'not_used';
  $g2ic_custom_class_4 = ($form_values['gallery_g2image_custom_class_4']) ?
    $form_values['gallery_g2image_custom_class_4'] : 'not_used';
  
  $content = '<?php' .$cr;
  $content .= '//  Configuration File for Gallery 2 Image Chooser for TinyMCE' . $cr;
  $content .= '//  Version 2.0 RC4 and above' . $cr;
  $content .= '//  By Kirk Steffensen - http://g2image.steffensenfamily.com/' . $cr;
  $content .= '//  Released under the GPL version 2.' . $cr;
  $content .= '//  A copy of the license is in the root folder of this plugin.' . $cr;
  $content .= $cr . '//  Automatically generated by gallery.module (admin/settings/gallery).' . $cr;
  $content .= '//  DO NOT EDIT' . $cr;
  $content .= '$g2ic_image_ext_regex = \'' . $form_values['gallery_g2image_regex'] . '\';' . $cr;
  $content .= '$g2ic_gallery2_path = \'' . $g2ic_gallery2_path . '\';' . $cr;
  $content .= '$g2ic_embedded_mode = TRUE;' . $cr;
  $content .= '$g2ic_use_full_path = ' . $g2ic_use_full_path. ';' . $cr;
  $content .= '$g2ic_gallery2_uri = \'' .  $form_values['gallery_uri'] . '\';' . $cr;
  $content .= '$g2ic_embed_uri = \'' . $form_values['gallery_embed_uri'] . '\';' . $cr;
  $content .= '$g2ic_drupal_g2_filter = TRUE;' . $cr;
  $content .= '$g2ic_drupal_g2_filter_prefix = \'' . $form_values['gallery_filter_prefix'] . '\';' . $cr;
  $content .= '$g2ic_language = \'en\';' . $cr;
  $content .= '$g2ic_images_per_page = ' . $form_values['gallery_g2image_images_per_page'] . ';' . $cr;
  $content .= '$g2ic_display_filenames = ' . $g2ic_display_filenames . ';' . $cr;
  $content .= '$g2ic_default_alignment = \'' . $form_values['gallery_g2image_default_alignment'] . '\';' . $cr;
  $content .= '$g2ic_custom_class_1 = \'' . $g2ic_custom_class[1] . '\';' . $cr;
  $content .= '$g2ic_custom_class_2 = \'' . $g2ic_custom_class[2] . '\';' . $cr;
  $content .= '$g2ic_custom_class_3 = \'' . $g2ic_custom_class[3] . '\';' . $cr;
  $content .= '$g2ic_custom_class_4 = \'' . $g2ic_custom_class[4] . '\';' . $cr;
  $content .= '$g2ic_class_mode = \'' . $form_values['gallery_g2image_class_mode'] . '\';' . $cr;
  $content .= '$g2ic_click_mode = \'' . $form_values['gallery_g2image_click_mode'] . '\';' . $cr;
  $content .= '$g2ic_click_mode_variable = ' . $form_values['gallery_g2image_click_mode_variable'] . ';' . $cr;
  $content .= '$g2ic_default_action = \'' . $form_values['gallery_g2image_default_action'] . '\';' . $cr;
  $content .= '$g2ic_sortby = \'' . $form_values['gallery_g2image_sortby'] . '\';' . $cr;
  $content .= '$g2ic_custom_url = \'' . $form_values['gallery_g2image_custom_url'] . '\';' . $cr;

  $filename = $path . '/config.php';
  if (is_writable($filename) == false) {
    $results['gallery_g2image']['title'] = $title;
    $results['gallery_g2image']['warning'] = true;       
    $results['gallery_g2image']['notice'] = t('Could not write to g2image config file. Please check the permissions for %filename.', array('%filename' => $filename));
    $num_warnings++;
    return array($num_errors, $num_warnings, $results['gallery_g2image']);   
  }
  $handle = fopen($filename, "w");
  if (fwrite($handle, $content) === FALSE) {
    $results['gallery_g2image']['title'] = $title;
    $results['gallery_g2image']['warning'] = true;       
    $results['gallery_g2image']['notice'] = t('Could not write to g2image config file. Please check the permissions for %filename.', array('%filename' => $filename));
    $num_warnings++;
     return array($num_errors, $num_warnings, $results['gallery_g2image']);    
  } else {
    $results['gallery_g2image']['title'] = $title;
    $results['gallery_g2image']['success'] = true;
  }  
   fclose($handle);
   return array($num_errors, $num_warnings, $results['gallery_g2image']);
}
?>