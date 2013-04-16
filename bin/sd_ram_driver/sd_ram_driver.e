sdram	out	32	sdram_write

	out	33	sdram_x

	out	34	sdram_y

	out	35	sdram_data_write

	out	30 	NUM1

ramloop	in	31	sdram_response

	be 	ramloop	sdram_response	NUM0

	be 	ramread	sdram_write	NUM0

ramloop2	out	30	NUM0

ramloop3	in	31	sdram_response

	be	ramloop3	sdram_response	NUM1		

	ret	sd_ram_ra

ramread	in	36	sdram_data_read

	be	ramloop2	NUM0	NUM0	


sdram_write	.data 0
sdram_x		.data 0
sdram_y		.data 0
sdram_data_write	.data 0
sdram_data_read	.data 0 
sdram_response	.data 0
sd_ram_ra	.data 0

#include ../speaker_driver/speaker_driver.e
