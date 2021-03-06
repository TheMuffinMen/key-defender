buzzer		cp	sdram_x		sdram_num1276
		cp	sdram_y		NUM6
		cp	sdram_write	NUM0
ram_laser_loop	call	sdram	sd_ram_ra	
		cp	speaker_sample	sdram_data_read
		call	speaker		speaker_ra
		add	sdram_x		sdram_x		NUM1
		be	readforend	sdram_x		sdram_num1219
		be	addy		sdram_x		sdnum2048
		be	ram_laser_loop	NUM0		NUM0
addy		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	ram_laser_loop	NUM0		NUM0
readforend	be	end		sdram_y		NUM9
		be ram_laser_loop	NUM0		NUM0	
end		ret	buzzer_ra

buzzer_ra	.data 0
sdram_num1276	.data 1276
sdnum2048	.data 2048
sdram_num1219	.data 1219


#include sd_ram_driver.e
