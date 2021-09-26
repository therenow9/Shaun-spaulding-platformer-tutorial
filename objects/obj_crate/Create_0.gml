/// @description 
mywall=instance_create_layer(x,y,layer,obj_wall);
with(mywall)
{	
	image_xscale=other.sprite_width/sprite_width;//make it same size as crate
	image_yscale=other.sprite_height/sprite_height;
}