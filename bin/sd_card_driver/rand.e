//This file represents the random number generator 
//It has three functions:
//  1. Seeding the random number generator: 
//          This needs to be don every single time the program is
//          called. It uses random sounds picked up by the microphone as a seed
//          It also initializes values for addr_low_rand and addr_high_rand
//  2. Producing a random number that is 16 bits:
//          Takes the previous random number and produces a new random 
//          number that is 16 bits. This is used for addr_low of SD_Card
//          if the random number for addr_high is 0. (see below)
//  3. Producing a random number that is either 0 or 1:
//          Takes the previous addr_low_rand value and produces a 0 or 1
//          depending on this value.

rand		call	microphone	microphone_ra
		mult	micro_sample	micro_sample	NUM28672
		blt	set_seed	NUM0		micro_sample
		mult	micro_sample	NUM_minus_1	micro_sample
set_seed	cp	rand_seed	micro_sample
		cp  	addr_high_rand  rand_seed
set_addr_high   blt 	set_addr_low    addr_high_rand  NUM2
                sub 	addr_high_rand  addr_high_rand  NUM2
                be  	set_addr_high   0               0
set_addr_low    be  	limit_addr_low  addr_high_rand  NUM1
		cp  	addr_low_rand   rand_seed
		be	done_rand	0		0
limit_addr_low  blt 	done_rand       addr_low_rand   end_of_dictionary
                sub 	addr_low_rand   addr_low_rand   end_of_dictionary
                be  	limit_addr_low  0               0
			
done_rand	cp	dq_imid_low	addr_low_rand
		cp	dq_imid_high	addr_high_rand
		call	dq_set_index	dq_set_index_ra
		cp	addr_low_rand	dq_index_low
		cp	addr_high_rand	dq_index_high
	
		
adjust_rand_low	sub addr_low_rand   addr_low_rand   mod_rand_low
//Starting addresses are defined now
		cp      sd_address_low  addr_low_rand
		cp	sd_address_high addr_high_rand
rand_cp_word	be	done_rand_1	i_rand	    NUM9
		call	sdcard		sdcard_ra
		cpta	sd_data_read	rand_array  i_rand
		add	i_rand		i_rand	    NUM1
		add	sd_address_low	sd_address_low	NUM1
		be	rand_cp_word	0	    0

done_rand_1	ret	rand_ra
		
  


rand_seed           .data   0
addr_high_rand      .data   0
addr_low_rand       .data   0
end_of_dictionary   .data   18673
seed_ra             .data   0
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

#include dic_lib.e

