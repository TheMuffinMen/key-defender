loop		be ender send stop
			cp serial_send_data send
			call serial_send serial_send_ra
			add send send NUM1
			be loop 0 0
ender		halt


send		.data 100
stop		.data 105

#include serial_driver.e
