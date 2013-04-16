sdram	out	32	sdram_write

	out	33	sdram_x

	out	34	sdram_y

	out	35	sdram_data_write

	out	30 	sdram_num1

ramloop	in	31	sdram_response

	be 	ramloop	sdram_response	sdram_num0

	be 	ramread	sdram_write	sdram_num0

ramloop2	out	30	sdram_num0

ramloop3	in	31	sdram_response

	be	ramloop3	sdram_response	sdram_num1		

	ret	sdram_ret

ramread	in	36	sdram_data_read

	be	ramloop2	sdram_num0	sdram_num0	

sdram_num0	.data 0 
sdram_num1	.data 1
sdram_write	.data 0
sdram_x		.data 0
sdram_y		.data 0
sdram_data_write	.data 0
sdram_data_read	.data 0 
sdram_response	.data 0
sdram_ret	.data 0
