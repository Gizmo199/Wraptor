#macro Gui		global.__gui
#macro Window	global.__window
#macro Display	global.__display
#macro AppSurf	global.__appsurf

Gui = {
	width			: function() { return display_get_gui_width() },
	height			: function() { return display_get_gui_height()}, 
	set_size		: function(_w, _h)
	{
		///@func set_size(width, height)
		display_set_gui_size(w,h);
	}
}
Window = {
	fullscreen		: function(_enable){ window_set_fullscreen(_enable); },
	is_fullscreen	: function(){ return window_get_fullscreen(); },
	width			: function() { return window_get_width() },
	height			: function() { return window_get_height()},
	set_size		: function(_w, _h)
	{
		///@func set_size(width, height) 
		window_set_size(_w, _h);
		window_set_position(
			( display.width()*.5 ) - width() * .5,
			( display.height()*.5) - height() * .5
		);		
	},
	mouse_position	: function()
	{
		///@func mouse_position()
		return { x : window_mouse_get_x(), y : window_mouse_get_y() }
	},
	mouse_lock		: function(_tf)
	{
		///@func mouse_lock(enabled)
		window_mouse_set(width()*.5, height()*.5)
	}
}
Display = {
	width			: function() { return display_get_width() },
	height			: function() { return display_get_height()}
}
AppSurf = {
	enable			: function(_enable) { application_surface_enable(_enable); },
	enable_draw		: function(_enable) { application_surface_draw_enable(_enable); },
	width			: function() { return surface_get_width(application_surface)  },
	height			: function() { return surface_get_height(application_surface) },
	set_size		: function(w, h)
	{
		///@func set_size(width, height)
		surface_resize(application_surface, w, h);
	},
	draw			: function(_x, _y, _xscale = 1, _yscale = 1, _angle = 0, _blend = c_white, _alpha = 1)
	{
		///@func draw(x, y, *xscale, *yscale, *angle, *blend, *alpha)
		draw_surface_ext(application_surface, _x, _y, _xscale, _yscale, _angle, _blend, _alpha);	
	},	
	draw_stretched	: function(_x, _y, _w, _h, _blend = c_white, _alpha = 1)
	{
		///@func draw_ext(x, y, width, height, *blend, *alpha)
		draw_surface_stretched_ext(application_surface, _x, _y, _w, _h, _blend, _alpha);
	}	
}



