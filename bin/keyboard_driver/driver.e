key_input	out     20     			NUM1
		ret	key_input_ra 
		   
key_response    in      21       		key_input_response
		cp	key_execute		NUM1
                be    	key_response1   	key_input_response 	NUM0         
is_pressed     	in      22       		key_input_pressed	          
ps2_ascii       in      23       		key_input_element	
ps2_command2    out     20       		NUM0
ps2_response2   in      21       		key_input_response
                bne     ps2_response2  		key_input_response 	NUM0
                out     20     			NUM1 
	   	ret   	key_response_ra
key_response1	cp	key_execute		NUM0
		ret	key_response_ra	   	
       
key_execute		.data	0     
key_input_response 	.data   0
key_input_pressed  	.data   0
key_input_element  	.data   0
key_input_ra		.data	0
key_response_ra		.data	0

