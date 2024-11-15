	.meta source "\"autos/add1.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 9 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L16:
	seti r1, #0
L17:
	invoke 3, 0, 1
	invoke 5, 70, 0
	invoke 5, 71, 6
	add r72, r70, r71
	set r62, r72
	invoke 5, 68, 2
	add r69, r62, r68
	set r63, r69
	invoke 5, 66, 5
	add r67, r66, r62
	set r64, r67
	add r65, r63, r64
	invoke 4, 65, 0
	add r1, r1, r4
	goto_lt L17, r1, r3
	add r0, r0, r4
	goto_lt L16, r0, r2
	stop
