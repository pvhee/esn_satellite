<?php



function theme_slideshare_flash($embed, $width, $height, $field, $item, &$node, $autoplay) {
  
  return $item['data']['EMBED'][0];
  
  return $embed;
  
  
  if ($embed) {
    $autoplay = $autoplay ? '&amp;autoPlay=true' : '';
    // this will be executed by not Internet Explorer browsers
    $output = '<!--[if !IE]> <-->
  <object type="application/x-shockwave-flash" width="'. $width .'" height="'. $height .'"
  data="http://video.slideshare.'. variable_get('emvideo_slideshare_domain', EMVIDEO_SLIDESHARE_DOMAIN_DEFAULT) .'/slideshareplayer.swf?docId='. check_plain($embed) . $autoplay .'">
  <!--> <![endif]-->'."\n";

    // this will be executed by Internet Explorer
    $output .= '<!--[if IE]>
  <object type="application/x-shockwave-flash" width="'. $width .'" height="'. $height .'"
  classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0">
  <![endif]-->'."\n";

    // params will be passed to both IE or not IE browsers
    $output .= '<param name="movie" value="http://video.slideshare.'. variable_get('emvideo_slideshare_domain', EMVIDEO_SLIDESHARE_DOMAIN_DEFAULT) .'/slideshareplayer.swf?docId='. check_plain($embed) . $autoplay .'" />'."\n";
    // following a list of params simply copied from old embed tag params. I don't know if this are really needed.
    $output .= '<param name="quality" value="best" />
    <param name="bgcolor" value="#ffffff" />
    <param name="allowScriptAccess" value="sameDomain" />
    <param name="scale" value="noScale" />
    <param name="wmode" value="transparent" />
    <param name="salign" value="TL" />
    <param name="FlashVars" value="playerMode=embedded" />
    <p>'. t('Your browser is not able to display this multimedia content.') .'</p>
  </object>';
  }
  return $output;
}

?>