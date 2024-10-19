	.meta source "\"autos/expr.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 9 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L62:
	seti r1, #0
L63:
	invoke 3, 0, 1
	invoke 5, 166, 0
	invoke 5, 167, 5
	invoke 5, 168, 7
	add r169, r167, r168
	invoke 5, 170, 3
	add r171, r169, r170
	invoke 5, 172, 1
	add r173, r171, r172
	seti r174, #3
	mod r175, r173, r174
	add r176, r166, r175
	seti r177, #9
	mod r178, r176, r177
	invoke 4, 178, 0
	add r1, r1, r4
	goto_lt L63, r1, r3
	add r0, r0, r4
	goto_lt L62, r0, r2
	stop
