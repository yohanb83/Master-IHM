	.meta source "\"autos/var1.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L60:
	seti r1, #0
L61:
	invoke 3, 0, 1
	invoke 4, 164, 0
	add r1, r1, r4
	goto_lt L61, r1, r3
	add r0, r0, r4
	goto_lt L60, r0, r2
	stop
