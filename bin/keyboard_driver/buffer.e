cll   	call  	input    	input_return
tmp     bne   	cll            	input_pressed  	num1
	cpta	input_element	buffer_array	buffer_i
	add	buffer_i	buffer_i	num1	     
        be    	cll           	num1     	num1
        halt         

	


buffer_i       	.data	0
buffer_array	.data	0	
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0	
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
#include driver.e
