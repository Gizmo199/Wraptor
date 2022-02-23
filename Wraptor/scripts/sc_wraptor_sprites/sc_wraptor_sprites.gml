function Sprite(_spr) constructor
{
	///@func Sprite(ind)	
	index		= _spr;
	name		= sprite_get_name(_spr);
	number		= sprite_get_number(_spr);
	width		= sprite_get_width(_spr);
	height		= sprite_get_height(_spr);
	offset_x	= sprite_get_xoffset(_spr);
	offset_y	= sprite_get_yoffset(_spr);
	bbox_left	= sprite_get_bbox_left(_spr);
	bbox_right	= sprite_get_bbox_right(_spr);
	bbox_top	= sprite_get_bbox_top(_spr);
	bbox_bottom	= sprite_get_bbox_bottom(_spr);
	speed		= sprite_get_speed(_spr);
	nineslice	= sprite_get_nineslice(_spr);
	texture		= [];
	for ( var i=0; i<number; i++ )
	{
		texture[i] = sprite_get_texture(_spr, i);
	}
	static draw				= function(_ind, _x, _y, _xscale=1, _yscale=1, _angle=0, _blend=c_white, _alpha=1)
	{
		///@func draw(image_index, x, y, *xscale, *yscale, *angle, *blend, *alpha)
		draw_sprite_ext(index, _ind, _x, _y, _xscale, _yscale, _angle, _blend, _alpha);
	}
	static draw_stretched	= function(_ind, _x, _y, _w, _h, _blend=c_white, _alpha=1)
	{
		///@func draw_stretched(image_index, x, y, width, height, *blend, *alpha);
		draw_sprite_stretched_ext(index, _ind, _x, _y, _w, _h, _blend, _alpha);
	}	
	static draw_part		= function(_ind, _x, _y, _left, _top, _width, _height, _xscale = 1, _yscale = 1, _blend = c_white, _alpha = 1)
	{
		///@func draw_part(image_index, left, top, width, height, x, y, *xscale, *yscale, *blend, *alpha)
		draw_sprite_part_ext(index, _ind, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _blend, _alpha);
	}	
}
