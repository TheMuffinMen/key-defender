sdcard	out	82	sd_write

	out	83	sd_address_low

	out	84	sd_address_high

	out	85	sd_data_write

	out	80	sd_num1

sdloop	in	81	sd_response

	be	sdloop	sd_response	sd_num0

	be 	read	sd_write	sd_num0


sdloop2	out	80	sd_num0

sdloop3	in	81	sd_response

	be	sdloop3	sd_response	sd_num1

	ret	sdcard_ret

read	in	86		sd_data_read

	be 	sdloop2		sd_num0	sd_num0

sd_num0		.data 0
sd_num1		.data 1
sd_write	.data 0
sd_address_low	.data 0
sd_address_high	.data 0
sd_data_write	.data 0
sd_response	.data 0
sd_data_read	.data 0
sdcard_ret	.data 0	
