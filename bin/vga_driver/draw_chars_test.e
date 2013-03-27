//This programs is going to test the which_character file to see how well it draws each letter
start		call	set_black_screen	set_black_screen_ra
		cp	str_x_start	NUM10
		cp	str_y_start	NUM10	
func_call	call	draw_str	which_char_ra
end		halt

#include which_character.e
