		call	set_black_screen	set_black_screen_ra
		call	init_serial		init_serial_ra
		cp	serial_send_data	NUM12
		call	serial_send		serial_send_ra
ready_check	call	check_serial		check_serial_ra
		bne	ready_check		check_serial_exist	NUM1
		bne	ready_check		check_serial_data	NUM12
		call	key_init		key_init_ra
		call	draw_play_screen	draw_play_screen_ra
		cp	cur_mode		NUM0
		cp	user_str_len		NUM0
		cp	queue_len		NUM0
		cp	ufo_cntr		NUM0
		in 	5			clock_start
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
		cp	ufo_i			NUM0
eval_loop	be	clear_box		ufo_i			NUM10
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
		sub	ufo_cntr		ufo_cntr		NUM1
		//  Place in "killed alien" sound
		be	eval_loop		0			0
		
str_to_serial	cp	str_copy_from		user_str_ptr
		cp	str_copy_to		dq_qstr_ptr
		call	str_copy		str_copy_ra
		call	dic_query		dic_query_ra
		be	not_found_sound		dic_query_result	NUM0
		cp	str_copy_from		user_str_ptr
		cp	str_copy_to		str_send_ptr
		call	str_copy		str_copy_ra
		call	str_send		str_send_ra
		// Play valid word (word sent) sound
		
		
not_found_sound	be	clear_box		0			0 
		// input sound for wrong word


clear_box	cp	erase_x			NUM256
		cp	erase_y			NUM454
		call	erase_typed		erase_typed_ra
		cp	user_str_len		NUM0
clear_str_loop	cpta	NUM0			user_str		user_str_len
		add	user_str_len		user_str_len		NUM1
		bne	clear_str_loop		user_str_len		NUM10
		cp 	user_str_len		NUM0
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
		be	add_to_queue		check_serial_data	NUM0
cont_call	call	check_serial		check_serial_ra
		be	cont_call		check_serial_exist	NUM0
		be	gs_loop			0			0
		
add_to_queue	cp	sent_i			NUM0
		be	add_ufos		queue_len		NUM5
		add	queue_i			ufo_queue		queue_len
		add	queue_len		queue_len		NUM1
		cp	str_copy_from		received_str_ptr
		cp	str_copy_to		queue_i
		call	str_copy		str_copy_ra
		be	add_ufos		0			0
		
add_ufos	be	clock_update		ufo_cntr		NUM10	
		cp	pos1_free		NUM1
		cp	pos2_free		NUM1
		cp	pos3_free		NUM1
		cp	pos4_free		NUM1
		cp	ufo_i			NUM0		
free_space	be	apply_queue		ufo_i			NUM10
		cpfa	ufo_cur			ufo_objects		ufo_i
		add	ufo_i			ufo_i			NUM1
		cpfa	ufo_deref		0			ufo_cur
		be	free_space		ufo_deref		NUM0
		add	ufo_cur			ufo_cur			NUM2
		cpfa	ufo_deref		0			ufo_cur
		cp	free_x			ufo_deref
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		cp	free_y			ufo_deref
		blt	cont_free		free_y			NUM110	
		be	free_space		0			0		
cont_free	be	change_pos1		free_x			NUM30
		be	change_pos2		free_x			NUM197
		be	change_pos3		free_x			NUM364
		cp	pos4_free		NUM0
		be	free_space		0			0
change_pos1	cp	pos1_free		NUM0
		be	free_space		0			0
change_pos2	cp	pos2_free		NUM0
		be	free_space		0			0
change_pos3	cp	pos3_free		NUM0
		be 	free_space		0			0
		
apply_queue	cp	ufo_i			NUM0
		cp	queue_limit		queue_len
add_loop	be	queue_update		ufo_i			queue_limit
		be	queue_update		ufo_cntr		NUM10
		add	ufo_i			ufo_i			NUM1
		be 	add_to_pos1		pos1_free		NUM1
		be	add_to_pos2		pos2_free		NUM1
		be 	add_to_pos3		pos3_free		NUM1
		be	add_to_pos4		pos4_free		NUM1
		be	add_loop		0			0

add_to_pos1	call	find_free		find_free_ra
		cp	free_x			NUM30
		be	draw_added		0			0		
add_to_pos2	call	find_free		find_free_ra
		cp	free_x			NUM197
		be	draw_added		0			0
add_to_pos3	call	find_free		find_free_ra
		cp	free_x			NUM364
		be	draw_added		0			0
add_to_pos4	call	find_free		find_free_ra
		cp	free_x			NUM531
		be	draw_added		0			0
		
draw_added	cpta	NUM1			0			ufo_cur
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		add	queue_i			ufo_queue		ufo_i
		cp	str_copy_from		queue_i				
		cp	str_copy_to		ufo_deref
		call	str_copy		str_copy_ra
		add	ufo_cur			ufo_cur			NUM1
		cpta	free_x			0			ufo_cur
		add	ufo_cur			ufo_cur			NUM1
		cpta	NUM30			0			ufo_cur
		cp	str_copy_from		queue_i
		cp	str_copy_to		draw_str_ptr
		call	str_copy		str_copy_ra
		cp	ufo_x			free_x
		cp	ufo_y			NUM30
		call	draw_ufo		draw_ufo_ra
		add	ufo_cntr		ufo_cntr		NUM1
		sub	queue_len		queue_len		NUM1
		be	add_loop		0			0
		
