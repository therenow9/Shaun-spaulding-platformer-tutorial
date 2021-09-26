/// @description 
if(hp<=0)
{
	
	with(instance_create_layer(x,y,layer,obj_enemy_dead))// create dead enemy when hp=0;
	{
	direction=other.hitfrom;//enemies hit from applies to obj deads distance
	hsp=lengthdir_x(3,direction);
	vsp=lengthdir_y(3,direction)-2;//-2 makes body jump up
	if (sign(hsp) !=0) 
		{
			image_xscale=sign(hsp)*other.size//opposite of horizontal
			image_yscale=other.size;
		}
	}
	with (my_gun) instance_destroy();
	if (instance_exists(obj_player))
	{
		global.kills++;	
		global.killsthisroom++;
		with (obj_game) kill_text_scale=2;
	}
	instance_destroy();//kill enemy
}