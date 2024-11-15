	.meta source "\"autos/undeclared.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L30:
	seti r1, #0
L31:
	invoke 3, 0, 1
	set r95, r80
	invoke 4, 95, 0
	add r1, r1, r4
	goto_lt L31, r1, r3
	add r0, r0, r4
	goto_lt L30, r0, r2
	stop
