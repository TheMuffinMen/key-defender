speaker out 42	 speaker_sample			

	out 40   num1

sloop	in  41   speaker_response

	be  sloop speaker_response  num0

	out 40   num00

sloop2	in  41   speaker_response

	be  sloop2 speaker_response num1

	ret speaker_ret

speaker_sample .data 0
num1 .data 1
speaker_response .data 0
num00 .data 0
speaker_ret .data 0

