init_serial			out 90 NUM1
					ret init_serial_ra


check_buffer		in 91 check_buffer_response				
					bne check_serial_ret check_buffer_response NUM1
					in 92 check_buffer_data
					out 90 NUM0
check_buffer_loop	in 91 check_buffer_response
					bne check_buffer_loop check_buffer_response NUM0
					out 90 NUM1
check_serial_ret	ret check_serial_ra


serial_send			out 102 serial_send_data
					out 100 NUM1
serial_send_loop1	in 101 serial_send_response
					bne serial_send_loop1 serial_send_response NUM1
					out 100 NUM0
serial_send_loop2	in 101 serial_send_response
					bne serial_send_loop2 serial_send_response NUM1
					ret serial_send_ra

serial_send_str		
			
