	.meta source "\"autos/neg.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L18:
	seti r1, #0
L19:
	invoke 3, 0, 1
	invoke 5, 78, 6
	seti r79, #0
	sub r78, r79, r78
	set r73, r79
	seti r77, #0
	sub r73, r77, r73
	set r74, r77
	add r75, r73, r74
	seti r76, #0
	sub r75, r76, r75
	invoke 4, 76, 0
	add r1, r1, r4
	goto_lt L19, r1, r3
	add r0, r0, r4
	goto_lt L18, r0, r2
	stop
