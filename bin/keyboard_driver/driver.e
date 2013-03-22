input	  	out     20     		num1    
ps2_response    in      21       	input_response
                bne     ps2_response	input_response num1
ps2_pressed     in      22       	input_pressed          
ps2_ascii       in      23       	input_element	
ps2_command2    out     20       	num0
ps2_response2   in      21       	input_response
                bne     ps2_response2  	input_response num0 
                ret   	input_return 
       
     
num0        	.data 	0
num1        	.data   1
num8        	.data   8
input_response 	.data   0
input_pressed  	.data   0
input_element  	.data   0
input_return	.data	0
     
