        cp  str_copy_from   str_ptr
        cp  str_copy_to     dq_qstr_ptr
        call    str_copy    str_copy_ra
        call    dic_query   dic_query_ra
        halt


str         .data 100
            .data 114
            .data 97
            .data 105
            .data 110
            .data 101
            .data 114
            .data 0
            .data 0
            .data 0
            .data 0
str_ptr     .data str

#include dic_lib.e
