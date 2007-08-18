// Initialization, you can leave this here or move this somewhere else


jQuery(function(){
	jQuery('ul.jd_menu').jdMenu();
	jQuery(document).bind('click', function() {
		jQuery('ul.jd_menu ul:visible').jdMenuHide();
	});
});

/*
 * jdMenu 1.2 (2007-01-26)
 *
 * Copyright (c) 2006,2007 Jonathan Sharp (http://jdsharp.us)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://jdsharp.us/
 *
 * Built upon jQuery 1.1.1 (http://jquery.com)
 * This also requires the jQuery dimensions plugin
 */
(function($){
	// This method can be removed once it shows up in core
	if (!$.fn.ancestorsUntil) {
		$.fn.ancestorsUntil = function(match) {
			var a = [];
			jQuery(this[0]).parents().each(function() {
				a.push(this);
				return !jQuery(this).is(match);
			});
			return this.pushStack(a, arguments);
		};
	}
	
	// Settings
	var DELAY	= 81;
	var IFRAME 	= $.browser.msie;
	var CSSR 	= 'jd_menu_flag_root';
	var CSSB	= 'jd_menu_hover_toolbar';
	var CSSH	= 'jd_menu_hover';
	
	// Public methods
	$.fn.jdMenu = function() {
		return this.each(function() {
			jQuery(this).addClass(CSSR);
			addEvents(this);
		});
	};
	
	$.fn.jdMenuHide = function() {
		return this.each(function() {
			hide(this);
		});
	};
	
	// Private methods
	function addEvents(ul) {
		jQuery('> li', ul).hover(hoverOver,hoverOut).bind('click', click);
	};
	
	function removeEvents(ul) {
		jQuery('> li', ul).unbind('mouseover').unbind('click', click);
	};
	
	function hoverOver() {
		var c = jQuery(this).parent().is('.' + CSSR) ? CSSB : CSSH;
		jQuery(this).addClass(c).find('> a').addClass(c);
		
		if (this.$timer) {
			clearTimeout(this.$timer);
		}
		this.$size = jQuery('> ul', this).size();
		if (this.$size > 0) {
			var ul = jQuery('> ul', this)[0];
			if (!jQuery(ul).is(':visible')) {
				this.$timer = setTimeout(function() {
					if (!jQuery(ul).is(':visible')) { 
						show(ul); 
					}
				}, DELAY);
			}
		}
	};
	
	function hoverOut() {
		jQuery(this)	.removeClass(CSSH).removeClass(CSSB)
			.find('> a')
				.removeClass(CSSH).removeClass(CSSB);
		
		if (this.$timer) {
			clearTimeout(this.$timer);
		}
		if (jQuery(this).is(':visible') && this.$size > 0) {
			var ul = jQuery('> ul', this)[0];
			this.$timer = setTimeout(function() {
				if (jQuery(ul).is(':visible')) {
					hide(ul);
				}
			}, DELAY);
		}
	};
	
	function show(ul) {
		// Hide any existing menues at the same level
		jQuery(ul).parent().parent().find('> li > ul:visible').not(ul).each(function() {
			hide(this);
		});
		addEvents(ul);
		
		var o = jQuery(ul).offset();
		var bt = o.borderTop;
		var bl = o.borderLeft;
		
		var x = 0, y = 0;
		var li = jQuery(ul).parent();
		if (jQuery(li).ancestorsUntil('ul.' + CSSR).filter('li').size() == 0) {
			x = jQuery(li).offset(jQuery(li).parents('ul.' + CSSR)[0]).left;
			y = jQuery(li).outerHeight();
		} else {
			x = jQuery(li).outerWidth() - (3 * bl);
			y = jQuery(li).offset(jQuery(li).parent()).top + bt;
		}
		//jQuery(ul).css({left: x + 'px', top: y + 'px'}).fadeIn('fast');
		jQuery(ul).css({left: x + 'px', top: y + 'px'}).show();
		
		if (IFRAME && (jQuery(ul).ancestorsUntil('ul.' + CSSR).filter('li').size() > 0)) {
			// TODO Add in the auto declaration?
			var w = jQuery(ul).outerWidth();	// Needs to be before the frame is added
			var h = jQuery(ul).outerHeight();
			if (jQuery('> iframe', ul).size() == 0) {
				jQuery(ul).append('</iframe>').prepend('<iframe style="position: absolute; z-index: -1;">');
			}
			jQuery('> iframe', ul).css({		opacity:		'0',
										left: 			-bl + 'px',
										top: 			-bt + 'px',
										width: 			w + 'px',
										height: 		h + 'px'});
			if (!ul.style.width || ul.$auto) {
				ul.$auto = true;
				jQuery(ul).css({	width: 	w - (bl * 2) + 'px',
							height: h - (bt * 2) + 'px',
							zIndex: '100' });
			}
		}
	};
	
	function hide(ul, recurse) {
		jQuery('> li > ul:visible', ul).each(function(){
			hide(this, false); 
		});
		if (jQuery(ul).is('.' + CSSR)) {
			return;
		}
		
		removeEvents(ul);
		//jQuery(ul).fadeOut('fast');
		jQuery(ul).hide();
		jQuery('> iframe', ul).remove();
		
		// If true, hide all of our parent menues
		if (recurse == true) {
			jQuery(ul).ancestorsUntil('ul.' + CSSR)
					.removeClass(CSSH).removeClass(CSSB)
				.not('.' + CSSR).filter('ul')
					.each(function() {
						hide(this, false)
				});
		}
	};
		
	function click(e) {
		e.stopPropagation();
		if (this.$timer) {
			clearTimeout(this.$timer);
		}
		if (this.$size > 0) {
			var ul = jQuery('> ul', this)[0];
			if (!jQuery(ul).is(':visible')) {
				show(ul);
			}
		} else {
			var l = jQuery('> a', this).get(0);
			if (l != undefined) {
				if (!l.onclick) {
					window.open(l.href, l.target || '_self');
				} else {
					jQuery(l).click();
				}
			}
			
			var ul = jQuery(this).parent();
			if (!jQuery(ul).is('.' + CSSR)) {
				hide(ul, true);
			}
		}
	};
})(jQuery);
