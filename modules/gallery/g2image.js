// $Id: g2image.js,v 1.1 2006/03/24 14:04:52 kiz0987 Exp $

function g2ic_open(field) {
  // Find the form id by going back through the hierarchy. Kludge until can get the form id
  // directly from drupal.
  var element = document.getElementById(field).parentNode;
  while (element.tagName != 'FORM') {
    element = element.parentNode;
  }
  var form = element.id;
  var url = G2IMAGE_URI + 'g2image.php?g2ic_form='+form+'&g2ic_field='+field+'&g2ic_tinymce=0';
	var name = 'g2image';
	var w = 600;
	var h = 600;
	var valLeft = (screen.width) ? (screen.width-w)/2 : 0;
	var valTop = (screen.height) ? (screen.height-h)/2 : 0;
	var features = 'width='+w+',height='+h+',left='+valLeft+',top='+valTop+',resizable=1,scrollbars=1';
	window.open(url, name, features);
}
