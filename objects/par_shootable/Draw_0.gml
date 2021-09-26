/// @description 
draw_self();

if(flash>0)
{
	flash--;//reset flash
	shader_set(sha_white);//sets shader
	draw_self();//default draw stuff
	shader_reset();//resets to default draw event
}