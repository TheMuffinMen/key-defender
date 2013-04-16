lasergun		cp	sdram_x		sdram_num436
		cp	sdram_y		sdram_num2
		cp	sdram_write	sdram_num0
ram_laser_loop	call	sdram	sdram_ret	
		cp	speaker_sample	sdram_data_read
		call	speaker		speaker_ret
		add	sdram_x		sdram_x		sdram_num1
		be	readforend	sdram_x		sdram_num1721
		be	addy		sdram_x		sdnum2048
		be	ram_laser_loop	sdram_num0	sdram_num0
addy		cp	sdram_x		sdram_num0
		add	sdram_y		sdram_y		sdram_num1
		be	ram_laser_loop	sdram_num0	sdram_num0
readforend	be	end	sdram_y		sdram_num3
		be ram_laser_loop	sdram_num0	sdram_num0	
end		halt

sdram_num2	.data 2
sdram_num436	.data 436
sdnum2048	.data 2048
sdram_num3	.data 3
sdram_num1721	.data 1721

#include speakerdriver.e
#include sdram_driver.e
