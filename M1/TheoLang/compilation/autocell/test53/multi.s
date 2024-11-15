	.meta source "\"test53/multi.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	add r7, r-1, r-1
	add r8, r7, r-1
	seti r9, #0
	goto_eq L2, r8, r9
	seti r5, #1
	invoke 4, 5, 0
	goto L3
L2:
	seti r6, #0
	invoke 4, 6, 0
L3:
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
