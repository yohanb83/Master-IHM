	.meta source "\"autos/vars.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L52:
	seti r1, #0
L53:
	invoke 3, 0, 1
	invoke 5, 139, 6
	set r137, r139
	set r138, r137
	invoke 4, 138, 0
	add r1, r1, r4
	goto_lt L53, r1, r3
	add r0, r0, r4
	goto_lt L52, r0, r2
	stop
