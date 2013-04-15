//This program is going to allow the user to switch between the different
//modes at the menu screen

menu_screen     cp      sd_address_low      NUM0
                cp      sd_address_high     NUM0
                cp      write_const_x       NUM0
                cp      write_const_y       NUM0
                cp      sd_write            NUM0
                call    set_black_screen    set_black_screen_ra
menu_outer      be      choose_mode         write_const_y   NUM480
                cp      write_const_x       NUM0
menu_inner      be      menu_y_incr         write_const_x   NUM640
                call    sdcard              sdcard_ra
                cp      write_pixel_color   sd_data_read
                call    draw_menu           write_pixel_ra
                be      modify_sd_high      sd_address_low  NUM32767
                add     sd_address_low      sd_address_low  NUM1
menu_x_incr     add     write_const_x       write_const_x   NUM1
                be      menu_inner          0               0
menu_y_incr     add     write_const_y       write_const_y   NUM1
                be      menu_outer          0               0
                        
modify_sd_high     add      sd_address_high     sd_address_high     NUM1
                   cp       sd_address_low      NUM0
                   be       menu_x_incr         0                   0

choose_mode call    key_init        key_init_ra
mode_select call    key_response    key_response_ra
            be      mode_select     key_execute         NUM0
            be      mode_select     key_input_pressed   NUM1
            be      sp_menu         key_input_element   NUM49
            be      mp_menu         key_input_element   NUM50
            be      mode_select     0                   0

sp_menu     cp      which_mode      NUM1
            be      done_menu       0                   0
mp_menu     cp      which_mode      NUM2
done_menu   ret     menu_screen_ra

which_mode      .data   0
menu_screen_ra  .data   0
menu_tmp        .data   0         
