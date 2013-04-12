		call	set_black_screen	set_black_screen_ra
		cp	str_copy_from		string_from_dict_ptr
		cp	str_copy_to		draw_str_ptr
		call	str_copy		str_copy_ra
		cp	ufo_x			ufo_x_start
		cp	ufo_y			ufo_y_start
ufo_loop2	call	draw_ufo		draw_ufo_ra
		in	5			clock_start
end_chk		in	5			clock_end
		be	end			ufo_y			NUM418
		sub	clock_diff		clock_end		clock_start
		bne	end_chk			clock_diff		NUM2
erase		call	erase_function		erase_function_ra
		add	ufo_y			ufo_y			NUM2
		be	ufo_loop2		0			0
end		call	erase_function		erase_function_ra
		halt			


ufo_x_start		.data	30
ufo_y_start		.data	30
string_from_dict	.data	111
			.data	120
			.data	121
			.data	109
			.data	111
			.data	114
			.data	111
			.data	110
			.data	115
			.data	0
			.data	0
string_from_dict_ptr	.data	string_from_dict
clock_start		.data	0
clock_end		.data	0
clock_diff		.data	0

#include ufo_function.e
#include ../shared_libs/str_help.e
