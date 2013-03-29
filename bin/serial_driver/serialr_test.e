			call init_serial init_serial_ra
loop		be ender read_total stop_total
			call check_serial check_serial_ra
			be loop check_serial_exist NUM0
			cpta check_serial_data array read_total
			add read_total read_total NUM1
			be loop 0 0
ender		halt


read_total		.data 0
stop_total		.data 7
array			.data 0
				.data 0
				.data 0
				.data 0
				.data 0
				.data 0
				.data 0
				.data 0
				.data 0
				.data 0
				.data 0

#include serial_driver.e
