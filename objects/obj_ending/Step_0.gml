/// @description 

//Move player towards center
layer_x("asset_title",min(layer_get_x("asset_title")+1,RES_W *0.5-32));

//PRogress text
letters+=spd;
text=string_copy(endtext[currentline],1,floor(letters));

//next line
if (letters>=length) and( keyboard_check_pressed(vk_anykey))
{
	if (currentline+1 == array_length_1d(endtext))
	{
		scr_slide_transition(TRANS_MODE.RESTART)	
		
	}
	else
	{
		currentline++;
		letters=0;
		length=string_length(endtext[currentline]);
		
	}
}