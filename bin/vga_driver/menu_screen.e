//This program is going to allow the user to switch between the different
//modes at the menu screen

menu_screen call    key_init        key_init_ra
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
