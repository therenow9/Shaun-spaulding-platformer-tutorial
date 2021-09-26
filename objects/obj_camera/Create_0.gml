/// @description setup camera
/*
view_enabled=true;//enable viewports through code
view_visible[0]=true;
view_wport[0]=1024;//set viewport width size
view_hport[0]=768;// set viewport height size
camera_set_view_size(view_camera[0],1024,768);
*/
cam=view_camera[0];
follow=obj_player;

view_w_half=camera_get_view_width(cam)*0.5;
view_h_half=camera_get_view_height(cam)*0.5;

x_to=xstart;//x and y coordinates we will be moving to
y_to=ystart;
//screen shake stuff
shake_length=0;
shake_magnitude=0;//shake radius # of pixels
shake_remain=0;//how much we have left, once hits 0 shake stops
buff=0;//buffer to camera pos 