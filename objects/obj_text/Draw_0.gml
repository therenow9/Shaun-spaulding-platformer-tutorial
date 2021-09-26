/// @description 
var halfw=w*0.5;

//draw the box
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,15,15,false);
draw_sprite(spr_marker,0,x,y);
draw_set_alpha(1);//sets game back

//draw  text
scr_draw_set_text(c_white,fnt_menu,fa_center,fa_top);
draw_text(x,y-h-border,text_current);