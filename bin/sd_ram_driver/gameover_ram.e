gameover	cp	sdram_x		sdram_num1219
		cp	sdram_y		NUM9
		cp	sdram_write	NUM0
ram_laser_loop	call	sdram	sd_ram_ra	
		cp	speaker_sample	sdram_data_read
		call	speaker		speaker_ra
		add	sdram_x		sdram_x		NUM1
		be	readforend	sdram_x		NUM58
		be	addy		sdram_x		sdnum2048
		be	ram_laser_loop	NUM0		NUM0
addy		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	ram_laser_loop	NUM0		NUM0
readforend	be	end		sdram_y		sdram_num23
		be ram_laser_loop	NUM0		NUM0	
end		ret	gameover_ra

gameover_ra	.data 0
sdram_num23	.data 23
sdram_num1219	.data 1319
sdnum2048	.data 2048
sdram_num58	.data 150


#include sd_ram_driver.e
