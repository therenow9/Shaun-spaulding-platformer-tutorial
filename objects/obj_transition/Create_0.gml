/// @description Size variables and mode setup
w=display_get_gui_width();//rectangle transition
h=display_get_gui_height();
h_half=h*0.5;
enum TRANS_MODE
{
OFF,
NEXT,
GOTO,
RESTART,
INTRO
}

mode=TRANS_MODE.INTRO;
percent=1;//whole screen covered in black
target=room;//holds room transition goes too
