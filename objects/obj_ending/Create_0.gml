/// @description 
gun_sprite=layer_sprite_get_id("asset_title","gra_gun");
if (global.hasgun=true) and (global.kills>0)
{
	endtext[0]="Some madman slayed "+ string(global.kills) + "people.";	
	endtext[1]="Some of these people were strapped as well though...";
	endtext[2]="So maybe they deserved it possibly";
	endtext[3]="Either way, he's in the slammer for good now";	
	endtext[4]="His lawyer tried to say that the dope ass gun effects were at fault and stuff,\n but it didn't work";	
	endtext[5]="The ranger said that the dude was \"prolly off a xan the whole time.\"";	
	endtext[6]="End.";	
}
else
{
	layer_sprite_destroy(gun_sprite);
	endtext[0]="Today some dude was baked, and walked through the park having a grand old time\there were no casualties.";
	endtext[1]="He found a discarded assault rifle on the ground and turned it in\n the local authorities were stoked";
	endtext[2]="Seems like this was the right thing to do for sure\n it's what i would have done";
	endtext[3]="and it's a win cause he was stoned the whole time";
	endtext[4]="End.";
}

spd=0.5
letters=0;
currentline=0;
length=string_length(endtext[currentline]);
text="";