	.meta source "\"autos/conway.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L0:
	seti r1, #0
L1:
	invoke 3, 0, 1
	invoke 5, 14, 2
	invoke 5, 15, 1
	add r16, r14, r15
	invoke 5, 17, 8
	add r18, r16, r17
	invoke 5, 19, 7
	add r20, r18, r19
	invoke 5, 21, 6
	add r22, r20, r21
	invoke 5, 23, 5
	add r24, r22, r23
	invoke 5, 25, 4
	add r26, r24, r25
	invoke 5, 27, 3
	add r28, r26, r27
	set r5, r28
	invoke 5, 12, 0
	seti r13, #1
	goto_ne L2, r12, r13
	seti r9, #2
	goto_ge L4, r5, r9
	seti r6, #0
	invoke 4, 6, 0
	goto L5
L4:
	seti r8, #3
	goto_le L6, r5, r8
	seti r7, #0
	invoke 4, 7, 0
	goto L7
L6:
L7:
L5:
	goto L3
L2:
	seti r11, #3
	goto_ne L8, r5, r11
	seti r10, #1
	invoke 4, 10, 0
	goto L9
L8:
L9:
L3:
	add r1, r1, r4
	goto_lt L1, r1, r3
	add r0, r0, r4
	goto_lt L0, r0, r2
	stop
