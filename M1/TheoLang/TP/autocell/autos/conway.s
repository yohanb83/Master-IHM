	.meta source "\"autos/conway.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L2:
	seti r1, #0
L3:
	invoke 3, 0, 1
	invoke 5, 27, 2
	invoke 5, 28, 1
	add r29, r27, r28
	invoke 5, 30, 8
	add r31, r29, r30
	invoke 5, 32, 7
	add r33, r31, r32
	invoke 5, 34, 6
	add r35, r33, r34
	invoke 5, 36, 5
	add r37, r35, r36
	invoke 5, 38, 4
	add r39, r37, r38
	invoke 5, 40, 3
	add r41, r39, r40
	set r18, r41
	invoke 5, 25, 0
	seti r26, #1
	goto_ne L4, r25, r26
	seti r22, #2
	goto_ge L6, r18, r22
	seti r19, #0
	invoke 4, 19, 0
	goto L7
L6:
	seti r21, #3
	goto_le L8, r18, r21
	seti r20, #0
	invoke 4, 20, 0
	goto L9
L8:
L9:
L7:
	goto L5
L4:
	seti r24, #3
	goto_ne L10, r18, r24
	seti r23, #1
	invoke 4, 23, 0
	goto L11
L10:
L11:
L5:
	add r1, r1, r4
	goto_lt L3, r1, r3
	add r0, r0, r4
	goto_lt L2, r0, r2
	stop
