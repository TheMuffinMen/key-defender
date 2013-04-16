soundtoram	cp	sdram_write	sdram_num1
		cp	sdram_x		sdram_num0
		cp	sdram_y		sdram_num0
		cp	sd_address_low	sdram_num0
		cp	sd_address_high	sdram_num16
		cp	sd_write	sdram_num0
callsd		call	sdcard		sdcard_ret
		cp	sdram_data_write	sd_data_read
		call	sdram	sdram_ret
		add	sdram_x		sdram_x		sdram_num1
		
		be	clearx		sdram_x		ramnum2048

addsd		add	sd_address_low	sd_address_low	sdram_num1

		be	testend		sd_address_low	sdnum16421

		be	clearlow	sd_address_low	sdnum32768
		
aftertest	be	callsd		sdram_num0	sdram_num0

clearx		cp	sdram_x		sdram_num0
		add	sdram_y		sdram_y		sdram_num1
		be	addsd		sdram_num0	sdram_num0

clearlow	cp	sd_address_low	sdram_num0
		add	sd_address_high	sd_address_high	sdram_num1
		be	callsd		sdram_num0	sdram_num0

testend		be	end	sd_address_high		sdram_num17
		be	aftertest	sdram_num0	sdram_num0

end		halt

ramnum2048	.data 2048
sdram_num16	.data 16
sdnum32768	.data 32768
sdnum16421	.data 16350
sdram_num17	.data 17


#include sdram_driver.e
#include sdcarddriver.e
