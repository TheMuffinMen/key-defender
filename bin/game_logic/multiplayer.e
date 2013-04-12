		call	set_black_screen	set_black_screen_ra
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		call	ufo_draw_loop		ufo_draw_loop_ra
ufo_loop2	in	5			clock_start
end_chk		in	5			clock_end
		be	end			ufo_y			NUM418
		sub	clock_diff		clock_end		clock_start
		bne	end_chk			clock_diff		NUM2
		cp	ufo_i			NUM0
		cp	ufo_erase		NUM1
		call	ufo_draw_loop		ufo_draw_loop_ra
		be	ufo_loop2		0			0
end		halt	
		
ufo_draw_loop	be	ufo_draw_ret		ufo_i			NUM10
		cpfa	ufo_cur			ufo_objects		ufo_i
		add	ufo_i			ufo_i			NUM1
		cpfa	ufo_deref		0			ufo_cur
		be	ufo_draw_loop		ufo_deref		NUM0
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		cp	str_copy_from		ufo_deref
		cp	str_copy_to		draw_str_ptr
		call	str_copy		str_copy_ra
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		cp	ufo_x			ufo_deref
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		cp	ufo_y			ufo_deref
		be	not_erase		ufo_erase		NUM0
		cp	erase_x			ufo_x
		cp	erase_y			ufo_y
		call	erase_function		erase_function_ra
		add	ufo_y			ufo_y			NUM2
		cpta	ufo_y			0			ufo_cur
not_erase	call	draw_ufo		draw_ufo_ra
		be	ufo_draw_loop		0			0
ufo_draw_ret	ret	ufo_draw_loop_ra


ufo_i		.data	0
ufo_cur		.data	0
ufo_deref	.data	0
ufo_draw_loop_ra	.data	0
ufo_erase	.data	0
clock_start	.data	0
clock_end	.data	0
clock_diff	.data	0
ufo_objects	.data	ufo1
		.data	ufo2
		.data	ufo3
		.data	ufo4
		.data	ufo5
		.data	ufo6
		.data	ufo7
		.data	ufo8
		.data	ufo9
		.data	ufo10
		
ufo1		.data	1
		.data	ufo_str1
		.data	30
		.data	10
ufo2		.data	1
		.data	ufo_str2
		.data	197
		.data	10
ufo3		.data	1
		.data	ufo_str3
		.data	364
		.data	10
ufo4		.data	1
		.data	ufo_str4
		.data	531
		.data	10
ufo5		.data	1
		.data	ufo_str5
		.data	30
		.data	80
ufo6		.data	1
		.data	ufo_str6
		.data	197
		.data	80
ufo7		.data	1
		.data	ufo_str7
		.data	364
		.data	80
ufo8		.data	1
		.data	ufo_str8
		.data	531
		.data	80
ufo9		.data	0
		.data	ufo_str9
		.data	0
		.data	0
ufo10		.data	0
		.data	ufo_str10
		.data	0
		.data	0
		
ufo_str1	.data	111
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
ufo_str2	.data	111
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
ufo_str3	.data	111
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
ufo_str4	.data	111
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
ufo_str5	.data	111
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
ufo_str6	.data	111
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
ufo_str7	.data	111
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
ufo_str8	.data	111
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
ufo_str9	.data	0
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
ufo_str10	.data	0
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

#include ../vga_driver/ufo_function.e
#include ../shared_libs/str_help.e
