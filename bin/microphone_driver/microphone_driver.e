//This program is a device driver for the microphone
//It will be used as a seed for the random number generator
microphone	out	50		NUM1
micro_read1	in	51		response
		bne	micro_read1	response		NUM1
		in	52		micro_sample
		out	50	        NUM0
micro_read2	in	51		response
		bne	micro_read2	response	NUM0
		ret	microphone_ra

micro_command		.data	0
micro_sample		.data	0
micro_respond		.data	0
microphone_ra 		.data	0
response		.data	0
