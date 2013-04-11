//Function - dic_query
//Uses a binary search to find the location of dq_query_str in the dictionary. If the string is successfully
//found in the dictionary, dic_query_result is set to 1, but if the string is not found in the dictionary, 
//dic_query_result is set to 0.
//Parameters: dq_query_str (has pointer dq_qstr_ptr)
//Returns: dic_query_result
dic_query           cp      dq_imax_low         NUM18673
                    cp      dq_imax_high        NUM1
                    cp      dq_imin_low         NUM0
                    cp      dq_imin_high        NUM0
                    cp      dq_interval_low     dq_imax_low
                    cp      dq_interval_high    dq_imax_high
                    cp      sd_write    NUM0
                    cp      loop_count  NUM0
dq_loop             blt     dq_not_found    dq_imax_high    dq_imin_high
                    bne     dq_cont         dq_imax_high    dq_imin_high
                    blt     dq_not_found    dq_imax_low     dq_imin_low
                    add     loop_count      loop_count      NUM1
dq_cont             sr      dq_interval_low     dq_interval_low     NUM1
                    and     dq_carry_over   dq_interval_high    NUM1
                    sl      dq_carry_over   dq_carry_over       NUM14
                    add     dq_interval_low     dq_interval_low     dq_carry_over
                    sr      dq_interval_high    dq_interval_high    NUM1
                    call    dq_set_midpoint     dq_set_midpoint_ra
                    call    dq_set_index        dq_set_index_ra
                    call    dq_read_index       dq_read_index_ra
                    cp      str_comp_str1       dq_qstr_ptr
                    cp      str_comp_str2       dq_rstr_ptr
                    call    str_comp    str_comp_ra
                    be      dq_equal0   str_comp_result     NUM0
                    blt     dq_less0    str_comp_result     NUM0
dq_greater0         bne     dq_imin_skip    dq_imid_low     NUM32767
                    add     dq_imid_high    dq_imid_high    NUM1
                    cp      dq_imid_low     NUM0
                    be      dq_imin_copy 0 0
dq_imin_skip        add     dq_imid_low     dq_imid_low     NUM1
dq_imin_copy        cp      dq_imin_low     dq_imid_low
                    cp      dq_imin_high    dq_imid_high
                    be      dq_loop 0 0
dq_less0            bne     dq_imax_skip    dq_imid_low     NUM0
                    be      dq_imax_skip    dq_imid_high    NUM0
                    sub     dq_imid_high    dq_imid_high    NUM1
                    cp      dq_imid_low     NUM32767
                    be      dq_imax_copy 0 0
dq_imax_skip        sub     dq_imid_low     dq_imid_low     NUM1
dq_imax_copy        cp      dq_imax_low     dq_imid_low
                    cp      dq_imax_high    dq_imid_high
                    be      dq_loop 0 0
dq_equal0           cp      dic_query_result    NUM1
                    ret     dic_query_ra
dq_not_found        cp      dic_query_result    NUM0
                    ret     dic_query_ra

//Helper function for dic_query. Used to find the midpoint between the min and max values in the binary search.
dq_set_midpoint     add     dq_imid_high    dq_interval_high    dq_imin_high
                    add     dq_imid_low     dq_interval_low     dq_imin_low
                    and     dq_imid_low     dq_imid_low         NUM32767
                    blt     smid_adjust     dq_imid_low         dq_interval_low
                    blt     smid_adjust     dq_imid_low         dq_imin_low
                    ret     dq_set_midpoint_ra
smid_adjust         add     dq_imid_high    dq_imid_high    NUM1
                    ret     dq_set_midpoint_ra

//Helper function for dic_query. Used to multiply the midpoint by 10 to get the index needed for the SD card.
dq_set_index        sl      dq_times8_high  dq_imid_high    NUM3
                    and     dq_carry_over   dq_imid_low     NUM28672
                    sr      dq_carry_over   dq_carry_over   NUM12
                    add     dq_times8_high  dq_times8_high  dq_carry_over
                    sl      dq_times8_low   dq_imid_low     NUM3
                    and     dq_times8_low   dq_times8_low   NUM32767
                    sl      dq_times2_high  dq_imid_high    NUM1
                    and     dq_carry_over   dq_imid_low     NUM16384
                    sr      dq_carry_over   dq_carry_over   NUM14
                    add     dq_times2_high  dq_times2_high  dq_carry_over
                    sl      dq_times2_low   dq_imid_low     NUM1
                    and     dq_times2_low   dq_times2_low   NUM32767
                    add     dq_index_high   dq_times8_high  dq_times2_high
                    add     dq_index_low    dq_times8_low   dq_times2_low
                    and     dq_index_low    dq_index_low    NUM32767
                    blt     sind_adjust     dq_index_low    dq_times8_low
                    blt     sind_adjust     dq_index_low    dq_times2_low
                    ret     dq_set_index_ra
sind_adjust         add     dq_index_high   dq_index_high   NUM1
                    ret     dq_set_index_ra

//Helper function for dic_query. Used to read the string located at an index of the SD card.
dq_read_index       cp      sd_address_low      dq_index_low
                    cp      sd_address_high     dq_index_high
                    cp      dq_rindex       NUM0
dq_read_loop        be      dq_readi_ret    dq_rindex   NUM10
                    call    sdcard  sdcard_ra
                    cpta    sd_data_read    dq_read_str     dq_rindex
                    be      dq_readi_ret    sd_data_read    NUM0
                    add     dq_rindex       dq_rindex   NUM1
                    bne     dq_no_overflow  sd_address_low  NUM32767
                    add     sd_address_high     sd_address_high     NUM1
                    cp      sd_address_low      NUM0
                    be      dq_read_loop 0 0
dq_no_overflow      add     sd_address_low      sd_address_low      NUM1
                    be      dq_read_loop 0 0
dq_readi_ret        ret     dq_read_index_ra

                    

//dic_query variables

//dic_query
loop_count          .data 0
dq_imax_low         .data 0
dq_imax_high        .data 0
dq_imin_low         .data 0
dq_imin_high        .data 0
dq_imid_low         .data 0
dq_imid_high        .data 0
dq_interval_low     .data 0
dq_interval_high    .data 0
dq_index_low        .data 0
dq_index_high       .data 0
dic_query_result    .data 0
dic_query_ra        .data 0

dq_query_str        .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
dq_qstr_ptr         .data dq_query_str

dq_read_str         .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
                    .data 0
dq_rstr_ptr         .data dq_read_str

//dq_set_midpoint
dq_set_midpoint_ra  .data 0

//dq_set_index
dq_times8_low       .data 0
dq_times8_high      .data 0
dq_times2_low       .data 0
dq_times2_high      .data 0
dq_carry_over       .data 0
dq_set_index_ra     .data 0

//dq_read_index
dq_rindex           .data 0
dq_read_index_ra    .data 0

#include sd_card_driver.e
#include ../shared_libs/str_help.e
#include ../shared_libs/nums.e