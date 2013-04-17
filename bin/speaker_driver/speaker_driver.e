speaker         out 42	 speaker_sample			
	            out 40   NUM1
speaker_loop	in  41   speaker_response
	            be  speaker_loop speaker_response  NUM0
	            out 40   NUM0
speaker_loop2	in  41   speaker_response
    	        be  speaker_loop2 speaker_response NUM1
	            ret speaker_ra


speaker_sample      .data 0
speaker_response    .data 0
speaker_ra          .data 0


