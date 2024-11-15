	.meta source "\"autos/add2.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 9 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	invoke 5, 15, 0
	invoke 5, 16, 6
	add r17, r15, r16
	set r5, r17
	invoke 5, 12, 2
	add r13, r5, r12
	add r14, r13, r5
	set r6, r14
	add r7, r5, r6
	invoke 5, 8, 6
	add r9, r7, r8
	invoke 5, 10, 0
	add r11, r9, r10
	invoke 4, 11, 0
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