find_free	cp	free_i			NUM0
find_free_loop	be	find_free_ret		free_i			NUM10
		cpfa	ufo_cur			ufo_objects		free_i
		cpfa	ufo_deref		0			ufo_cur
		be	find_free_ret		ufo_deref		NUM0
		add	free_i			free_i			NUM1
		be	find_free_loop		0			0		
find_free_ret	ret	find_free_ra

queue_update	sub	free_i			queue_limit		queue_len
		cp	queue_i			NUM0
update_loop	be	clock_update		queue_i			queue_len
		add	free_i			queue_i			free_i		
		add	str_copy_from		ufo_queue		free_i
		add	str_copy_to		ufo_queue		queue_i
		call	str_copy		str_copy_ra
		add	queue_i			queue_i			NUM1
		be	update_loop		0			0
		
clock_update	in	5			clock_end
		sub	clock_diff		clock_end		clock_start
		blt	game_loop		clock_diff		NUM2
		in 	5			clock_start
		be	move_ufos		0			0		
		
move_ufos	cp	ufo_i			NUM0	
move_ufos_loop	be	lose_check		ufo_i			NUM10
		cpfa	ufo_cur			ufo_objects		ufo_i
		add	ufo_i			ufo_i			NUM1
		cpfa	ufo_deref		0			ufo_cur
		be	move_ufos_loop		ufo_deref		NUM0
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
		cp	erase_x			ufo_x
		cp	erase_y			ufo_y
		call	erase_function		erase_function_ra
		add	ufo_y			ufo_y			NUM2
		cpta	ufo_y			0			ufo_cur
		call	draw_ufo		draw_ufo_ra
		be	move_ufos_loop		0			0
		
lose_check	cp	ufo_i			NUM0	
lose_check_loop	be	game_loop		ufo_i			NUM10
		cpfa	ufo_cur			ufo_objects		ufo_i
		add	ufo_i			ufo_i			NUM1
		cpfa	ufo_deref		0			ufo_cur
		be	lose_check_loop		ufo_deref		NUM0
		add	ufo_cur			ufo_cur			NUM2
		cpfa	ufo_deref		0			ufo_cur
		cp	free_x			ufo_deref
		add	ufo_cur			ufo_cur			NUM1
		cpfa	ufo_deref		0			ufo_cur
		cp	free_y			ufo_deref
		be	check_outside		free_x			NUM30
		be	check_outside		free_x			NUM531
		be	check_inside		free_x			NUM197
check_inside	bne	lose_check_loop		free_y			NUM358
		be	send_lose		0			0
check_outside	bne	lose_check_loop		free_y			NUM408
		be	send_lose		0			0
		
send_lose	cp	serial_send_data	NUM3
		call	serial_send		serial_send_ra
		be	end_game		0			0
		
				
						
end_game	halt		
		
		
		
		
		
//ufo_loop2	in	5			clock_start
//end_chk	in	5			clock_end
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

pos1_free	.data	0
pos2_free	.data	0	
pos3_free	.data	0
pos4_free	.data	0
free_x		.data	0
free_y		.data	0
free_i		.data	0
find_free_ra	.data	0
cur_mode	.data	0
ufo_cntr	.data	0
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
		
ufo1		.data	0
		.data	ufo_str1
		.data	0
		.data	0
ufo2		.data	0
		.data	ufo_str2
		.data	0
		.data	0
ufo3		.data	0
		.data	ufo_str3
		.data	0
		.data	0
ufo4		.data	0
		.data	ufo_str4
		.data	0
		.data	0
ufo5		.data	0
		.data	ufo_str5
		.data	0
		.data	0
ufo6		.data	0
		.data	ufo_str6
		.data	0
		.data	0
ufo7		.data	0
		.data	ufo_str7
		.data	0
		.data	0
ufo8		.data	0
		.data	ufo_str8
		.data	0
		.data	0
ufo9		.data	0
		.data	ufo_str9
		.data	0
		.data	0
ufo10		.data	0
		.data	ufo_str10
		.data	0
		.data	0
		
ufo_str1	.data	0
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
ufo_str2	.data	0
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
ufo_str3	.data	0
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
ufo_str4	.data	0
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
ufo_str5	.data	0
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
ufo_str6	.data	0
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
ufo_str7	.data	0
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
ufo_str8	.data	0
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
		
ufo_queue	.data	ufo_queue1
		.data	ufo_queue2
		.data	ufo_queue3
		.data	ufo_queue4
		.data	ufo_queue5
queue_len	.data	0
queue_i		.data	0
queue_limit	.data	0
ufo_queue1	.data	0
		.data	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
ufo_queue2	.data	0
		.data	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
ufo_queue3	.data	0
		.data	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
ufo_queue4	.data	0
		.data	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
ufo_queue5	.data	0
		.data	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0
		.data 	0


#include ../vga_driver/ufo_function.e
#include ../shared_libs/str_help.e
#include ../serial_driver/serial_driver.e
#include ../keyboard_driver/driver.e
#include ../sd_card_driver/dic_lib.e