inc_str         cp      str_len         NUMNEG1
                cp      str_i           NUM0
                cp      ptr_start       num_str_ptr
length_loop     add     str_len         str_len     NUM1
                cpfa    str_char        0           num_str_ptr
                add     num_str_ptr     num_str_ptr NUM1
                bne     length_loop     str_char    NUM0
                sub     num_str_ptr     num_str_ptr NUM2
                add     ptr_end         num_str_ptr NUM1
                cpfa    str_char        0           num_str_ptr
                be      char_nine       str_char    NUM57
                add     str_char        str_char    NUM1
                cpta    str_char        0           num_str_ptr
                be      inc_str_ret     0           0
char_nine       be      add_digit       num_str_ptr ptr_start
                sub     num_str_ptr     num_str_ptr NUM1
                cpfa    str_char        0           num_str_ptr
                be      char_nine       str_char    NUM57
                add     str_char        str_char    NUM1
                cpta    str_char        0           num_str_ptr
                be      add_zeros       0           0
add_digit       cpta    NUM49           0           num_str_ptr
                add     str_len         str_len     NUM1
                add     ptr_end         ptr_end     NUM1
add_zeros       sub     str_i           ptr_end     num_str_ptr
add_zeros_loop  add     num_str_ptr     num_str_ptr NUM1
                sub     str_i           str_i       NUM1
                be      inc_str_ret     str_i       NUM0
                cpta    NUM48           0           num_str_ptr
                be      add_zeros_loop  0           0
inc_str_ret     ret     inc_str_ra


str_i       .data 0
str_char    .data 0
str_len     .data 0
num_str_ptr .data 0
ptr_start   .data 0
ptr_end     .data 0
inc_str_ra  .data 0
