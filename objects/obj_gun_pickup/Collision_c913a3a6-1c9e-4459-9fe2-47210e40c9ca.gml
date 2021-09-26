/// @description Equip Gun
global.hasgun=true;
instance_create_layer(obj_player.x,obj_player.y,"inst_gun",obj_gun);//give gun
instance_destroy();
