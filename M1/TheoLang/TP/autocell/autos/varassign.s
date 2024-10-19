	.meta source "\"autos/varassign.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L58:
	seti r1, #0
L59:
	invoke 3, 0, 1
	invoke 5, 165, 6
	set r164, r165
	add r1, r1, r4
	goto_lt L59, r1, r3
	add r0, r0, r4
	goto_lt L58, r0, r2
	stop
