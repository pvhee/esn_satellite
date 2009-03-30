<?php
/**
 * Insert this code in the phpfilter of the content type 'Setting', text field 'Section'.
 */
$ya_xml_resources = array('http://center.youthagora.org/xml/esn-satellite/sections.xml', 'http://galaxy.esn.org/sections/xml');
$ya_xml_local_file = file_directory_path().'/'.'sections.xml';

if(file_exists($ya_xml_local_file)) array_unshift($ya_xml_resources, $ya_xml_local_file);

$ya_xml = false;
foreach($ya_xml_resources as $ya_xml_resource) {
  $ya_xml = @simplexml_load_file($ya_xml_resource, 'SimpleXMLElement', LIBXML_NOCDATA);
  if($ya_xml) break;
}

if($ya_xml) {
  foreach($ya_xml->section as $item) {
    $elements['id'] = (string) $item->id;
    $elements['sc'] = (string) $item->sc;
    $elements['sectionname'] = (string) $item->sectionname;
    $elements['l'] = (string) $item->l;
    $elements['universityname'] = (string) $item->universityname;
    $elements['street'] = (string) $item->street;
    $elements['postaladdress'] = (string) $item->postaladdress;
    $elements['telephonenumber'] = (string) $item->telephonenumber;
    $elements['facsimiletelephonenumber'] = (string) $item->facsimiletelephonenumber;
    $elements['mail'] = (string) $item->mail;
    $elements['universitywebsite'] = (string) $item->universitywebsite;
    $elements['sectionpin'] = (string) $item->sectionpin;
    $elements['website'] = (string) $item->website;
    $elements['satellitejoindate'] = (string) $item->satellitejoindate;
    $elements['latitude'] = (string) $item->latitude;
    $elements['longitude'] = (string) $item->longitude;
    $elements['zoomlevel'] = (string) $item->zoomlevel;
    $elements['satellite'] = (string) $item->satellite;
  
    $code = base64_encode(serialize($elements));
    $ya_list[$code] = $elements['sectionname'];
  }
  return $ya_list;
} else {
  return array();
}
?>