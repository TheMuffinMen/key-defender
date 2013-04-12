//Function - set_black_screen 
//Makes the whole screen black.
//Requires no parameters.
set_black_screen    out 62 NUM1  
                    out 63 NUM0  //Set coordinates for the rectangle 
		    out 64 NUM0  //at (0,0) and (639, 479)
                    out 65 NUM639
                    out 66 NUM479
                    out 67 NUM0  //Set color of rectangle to black
                    out 60 NUM1
check_res1_sbs      in 61 vga_response
                    bne check_res1_sbs vga_response NUM1
		    out 60 NUM0
check_res0_sbs	    in 61 vga_response
		    bne check_res0_sbs vga_response NUM0
                    ret set_black_screen_ra
                    
erase_function		out 	62 			NUM1		
		    	sub	array_xstart		erase_x			NUM24
		    	cp	array_ystart		erase_y
		    	add	array_xend		erase_x			NUM127
		    	add	array_yend		erase_y			NUM62         				
delete_array		out 	63 			array_xstart  //Set coordinates for the rectangle 
		    	out	64 			array_ystart  //of the array we want to erase
                    	out 	65 			array_xend
                    	out 	66 			array_yend
                    	out 	67 			NUM0  //Set color of rectangle to black
                    	out 	60 			NUM1
check_clear1        	in 	61 vga_response
                    	bne 	check_clear1 		vga_response 		NUM1
		    	out 	60 			NUM0
check_clear2	    	in 	61 			vga_response
		    	bne 	check_clear2 		vga_response 		NUM0
                    	ret 	erase_function_ra
                    	
                    	

erase_typed		out 	62 			NUM1		
		    	sub	array_xstart		erase_x			NUM24
		    	cp	array_ystart		erase_y
		    	add	array_xend		erase_x			NUM127
		    	add	array_yend		erase_y			NUM10         				
delete_typed		out 	63 			array_xstart  //Set coordinates for the rectangle 
		    	out	64 			array_ystart  //of the array we want to erase
                    	out 	65 			array_xend
                    	out 	66 			array_yend
                    	out 	67 			NUM0  //Set color of rectangle to black
                    	out 	60 			NUM1
check_cleartyped1      	in 	61 vga_response
                    	bne 	check_clear1 		vga_response 		NUM1
		    	out 	60 			NUM0
check_cleartyped2    	in 	61 			vga_response
		    	bne 	check_clear2 		vga_response 		NUM0
                    	ret 	erase_function_ra
//Function - write_pixel
//Writes a pixel of a given color at the specified (x,y) coordinate
//Parameters: write_pixel_x, write_pixel_y, write_pixel_color
write_pixel         out 62 NUM1
                    out 63 write_pixel_x1
                    out 64 write_pixel_y1
                    out 65 write_pixel_x2
                    out 66 write_pixel_y2
                    out 67 write_pixel_color
                    out 60 NUM1
check_res1_wp       in 61 vga_response
                    bne check_res1_wp vga_response NUM1
                    out 60 NUM0
check_res0_wp	    in 61 vga_response
		    bne check_res0_wp vga_response NUM0
                    ret write_pixel_ra

//Variables

set_black_screen_ra	.data 	0
write_pixel_ra		.data 	0
vga_response		.data 	0
clear_array_ra		.data	0
array_val		.data	0
falling_array		.data	0
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
length_i		.data	0
erase_function_ra	.data	0
erase_x			.data	0
erase_y			.data	0
			

//write_pixel parameters
write_pixel_x1       	.data	0
write_pixel_y1       	.data	0
write_pixel_color       .data	0
write_pixel_x2		.data	0
write_pixel_y2		.data	0

//clear_array parameters
array_xstart		.data	0
array_ystart		.data	0
array_xend		.data	0
array_yend		.data	0
temp_xend		.data	0

#include ../shared_libs/nums.e
