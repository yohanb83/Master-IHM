	.meta source "\"autos/parent.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 9 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L64:
	seti r1, #0
L65:
	invoke 3, 0, 1
	invoke 5, 204, 0
	invoke 5, 205, 6
	add r206, r204, r205
	seti r207, #5
	add r208, r206, r207
	set r179, r208
	invoke 5, 199, 0
	invoke 5, 200, 6
	seti r201, #5
	add r202, r200, r201
	add r203, r199, r202
	set r180, r203
	invoke 5, 194, 0
	invoke 5, 195, 6
	seti r196, #5
	add r197, r195, r196
	add r198, r194, r197
	set r181, r198
	invoke 5, 189, 0
	invoke 5, 190, 6
	seti r191, #1
	add r192, r190, r191
	sub r193, r189, r192
	set r182, r193
	invoke 5, 184, 0
	invoke 5, 185, 6
	seti r186, #1
	sub r187, r185, r186
	sub r188, r184, r187
	set r183, r188
	add r1, r1, r4
	goto_lt L65, r1, r3
	add r0, r0, r4
	goto_lt L64, r0, r2
	stop
