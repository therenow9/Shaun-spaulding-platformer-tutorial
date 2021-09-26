/// @description update camera

//update destination
if(instance_exists(follow))
{
x_to=follow.x;
y_to=follow.y;

if((follow).object_index=obj_player_dead)
	{
		x=x_to;
		y=y_to;
	}
}

//update object position
x+=(x_to-x)/25;//last number determines speed at which camera moves
y+=(y_to-y)/25;
//keep camera inside room
x=clamp(x,view_w_half+buff,room_width-view_w_half);//clamp camera at room border makes camera border 1 tile closer in
y=clamp(y,view_h_half+buff,room_height-view_h_half);

//screen shake
x+=random_range(-shake_remain,shake_remain);
y+=random_range(-shake_remain,shake_remain);
shake_remain=max(0,shake_remain-((1/shake_length)*shake_magnitude));//decrease shake remain every frame

//update camera view]
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
if (room!=rm_menu) and (room!=rm_ending)
{
	if(layer_exists("background_mountains"))//parallax scrolling
	{
		layer_x("background_mountains",x/2);
	}

	if(layer_exists("background_trees"))//parallax scrolling
	{
		layer_x("background_trees",x/4);
	}
}