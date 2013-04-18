//This program is going to draw the end screens
//These are the you win and you lose screens

draw_win_screen	    cp		write_pixel_x1	NUM0
			cp	write_pixel_x2	NUM639
			cp	write_pixel_y1	NUM22
			cp	write_pixel_y2	NUM359
			cp	write_pixel_color	NUM0
			call	write_pixel	write_pixel_ra
		    cp	    sd_address_low	NUM4033
		    cp	    sd_address_high	NUM28
		    cp	    write_const_x	NUM80
		    cp	    write_const_y	NUM30
win_screen_outer    be	    done_end_screen	write_const_y	NUM339
		    cp	    write_const_x	NUM80
win_screen_inner    be	    win_y_incr		write_const_x	NUM560
		    call    sdcard		sdcard_ra
		    cp	    write_pixel_color	sd_data_read
		    call    draw_menu		write_pixel_ra
		    be	    modify_sd_end	sd_address_low	NUM32767
		    add	    sd_address_low	sd_address_low	NUM1
win_x_incr	    add	    write_const_x	write_const_x	NUM1
		    be	    win_screen_inner	0		0
win_y_incr	    add	    write_const_y	write_const_y	NUM1
		    be	    win_screen_outer	0		0

modify_sd_end	    add	    sd_address_high	sd_address_high	NUM1
		    cp	    sd_address_low	NUM0
		    be	    win_x_incr		0		0

//draws you lose screen

draw_lose_screen    cp		write_pixel_x1	NUM0
			cp	write_pixel_x2	NUM639
			cp	write_pixel_y1	NUM22
			cp	write_pixel_y2	NUM359
			cp	write_pixel_color	NUM0
			call	write_pixel	write_pixel_ra
		    cp	    sd_address_low	NUM17793
		    cp	    sd_address_high	NUM33
		    cp	    write_const_x	NUM80
		    cp	    write_const_y	NUM30
lose_screen_outer   be	    done_end_screen	write_const_y	NUM339
		    cp	    write_const_x	NUM80
lose_screen_inner   be	    lose_y_incr		write_const_x	NUM560
		    call    sdcard		sdcard_ra
		    cp	    write_pixel_color	sd_data_read
		    call    draw_menu		write_pixel_ra
		    be	    modify_sd_end_lose	sd_address_low	NUM32767
		    add	    sd_address_low	sd_address_low	NUM1
lose_x_incr	    add	    write_const_x	write_const_x	NUM1
		    be	    lose_screen_inner	0		0
lose_y_incr	    add	    write_const_y	write_const_y	NUM1
		    be	    lose_screen_outer	0		0

modify_sd_end_lose  add	    sd_address_high	sd_address_high	NUM1
		    cp	    sd_address_low	NUM0
		    be	    lose_x_incr		0		0


done_end_screen	    ret	    draw_end_ra

draw_end_ra	    .data	0

