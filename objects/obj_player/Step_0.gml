/// @description 

#region//input variables
if(hascontrol)// if not in cutscene
	{
	input_left=keyboard_check(ord("A"))|| keyboard_check(vk_left);
	input_right=keyboard_check(ord("D"))|| keyboard_check(vk_right);
	input_run=keyboard_check(vk_shift);
	input_jump=keyboard_check_pressed(vk_space);

	if (input_left) or (input_right) or (input_jump) or (input_run)//knows we are using keyboard
	{
	controller=0;	
	}

	if (abs(gamepad_axis_value(0,gp_axislh))>0.2)//returns where left analog stick is in horizonatl axis
	{//must push more than 0.2 (deadzone) to return a value
	input_left=abs(min(gamepad_axis_value(0,gp_axislh),0));//abs used to return negative,min is smallest value between axis and zero
	input_right=max(gamepad_axis_value(0,gp_axislh),0);//ca't set things to be negative like keyboard keys
	controller=1;//controller is being used

	}
	if (gamepad_button_check_pressed(0,gp_shoulderr))
	{
	input_jump=1;
	controller=1;
	
	}
}
else//update when it takes control away from the player
{
	input_right=0;
	input_left=0;
	input_jump=0;
}
#endregion
#region run stuff
if input_run
{
controller=0;
run=1.5
}
else {run=1}
if (gamepad_button_check(0,gp_shoulderl))//gamepad run button
{
run=1.5
input_run=1;
controller=1;
}
else
{
	run=1
}
walksp=4*run;//walk speed

#endregion

#region // calculate movement
//input-input prevents both from happening simultaneously
var move_horizontal=input_right-input_left;

//movement
hsp=(move_horizontal* walksp) +gunkick_x;
gunkick_x=0;

vsp= (vsp+grv)+gunkick_y//gravity ex falling
gunkick_y=0;

//jump if you are on the floor
can_jump-=1;
if(can_jump>0) && (input_jump)
{
	can_jump=0;
	vsp=-7;
}
#endregion

//Horizontal Collision 
if  (place_meeting(x+hsp,y,obj_wall))
{
	while(!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x+=sign(hsp);
	}
	hsp=0;

}
x+=hsp


//Vertical Collision 
if  (place_meeting(x,y+vsp,obj_wall))
{
	while(!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y+=sign(vsp);
	}
	vsp=0;

}
y+=vsp


//animation stuff
var aimside=sign(mouse_x-x);
if (aimside!=0) image_xscale=aimside;
if (!place_meeting(x,y+1,obj_wall))//if there isnt a collision one pixel below us
{
	sprite_index=spr_player_air;
	image_speed=0;
	if (sign(vsp)>0) image_index=1; else image_index=0;
	
}
else//if we are touching the floor
{
	can_jump=10;
	if(sprite_index==spr_player_air) 
	{
		audio_sound_pitch(snd_landing,choose(0.8,1.0,1.2));
		audio_play_sound(snd_landing,4,false)
		repeat (5)
		{
			with (instance_create_layer(x,bbox_bottom,"inst_bullets",obj_dust))
			{
				vsp=0;
			}
		}
	}
	image_speed=1;
	if (hsp==0)//idle
	{
	sprite_index=spr_player;
	}
	else//running
	{
		sprite_index=spr_player_run;
		if (aimside!=sign(hsp)) sprite_index=spr_player_run_flipped
	}
	
}

//if (hsp !=0) image_xscale=sign(hsp); //mirror sprite to the left

