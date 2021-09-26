/// @description Move to next room

with (obj_player)
{
	if (hascontrol)
	{
		hascontrol=false;
		scr_slide_transition(TRANS_MODE.GOTO,other.target);
	
	}
}