//This program is going to take a value and it is going to decipher which character it is
//Then it will send this program to go and draw the corresponding letter to the VGA
//User also has to specify the starting point
//This point has to correspond to the top leftmost value you want it to take
//This is taken and the entire area that the letter will cover is covered in white
//Each character takes up a 10x10 grid

//initializes drawing
draw_string	cp	draw_char_tmpx	str_x_start
		cp	draw_char_tmpy	str_y_start
		cp	drawstr_i	NUM0

//loop through string and store each element in char_in

loop1	cpfa	char_in		draw_str	drawstr_i
	be	done_draw	char_in	NUM0
	cp	write_pixel_x1	draw_char_tmpx
	cp	write_pixel_y1	draw_char_tmpy
	add	write_pixel_x2	write_pixel_x1	NUM9
	add	write_pixel_y2	write_pixel_y1	NUM9
	cp	write_pixel_color	NUM255
	be	case	0	0
	
incr	add	drawstr_i	drawstr_i	NUM1
	add	draw_char_tmpx	draw_char_tmpx	NUM13
	be	loop1	0	0

//case statement
case	be	 draw_a	  char_in  NUM97
   	be	 draw_b	  char_in  NUM98
   	be	 draw_c	  char_in  NUM99
   	be	 draw_d	  char_in  NUM100  
   	be	 draw_e	  char_in  NUM101
   	be	 draw_f	  char_in  NUM102
   	be	 draw_g	  char_in  NUM103
   	be	 draw_h	  char_in  NUM104
   	be	 draw_i	  char_in  NUM105
   	be	 draw_j	  char_in  NUM106
   	be	 draw_k	  char_in  NUM107
   	be	 draw_l	  char_in  NUM108
   	be	 draw_m	  char_in  NUM109
   	be	 draw_n	  char_in  NUM110
   	be	 draw_o	  char_in  NUM111
   	be	 draw_p	  char_in  NUM112
   	be	 draw_q	  char_in  NUM113
   	be	 draw_r	  char_in  NUM114
   	be	 draw_s	  char_in  NUM115
   	be	 draw_t	  char_in  NUM116
   	be	 draw_u	  char_in  NUM117
   	be	 draw_v	  char_in  NUM118
   	be	 draw_w	  char_in  NUM119
   	be	 draw_x	  char_in  NUM120
   	be	 draw_y	  char_in  NUM121
   	be	 draw_z	  char_in  NUM122
	be	 draw_0	  char_in  NUM48
	be	 draw_1	  char_in  NUM49
	be	 draw_2	  char_in  NUM50
	be	 draw_3	  char_in  NUM51
	be	 draw_4	  char_in  NUM52
	be	 draw_5	  char_in  NUM53
	be	 draw_6	  char_in  NUM54
	be	 draw_7	  char_in  NUM55
	be	 draw_8	  char_in  NUM56
	be	 draw_9	  char_in  NUM57
	be	 draw_space char_in NUM32
	be	 draw_colon char_in NUM7
done_draw   ret	 draw_string_ra

//This section handles the task of drawing the actual letter
//User has to specify the starting point
//This point has to correspond to the top leftmost value you want it to take


//Draws the letter A
draw_a	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM5
	add	write_pixel_y2	write_pixel_y1	NUM2
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM5
	add	write_pixel_y2	write_pixel_y1	NUM2
	call	write_pixel	write_pixel_ra
	be	incr	0	0

//Draws the letter B
draw_b	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_x2	write_pixel_x1	NUM5
	add	write_pixel_y2	write_pixel_y1	NUM2
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM6
	sub	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM4
	call	write_pixel	write_pixel_ra
	be	incr	0	0

//Draws the letter C
draw_c	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y2	write_pixel_y1	NUM5
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	be	incr	0	0

//Draws the letter D
draw_d	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM3
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM5
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM5
	sub	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM8
	cp	write_pixel_x2	write_pixel_x1
	sub	write_pixel_y1	write_pixel_y1	NUM7
	add	write_pixel_y2	write_pixel_y1	NUM7
	call	write_pixel	write_pixel_ra
	be	incr	0	0		

draw_e	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y2	write_pixel_y1	NUM5
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM255
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_f	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y2	write_pixel_y1	NUM7
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM255
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_g	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y2	write_pixel_y1	NUM5
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM255
	add	write_pixel_x1	write_pixel_x1	NUM6
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM3
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_h	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM5
	add	write_pixel_y2	write_pixel_y1	NUM3
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_y2	write_pixel_y1	NUM3
	call	write_pixel	write_pixel_ra	
	be	incr	0	0

