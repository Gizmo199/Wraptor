# Wraptor
A library of wrapper functions for gamemaker studio 2

Wraptor is an ongoing wrapper library for GM. This library lets you condense your code into a much more readable 
format that follows a more modern coding approach to getters and setters. This library even includes the ability to 'chain'
sub-function calls together! 

## Arrays
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
