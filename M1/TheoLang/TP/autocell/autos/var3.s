	.meta source "\"autos/var3.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L74:
	seti r1, #0
L75:
	invoke 3, 0, 1
	invoke 4, -1, 0
	add r1, r1, r4
	goto_lt L75, r1, r3
	add r0, r0, r4
	goto_lt L74, r0, r2
	stop
