start           call set_black_screen set_black_screen_ra
                cp pixel_x NUM_0
                cp pixel_y NUM_0
loop            be end pixel_x array_length
				cp write_pixel_x pixel_x
                cp write_pixel_y pixel_y
                cpfa write_pixel_color color_array array_index
                call write_pixel write_pixel_ra
                add pixel_x pixel_x NUM_1
                add array_index array_index NUM_1
                be loop 0 0
end             halt

//Variables

pixel_x         .data 0
pixel_y         .data 0
array_length	.data 30
array_index		.data 0
color_array     .data 10
				.data 11
				.data 12
				.data 13
				.data 14
				.data 15
				.data 16
				.data 17
				.data 18
				.data 19
				.data 20
				.data 21
				.data 22
				.data 23
				.data 24
				.data 25
				.data 26
				.data 27
				.data 28
				.data 29
				.data 30
				.data 31
				.data 32
				.data 33
				.data 34
				.data 35
				.data 36
				.data 37
				.data 38
				.data 39

#include vga_driver.e
