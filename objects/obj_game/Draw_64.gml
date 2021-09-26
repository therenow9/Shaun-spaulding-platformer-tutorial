/// @description Draw Score
if (room != rm_menu) and (instance_exists(obj_player)) and (global.kills >0)
{
	kill_text_scale=max(kill_text_scale *0.95,1);
	scr_draw_set_text(c_black,fnt_menu,fa_right,fa_top);
	draw_text_transformed(RES_W-8,12,string(global.kills) + "Pointless Murders: (",kill_text_scale,kill_text_scale,0)
	draw_set_color(c_white);
	draw_text_transformed(RES_W-10,10,string(global.kills) + "Pointless Murders: (",kill_text_scale,kill_text_scale,0)
}
 
