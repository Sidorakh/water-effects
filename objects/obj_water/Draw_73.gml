/// @description Draw the water.

//var _cx = obj_camera.camera_x(),
//    _cy = obj_camera.camera_y(),
//	_cw = obj_camera.width,
//	_ch = obj_camera.height;


// _cx, _cy should be the top-left of the camera

var _cx = 0;
var _cy = 0;

//if (bbox_right < _cx || bbox_left > _cx+_cw || bbox_bottom < _cy || bbox_top > _cy+_ch) {
//	return;
//}
	

if (!surface_exists(surface)) {
	surface = surface_create(sprite_width,sprite_height);
}
surface_set_target(surface);
var _l = bbox_left-_cx,
	_t = bbox_top - _cy;
	
draw_surface_part_ext(application_surface,_l,_t,sprite_width,sprite_height,0,0,1,1,c_white,1);
surface_reset_target();
draw_set_color(water_color);



//draw_set_alpha(0.5);


shader_set(shd_water);
var _uni_time = shader_get_uniform(shd_water,"time");
var _uni_col = shader_get_uniform(shd_water,"col");
var _col_r = color_get_red(water_color)/256,
	_col_g = color_get_green(water_color)/256,
	_col_b = color_get_blue(water_color)/256;

shader_set_uniform_f(_uni_time,current_time);
shader_set_uniform_f(_uni_col,_col_r,_col_g,_col_b);
draw_primitive_begin_texture(pr_trianglestrip,surface_get_texture(surface));
// Draws the vertex list
for (var i=0;i<=parts;i++) {
	var _tx = (part[i].x - bbox_left)/sprite_width;
	draw_vertex_texture(part[i].x,part[i].y,_tx,0);
    draw_vertex_texture(part[i].x,bbox_bottom,_tx,1);
}
draw_primitive_end();
shader_reset();