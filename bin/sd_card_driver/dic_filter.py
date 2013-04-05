def d_filter():
	allowable_chars = "abcdefghigklmnopqrstuvwxyz0123456789"
	allow = True
	dic = []
	new_dic = []

	dic = list(line.strip() for line in open('words'))
	for word in dic[:]:
		allow = True
		if len(word) < 3 or len(word) > 10:
			allow = False
		for c in word:
			if c not in allowable_chars:
				allow = False
		if allow:
			new_dic.append(word)

	new_f = open('filtered_words', 'w')
	for word in new_dic:
		new_f.write("%s\n" % word)
	new_f.close()
