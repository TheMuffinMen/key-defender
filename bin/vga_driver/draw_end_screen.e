//This program is going to draw the end screens
//These are the you win and you lose screens

draw_win_screen	    cp	    sd_address_low	NUM0
		    cp	    sd_address_high	NUM0
		    cp	    write_const_x	NUM0
		    cp	    write_const_y	NUM30
win_screen_outer    be	    done_end_screen	write_const_y	NUM401
		    cp	    write_const_x	NUM0
win_screen_inner    be	    win_y_incr		write_const_x	NUM640
		    call    sdcard		sdcard_ra
		    cp	    write_pixel_color	sd_data_read
		    call    draw_menu		write_pixel_ra
		    be	    modify_sd_win	sd_address_low	NUM32767
		    add	    sd_address_low	sd_address_low	NUM1
win_x_incr	    add	    write_const_x	write_const_x	NUM1
		    be	    win_screen_inner	0		0
win_y_incr	    add	    write_const_y	write_const_y	NUM1
		    be	    win_screen_outer	0		0

modify_sd_win	    add	    sd_address_high	sd_address_high	NUM1
		    cp	    sd_address_low	NUM0
		    be	    win_x_incr		0		0
