/// @description 
hsp=0;
vsp=0;
grv=0.2;
done=0;

scr_screen_shake(6,25);//shake screen when enemy dies

image_speed=0;//control frame of sprite
image_index=0;
scr_screen_shake(6,60);
audio_play_sound(snd_death,10,false);
game_set_speed(30,gamespeed_fps);//slow mo death effect
with(obj_camera) follow=other.id;
