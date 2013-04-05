//Tests the dictionary
   cp	 sd_address_low	   NUM0
   cp	 sd_address_high   NUM0
   cp	 sd_write	   NUM0

check be end   sd_address_low	NUM10
      call     sdcard	      sdcard_ret
      cpta     sd_data_read   dict_str	  i_dict
      add      i_dict	      i_dict	  NUM1
      add      sd_address_low sd_address_low NUM1
      be       check	   0	       0

end   halt

i_dict	    .data    0
dict_str    .data    0
	    .data    0
	    .data    0
	    .data    0
	    .data    0
	    .data    0
	    .data    0
	    .data    0
	    .data    0
	    .data    0
	    .data    0

#include sdcarddriver.e
#include ../shared_variables/nums.e 
   
