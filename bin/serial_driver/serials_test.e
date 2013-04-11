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


#include serial_driver.e
#include ../shared_libs/str_help.e
