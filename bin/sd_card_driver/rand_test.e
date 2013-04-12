//This program tests the rand function

start   call	    set_seed	    set_seed_ra
	call	    rand	    rand_ra	
cp_str	be	    end	    i_test_rand_str	    NUM9
	cpfa	    test_tmp	rand_array  i_test_rand_str
	cpta	    test_tmp	test_rand_str	i_test_rand_str
	add	    i_test_rand_str	i_test_rand_str	    NUM1
	be	    cp_str	0	    0
end	call	    rand	    rand_ra
	cp	    i_test_rand_str NUM0
cp_str1	be	    end1    i_test_rand_str	    NUM9
	cpfa	test_tmp	rand_array  i_test_rand_str
	cpta	test_tmp	test_rand_str_2   i_test_rand_str
	add	i_test_rand_str		i_test_rand_str	    NUM1
	be	cp_str1	    0		0
end1	halt
	halt

test_rand_str	.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
test_rand_str_2	.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
		.data	0
i_test_rand_str	.data	0
test_tmp	.data	0
large_number	.data	1000
#include dic_lib.e
