// $Id: simplemenu.js,v 1.9.2.3 2007/04/07 05:51:57 m3avrck Exp $

$(document).ready(function() {
  // get the Drupal basepath
  var basePath = Drupal.settings.simplemenu.basePath;
  // get the element to add the menu to
  var element = Drupal.settings.simplemenu.element;                        
  var menu = '<ul id="simplemenu" class="clear-block"></ul>';
  
  switch (Drupal.settings.simplemenu.placement) {
    case 'prepend':
      $(menu).prependTo(element);
      break;
    case 'append':
      $(menu).appendTo(element);
      break;
    case 'replace':
      $(element).html(menu);
      break;
  }  
  
  $('body').css('margin-top', '20px');
  
  // Build menu        
  $('#simplemenu')
    .append(simplemenu)
    .superfish({
		  hoverClass	: "sfhover", animation : { opacity:"show", delay: 750 }
	  })
    .find(">li[ul]")
  		.mouseover(function(){
  			$("ul", this).bgIframe({opacity:false});
  		})
  		.find("a")
  			.focus(function(){
  				$("ul", $("#simplemenu>li[ul]")).bgIframe({opacity:false});
  			})
	 
	 $('#simplemenu').children('li.expanded').addClass('root');    
});           

/*
 * Superfish - jQuery menu widget
 *
 * Copyright (c) 2007 Joel Birch
 *
 * Dual licensed under the MIT and GPL licenses:
 * 	http://www.opensource.org/licenses/mit-license.php
 * 	http://www.gnu.org/licenses/gpl.html
 *
 * Last updated: 18/3/07 to remove iframes on 'out'
 */

(function($){
	$.fn.superfish = function(o){
		var defaults = {
			hoverClass	: "sfHover",
			delay		: 500,
			animation	: {opacity:"show"},
			speed		: "normal"
		},
			over = function(){
				var $$ = $(this);
				clearTimeout(this.sfTimer);
				if (!$$.is("."+o.hoverClass)) {
					$$.addClass(o.hoverClass)
						.find("ul")
							.animate(o.animation,o.speed)
							.end()
						.siblings()
						.removeClass(o.hoverClass);
				}
			},
			out = function(){
				var $$ = $(this);
				this.sfTimer=setTimeout(function(){
					$$.removeClass(o.hoverClass)
					.find("iframe", this)
						.remove();
				},o.delay);
			};
		o = $.extend(defaults, o || {});
		var sfHovAr=$("li",this)
			.hover(over,out)
			.find("a").each(function() {
				var $a = $(this), $li = $a.parents("li");
				$a.focus(function(){ $li.each(over); })
				  .blur(function(){ $li.each(out); });
			}).end();
		$(window).unload(function() {
			sfHovAr.unbind("mouseover").unbind("mouseout");
		});
		return this;
	};
})(jQuery);        

/* Copyright (c) 2006 Brandon Aaron (http://brandonaaron.net)
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php) 
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 * $LastChangedDate: 2007-03-07 15:07:51 -0600 (Wed, 07 Mar 2007) $
 * $Rev: 1505 $
 */

/**
 * The bgiframe is chainable and applies the iframe hack to get 
 * around zIndex issues in IE6. It will only apply itself in IE 
 * and adds a class to the iframe called 'bgiframe'.
 * 
 * It does take borders into consideration but all values
 * need to be in pixels and the element needs to have
 * position relative or absolute.
 *
 * NOTICE: This plugin uses CSS expersions in order to work
 * with an element's borders, height and with and can result in poor 
 * performance when used on an element that changes properties 
 * like size and position a lot. Two of these expressions can be
 * removed if border doesn't matter and performance does.
 * See lines 39 and 40 below and set top: 0 and left: 0
 * instead of their current values.
 *
 * @example $('div').bgiframe();
 * @before <div><p>Paragraph</p></div>
 * @result <div><iframe class="bgiframe".../><p>Paragraph</p></div>
 *
 * @name bgiframe
 * @type jQuery
 * @cat Plugins/bgiframe
 * @author Brandon Aaron (brandon.aaron@gmail.com || http://brandonaaron.net)
 */
jQuery.fn.bgIframe = jQuery.fn.bgiframe = function() {
	// This is only for IE6
	if ( !(jQuery.browser.msie && typeof XMLHttpRequest == 'function') ) return this;
	var html = '<iframe class="bgiframe" src="javascript:;" tabindex="-1" '
	 					+'style="display:block; position:absolute; '
						+'top: expression(((parseInt(this.parentNode.currentStyle.borderTopWidth)  || 0) * -1) + \'px\'); '
						+'left:expression(((parseInt(this.parentNode.currentStyle.borderLeftWidth) || 0) * -1) + \'px\'); ' 
						+'z-index:-1; filter:Alpha(Opacity=\'0\'); '
						+'width:expression(this.parentNode.offsetWidth + \'px\'); '
						+'height:expression(this.parentNode.offsetHeight + \'px\')"/>';
	return this.each(function() {
		if ( !jQuery('iframe.bgiframe', this)[0] )
			this.insertBefore( document.createElement(html), this.firstChild );
	});
};