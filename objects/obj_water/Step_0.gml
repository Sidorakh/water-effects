/// @description water control

for (var i=1;i<parts;i++) {
	var _dist_y = 0;
	part[i].amplitude = part[i].y - bbox_top;
	if (i > 0) {
		_dist_y = part[i-1].amplitude - part[i].amplitude;
		part[i].yspeed += (_dist_y/100);
	}
	if (i < parts) {
		_dist_y = part[i+1].amplitude - part[i].amplitude;
		part[i].yspeed += (_dist_y/100);
	}
	_dist_y = part[i].amplitude;
	part[i].yspeed -= _dist_y/100;
	if (abs(part[i].yspeed) > 0) {
		part[i].yspeed *= 0.95;
	}
	if (abs(part[i].yspeed) > 0) {
		part[i].y += part[i].yspeed;
	}
}

if (mouse_check_button(mb_left)) {
	force(mouse_x,5);
}