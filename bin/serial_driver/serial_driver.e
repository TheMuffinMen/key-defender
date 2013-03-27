init_serial			out 90 NUM1
					ret init_serial_ra

					
//Returns check_serial_data, check_serial_exist
check_serial		cp check_serial_exist NUM0
					in 91 check_serial_response				
					bne check_serial_ret check_serial_response NUM1
					in 92 check_serial_data
					//be check_serial_ret check_serial_data NUM0
					out 90 NUM0
check_serial_loop	in 91 check_serial_response
					bne check_serial_loop check_serial_response NUM0
					out 90 NUM1
					cp check_serial_exist NUM1
check_serial_ret	ret check_serial_ra


//Parameters: serial_send_data
serial_send			out 102 serial_send_data
					out 100 NUM1
serial_send_loop1	in 101 serial_send_response
					bne serial_send_loop1 serial_send_response NUM1
					out 100 NUM0
serial_send_loop2	in 101 serial_send_response
					bne serial_send_loop2 serial_send_response NUM0
					ret serial_send_ra


//Variables

init_serial_ra				.data 0

check_serial_response		.data 0
check_serial_data			.data 0
check_serial_exist			.data 0
check_serial_ra				.data 0

serial_send_data			.data 0
serial_send_response		.data 0
serial_send_ra				.data 0


#include ../shared_variables/nums.e
