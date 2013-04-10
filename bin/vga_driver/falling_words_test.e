			call	set_black_screen	set_black_screen_ra
			cp	str_x_start		NUM10
			cp	str_y_start		NUM10
			cp	array_xstart		str_x_start
			cp	array_ystart		str_y_start
			cp	str_copy_from		falling_array_ptr
			cp	str_copy_to		draw_str_ptr
			call	str_copy		str_copy_ra
print_moved_array	call	draw_string		which_char_ra
			in	5			clock_start
clock_end_check		in	5			clock_end
			be	end			clock_end		NUM30000
			sub	clock_diff		clock_end		clock_start
			bne	clock_end_check		clock_diff		NUM50
clear_command		call	clear_array		clear_array_ra
			cp	str_y_start		array_yend
			cp	drawstr_i		NUM0
			be	print_moved_array	NUM1			NUM1
end			halt
	
		
		
falling_array		.data	97
			.data	99
			.data	101
			.data	0
			.data	0
			.data	0
			.data	0
			.data	0
			.data	0
			.data	0
			.data	0
			.data	0
falling_array_ptr	.data	falling_array
array_val		.data	0
length_i		.data	0
clock_start		.data	0
clock_end		.data	0
clock_diff		.data	0

#include which_character.e
#include ../shared_libs/str_help.e
