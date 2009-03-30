<?php
/**
 * Insert this code in the phpfilter of the content type 'Setting', text field 'Country'.
 */
$ya_xml_resources = array('http://center.youthagora.org/xml/esn-satellite/countries.xml', 'http://galaxy.esn.org/countries/xml');
$ya_xml_local_file = file_directory_path().'/'.'countries.xml';

if(file_exists($ya_xml_local_file)) array_unshift($ya_xml_resources, $ya_xml_local_file);

$ya_xml = false;
foreach($ya_xml_resources as $ya_xml_resource) {
  $ya_xml = @simplexml_load_file($ya_xml_resource, 'SimpleXMLElement', LIBXML_NOCDATA);
  if($ya_xml) break;
}

if($ya_xml) {
  foreach($ya_xml->country as $item) {
    $elements['c'] = (string) $item->c;
    $elements['cn'] = (string) $item->cn;
    $elements['website'] = (string) $item->website;
    $elements['mail'] = (string) $item->mail;
    $elements['latitude'] = (string) $item->latitude;
    $elements['longitude'] = (string) $item->longitude;
  
    $code = base64_encode(serialize($elements));
    $ya_list[$code] = $elements['cn'];  
  }
  return $ya_list;
} else {
  return array();
}
?>