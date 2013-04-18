//This program tests the Microphone Driver
beginning	call	microphone		microphone_ra
	
	 	mult	micro_sample	micro_sample	NUM30000
		blt	abs		micro_sample	NUM0
display		out		3	micro_sample
		be	beginning	1 	1
abs		mult	micro_sample 	NUMNEG1	micro_sample
noDisplay	be 	display 	1 	1
		halt
#include microphone_driver.e
#include ../shared_libs/nums.e
