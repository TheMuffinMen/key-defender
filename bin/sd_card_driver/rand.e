//This file represents the random number generator 
//It has three functions:
//  1. Seeding the random number generator: 
//          This only needs to be done once at the beginning of the program
//          calling it. It uses the current clock value as the seeding value
//          It also initializes values for addr_low_rand and addr_high_rand
//  2. Producing a random number that is 16 bits:
//          Takes the previous random number and produces a new random 
//          number that is 16 bits. This is used for addr_low of SD_Card
//          if the random number for addr_high is 0. (see below)
//  3. Producing a random number that is either 0 or 1:
//          Takes the previous addr_low_rand value and produces a 0 or 1
//          depending on this value.

seed_rand       in  5   rand_seed
                cp  addr_high_rand  rand_seed
set_addr_high   blt set_addr_low    addr_high_rand  NUM2
                sub addr_high_rand  addr_high_rand  NUM2
                be  set_addr_high   0               0
set_addr_low    be  limit_addr_low  addr_high_rand  NUM1
                cp  addr_low_rand   end_of_dictionary
limit_addr_low  blt done_seed       addr_low_rand   end_of_dictionary
                sub addr_low_rand   addr_low_rand   end_of_dictionary
                be  limit_addr_low  0               0
done_seed       ret seed_ra

rand            cp  addr_high_rand  addr_low_rand
set_rand_high   blt set_rand_low    addr_high_rand  NUM2
                sub addr_high_rand  addr_high_rand  NUM2
                be  set_rand_high   0               0
set_rand_low    mult addr_low_rand  addr_low_rand   NUM263
                add addr_low_rand   addr_low_rand   NUM71
                be  done_rand       addr_high_rand  NUM0
mod_limit_low   blt done_rand       addr_low_rand   end_of_dictionary
                sub addr_low_rand   addr_low_rand   end_of_dictionary
                be  mod_limit_low   0               0

done_rand       ret rand_ra  


rand_seed           .data   0
addr_high_rand      .data   0
addr_low_rand       .data   0
end_of_dictionary   .data   18673
seed_ra             .data   0
rand_ra             .data   0
#include ../shared_libs/nums.e
