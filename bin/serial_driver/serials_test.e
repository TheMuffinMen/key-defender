			cp str_copy_from str_ptr
			cp str_copy_to str_send_ptr
			call str_copy str_copy_ra
			call str_send str_send_ra
			halt

elt			.data 0
index		.data 0
str			.data 97
			.data 102
			.data 112
			.data 107
			.data 120
			.data 103
			.data 0
str_ptr		.data str


//Parameters str_copy_from, str_copy_to
str_copy		cp str_copy_index NUM0
str_copy_loop	cpfa str_copy_elt 0 str_copy_from
				cpta str_copy_elt 0 str_copy_to
				be str_copy_ret str_copy_elt NUM0
				add str_copy_from str_copy_from NUM1
				add str_copy_to str_copy_to NUM1
				be str_copy_loop 0 0
str_copy_ret	ret str_copy_ra

str_copy_from	.data 0
str_copy_to		.data 0
str_copy_elt	.data 0
str_copy_index	.data 0
str_copy_ra		.data 0

#include serial_driver.e
