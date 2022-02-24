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
data = DataCreate(ds_type_array);
data.id[0] = "position1";
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
