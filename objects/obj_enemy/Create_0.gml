/// @description 
if (has_weapon)
{
	my_gun=instance_create_layer(x,y,"inst_gun",obj_enemy_gun)	
	with(my_gun)
	{
		owner=other.id;	
		
	}
}
else my_gun=noone;
