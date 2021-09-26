/// @description auto save

//overwrite old save
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

//create new save
var file;//store id of file we opened
file=file_text_open_write(SAVEFILE);
file_text_write_real(file,room);
file_text_write_real(file,global.kills);
file_text_write_real(file,global.hasgun);
file_text_close(file);