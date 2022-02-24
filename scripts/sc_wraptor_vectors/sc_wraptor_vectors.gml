function Vec2() constructor
{
	#region Initialize Vector
		
		__IS_VEC_3 = false;
		
		#region Setup
		
			/// Set available parameters
			var paramArray = array_create(2,0);
			for ( var i=0; i<argument_count; i++ )
			{
				paramArray[@i] = argument[i];
			}
			
		#endregion
		#region Position[0] Handling
		
			var arg = argument[0];
			if ( argument_count==1 )
			{
				if ( is_struct(arg) )
				{
					paramArray = [ arg.x, arg.y ];
				}
				else
				{
					paramArray = [ arg, arg ];
				}
			}
			
		#endregion
		#region Set values
		
			x=paramArray[0]; 
			y=paramArray[1];
			
		#endregion
		
	#endregion
	#region Math Functions
		
		#region Arithmetical functions
		
			static multiply			= function(val)
			{
				///@func multiply(value_or_vec)
				var v = new Vec2(val);
				x*=v.x;
				y*=v.y;
				return self;
			}
			static add				= function(val)
			{
				///@func add(value_or_vec)
				var v = new Vec2(val);
				x+=v.x;
				y+=v.y;
				return self;
			}
			static subtract			= function(val)
			{
				///@func subtract(value_or_vec)
				var v = new Vec2(val);
				x-=v.x;
				y-=v.y;
				return self;
			}
			static divide			= function(val)
			{
				///@func divide(value_or_vec)
				var v = new Vec2(val);
				x/=v.x;
				y/=v.y;
				return self;
			}
			static modulo			= function(val)
			{
				///@func modulo(value_or_vec)
				var v = new Vec2(val);
				x%=v.x;
				y%=v.y;
				return self;
			}
			
		#endregion
		#region Advanced functions
		
			static length_squared	= function()
			{
				///@func length_squared()
				return x*x+y*y;
			}
			static length			= function()
			{
				///@func length()
				return sqrt(length_squared());
			}	
			static normalize		= function()
			{
				///@func normalize()
				var mag = length();
				if ( mag == 0 ) {
					x=0; y=0;
				}
				else
				{
					divide(mag);
				}
				return self;
			}
			static is_normalized	= function()
			{
				///@func is_normalized()
				return ( length_squared() == 1 );
			}
			static inverse			= function()
			{
				///@func inverse()
				return new Vec2(1/x, 1/y);
			}		
			static dot				= function(val)
			{
				///@func dot(value_or_vec)
				var v = new Vec2(val);
				return dot_product(x,y,v.x,v.y);
			}
			static dot_normalized	= function(val)
			{
				///@func dot_normalized(value_or_vec)
				var v = new Vec2(val);
				return dot_product_normalized(x,y,v.x,v.y);
			}			
			static distance_to		= function(val)
			{
				///@func distance_to(value_or_vec)
				var v = new Vec2(val);
				var v2 = new Vec2(x,y);
				
				v.subtract(v2);
				return v.length();
			}
			static angle_to			= function(val)
			{
				///@func angle_to(value_or_vec)
				var v = new Vec2(val);
				return point_direction(x,y,v.x,v.y);
			}
			static lerp_to			= function(val,amt)
			{
				///@func lerp_to(value_or_vec, amount)
				var v = new Vec2(val);
				x=lerp(x,v.x,amt);
				y=lerp(y,v.y,amt);
				return self;
			}
			static reflect			= function(val)
			{
				///@func reflect(normal);
				var v = new Vec2(val);
				v.normalize();
				
				var d = dot(v);
				v.multiply(2*d);
				v.subtract(new Vec2(x,y));
				return v;
			}	
			static clamp_to			= function(v1, v2)
			{
				///@func clamp_to(min, max)
				x = clamp(x, v1, v2);
				y = clamp(y, v1, v2);
				return self;
			}
			
			static vec_abs			= function()
			{
				///@func vec_abs()
				return new Vec2(abs(x),abs(y));
			}
			static vec_floor		= function()
			{
				///@func vec_floor()
				return new Vec2(floor(x),floor(y));
			}
			static vec_ceil			= function()
			{
				///@func vec_ceil()
				return new Vec2(ceil(x),ceil(y));	
			}
			static vec_sign			= function()
			{
				///@func vec_sign()
				return new Vec2(sign(x),sign(y));	
			}
			static vec_round		= function()
			{
				///@func vec_round()
				return new Vec2(round(x),round(y));	
			}
			
		#endregion
	#endregion
}
function Vec3() constructor
{
	#region Initialize Vector
	
		__IS_VEC_3 = true;
				
		#region Setup
		
			// Set available parameters
			var paramArray = array_create(3,0);
			for ( var i=0; i<argument_count; i++ )
			{
				paramArray[@i] = argument[i];
			}
			
		#endregion	
		#region Position[0] handling
		
			var arg = argument[0];
			if ( argument_count>0 )
			{
				if ( is_struct(arg) )
				{
					if ( arg.__IS_VEC_3 )
					{
						paramArray = [ arg.x,arg.y,arg.z ];
					}
					else
					{
						if ( argument_count < 2 ) 
						{
							throw("Invalid use of 'Vec2' for 'Vec3'\nYou must supply a value to the 'z' parameter!\nExample: Vec3(Vec2(0), 0)");
							paramArray = [ arg.x, arg.y, 0 ];
						}
						paramArray = [ arg.x, arg.y, argument[1] ];
					}
				}
				else
				{
					if( argument_count==1 )
					{
						paramArray = [ arg, arg, arg ];
					}
				}
			}
			else
			{
				show_debug_message("WARNING!! - An empty 'Vec3' was created! results: { x: 0, y: 0, z: 0 }");
			}
			
		#endregion
		#region Set values
		
			x=paramArray[0]; 
			y=paramArray[1];
			z=paramArray[2];
			
			xy = new Vec2(x, y);
			yx = new Vec2(y, x);
			
			static __UpdateVec2Status=function()
			{
				xy.x = x;
				xy.y = y;
				yx.x = y;
				yx.y = x;
			}
			
		#endregion
		
	#endregion
	#region Math Functions
		
		#region Arithmetical functions
		
			static multiply			= function(val)
			{
				///@func multiply(value_or_vec)
				var v = new Vec3(val);
				x*=v.x;
				y*=v.y;
				z*=v.z;
				__UpdateVec2Status();
				return self;
			}
			static add				= function(val)
			{
				///@func add(value_or_vec)
				var v = new Vec3(val);
				x+=v.x;
				y+=v.y;
				z+=v.z;
				__UpdateVec2Status();
				return self;
			}
			static subtract			= function(val)
			{
				///@func subtract(value_or_vec)
				var v = new Vec3(val);
				x-=v.x;
				y-=v.y;
				z-=v.z;
				__UpdateVec2Status();
				return self;
			}
			static divide			= function(val)
			{
				///@func divide(value_or_vec)
				var v = new Vec3(val);
				x/=v.x;
				y/=v.y;
				z/=v.z;
				__UpdateVec2Status();
				return self;
			}
			static modulo			= function(val)
			{
				///@func modulo(value_or_vec)
				var v = new Vec3(val);
				x%=v.x;
				y%=v.y;
				z%=v.z;
				__UpdateVec2Status();
				return self;
			}
			
		#endregion
		#region Advanced functions
		
			static length_squared	= function()
			{
				///@func length_squared()
				return x*x+y*y+z*z;
			}
			static length			= function()
			{
				///@func length()
				return sqrt(length_squared());
			}	
			static normalize		= function()
			{
				///@func normalize()
				var mag = length();
				if ( mag == 0 ) {
					x=0; y=0; z=0;
				}
				else
				{
					divide(mag);
				}
				__UpdateVec2Status();
				return self;
			}
			static is_normalized	= function()
			{
				///@func is_normalized()
				return ( length_squared() == 1 );
			}
			static inverse			= function()
			{
				///@func inverse()
				return new Vec3(1/x, 1/y, 1/z);
			}
			static cross			= function(val)
			{
				///@func cross(value_or_vec)
				var v = new Vec3(val);
				return new Vec3(
					(y*v.z)-(z*v.y),
					(z*v.x)-(x*v.z),
					(x*v.y)-(y*v.x)
				);
			}			
			static dot				= function(val)
			{
				///@func dot(value_or_vec)
				var v = new Vec3(val);
				return dot_product_3d(x,y,z,v.x,v.y,v.z);
			}
			static dot_normalized	= function(val)
			{
				///@func dot_normalized(value_or_vec)
				var v = new Vec3(val);
				return dot_product_3d_normalized(x,y,z,v.x,v.y,v.z);
			}			
			static distance_to		= function(val)
			{
				///@func distance_to(value_or_vec)
				var v = new Vec3(val);
				var v2 = new Vec3(x,y,z);
				
				v.subtract(v2);
				v.__UpdateVec2Status();
				return v.length();
			}
			static angle_to			= function(val)
			{
				///@func angle_to(value_or_vec)
				var v = new Vec3(val);
				return arctan2(cross(v).length, dot(v));
			}
			static lerp_to			= function(val,amt)
			{
				///@func lerp_to(value_or_vec, amount)
				var v = new Vec3(val);
				x=lerp(x,v.x,amt);
				y=lerp(y,v.y,amt);
				z=lerp(z,v.z,amt);
				__UpdateVec2Status();
				return self;
			}
			static reflect			= function(val)
			{
				///@func reflect(normal);
				var v = new Vec3(val);
				v.normalize();
				
				var d = dot(v);
				v.multiply(2*d);
				v.subtract(new Vec3(x,y,z));
				v.__UpdateVec2Status();
				return v;
			}	
			static clamp_to			= function(v1, v2)
			{
				///@func clamp_to(min, max)
				x = clamp(x, v1, v2);
				y = clamp(y, v1, v2);
				z = clamp(z, v1, v2);
				return self;
			}
			
			static vec_abs			= function()
			{
				///@func vec_abs()
				return new Vec3(abs(x),abs(y),abs(z));
			}
			static vec_floor		= function()
			{
				///@func vec_floor()
				return new Vec3(floor(x),floor(y),floor(z));
			}
			static vec_ceil			= function()
			{
				///@func vec_ceil()
				return new Vec3(ceil(x),ceil(y),ceil(z));	
			}
			static vec_sign			= function()
			{
				///@func vec_sign()
				return new Vec3(sign(x),sign(y),sign(z));	
			}
			static vec_round		= function()
			{
				///@func vec_round()
				return new Vec3(round(x),round(y),round(z));	
			}
			
		#endregion
	#endregion
}