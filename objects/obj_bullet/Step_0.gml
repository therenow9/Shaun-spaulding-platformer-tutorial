/// @description make sure we destroy bullet after it is drawn
x+=lengthdir_x(spd,direction);
y+=lengthdir_y(spd,direction);
if (place_meeting(x,y,par_shootable))
{
	with (instance_place(x,y,par_shootable))// instance id of specific enemy collding with if i did obj enemy it would do it to all enemies
	{
		hp--;//subtractsby 1 ++ adds by 1
		flash=3;
		hitfrom=other.direction;//other.other refers back to bullet//applies to enemy makes their direction the sae as bullet direction
	}
	instance_destroy();
}


if (place_meeting(x,y,obj_wall)) and (image_index!=0)
{
	while (place_meeting(x,y,obj_wall))
	{
	x-=lengthdir_x(1,direction);//subtract direction, space game?
	y-=lengthdir_y(1,direction);
	}
	
	spd=0;
	instance_change(obj_hit_spark,true);
	layer_add_instance("tiles_tileset",id);
	depth+=1;
}