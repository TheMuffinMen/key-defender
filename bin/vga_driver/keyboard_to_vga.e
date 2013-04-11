//This programs is going to test the which_character file to see how well it draws each letter
start		call	set_black_screen	set_black_screen_ra
		cp	str_x_start		NUM10
		cp	str_y_start		NUM10
		ret	start_ra
//break		call  	key_input    		key_input_ra
loop		call	key_response		key_response_ra
		be	loop			key_execute	NUM0
		be	loop			key_input_pressed	NUM1
		//	be	func_call		key_input_element	NUM32
		be	is32			key_input_element	NUM32
		cpta	key_input_element	element_array	i_input
		add	i_input			i_input		NUM1
		ret	loop_ra
func_call	cp	str_copy_from		element_array_ptr
		cp	str_copy_to		draw_str_ptr
		call	str_copy		str_copy_ra
		call	draw_string		which_char_ra 
		ret	func_call_ra

element_array	.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
element_array_ptr	.data	element_array
i_input		.data	0


//Parameters str_copy_from, str_copy_to
str_copy	cp 	str_copy_index 	NUM0
str_copy_loop	cpfa 	str_copy_elt 	0 		str_copy_from
		cpta 	str_copy_elt 	0 		str_copy_to
		be 	str_copy_ret 	str_copy_elt 	NUM0
		add 	str_copy_from 	str_copy_from 	NUM1
		add 	str_copy_to 	str_copy_to NUM1
		be 	str_copy_loop 	0 0
str_copy_ret	ret 	str_copy_ra

str_copy_from	.data 0
str_copy_to		.data 0
str_copy_elt	.data 0
str_copy_index	.data 0
str_copy_ra		.data 0

#include which_character.e
#include ../keyboard_driver/driver.e
