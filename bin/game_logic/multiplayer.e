		call	set_black_screen	set_black_screen_ra
		call	draw_play_screen	draw_play_screen_ra
		call	init_serial		init_serial_ra
		cp	serial_send_data	NUM12
		call	serial_send		serial_send_ra
ready_check	call	check_serial		check_serial_ra
		bne	ready_check		check_serial_exist	NUM1
		bne	ready_check		check_serial_data	NUM12
		call	key_init		key_init_ra
		cp	cur_mode		NUM0
		cp	user_str_len		NUM0
break		cp	sent_i			NUM0
		
		
game_loop	call	key_response		key_response_ra
		be	game_serial		key_execute		NUM0
		be	game_serial		key_input_pressed	NUM1
		be 	mode_change		key_input_element	NUM10
		be	eval_str		key_input_element	NUM32
		blt	game_serial		key_input_element	NUM97
		blt	add_char		key_input_element	NUM123
		be	game_serial		0			0
		
mode_change	be	cur_mode1		cur_mode		NUM1
		cp	cur_mode		NUM1
		cp	write_pixel_color	NUM3
		be	redraw_rect		0			0
		
cur_mode1	cp	cur_mode		NUM0
		cp	write_pixel_color	NUM12
		
redraw_rect	cp	write_pixel_x1		NUM0
		cp	write_pixel_y1		NUM470
		cp	write_pixel_x2		NUM640
		cp	write_pixel_y2		NUM480
		call	write_pixel		write_pixel_ra
		cp	write_pixel_x1		NUM0
		cp	write_pixel_y1		NUM20
		cp	write_pixel_x2		NUM640
		cp	write_pixel_y2		NUM21
		call	write_pixel		write_pixel_ra
		cp	write_pixel_x1		NUM319
		cp	write_pixel_y1		NUM419
		cp	write_pixel_x2		NUM321
		cp	write_pixel_y2		NUM420
		call	write_pixel		write_pixel_ra
		be	game_serial		0			0
		
eval_str	be	str_to_serial		cur_mode		NUM1
eval_loop	cp	ufo_i			NUM0
		be	clear_box		ufo_i			NUM10
		cpfa	ufo_cur			ufo_objects		ufo_i
		add	ufo_i			ufo_i			NUM1
		cpfa	ufo_deref		0			ufo_cur
		be	eval_loop		ufo_deref		NUM0
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		cp	str_comp_str1		ufo_deref
		cp	str_comp_str2		user_str_ptr
		call	str_comp		str_comp_ra
		bne	eval_loop		str_comp_result		NUM0
		sub	ufo_cur			ufo_cur			NUM1
		cpta	NUM0			0			ufo_cur
		add	ufo_cur			ufo_cur			NUM2
		cpfa	ufo_deref		0			ufo_cur
		cp	erase_x			ufo_deref
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		cp	erase_y			ufo_deref
		call	erase_function		erase_function_ra
		//  Place in "killed alien" sound
		be	eval_loop		0			0
		
str_to_serial	cp	str_copy_from		user_str_ptr
		cp	str_copy_to		dq_qstr_ptr
		cp	str_copy		str_copy_ra
		call	dic_query		dic_query_ra
		be	not_found_sound		dic_query_result	NUM0
		cp	str_copy_from		user_str_ptr
		cp	str_copy_to		str_send_ptr
		cp	str_copy		str_copy_ra
		call	str_send		str_send_ra
		// Play valid word (word sent) sound
		
		
not_found_sound	be	clear_box		0			0 
		// input sound for wrong word


clear_box	cp	erase_x			NUM256
		cp	erase_y			NUM454
		call	erase_typed		erase_typed_ra
		cp	user_str_len		NUM0
		be	game_serial		0			0
		
add_char	be	game_serial		user_str_len		NUM10
		cpta	key_input_element	user_str		user_str_len
		add	user_str_len		user_str_len		NUM1
		cp	str_x_start		NUM256
		cp	str_y_start		NUM454
		cp	str_copy_from		user_str_ptr
		cp	str_copy_to		draw_str_ptr
		call	str_copy		str_copy_ra
		call	draw_string		draw_string_ra
		be	game_serial		0			0
			
game_serial	call	check_serial		check_serial_ra
		be	game_loop		check_serial_exist	NUM0
		be	end_game		check_serial_data	NUM3
gs_loop		cpta	check_serial_data	received_str		sent_i
		add	sent_i			sent_i			NUM1
		be	reset_i			check_serial_data	NUM0
cont_call	call	check_serial		check_serial_ra
		be	cont_call		check_serial_exist	NUM0
		be	gs_loop			0			0
		
reset_i		cp	sent_i			NUM0
		cp	str_copy_from		received_str_ptr
		cp	str_copy_to		draw_str_ptr
		call	str_copy		str_copy_ra
		cp	ufo_x			NUM30
		cp	ufo_y			NUM30
		call	draw_ufo		draw_ufo_ra
		cpfa	ufo_cur			ufo_objects		NUM0
		cpta	NUM1			0			ufo_cur
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		cp	str_copy_from		received_str_ptr
		cp	str_copy_to		ufo_deref
		call	str_copy		str_copy_ra
		add	ufo_cur			ufo_cur			NUM1
		cpta	NUM30			0			ufo_cur
		add	ufo_cur			ufo_cur			NUM1
		cpta	NUM30			0			ufo_cur
		be	game_loop		0			0		
		
end_game	halt		
		
		
		
		
		
//ufo_loop2	in	5			clock_start
//end_chk		in	5			clock_end
//		be	end			ufo_y			NUM418
//		sub	clock_diff		clock_end		clock_start
//		bne	end_chk			clock_diff		NUM2
//		cp	ufo_i			NUM0
//		cp	ufo_erase		NUM1
//		call	ufo_draw_loop		ufo_draw_loop_ra
//		be	ufo_move		0			0
//end		halt	
		
//ufo_draw_loop	be	ufo_draw_ret		ufo_i			NUM10
//		cpfa	ufo_cur			ufo_objects		ufo_i
//		add	ufo_i			ufo_i			NUM1
//		cpfa	ufo_deref		0			ufo_cur
//		be	ufo_draw_loop		ufo_deref		NUM0
//		add	ufo_cur			ufo_cur			NUM1
//		cpfa	ufo_deref		0			ufo_cur
//		cp	str_copy_from		ufo_deref
//		cp	str_copy_to		draw_str_ptr
//		call	str_copy		str_copy_ra
//		add	ufo_cur			ufo_cur			NUM1
//		cpfa	ufo_deref		0			ufo_cur
//		cp	ufo_x			ufo_deref
//		add	ufo_cur			ufo_cur			NUM1
//		cpfa	ufo_deref		0			ufo_cur
//		cp	ufo_y			ufo_deref
//		be	not_erase		ufo_erase		NUM0
//		cp	erase_x			ufo_x
//		cp	erase_y			ufo_y
//		call	erase_function		erase_function_ra
//		add	ufo_y			ufo_y			NUM2
//		cpta	ufo_y			0			ufo_cur
//not_erase	call	draw_ufo		draw_ufo_ra
//		be	ufo_draw_loop		0			0
//ufo_draw_ret	ret	ufo_draw_loop_ra

cur_mode	.data	0
user_str_len	.data	0
user_str	.data	0
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
user_str_ptr	.data	user_str
sent_i		.data	0
received_str	.data	0
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
received_str_ptr	.data	received_str


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
#include ../serial_driver/serial_driver.e
#include ../keyboard_driver/driver.e
#include ../sd_card_driver/dic_lib.e
