//Function - set_black_screen 
//Makes the whole screen black.
//Requires no parameters.
set_black_screen    out 62 NUM_1  
                    out 63 NUM_0  //Set coordinates for the rectangle 
					out 64 NUM_0  //at (0,0) and (639, 479)
                    out 65 NUM_639
                    out 66 NUM_479
                    out 67 NUM_0  //Set color of rectangle to black
                    out 60 NUM_1
check_res1_sbs      in 61 vga_response
                    bne check_res1_sbs vga_response NUM_1
					out 60 NUM_0
check_res0_sbs		in 61 vga_response
					bne check_res0_sbs vga_response NUM_0
                    ret set_black_screen_ra

//Function - write_pixel
//Writes a pixel of a given color at the specified (x,y) coordinate
//Parameters: write_pixel_x, write_pixel_y, write_pixel_color
write_pixel         out 62 NUM_1
                    out 63 write_pixel_x1
                    out 64 write_pixel_y1
                    out 65 write_pixel_x2
                    out 66 write_pixel_y2
                    out 67 write_pixel_color
                    out 60 NUM_1
check_res1_wp       in 61 vga_response
                    bne check_res1_wp vga_response NUM_1
                    out 60 NUM_0
check_res0_wp	    in 61 vga_response
		    bne check_res0_wp vga_response NUM_0
                    ret write_pixel_ra

//Variables

set_black_screen_ra		.data 0
write_pixel_ra			.data 0
vga_response			.data 0

//write_pixel parameters
write_pixel_x1       	.data	0
write_pixel_y1       	.data	0
write_pixel_color       .data	0
write_pixel_x2		.data	0
write_pixel_y2		.data	0

//NUMs
NUM_0       .data 0
NUM_1       .data 1
NUM_639     .data 639
NUM_479     .data 479
