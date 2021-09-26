/// @description shoot at player
x=owner.x;
y=owner.y+10;

image_xscale=abs(owner.image_xscale);
image_yscale=abs(owner.image_yscale);

if (instance_exists(obj_player))
{
	if (obj_player.x<x) image_yscale=-image_yscale;
	if (point_distance(obj_player.x,obj_player.y,x,y)<600)
	{
		image_angle=point_direction(x,y,obj_player.x,obj_player.y);
		countdown--;
		if (countdown<=0)
		{
			if(!collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,false))//make it so enemy won't try to shoot through walls at player etc
			countdown=countdown_rate;//40
			audio_sound_pitch(snd_shoot,choose(0.8,1.0,1.2));
			audio_play_sound(snd_shoot,5,false);
			with (instance_create_layer(x,y,"inst_bullets",obj_enemy_bullet))
			{
				spd=10;//bullet speed bc speed is set right away it moves 25 pixels before it is even drawn for the first time
				direction=other.image_angle+random_range(-3,3)//angle of gun randomize bullets a little to make it look polished
				image_angle=direction;
			}
		}
	}
}