draw_i	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM3
	add	write_pixel_y2	write_pixel_y1	NUM5
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM6
	add	write_pixel_x2	write_pixel_x1	NUM3
	call	write_pixel	write_pixel_ra
	be	incr	0	0	

draw_j	call	write_pixel	write_pixel_ra
	add	write_pixel_x2	write_pixel_x1	NUM4
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM5
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM7
	add	write_pixel_x2	write_pixel_x1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM7
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM255
	sub	write_pixel_x1	write_pixel_x1	NUM7
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1			
	call	write_pixel	write_pixel_ra
	be	incr	0	0		

draw_k	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM255
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_x2	write_pixel_x1	NUM3
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	sub	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_l	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM0
	add	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_y2	write_pixel_y2	NUM2
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_m	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM5
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM255
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr	0	0

draw_n	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM5
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM255
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr	0	0

draw_o	call	write_pixel	write_pixel_ra
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM5
	add	write_pixel_y2	write_pixel_y1	NUM5
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM6
	add	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM8
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_p	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y2	write_pixel_y1	NUM3
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x2	write_pixel_x2	NUM2
	sub	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1	
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_q	call	write_pixel	write_pixel_ra
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM5
	add	write_pixel_y2	write_pixel_y1	NUM5
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM6
	add	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM8
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	cp	write_pixel_color	NUM255
	add	write_pixel_x1	write_pixel_x1	NUM9
	cp	write_pixel_y1	write_pixel_y2
	cp	write_pixel_x2	write_pixel_x1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM1
	cp	write_pixel_x2	write_pixel_x1
	sub	write_pixel_y1	write_pixel_y1	NUM1
	cp	write_pixel_y2	write_pixel_y1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM1
	cp	write_pixel_x2	write_pixel_x1	
	sub	write_pixel_y1	write_pixel_y1	NUM1
	cp	write_pixel_y2	write_pixel_y1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM1
	sub	write_pixel_y1	write_pixel_y1	NUM1
	cp	write_pixel_x2	write_pixel_x1
	cp	write_pixel_y2	write_pixel_y1
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_r	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y2	write_pixel_y1	NUM3
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x2	write_pixel_x2	NUM2
	sub	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1	
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM255
	add	write_pixel_x1	write_pixel_x1	NUM4
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr	0	0	

draw_s	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_x2	write_pixel_x2	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x2	write_pixel_x1	NUM1
	sub	write_pixel_y1	write_pixel_y2	NUM7
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1	
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM8
	add	write_pixel_x2	write_pixel_x1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_t	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM7
	add	write_pixel_x2	write_pixel_x1	NUM3
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM6
	add	write_pixel_x2	write_pixel_x1	NUM3
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_u	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM5
	add	write_pixel_y2	write_pixel_y1	NUM7
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y2	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	add	write_pixel_x1	write_pixel_x1	NUM8
	add	write_pixel_x2	write_pixel_x1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr	0	0	

draw_v	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM3
	cp	write_pixel_color	NUM255
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x2	NUM1
	add	write_pixel_y1	write_pixel_y2	NUM1
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM3
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x2	NUM1
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y2	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x2	NUM1
	add	write_pixel_x2	write_pixel_x1	NUM1
	sub	write_pixel_y2	write_pixel_y2	NUM2
	sub	write_pixel_y1	write_pixel_y1	NUM4
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x2	NUM1
	add	write_pixel_x2	write_pixel_x1	NUM1
	sub	write_pixel_y2	write_pixel_y2	NUM4
	sub	write_pixel_y1	write_pixel_y1	NUM4
	call	write_pixel	write_pixel_ra
	be	incr	0	0

draw_w	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_x2	write_pixel_x2	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM7
	cp	write_pixel_color	NUM0
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM3
	cp	write_pixel_color	NUM255
	call	write_pixel	write_pixel_ra	
	be	incr	0	0
	
draw_x	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	cp	write_pixel_color	NUM255
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	sub	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_y2	write_pixel_y1	NUM1
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM8
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr	0	0

