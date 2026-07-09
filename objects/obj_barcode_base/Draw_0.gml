for(var i=0; i<array_length(bits); i++){
    draw_set_colour(bits[i] == 1 ? one_color: zero_color);
    draw_rectangle(x+i*bar_width, y, x+(i+1)*bar_width, y+bar_height, false);
    draw_flush();
}