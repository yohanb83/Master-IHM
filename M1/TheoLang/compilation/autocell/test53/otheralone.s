	.meta source "\"test53/otheralone.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	invoke 5, 15, 7
	seti r16, #1
	goto_ne L6, r15, r16
	seti r14, #1
	set r5, r14
	goto L7
L6:
L7:
	invoke 5, 12, 8
	seti r13, #1
	goto_ne L4, r12, r13
	seti r11, #1
	set r6, r11
	goto L5
L4:
L5:
	invoke 5, 9, 1
	seti r10, #1
	goto_ne L2, r9, r10
	seti r8, #1
	set r7, r8
	goto L3
L2:
L3:
	invoke 4, 7, 0
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