draw_y	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y2	write_pixel_y1	NUM1
	cp	write_pixel_color	NUM255
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM8
	add	write_pixel_x2	write_pixel_x1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	sub	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM4
	add	write_pixel_x2	write_pixel_x1	NUM1		
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM5
	call	write_pixel	write_pixel_ra	
	be	incr	0	0

draw_z	call	write_pixel	write_pixel_ra
	cp	write_pixel_color	NUM0
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM5
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	cp	write_pixel_color	NUM255
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	sub	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM1
	sub	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr	0	0

draw_0	call    write_pixel	write_pixel_ra
	cp	write_pixel_color   NUM0
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM5
	add	write_pixel_y2	write_pixel_y1	NUM5
	call	write_pixel	write_pixel_ra
	be	incr		0		0

draw_1  cp	write_pixel_color   NUM255
	add	write_pixel_x1	write_pixel_x1	NUM4
	add	write_pixel_x2	write_pixel_x1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr		0		0

draw_2	call	write_pixel	write_pixel_ra
	cp	write_pixel_color    NUM0
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	add	write_pixel_x2	write_pixel_x1	NUM7
	call	write_pixel	write_pixel_ra
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	be	incr		0		0

draw_3	call	write_pixel	write_pixel_ra
	cp	write_pixel_color   NUM0
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM5
	call	write_pixel	write_pixel_ra
	cp	write_pixel_color   NUM255
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	add	write_pixel_x1	write_pixel_x1	NUM4
	add	write_pixel_x2	write_pixel_x1	NUM3
	call	write_pixel	write_pixel_ra
	be	incr		0		0

draw_4	call	write_pixel	write_pixel_ra
	cp	write_pixel_color   NUM0
	add	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_x2	write_pixel_x2	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM3
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM6
	add	write_pixel_y2	write_pixel_y1	NUM3
	call	write_pixel	write_pixel_ra
	be	incr		0		0

draw_5	call	write_pixel	write_pixel_ra
	cp	write_pixel_color    NUM0
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_x2	write_pixel_x2	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr		0		0

draw_6	call	write_pixel	write_pixel_ra
	cp	write_pixel_color   NUM0
	add	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x2	write_pixel_x2	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra	
	be	incr		0		0

draw_7	call	write_pixel	write_pixel_ra
	cp	write_pixel_color   NUM0
	add	write_pixel_x2	write_pixel_x1	NUM7
	add	write_pixel_y1	write_pixel_y1	NUM2
	call	write_pixel	write_pixel_ra
	be	incr		0		0

draw_8	call	write_pixel	write_pixel_ra
	cp	write_pixel_color   NUM0
	add	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_x2	write_pixel_x2	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	be	incr		0		0

draw_9	call	write_pixel	write_pixel_ra
	cp	write_pixel_color   NUM0
	add	write_pixel_x1	write_pixel_x1	NUM2
	sub	write_pixel_x2	write_pixel_x2	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM2
	add	write_pixel_y2	write_pixel_y1	NUM1
	call	write_pixel	write_pixel_ra
	sub	write_pixel_x1	write_pixel_x1	NUM2
	add	write_pixel_y1	write_pixel_y1	NUM4
	add	write_pixel_y2	write_pixel_y1	NUM3
	call	write_pixel	write_pixel_ra
	be	incr		0		0

draw_space  cp	write_pixel_color   NUM0
	    call    write_pixel	    write_pixel_ra
	    be	    incr	0		0

draw_colon  cp	write_pixel_color    NUM0
	    call    write_pixel	    write_pixel_ra
	    cp	    write_pixel_color	NUM255
	    add	    write_pixel_y1  write_pixel_y1  NUM2
	    add	    write_pixel_y2  write_pixel_y1  NUM1
	    add	    write_pixel_x2  write_pixel_x1  NUM1
	    call    write_pixel	    write_pixel_ra
	    add	    write_pixel_y1  write_pixel_y1  NUM4
	    add	    write_pixel_y2  write_pixel_y1  NUM1
	    call    write_pixel	    write_pixel_ra
	    be	    incr	    0		    0
	    
draw_str	.data	0 
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
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
draw_str_ptr	.data	draw_str
str_x_start	.data	0
str_y_start	.data	0
char_in	       	.data	0
draw_char_tmpx 	.data	0
draw_char_tmpx2	.data	0
draw_char_tmpy2	.data	0
draw_char_tmpy 	.data	0
draw_string_ra  	.data	0
drawstr_i		.data	0

#include vga_driver.e
