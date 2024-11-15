	.meta source "\"autos/simpleif.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 1 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L66:
	seti r1, #0
L67:
	invoke 3, 0, 1
	invoke 5, 218, 6
	set r209, r218
	invoke 5, 217, 2
	set r210, r217
	goto_ne L72, r209, r210
	seti r216, #1
	invoke 4, 216, 0
	goto L73
L72:
L73:
	add r214, r209, r210
	seti r215, #2
	goto_eq L68, r214, r215
	invoke 5, 212, 3
	invoke 5, 213, 5
	goto_ge L70, r212, r213
	seti r211, #2
	invoke 4, 211, 0
	goto L71
L70:
L71:
	goto L69
L68:
L69:
	add r1, r1, r4
	goto_lt L67, r1, r3
	add r0, r0, r4
	goto_lt L66, r0, r2
	stop
