word_send_test	cp 	str_copy_from 		draw_str_ptr
		cp 	str_copy_to 		str_send_ptr
		call 	str_copy 		str_copy_ra
		call 	str_send 		str_send_ra
		ret	word_send_test_ra

elt			.data 0
index			.data 0



#include serial_driver.e
