//This program is going to take a value and it is going to decipher which character it is
//Then it will send this program to go and draw the corresponding letter to the VGA
//User also has to specify the starting point
//This point has to correspond to the top leftmost value you want it to take
//This is taken and the entire area that the letter will cover is covered in white
//Each character takes up a 10x10 grid

which_char   cp    vga_x1   char_x_start
   cp    vga_y1   char_y_start
   add   vga_x2   vga_x1   NUM9
   add   vga_y2   vga_y1   NUM9
   cp    vga_color_write   NUM1 //sets the background of the char to white 
 

//case statement
   be	 draw_a	  char_in  NUM97
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
done_draw   ret	 which_char_ra

//This section handles the task of drawing the actual letter
//User has to specify the starting point
//This point has to correspond to the top leftmost value you want it to take


//Draws the letter A
draw_a   call  vga_draw_rect  vga_return
      add      draw_char_tmpx    char_x_start   NUM2
      add      draw_char_tmpy    char_y_start   NUM2
      cp       vga_x1         draw_char_tmpx
      cp       vga_y1         draw_char_tmpy
      add      vga_x2         vga_x1            NUM5
      add      vga_y2         vga_x1            NUM2
      cp       vga_color_write   NUM255            //fills a middle rectangle black 
      call     vga_draw_rect  vga_return
      add      vga_y1         vga_y1            NUM5
      add      vga_y2         vga_y2            NUM5
      call     vga_draw_rect  vga_return          //fills a bottom rectangle black to complete the "A"
      be       done_draw      0           0

draw_b  call   	vga_draw_rect  	vga_return
      	add     vga_x1         	char_x_start   NUM2
      	add     vga_y1         	char_y_start   NUM1
	add     vga_x2         	vga_x1         NUM4
	add     vga_y2         	vga_y1         NUM2
	cp      vga_color_write NUM255
	call  	vga_draw_rect  	vga_return
	add	vga_y1		char_y_start	NUM6
	add	vga_x2		vga_x1		NUM5
	add	vga_y2		vga_y1		NUM2
	call	vga_draw_rect	vga_return

char_in	       .data 0
draw_char_tmpx .data 0
draw_char_tmpy .data 0
which_char_ra  .data 0
#include NUMS.e
#include VGA_driver.e
#include draw_chars_test.e
