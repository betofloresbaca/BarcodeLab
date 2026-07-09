// Drag logic
rectangle_width = array_length(bits) * bar_width;
rectangle_height = bar_height;
if(mouse_check_button_pressed(mb_left)){
    if(point_in_rectangle(mouse_x, mouse_y, x, y, x+rectangle_width, y+rectangle_width)){
        is_dragging = true;
        drag_offset_x = x - mouse_x;
        drag_offset_y = y - mouse_y;
    }
}
if(mouse_check_button_released(mb_left)){
    is_dragging = false;
}
if(is_dragging){
    x = mouse_x + drag_offset_x;
    y = mouse_y + drag_offset_y;
}