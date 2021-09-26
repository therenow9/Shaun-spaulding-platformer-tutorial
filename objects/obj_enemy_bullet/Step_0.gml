/// @description make sure we destroy bullet after it is drawn
x+=lengthdir_x(spd,direction);
y+=lengthdir_y(spd,direction);


if (place_meeting(x,y,obj_wall)) and (image_index!=0)
{
	while (place_meeting(x,y,obj_wall))
	{
	x-=lengthdir_x(1,direction);//subtract direction, space game?
	y-=lengthdir_y(1,direction);
	}
	spd=0;
	instance_change(obj_hit_spark,true);
}