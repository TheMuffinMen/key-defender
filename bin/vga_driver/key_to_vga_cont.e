			call	start			start_ra
			call  	key_input    		key_input_ra
key_to_vga_cont		call	loop			loop_ra
			cp	drawstr_i		NUM0
			be	is32			key_input_element	NUM0
			call	start			start_ra
			call	func_call		func_call_ra
			be	key_to_vga_cont		NUM1			NUM1
is32			halt
			
loop_ra		.data	0
start_ra	.data	0
func_call_ra	.data	0

#include keyboard_to_vga.e
