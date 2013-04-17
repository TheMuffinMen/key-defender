//This programs is going to test the which_character file to see how well it draws each letter
start		call	set_black_screen	set_black_screen_ra
		cp	str_x_start	NUM10
		cp	str_y_start	NUM10
loop_test_str	cpfa	curr_char	str_test	i_str_test
		be	func_call	curr_char	NUM0
		cpta	curr_char	draw_str	i_str_test
incr_test	add	i_str_test	i_str_test	NUM1
		be	loop_test_str	0		0
func_call	call	draw_string	draw_string_ra
end		halt

#include which_character.e
i_str_test	.data	0
curr_char	.data	0
str_test	.data	48
		.data	49
		.data	50
		.data	51
		.data	52
		.data	7
		.data	55
		.data	55
		.data	56
		.data	57
		.data	0	
		.data	0
