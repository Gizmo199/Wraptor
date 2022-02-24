#macro ds_type_array		0
function DataCreate(data_type)
{
	switch(data_type)
	{
		case ds_type_array		: return new Array();		break;
		case ds_type_list		: return new DsList();		break;
		case ds_type_queue		: return new DsQueue();		break;
		case ds_type_priority	: return new DsPriority();	break;
		case ds_type_stack		: return new DsStack();		break;
		case ds_type_map		: return new DsMap();		break;
		case ds_type_grid		: return new DsGrid();		break;
	}
	return -1;
}

function Array() constructor
{
	///@func Array(*size, *[value...])
	id					= array_create(argument_count>0 ? argument[0] : 0, argument_count>1 ? argument[1] : 0);
	static size			= function()
	{
		return array_length(id);
	}
	static push			= function()
	{
		var _i = 0;
		repeat(argument_count)
		{
			array_push(id, argument[++_i]);
		}
		return self;
	}
	static pop			= function()
	{
		array_pop(id);
		return self;
	}	
	static sort			= function(_ascend)
	{
		array_sort(id, _ascend);
		return self;
	}
	static insert		= function()
	{
		var _i = 0;
		repeat(argument_count)
		{
			array_insert(id, _i, argument[_i]);
			_i++;
		}
		return self;
	}
	static erase		= function(_pos, _num)
	{
		array_delete(id, _pos, _num);	
		return self;
	}
	static clear		= function(_val)
	{
		var _size = size();
		id = array_create(_size, _val);
		return self;
	}
	static get			= function(_pos)
	{
		return id[_pos];	
	}
	static set			= function(_pos, _val)
	{
		id[_pos] = _val;	
		return self;
	}
	static equals		= function(_arrayID)
	{
		return array_equals(id, is_struct(_arrayID) ? _arrayID.id : _arrayID);
	}
}
function DsList() constructor
{
	id					= ds_list_create();
	static get			= function(_pos)
	{
		return id[| _pos];	
	}
	static set			= function(_pos, _val)
	{
		id[| _pos] = _val;
		return self;
	}
	static add			= function(_val)
	{
		var _i=-1;
		repeat(argument_count)
		{
			ds_list_add(id, argument[++_i]);
		}
		return self;
	}
	static size			= function()
	{
		return ds_list_size(id);
	}
	static copy			= function(_source)
	{
		ds_list_copy(id, is_struct(_source) ? _source.id : _source);
		return self;
	}
	static destroy		= function()
	{
		ds_list_destroy(id);	
	}
	static insert		= function(_pos, _val)
	{
		ds_list_insert(id, _pos, _val);	
		return self;
	}
	static clear		= function()
	{
		ds_list_clear(id);
		return self;
	}	
	static empty		= function()
	{
		return ds_list_empty(id);	
	}
	static erase		= function(_pos)
	{
		ds_list_delete(id, _pos);
		return self;
	}
	static find_index	= function(_val)
	{
		return ds_list_find_index(id, _val);
	}
	static find_value	= function(_pos)
	{
		return ds_list_find_value(id, _pos);	
	}
	static shuffle		= function()
	{
		ds_list_shuffle(id);
		return self;
	}	
	static sort			= function(_ascend)
	{
		ds_list_sort(id, _ascend);	
		return self;
	}
	static read			= function(_str)
	{
		ds_list_read(id, _str );
		return self;
	}
	static read_legacy	= function(_str)
	{
		ds_list_read(id, _str, true);
		return self;
	}
	static write		= function()
	{
		return ds_list_write(id);	
	}
	static mark_list	= function(_pos)
	{
		ds_list_mark_as_list(id, _pos);
		return self;
	}
	static mark_map		= function(_pos)
	{
		ds_list_mark_as_map(id, _pos);
		return self;
	}
	static is_list		= function(_pos)
	{
		return ds_list_is_list(id, _pos);	
	}
	static is_map		= function(_pos)
	{
		return ds_list_is_map(id, _pos);	
	}
	static array_vals	= function()
	{
		var __arr = new Array(size());
		for ( var i=0; i<__arr.size(); i++ )
		{
			__arr.id[i] = id[| i];
		}
		return __arr;
		return self;
	}
}
function DsQueue() constructor
{
	id					= ds_queue_create();
	static size			= function()
	{
		return ds_queue_size(id);
	}
	static destroy		= function()
	{
		ds_queue_destroy(id);
	}
	static clear		= function()
	{
		ds_queue_clear(id);	
		return self;
	}
	static empty		= function()
	{
		return ds_queue_empty(id);	
	}
	static dequeue		= function()
	{
		ds_queue_dequeue(id);	
		return self;
	}
	static enqueue		= function(_val)
	{
		var _i = 0;
		repeat(argument_count)
		{
			ds_queue_enqueue(id, argument[_i]);	
			_i++;
		}
		return self;
	}
	static head			= function()
	{
		return ds_queue_head(id);
	}
	static tail			= function()
	{
		return ds_queue_tail(id);	
	}
	static copy			= function(_source)
	{
		ds_queue_copy(id, is_struct(_source) ? _source.id : _source);
		return self;
	}
	static read			= function(_str)
	{
		ds_queue_read(id, _str);	
		return self;
	}
	static read_legacy	= function(_str)
	{
		ds_queue_read(_data, _str, true);	
		return self;
	}
	static write		= function()
	{
		return ds_queue_write(id);	
	}
}
function DsPriority() constructor
{
	id					= ds_priority_create();
	static size			= function()
	{
		return ds_priority_size(id);
	}
	static destroy		= function()
	{
		ds_priority_destroy(id);	
	}
	static clear		= function()
	{
		ds_priority_clear(id);	
		return self;
	}
	static empty		= function()
	{
		return ds_priority_empty(id);	
	}
	static copy			= function(_source)
	{
		ds_priority_copy(id, is_struct(_source) ? _source.id : _source);
		return self;
	}
	static read			= function(_str)
	{
		ds_priority_read(id, _str);	
		return self;
	}
	static read_legacy	= function(_str)
	{
		ds_priority_read(id, _str, true);	
		return self;
	}
	static write		= function(_str)
	{
		return ds_priority_write(id);	
	}
	static add			= function(_val, _priority)
	{
		ds_priority_add(id, _val, _priority);	
		return self;
	}
	static change		= function(_val, _priority)
	{
		ds_priority_change_priority(id, _val, _priority);
		return self;
	}
	static erase_max	= function()
	{
		ds_priority_delete_max(id);
		return self;
	}	
	static erase_min	= function()
	{
		ds_priority_delete_min(id);
		return self;
	}
	static erase		= function(_val)
	{
		ds_priority_delete_value(id, _val);	
		return self;
	}
	static find_min		= function()
	{
		return ds_priority_find_min(id);	
	}
	static find_max		= function()
	{
		return ds_priority_find_max(id);	
	}
	static find_priority= function(_val)
	{
		return ds_priority_find_priority(id, _val);
	}
}
function DsStack() constructor
{
	id					= ds_queue_create();
	static size			= function()
	{
		return ds_stack_size(id);
	}
	static destroy		= function()
	{
		ds_stack_destroy(id);
	}
	static clear		= function()
	{
		ds_stack_clear(id);	
	}
	static empty		= function()
	{
		return ds_stack_empty(id);	
	}
	static copy			= function(_source)
	{
		ds_stack_copy(id, is_struct(_source) ? _source.id : _source);
	}
	static read			= function(_str)
	{
		ds_stack_read(id, _str);	
	}
	static read_legacy	= function(_str)
	{
		ds_stack_read(_data, _str, true);	
	}
	static write		= function()
	{
		return ds_stack_write(id);	
	}
	static top			= function()
	{
		return ds_stack_top(id);	
	}
	static pop			= function()
	{
		ds_stack_pop(id);
	}
	static push			= function(_val)
	{
		var _i = 0;
		repeat(argument_count)
		{
			ds_stack_push(id, argument[_i]);
			_i++;
		}
	}
}
function DsMap() constructor
{
	id					= ds_map_create();
	static exists		= function(_key)
	{
		return ds_map_exists(id, _key)	
	}
	static get			= function(_key)
	{
		return id[? _key];
	}
	static set			= function(_key, _val)
	{
		id[? _key] = _val;
		return self;
	}
	static size			= function()
	{
		return ds_map_size(id);	
	}
	static clear		= function()
	{
		ds_map_clear(id);	
		return self;
	}
	static destroy		= function()
	{
		ds_map_destroy(id);	
	}
	static copy			= function(_source)
	{
		ds_map_copy(id, is_struct(_source) ? _source.id : _source);
		return self;
	}
	static erase		= function(_key)
	{
		ds_map_delete(id, _key);	
		return self;
	}
	static empty		= function()
	{
		return ds_map_empty(id);
	}
	static first		= function()
	{
		return ds_map_find_first(id);
	}	
	static next			= function(_key)
	{
		return ds_map_find_next(id, _key);	
	}
	static previous		= function(_key)
	{
		return ds_map_find_previous(id, _key);
	}	
	static last			= function()
	{
		return ds_map_find_last(id);	
	}
	static read			= function(_str)
	{
		ds_map_read(id, _str);	
		return self;
	}
	static read_legacy	= function(_str)
	{
		ds_map_read(id, _str, true);
		return self;
	}	
	static write		= function()
	{
		return ds_map_write(id);	
	}
	static array_keys	= function()
	{
		var __arr = new Array();
		ds_map_keys_to_array(id, __arr.id);
		return __arr;
	}
	static array_vals	= function()
	{
		var __arr = new Array();
		ds_map_values_to_array(id, __arr.id);
		return __arr;
	}
	static save			= function(_fname)
	{
		ds_map_secure_save(id, _fname);
		return self;
	}
	static load			= function(_fname)
	{
		destroy();
		id = ds_map_secure_load(_fname);
		return self;
	}
	static save_buffer  = function(_buff)
	{
		ds_map_secure_save_buffer(id, _buff);	
		return self;
	}
	static load_buffer  = function(_buff)
	{
		destroy();
		id = ds_map_secure_load_buffer(_buff);	
		return self;
	}
	static add_list		= function(_key, _listID)
	{
		ds_map_add_list(id, _key, is_struct(_listID) ? _listID.id : _listID);
		return self;
	}
	static add_map		= function(_key, _mapID)
	{
		ds_map_add_map(id, _key, is_struct(_mapID) ? _mapID.id : _mapID);	
		return self;
	}
	static replace_list = function(_key, _listID)
	{
		ds_map_replace_list(id, _key, _listID);
		return self;
	}
	static replace_map	= function(_key, _mapID)
	{
		ds_map_replace_map(id, _key, _mapID);
		return self;
	}
	static is_list		= function(_key)
	{
		return ds_map_is_list(id, _key);	
	}
	static is_map		= function(_key)
	{
		return ds_map_is_map(id, _key);	
	}
}	
function DsGrid() constructor
{
	id					= ds_grid_create(0, 0);	
	static set_size		= function(_width, _height)
	{
		resize(	_width, _height );
		return self;
	}
	static width		= function() 
	{
		return ds_grid_width(id);	
	}
	static height		= function()
	{
		return ds_grid_height(id);
	}
	static resize		= function(_width, _height)
	{
		ds_grid_resize(id, _width, _height);	
		return self;
	}
	static destroy		= function()
	{
		ds_grid_destroy(id);	
	}
	static clear		= function(_val)
	{
		ds_grid_clear(id, _val);
		return self;
	}
	static fill			= function(_val)
	{
		clear(_val);
		return self;
	}	
	static set			= function(_x, _y, _val)
	{
		id[# _x, _y] = _val;
		return self;
	}
	static get			= function(_x, _y)
	{
		return id[# _x, _y];	
	}
	static shuffle		= function()
	{
		ds_grid_shuffle(id);
		return self;
	}
	static sort			= function(_column, _ascend)
	{
		ds_grid_sort(id, _column, _ascend);	
		return self;
	}
	static copy			= function(_source)
	{
		ds_grid_copy(id, is_struct(_source) ? _source.id : _source);
		return self;
	}
	static read			= function(_str)
	{
		ds_grid_read(id, _str);	
		return self;
	}
	static read_legacy	= function(_str)
	{
		ds_grid_read(id, _str, true);
		return self;
	}
	static write		= function(_str)
	{
		return ds_grid_write(id);
	}
	static disk_set		= function(_x, _y, _r, _val)
	{
		ds_grid_set_disk(id, _x, _y, _r, _val);	
		return self;
	}
	static disk_exists  = function(_x, _y, _r, _val)
	{
		return ds_grid_value_disk_exists(id, _x, _y, _r, _val);	
	}
	static disk_get_x	= function(_x, _y, _r, _val)
	{
		return ds_grid_value_disk_x(id, _x, _y, _r, _val);	
	}
	static disk_get_y	= function(_x, _y, _r, _val)
	{
		return ds_grid_value_disk_y(id, _x, _y, _r, _val);
	}	
	static disk_max		= function(_x, _y, _r)
	{
		return ds_grid_get_disk_max(id, _x, _y, _r);	
	}
	static disk_sum		= function(_x, _y, _r)
	{
		return ds_grid_get_disk_sum(id, _x, _y, _r);		
	}
	static disk_mean	= function(_x, _y, _r)
	{
		return ds_grid_get_disk_mean(id, _x, _y, _r);	
	}
	static disk_min		= function(_x, _y, _r)
	{
		return ds_grid_get_disk_min(id, _x, _y, _r);	
	}
	static value_exists	= function(_x, _y, _w, _h, _val)
	{
		return ds_grid_value_exists(id, _x, _y, _w, _h, _val);	
	}
	static region_set	= function(_x, _y, _w, _h, _val)
	{
		ds_grid_set_region(id, _x, _y, _x+_w, _y+_h, _val);
		return self;
	}
	static region_grid  = function(_x, _y, _source, _sourcex, _sourcey, _source_width, _source_height)
	{
		ds_grid_set_grid_region(id, is_struct(_source) ? _source.id : _source, _sourcex, _sourcey, _sourcex + _source_width, _sourcey + _source_height, _x, _y);
		return self;
	}
	static region_get_x = function(_x, _y, _w, _h, _val)
	{
		return ds_grid_value_x(id, _x, _y, _x + _w, _y + _h, _val);	
	}
	static region_get_y = function(_x, _y, _w, _h, _val )
	{
		return ds_grid_value_y(id, _x, _y, _x + _w, _y + _h, _val);
	}	
	static get_max		= function(_x, _y, _w, _h)
	{
		return ds_grid_get_max(id, _x, _y, _x + _w, _y + _h );	
	}
	static get_sum		= function(_x, _y, _w, _h)
	{
		return ds_grid_get_sum(id, _x, _y, _x + _w, _y + _h );	
	}
	static get_mean		= function(_x, _y, _w, _h)
	{
		return ds_grid_get_mean(id, _x, _y, _x + _w, _y + _h );	
	}
	static get_min		= function(_x, _y, _w, _h)
	{
		return ds_grid_get_min(id, _x, _y, _x + _w, _y + _h );	
	}
	static mulitply		= function(_x, _y, _val)
	{
		ds_grid_multiply(id, _x, _y, _val);	
		return self;
	}
	static mult_disk	= function(_x, _y, _r, _val)
	{
		ds_grid_multiply_disk(id, _x, _y, _r, _val);
		return self;
	}
	static mult_region	= function(_x, _y, _w, _h, _val)
	{
		ds_grid_multiply_region(id, _x, _y, _x + _w, _y + _h, _val);	
		return self;
	}
	static mult_reg_grid= function(_x, _y, _source, _sourcex, _sourcey, _source_width, _source_height)
	{
		ds_grid_multiply_grid_region(id, is_struct(_source) ? _source.id : _source, _sourcex, _sourcey, _sourcex + _source_width, _sourcey + _source_height, _x, _y);
		return self;
	}
}