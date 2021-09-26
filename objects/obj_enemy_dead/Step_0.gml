/// @description-collisions
if(done==0)
	{
	vsp+=grv;//gravity ex falling


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
		if (vsp>0) 
		{
		done=1;//if we found vertical collision done is 1
		image_index=1;//set to second frame of dead sprite
		}
		while(!place_meeting(x,y+sign(vsp),obj_wall))
		{
			y+=sign(vsp);
		}
		vsp=0;

	}
	y+=vsp
}