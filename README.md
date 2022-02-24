# Wraptor
A library of wrapper functions for gamemaker studio 2

Wraptor is an ongoing wrapper library for GM. This library lets you condense your code into a much more readable 
format that follows a more modern coding approach to getters and setters. This library even includes the ability to 'chain'
sub-function calls together! All data types are referenced within the structs as `id`

## Data Structures
Setting up an array and getting the size of the array is so easy!
```
var data;
data = new Array();
data.id[0] = "foo";
data.id[1] = "bar";
for ( var i=0; i<data.size(); i++ )
{
  show_debug_message(data.id[i]);
}
```
Each data type includes the list of functions commonly associated with the type, such that array contains:
```
Array.size()
Array.push()
Array.pop()	
Array.sort(ascending_order)	
Array.insert()
Array.erase(position, number_of_values)
Array.clear(value)
Array.get(position)	
Array.set(position, value)	
Array.equals(array_to_compare)
```

##### Sub-nesting and referencing
Any function call that ask for you to provide a data type will work with either the data type OR these custom structs like so
```
var data, compare;
data = new Array(4, -1);
compare = [];
compare[0] = [-1, -1, -1, -1];
compare[1] = new Array(4, -1);

if ( data.equals(compare[0]) ) show_debug_message("I work!");
if ( data.equals(compare[1]) ) show_debug_message("I also work!");
```
However if you wanted to sub-nest an array, for example, you would want to do this:
```
var data;
data = new Array(2, 15);
data.insert(0, new Array(4,1).id);
```
The above would return `[[1,1,1,1],15,15]`
You can also use the `DataCreate()` function to create any data structure you like using the `ds_type_*` command like so:
```
var data;
data = DataCreate(ds_type_list);
data.id[| 0] = "position1";
data.set(1, "position2");
```
there is also an added ds_type called `ds_type_array`. `DataCreate()` can use any of these constants as a parameter:
```
ds_type_array		
ds_type_list		
ds_type_queue		
ds_type_priority	
ds_type_stack		
ds_type_map		
ds_type_grid		
```

##### Command chains
You can chain together commands too! Any function that does not offer a return value is able to be chained like so:
```
var data;
data = new DsList();
data.add("Pos1", "Pos2", "Pos3");

var data_size = data.add("Pos4").size();
```
In this example `data_size` will return 4 which is the size of the array after adding a 4th position!

## Vectors
I have also included my [Vector library](https://github.com/Gizmo199/vector-library) in this project as well with the slight difference that `vec2` and `vec3` are now capitolized as `Vec2()` `Vec3()`. It contains all of the standard functionality that my original vector library contains. To read more about the vector library and how to use it follow the link above or go to: https://github.com/Gizmo199/vector-library

## Surfaces
Surfaces follow in a similar fasion with some added functionality to make things easier! It has automatic 'surface_exists()' checks in the draw codes. You can set up a surface with ease like so:

**Create Event**
```
var surf;
surf = new Surface(room_width, room_height);
surf.set();
draw_sprite(sprite_index, image_index, x, y);
surf.reset();
```

**Draw event**
```
surf.draw(0, 0);                        // Regular surface drawing
surf.draw(0, 0, 1, 1, 0, c_blue, 0.5);  // Draw a semi-translucent surface on top of our regularly drawn surface
```

You can also reference the surface using the `id` tag and use it with standard surface functions like so
```
var surf, buff;
surf = new Surface(64, 64);
buff = buffer_create(1, buffer_grow, 1);

buffer_set_surface(buff, surf.id, 1);
```

# Display
I have also included a bunch of easy to use `display` macros. You can call any of these to resize them, get their widths, and even get specific function calls from them:
```
Gui
Window
Display
AppSurf
```
Each contain a `width()` and `height()` function call. 
