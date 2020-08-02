/// @description Initialise water

size = 8;

parts = sprite_width/size;
part = [];
surface = noone;
// The height of water.
water_height = sprite_height;

// The static distance between parts.
var _x;
for (var i=0;i<=parts;i++) {
    _x = size*i;
	var _l = i-1;
	if (_l < 0) {
		_l = noone;	
	}
	var _r = i+1;
	if (_r > parts) {
		_r = noone;	
	}
    part[i] = {
		x:bbox_left + _x,
		y:bbox_top,
		num:i,
		control:id,
		yspeed:0,
		amplitude:0,
		left:_l,
		right:_r
	}
}
set = 0;

function force(xpos,pow) {
	var i=0;
	repeat(parts) {
		var _dist = abs(xpos-part[i].x);
		if (_dist < 32) {
			if (_dist == 0) _dist = 1;
			part[i].yspeed += pow/(_dist*2)
		}
		i++;
	}
	
}

water_color = make_color_rgb(0,128,255);