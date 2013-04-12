        cp  str_copy_from   str_ptr
        cp  str_copy_to     dq_qstr_ptr
        call    str_copy    str_copy_ra
        call    dic_query   dic_query_ra
        halt


str         .data 97
            .data 98
            .data 101
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
            .data 0
str_ptr     .data str

#include dic_lib.e
