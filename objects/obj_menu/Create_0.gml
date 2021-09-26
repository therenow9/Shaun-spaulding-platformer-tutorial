/// @description GUI Vars/ Menu Setup

#macro SAVEFILE "Save.sav" //savefile name

gui_width=display_get_gui_width();
gui_height=display_get_gui_height();
gui_margin=32;

menu_x=gui_width;//+200;
menu_y=gui_height-gui_margin;

menu_x_target=gui_width-gui_margin;
menu_speed=25;//lower is faster
menu_font=fnt_menu;
menu_item_height=font_get_size(menu_font);
menu_committed=-1;//what option you are hovering over
menu_control=true;//do we have control of the menu

menu[2]="New Game"
menu[1]="Continue";
menu[0]="Quit";

menu_items=array_length_1d(menu);//how many menu options are there

menu_top=menu_y-((menu_item_height*1.5) *menu_items);

menu_cursor=2;
