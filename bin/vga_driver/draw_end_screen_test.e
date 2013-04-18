	call	soundtoram	    read_sound_to_ram_ra
	call	draw_win_screen    draw_end_ra
	halt

#include ../vga_driver/vga_driver.e
#include ../sd_card_driver/sd_card_driver.e
#include ../keyboard_driver/driver.e
#include draw_end_screen.e
#include ../sd_ram_driver/all_sounds.e
