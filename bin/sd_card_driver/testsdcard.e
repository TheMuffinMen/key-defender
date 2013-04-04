	
	cp	sd_address_low	sdnum0
	
	cp	sd_address_high	sdnum0

read1	cp	sd_write	sdnum0

	be	end	sd_address_low	num7
	
	call	sdcard	sdcard_ret

	add	sd_address_low	sd_address_low	sdnum1

	cp	sd_write	sdnum1

	cp	sd_data_write	sd_data_read

	cpta	sd_data_write	array	numi

	add	numi	numi	sdnum1

	be	read1	sdnum0	sdnum0

end	halt

sdnum1	.data 1
sdnum0	.data 0
numi	.data 0
num7	.data 512

array	.data 0
	.data 0
	.data 0
	.data 0
	.data 0
	.data 0
	.data 0
	.data 0
	.data 0
	.data 0 


#include sdcarddriver.e
