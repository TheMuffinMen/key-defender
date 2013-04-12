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

//This section represents the random number generator used for single player 
//It has three functions:
//  1. Seeding the random number generator: 
//          This needs to be done only once in the program calling the 
//          RNG. It uses random sounds picked up by the microphone as a seed
//          It also initializes values for addr_low_rand and addr_high_rand
//  2. Producing a random number that is 16 bits:
//          Takes the previous random number and produces a new random 
//          number that is 16 bits. This is used for addr_low of SD_Card
//          if the random number for addr_high is 0. (see below)
//  3. Producing a random number thaevery single time t is either 0 or 1:
//          Takes the previous addr_low_rand value and produces a 0 or 1
//          depending on this value.

set_seed	call	microphone	microphone_ra
		cp	rand_micro_1	micro_sample
		call	microphone	microphone_ra
		cp	rand_micro_2	micro_sample
		call	microphone	microphone_ra
		cp	rand_micro_3	micro_sample
		mult	rand_micro_1	rand_micro_1	rand_micro_2
		mult	rand_micro_1	rand_micro_1	rand_micro_3
		add	rand_micro_1	rand_micro_1	rand_micro_2
		cp	micro_sample	rand_micro_1
		and	micro_sample	micro_sample	NUM32767
seed_set    	cp	rand_seed	micro_sample
        	ret	set_seed_ra

rand		mult	rand_seed	rand_seed	NUM263
		add	rand_seed	rand_seed	NUM71
		and	rand_seed	rand_seed	NUM32767        
next_step	cp  	addr_high_rand  rand_seed
set_addr_high   and	addr_high_rand	addr_high_rand	NUM1
set_addr_low    cp	addr_low_rand	rand_seed
		be  	limit_addr_low  addr_high_rand  NUM1
		
		be	    done_rand	0		0
limit_addr_low  blt 	done_rand       addr_low_rand   end_of_dictionary
                sub 	addr_low_rand   addr_low_rand   end_of_dictionary
                be  	limit_addr_low  0               0
			
done_rand	    cp	    dq_imid_low	        addr_low_rand
		    cp	    dq_imid_high	addr_high_rand
		    call    dq_set_index	dq_set_index_ra
		    cp	    addr_low_rand	dq_index_low
		    cp	    addr_high_rand	dq_index_high
	
		


//Starting addresses are defined now

		cp      sd_address_low  addr_low_rand
		cp	sd_address_high addr_high_rand
rand_cp_word	be	done_rand_1	    i_rand	    NUM9
		call	sdcard		sdcard_ra
		cpta	sd_data_read	rand_array  i_rand
		add	i_rand		i_rand	    NUM1
		add	sd_address_low	sd_address_low	NUM1
		be	rand_cp_word	0	    0

done_rand_1	cp	i_rand		NUM0
		ret	rand_ra
		
  


rand_seed           .data   0
addr_high_rand      .data   0
addr_low_rand       .data   0
end_of_dictionary   .data   18673
set_seed_ra         .data   0
rand_ra             .data   0
rand_array	    .data   0
		    .data   0
		    .data   0
		    .data   0
		    .data   0
		    .data   0
		    .data   0
		    .data   0
		    .data   0
		    .data   0
i_rand		    .data   0
mod_rand_low	    .data   0
rand_array_ptr	    .data   0
rand_micro_1	    .data   0
rand_micro_2	    .data   0
rand_micro_3	    .data   0     

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
//#include ../shared_libs/str_help.e
//#include ../shared_libs/nums.e
#include ../microphone_driver/microphone_driver.e
