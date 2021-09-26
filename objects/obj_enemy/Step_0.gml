/// @description 
if (global.hasgun==true) has_weapon=true; 
vsp+=grv;//gravity ex falling

//don"t walk off edges
if (grounded==true) and (afraid_of_heights==true) and (!place_meeting(x+hsp,y+1,obj_wall))
{
	hsp=-hsp;//flips directiona
}

//Horizontal Collision 
if  (place_meeting(x+hsp,y,obj_wall))
{
	while(!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x+=sign(hsp);
	}
	hsp=-hsp;//flips direction when they hit a wall

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
if (!place_meeting(x,y+1,obj_wall))//if there isnt a collision one pixel below us
{
	grounded=false;//less expesnive then a collision check
	sprite_index=spr_enemy_air;
	image_speed=0;
	if (sign(vsp)>0) image_index=1; else image_index=0;
	
}
else//if we are touching the floor
{
	grounded=true;
	image_speed=1;
	if (hsp==0)//idle
	{
	sprite_index=spr_enemy;
	}
	else//running
	{
		sprite_index=spr_enemy_run;
	}
	
}

if (hsp !=0)
{
	image_xscale=sign(hsp)*size; //mirror sprite to the left
	image_yscale=size;
}
