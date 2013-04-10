//Functions for use with (C-style) strings

//Copies the contents of str_copy_from to str_copy_to.
//Parameters: (pointer) str_copy_from, (pointer) str_copy_to
//Returns nothing
str_copy	    cpfa str_copy_elt 0 str_copy_from
				cpta str_copy_elt 0 str_copy_to
				be str_copy_ret str_copy_elt NUM0
				add str_copy_from str_copy_from NUM1
				add str_copy_to str_copy_to NUM1
				be str_copy 0 0
str_copy_ret	ret str_copy_ra


//Compares the contents of str_comp_str1 to str_comp_str2. Returns str_comp_result which is the ASCII 
//difference between the first pair of characters that differ in the two passed strings. If no characters 
//differ between the two strings, str_comp_result will be 0.
//Paramters: (pointer) str_comp_str1, (pointer) str_comp_str2
//Returns: str_comp_result
str_comp        cpfa str_comp_elt1 0 str_comp_str1
                cpfa str_comp_elt2 0 str_comp_str2
                sub str_comp_result str_comp_elt1 str_comp_elt2
                bne str_comp_ret str_comp_result NUM0
                be str_comp_ret str_comp_elt1 NUM0
                add str_comp_str1 str_comp_str1 NUM1
                add str_comp_str2 str_comp_str2 NUM1
                be str_comp 0 0
str_comp_ret    ret str_comp_ra


//Variables

str_copy_from	.data 0
str_copy_to		.data 0
str_copy_elt	.data 0
str_copy_ra		.data 0

str_comp_str1   .data 0
str_comp_str2   .data 0
str_comp_elt1   .data 0
str_comp_elt2   .data 0
str_comp_result .data 0
str_comp_ra     .data 0
