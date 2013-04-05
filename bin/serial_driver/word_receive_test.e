			call 	init_serial 		init_serial_ra
loop			//	be 	ender 			read_total 		stop_total
			call 	check_serial 		check_serial_ra
			be 	loop 			check_serial_exist 	NUM0
			be	print_received_array	check_serial_data	NUM0
			cpta 	check_serial_data 	receive_array		read_total
			add 	read_total 		read_total 		NUM1
			be 	loop 			0 			0
print_received_array	call	set_black_screen	set_black_screen_ra
			cp	str_x_start		NUM10
			cp	str_y_start		NUM10
			cp	str_copy_from		receive_array_ptr
			cp	str_copy_to		draw_str_ptr
			call	str_copy		str_copy_ra
			call	draw_string		which_char_ra 
ender			halt


read_total		.data 	0
stop_total		.data 	7
receive_array		.data 	0
			.data 	0
			.data 	0
			.data 	0
			.data 	0
			.data 	0
			.data 	0
			.data 	0
			.data 	0
			.data 	0
			.data 	0
receive_array_ptr	.data	receive_array

//Parameters str_copy_from, str_copy_to
str_copy		cp 	str_copy_index 	NUM0
str_copy_loop		cpfa 	str_copy_elt	0 		str_copy_from
			cpta 	str_copy_elt 	0 		str_copy_to
			be 	str_copy_ret 	str_copy_elt 	NUM0
			add 	str_copy_from 	str_copy_from 	NUM1
			add 	str_copy_to 	str_copy_to 	NUM1
			be 	str_copy_loop 	0 		0
str_copy_ret	ret str_copy_ra

str_copy_from	.data 0
str_copy_to		.data 0
str_copy_elt	.data 0
str_copy_index	.data 0
str_copy_ra		.data 0

#include serial_driver.e
#include ../vga_driver/which_character.e
