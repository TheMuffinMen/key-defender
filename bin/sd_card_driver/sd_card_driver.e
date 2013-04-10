sdcard	    out	82	sd_write
	        out	83	sd_address_low
	        out	84	sd_address_high
	        out	85	sd_data_write
	        out	80	NUM1
sdloop	    in	81	sd_response
	        be	sdloop	    sd_response	NUM0
	        be 	sd_no_read  sd_write	NUM1
    	    in	86		sd_data_read
sd_no_read	out	80	NUM0
sdloop2	    in	81  sd_response
	        be	sdloop2	sd_response	NUM1
	        ret	sdcard_ra


sd_write	    .data 0
sd_address_low	.data 0
sd_address_high	.data 0
sd_data_write	.data 0
sd_response	    .data 0
sd_data_read	.data 0
sdcard_ra	    .data 0	
