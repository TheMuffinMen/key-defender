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
		
		be	clearx		sdram_x		ramnum2048

addsd		add	sd_address_low	sd_address_low	NUM1

		be	testend		sd_address_low	sdnum16421

		be	clearlow	sd_address_low	sdnum32768
		
aftertest	be	callsd		NUM0		NUM0

clearx		cp	sdram_x		NUM0
		add	sdram_y		sdram_y		NUM1
		be	addsd		NUM0		NUM0

clearlow	cp	sd_address_low	NUM0
		add	sd_address_high	sd_address_high	NUM1
		be	callsd		NUM0	NUM0

testend		be	end	sd_address_high		NUM17
		be	aftertest	NUM0	NUM0

end		ret	read_sound_to_ram_ra

ramnum2048	.data 2048
sdnum32768	.data 32768
sdnum16421	.data 16350
read_sound_to_ram_ra	.data 0



#include sd_ram_driver.e
#include ../sd_card_driver/sd_card_driver.e
