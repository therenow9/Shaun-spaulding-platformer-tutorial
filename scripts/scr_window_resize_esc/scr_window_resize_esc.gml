//toggle fullscreen with escape
if (keyboard_check_pressed(vk_escape))
    {
    if window_get_fullscreen()
        {
        window_set_fullscreen(false);
        }
    else
        {
        window_set_fullscreen(true);
        }
    }