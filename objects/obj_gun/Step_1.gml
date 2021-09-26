/// @description gun stuff
x=obj_player.x;
y=obj_player.y+10;//put gun at player's hands



if (obj_player.controller==0)//only use mouse if controller is false
{
image_angle=point_direction(x,y,mouse_x,mouse_y);//gun points towards mouse
}
else
{
	var controller_h=gamepad_axis_value(0,gp_axisrh);//second analog stick aiming
	var controller_v=gamepad_axis_value(0,gp_axisrv);
	if(abs(controller_h)>0.2) or (abs(controller_v) > 0.2)
	{
		controller_angle=point_direction(0,0,controller_h,controller_v)//controller stick dead zones	
		
	}
	image_angle=controller_angle;
}

firing_delay-=1;//reduce every single frame 

if ((mouse_check_button(mb_left))  or gamepad_button_check(0,gp_shoulderrb)  ) and (firing_delay <0)
{
	recoil=4;
	firing_delay=5;//makes the firing delay 5 frames
	scr_screen_shake(2,10);//screen shake when you shoot gun
	audio_sound_pitch(snd_shoot,choose(0.8,1.0,1.2));
	audio_play_sound(snd_shoot,5,false);
	with (instance_create_layer(x,y,"inst_bullets",obj_bullet))
	{
		spd=25;//bullet speed bc speed is set right away it moves 25 pixels before it is even drawn for the first time
		direction=other.image_angle+random_range(-3,3)//angle of gun randomize bullets a little to make it look polished
		image_angle=direction;
	}
	
	with (obj_player)
	{
		gunkick_x=lengthdir_x(1.5,other.image_angle-180);
		gunkick_y=lengthdir_y(1,other.image_angle-180);
	}
}

recoil=max(0,recoil-1);//make sure we don't go below zero

x-=lengthdir_x(recoil,image_angle);//length dir helps with pythagorean theorem
y-=lengthdir_y(recoil,image_angle);

if(image_angle>90) and (image_angle <270)//turn gun around with you
{
image_yscale=-1;
}
else
{
	image_yscale=1;
}

