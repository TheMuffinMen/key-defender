        cp str_comp_str1 str1_ptr
        cp str_comp_str2 str2_ptr
        call str_comp str_comp_ra
        cp elt str_comp_result
        halt

str1        .data 100
            .data 112
            .data 108
            .data 120
            .data 98
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
str1_ptr    .data str1

str2        .data 100
            .data 112
            .data 108
            .data 120
            .data 98
            .data 0
            .data 122
            .data 0
            .data 0
            .data 0
            .data 0
str2_ptr    .data str2

elt         .data 0

#include str_help.e
#include nums.e
