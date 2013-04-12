draw_ufo	cp	write_pixel_color	NUM46
		cp	write_pixel_x1		ufo_x
		add	write_pixel_y1		ufo_y			NUM11
		add	write_pixel_x2		ufo_x			NUM75
		add	write_pixel_y2		ufo_y			NUM41
		call	write_pixel		write_pixel_ra
		cp	write_pixel_color	NUM128
		add	write_pixel_x1		ufo_x			NUM13			
		cp	write_pixel_y1		ufo_y					
		add	write_pixel_x2		ufo_x			NUM62
		add	write_pixel_y2		ufo_y			NUM10
		call	write_pixel		write_pixel_ra
		cp	write_pixel_color	NUM180
		add	write_pixel_x1		ufo_x			NUM9			
		add	write_pixel_y1		ufo_y			NUM20		
		add	write_pixel_x2		ufo_x			NUM22
		add	write_pixel_y2		ufo_y			NUM30
		call	write_pixel		write_pixel_ra
		add	write_pixel_x1		write_pixel_x1		NUM22			
		add	write_pixel_x2		write_pixel_x2		NUM22
		call	write_pixel		write_pixel_ra
		add	write_pixel_x1		write_pixel_x1		NUM22			
		add	write_pixel_x2		write_pixel_x2		NUM22
		call	write_pixel		write_pixel_ra
		cp	ufo_switch		NUM0
		cp	write_i			NUM3
		add	str_y_start		ufo_y			NUM51	
		add	str_x_start		ufo_x			NUM20				
ufo_loop	cpfa	temp_array_val		draw_str		write_i
		add	write_i			write_i			NUM1
		be	ufo_string		temp_array_val		NUM0
		be	ufo_switch1		ufo_switch		NUM1	
		sub	str_x_start		str_x_start		NUM7
		cp	ufo_switch		1
		be	ufo_loop		0			0
ufo_switch1	sub	str_x_start		str_x_start		NUM6
		cp	ufo_switch		0
		be	ufo_loop		0			0			
ufo_string	call	draw_string		draw_string_ra
		ret	draw_ufo_ra			



ufo_x		.data	0
ufo_y		.data	0
draw_ufo_ra	.data	0
temp_array_val	.data	0
write_i		.data	3
ufo_switch	.data	0



#include which_character.e

