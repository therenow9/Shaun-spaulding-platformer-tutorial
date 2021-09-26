/// @description Control menu

//item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//keyboard controls

if(menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor>=menu_items) menu_cursor=0;
	}
		if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor<0) menu_cursor=menu_items-1;//make menu loop around if you go down after the quit option
	
	}
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_target=gui_width+200;
		menu_committed=menu_cursor;
		scr_screen_shake(4,30);
		menu_control=false;
		audio_play_sound(snd_death,10,false)
	}
	
	var mouse_y_gui=device_mouse_y_to_gui(0);//mouse position on gui not room position
	if (mouse_y_gui <menu_y) and (mouse_y_gui >menu_top)
	{
		menu_cursor= (menu_y-mouse_y_gui) div (menu_item_height *1.5);//div returns int
		
		if(mouse_check_button_pressed(mb_left))
		{
		menu_x_target=gui_width+200;
		menu_committed=menu_cursor;
		scr_screen_shake(4,30);
		menu_control=false;
		audio_play_sound(snd_death,10,false)
		}
	}
	
}

if (menu_x>gui_width+150) and (menu_committed !=-1)
{
	switch (menu_committed)
	{
		case 2: scr_slide_transition(TRANS_MODE.NEXT); break;
		case 1:
		{
			if (!file_exists(SAVEFILE))
			{
				scr_slide_transition(TRANS_MODE.NEXT);	
			}
			else
			{
				var file =file_text_open_read(SAVEFILE);
				var target=file_text_read_real(file);//read first a 
				global.kills=file_text_read_real(file);
				global.hasgun=file_text_read_real(file);
				file_text_close(file);
				scr_slide_transition(TRANS_MODE.GOTO,target);
			}
		}
		break;
		
		case 0: game_end(); break;
		
	}
	
}
