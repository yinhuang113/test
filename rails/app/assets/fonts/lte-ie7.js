/* Use this script if you need to support IE 7 and IE 6. */

window.onload = function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'mallrat_font\'">' + entity + '</span>' + html;
	}
	var icons = {
			'icon-house' : '&#xe000;',
			'icon-bookmark' : '&#xe002;',
			'icon-cog' : '&#xe001;',
			'icon-search' : '&#xe003;',
			'icon-pencil' : '&#xe005;',
			'icon-checkmark' : '&#xe006;',
			'icon-clipboard' : '&#xe007;',
			'icon-export' : '&#xe008;',
			'icon-star' : '&#xe00c;',
			'icon-flag' : '&#xe00d;',
			'icon-plus' : '&#xe00e;',
			'icon-minus' : '&#xe00f;',
			'icon-menu' : '&#xe010;',
			'icon-arrow-down' : '&#xe011;',
			'icon-arrow-up' : '&#xe012;',
			'icon-calendar' : '&#xe014;',
			'icon-trashcan' : '&#xe013;',
			'icon-comment' : '&#xe015;',
			'icon-location' : '&#xe004;',
			'icon-adjust' : '&#xe016;',
			'icon-contrast' : '&#xe017;',
			'icon-eye' : '&#xe019;',
			'icon-diamond' : '&#xe02e;',
			'icon-soccer' : '&#xe02f;',
			'icon-badge' : '&#xe030;',
			'icon-calendar-2' : '&#xe01d;',
			'icon-phone' : '&#xe031;',
			'icon-coffee' : '&#xe032;',
			'icon-monitor' : '&#xe033;',
			'icon-book' : '&#xe034;',
			'icon-womens_fashions' : '&#xe009;',
			'icon-home' : '&#xe00a;',
			'icon-health_beauty' : '&#xe00b;',
			'icon-wireframe' : '&#xe01a;',
			'icon-unisex' : '&#xe01b;',
			'icon-handicap' : '&#xe01c;',
			'icon-footwear' : '&#xe01e;',
			'icon-team_agent' : '&#xe01f;',
			'icon-stroller' : '&#xe020;',
			'icon-foodcourt' : '&#xe021;',
			'icon-food_services' : '&#xe022;',
			'icon-stairs' : '&#xe023;',
			'icon-split_screen' : '&#xe024;',
			'icon-eyewear' : '&#xe025;',
			'icon-floor' : '&#xe026;',
			'icon-specialty_retail' : '&#xe027;',
			'icon-skytrain' : '&#xe028;',
			'icon-eyedroppper' : '&#xe029;',
			'icon-escalator' : '&#xe02a;',
			'icon-security' : '&#xe02b;',
			'icon-restroom' : '&#xe02c;',
			'icon-entrance' : '&#xe02d;',
			'icon-elevator' : '&#xe035;',
			'icon-restaurants' : '&#xe036;',
			'icon-playarea' : '&#xe037;',
			'icon-customer_service' : '&#xe038;',
			'icon-bus' : '&#xe039;',
			'icon-atm' : '&#xe03a;',
			'icon-mens_fashons' : '&#xe03b;',
			'icon-phone-2' : '&#xe03c;',
			'icon-medical' : '&#xe03d;',
			'icon-layer' : '&#xe03e;',
			'icon-kiosk' : '&#xe03f;',
			'icon-map' : '&#xe040;',
			'icon-users' : '&#xe041;',
			'icon-user-add' : '&#xe042;',
			'icon-user' : '&#xe043;',
			'icon-star-2' : '&#xe044;',
			'icon-mobile' : '&#xe045;',
			'icon-music' : '&#xe046;',
			'icon-checkbox' : '&#xe047;'
		},
		els = document.getElementsByTagName('*'),
		i, attr, html, c, el;
	for (i = 0; i < els.length; i += 1) {
		el = els[i];
		attr = el.getAttribute('data-icon');
		if (attr) {
			addIcon(el, attr);
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
};