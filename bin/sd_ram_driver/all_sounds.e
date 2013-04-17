laser1		cp	sdram_x		NUM0
		cp	sdram_y		NUM0
		cp	sdram_write	NUM0
ram_laser1_loop	call	sdram	sd_ram_ra	
		cp	speaker_sample	sdram_data_read
		call	speaker		speaker_ra
		add	sdram_x		sdram_x		NUM1
		be	readforend_laser1	sdram_x		NUM436
		be	add_laser1_y		sdram_x		NUM2048
		be	ram_laser1_loop	NUM0		NUM0
add_laser1_y		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	ram_laser1_loop	NUM0		NUM0
readforend_laser1	be	end13		sdram_y		NUM2
		be ram_laser1_loop	NUM0		NUM0	
end13		ret	laser1_ra

laser1_ra	.data 0



lasergun		cp	sdram_x		NUM436
		cp	sdram_y		NUM2
		cp	sdram_write	NUM0
ram_lasergun_loop	call	sdram	sd_ram_ra	
		cp	speaker_sample	sdram_data_read
		call	speaker		speaker_ra
		add	sdram_x		sdram_x		NUM1
		be	readforend_lasergun	sdram_x		NUM1721
		be	add_lasergun_y		sdram_x		NUM2048
		be	ram_lasergun_loop	NUM0		NUM0
add_lasergun_y		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	ram_lasergun_loop	NUM0		NUM0
readforend_lasergun	be	end14		sdram_y		NUM3
		be ram_lasergun_loop	NUM0		NUM0	
end14		ret	lasergun_ra



lasergun_ra	.data 0





chimes	cp	sdram_x		NUM1721
		cp	sdram_y		NUM3
		cp	sdram_write	NUM0
ram_chimes_loop	call	sdram	sd_ram_ra	
		cp	speaker_sample	sdram_data_read
		call	speaker		speaker_ra
		add	sdram_x		sdram_x		NUM1
		be	readforend_chimes	sdram_x		NUM1276
		be	add_chimes_y		sdram_x		NUM2048
		be	ram_chimes_loop	NUM0		NUM0
add_chimes_y		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	ram_chimes_loop	NUM0		NUM0
readforend_chimes	be	end15		sdram_y		NUM6
		be ram_chimes_loop	NUM0		NUM0	
end15		ret	chimes_ra



chimes_ra	.data 0





buzzer		cp	sdram_x		NUM1276
		cp	sdram_y		NUM6
		cp	sdram_write	NUM0
ram_buzzer_loop	call	sdram	sd_ram_ra	
		cp	speaker_sample	sdram_data_read
		call	speaker		speaker_ra
		add	sdram_x		sdram_x		NUM1
		be	readforend_buzzer	sdram_x		sdram_num1219
		be	add_buzzer_y		sdram_x		NUM2048
		be	ram_buzzer_loop	NUM0		NUM0
add_buzzer_y		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	ram_buzzer_loop	NUM0		NUM0
readforend_buzzer	be	end16		sdram_y		NUM9
		be ram_buzzer_loop	NUM0		NUM0	
end16		ret	buzzer_ra

buzzer_ra	.data 0
sdram_num1219	.data 1219




gameover	cp	sdram_x		sdram_num1319
		cp	sdram_y		NUM9
		cp	sdram_write	NUM0
ram_game_loop	call	sdram	sd_ram_ra	
		cp	speaker_sample	sdram_data_read
		call	speaker		speaker_ra
		add	sdram_x		sdram_x		NUM1
		be	readforend_game	sdram_x		sdram_num150
		be	add_game_y		sdram_x		NUM2048
		be	ram_game_loop	NUM0		NUM0
add_game_y		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	ram_game_loop	NUM0		NUM0
readforend_game	be	end17		sdram_y		sdram_num23
		be ram_game_loop	NUM0		NUM0	
end17		ret	gameover_ra

gameover_ra	.data 0
sdram_num23	.data 23
sdram_num1319	.data 1319
sdram_num150	.data 150

soundtoram	cp	sdram_write	NUM1
		cp	sdram_x		NUM0
		cp	sdram_y		NUM0
		cp	sd_address_low	NUM0
		cp	sd_address_high	NUM16
		cp	sd_write	NUM0
callsd		call	sdcard		sdcard_ra
		cp	sdram_data_write	sd_data_read
		call	sdram	sd_ram_ra
		add	sdram_x		sdram_x		NUM1
		
		be	clearx		sdram_x		NUM2048

addsd		add	sd_address_low	sd_address_low	NUM1

		be	testend		sd_address_low	sdnum16384

		be	clearlow	sd_address_low	sdnum32768
		
aftertest	be	callsd		NUM0		NUM0

clearx		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	addsd		NUM0		NUM0

clearlow	cp	sd_address_low	NUM0
		add	sd_address_high	sd_address_high	NUM1
		be	callsd		NUM0	NUM0

testend		be	end18	sd_address_high		NUM17
		be	aftertest	NUM0	NUM0

end18		ret	read_sound_to_ram_ra


sdnum32768	.data 32768
sdnum16384	.data 16384
read_sound_to_ram_ra	.data 0





#include ../sd_card_driver/sd_card_driver.e
#include sd_ram_driver.e
