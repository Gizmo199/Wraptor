function Surface(_width, _height) constructor
{
	id						= surface_create(_width, _height);
	static create			= function(_width, _height)
	{
		if ( !exists() )
		{
			id  = surface_create(_width, _height);
			__size.x = _width;
			__size.y = _height;
		}
	}
	static width			= function()
	{
		return surface_get_width(id);
	}
	static height			= function()
	{
		return surface_get_height(id);	
	}
	static exists			= function()
	{
		return surface_exists(id);	
	}
	static free				= function()
	{
		if ( exists() )
		{
			surface_free(id);
		}
	}	
	static replace			= function(_width, _height)
	{
		free();
		create(_width, _height);
	}
	static set				= function()
	{
		surface_set_target(id);	
	}
	static reset			= function()
	{	
		surface_reset_target();
	}
	static draw				= function(_x, _y, _xscale=1, _yscale=1, _angle=0, _blend=c_white, _alpha=1)
	{	
		///@func draw(x, y, *xscale, *yscale, *angle, *blend, *alpha)
		if ( !exists() ) create(__size.x, __size.y);	
		draw_surface_ext(id, _x, _y, _xscale, _yscale, _angle, _blend, _alpha);
	}
	static draw_stretched	= function(_x, _y, _w, _h, _blend=c_white, _alpha=1)
	{
		///@func draw_stretched(x, y, width, height, *blend, *alpha);
		if ( !exists() ) create(width, height);	
		draw_surface_stretched_ext(id, _x, _y, _w, _h, _blend, _alpha);
	}
	static draw_part		= function(_x, _y, _left, _top, _width, _height, _xscale = 1, _yscale = 1, _blend = c_white, _alpha = 1)
	{
		///@func draw_part(x, y, left, top, width, height, *xscale, *yscale, *blend, *alpha)
		if ( !exists() ) create(width, height);	
		draw_surface_part(id, _left, _top, _width, _height, _x, _y);
	}	
	
	// For re-creation purposes
	__size = { x : _width, y : _height }
}