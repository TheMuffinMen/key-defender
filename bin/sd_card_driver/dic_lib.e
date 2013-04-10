dic_query           cp      dq_imax_low         NUM17851
                    cp      dq_imax_high        NUM1
                    cp      dq_imin_low         NUM0
                    cp      dq_imin_high        NUM0
                    cp      dq_interval_low     NUM25309
                    cp      dq_interval_high    NUM0
                    cp      sd_address_write    NUM0
dicq_loop           blt     dicq_not_found  dq_imax_high    dq_imin_high
                    bne     dicq_cont       dq_imax_high    dq_imin_high
                    blt     dicq_not_found  dq_imax_low     dq_imin_low
dicq_cont           call    dq_set_midpoint     dq_set_midpoint_ra
                    call    dq_set_index        dq_set_index_ra
                    call    dq_read_index       dq_read_index_ra
                          
                    




dq_set_midpoint     add     dq_imid_high    dq_interval_high    dq_imin_high
                    add     dq_imid_low     dq_interval_low     dq_imin_low
                    blt     smid_adjust     dq_imid_low         dq_interval_low
                    blt     smid_adjust     dq_imid_low         dq_imin_low
                    ret     dq_set_midpoint_ra
smid_adjust         add     dq_imid_high    dq_imid_high    NUM1
                    ret     dq_set_midpoint_ra


dq_set_index        sr      dq_times8_high  imid_high   NUM3
                    and     dq_carry_over   imid_low    NUM28672
                    sl      dq_carry_over   dq_carry_over   NUM12
                    add     dq_times8_high  dq_times8_high  dq_carry_over
                    sr      dq_times8_low   imid_low    NUM3
                    sr      dq_times2_high  imid_high   NUM1
                    and     dq_carry_over   imid_low    NUM16384
                    sl      dq_carry_over   dq_carry_over   NUM14
                    add     dq_times2_high  dq_times2_high  dq_carry_over
                    sr      dq_times2_low   imid_low    NUM1
                    add     dq_index_high   dq_times8_high  dq_times2_high
                    add     dq_index_low    dq_times8_low   dq_times2_low
                    blt     sind_adjust     dq_index_low    dq_times8_low
                    blt     sind_adjust     dq_index_low    dq_times2_low
                    ret     dq_set_index_ra
sind_adjust         add     dq_index_high   dq_index_high   NUM1
                    ret     dq_set_index_ra


dq_read_index       cp      sd_address_low      dq_index_low
                    cp      sd_address_high     dq_index_high
                    


//Variables

//dic_query
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
dq_result           .data 0

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

//dq_set_index
dq_times8_low       .data 0
dq_times8_high      .data 0
dq_times2_low       .data 0
dq_times2_high      .data 0
dq_and_test         .data 0
