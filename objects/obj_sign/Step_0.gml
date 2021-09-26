/// @description display text on right mouse click when player is close to sign
if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) and (!instance_exists(obj_text))
{
	if (keyboard_check_pressed(ord("W")))
	{
		with (instance_create_layer(x,y-64,layer,obj_text))
		{
		text=other.text;
		length=string_length(text);
	
		}
		with (obj_camera)
		{
		follow=other.id;	
		
		}
	}
	
}else nearby=false;
