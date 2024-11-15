	.meta source "\"autos/ifelse.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L20:
	seti r1, #0
L21:
	invoke 3, 0, 1
	invoke 5, 94, 6
	set r80, r94
	invoke 5, 93, 2
	set r81, r93
	goto_ne L28, r80, r81
	seti r91, #1
	invoke 4, 91, 0
	goto L29
L28:
	seti r92, #0
	invoke 4, 92, 0
L29:
	add r89, r80, r81
	seti r90, #2
	goto_eq L22, r89, r90
	invoke 5, 84, 3
	invoke 5, 85, 5
	goto_ge L24, r84, r85
	seti r82, #2
	invoke 4, 82, 0
	goto L25
L24:
	seti r83, #0
	invoke 4, 83, 0
L25:
	goto L23
L22:
	invoke 5, 87, 0
	seti r88, #0
	goto_ne L26, r87, r88
	seti r86, #1
	invoke 4, 86, 0
	goto L27
L26:
L27:
L23:
	add r1, r1, r4
	goto_lt L21, r1, r3
	add r0, r0, r4
	goto_lt L20, r0, r2
	stop
