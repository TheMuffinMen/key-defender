//This program is going to test the menu screen
start   call   menu_screen  menu_screen_ra
        halt
#include menu_screen.e
#include ../keyboard_driver/driver.e
#include ../sd_ram_driver/all_sounds.e
#include ../vga_driver/vga_driver.e
#include ../sd_card_driver/sd_card_driver.e
