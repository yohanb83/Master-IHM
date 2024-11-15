	.meta source "\"autos/griffeath.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 3 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L32:
	seti r1, #0
L33:
	invoke 3, 0, 1
	invoke 5, 132, 0
	seti r133, #1
	add r134, r132, r133
	seti r135, #4
	mod r136, r134, r135
	set r96, r136
	seti r131, #0
	set r97, r131
	invoke 5, 130, 2
	goto_ne L50, r130, r96
	seti r128, #1
	add r129, r97, r128
	set r98, r129
	goto L51
L50:
L51:
	invoke 5, 127, 3
	goto_ne L48, r127, r96
	seti r125, #1
	add r126, r98, r125
	set r99, r126
	goto L49
L48:
L49:
	invoke 5, 124, 4
	goto_ne L46, r124, r96
	seti r122, #1
	add r123, r99, r122
	set r100, r123
	goto L47
L46:
L47:
	invoke 5, 121, 1
	goto_ne L44, r121, r96
	seti r119, #1
	add r120, r100, r119
	set r101, r120
	goto L45
L44:
L45:
	invoke 5, 118, 5
	goto_ne L42, r118, r96
	seti r116, #1
	add r117, r101, r116
	set r102, r117
	goto L43
L42:
L43:
	invoke 5, 115, 8
	goto_ne L40, r115, r96
	seti r113, #1
	add r114, r102, r113
	set r103, r114
	goto L41
L40:
L41:
	invoke 5, 112, 7
	goto_ne L38, r112, r96
	seti r110, #1
	add r111, r103, r110
	set r104, r111
	goto L39
L38:
L39:
	invoke 5, 109, 6
	goto_ne L36, r109, r96
	seti r107, #1
	add r108, r104, r107
	set r105, r108
	goto L37
L36:
L37:
	seti r106, #3
	goto_lt L34, r105, r106
	invoke 4, 96, 0
	goto L35
L34:
L35:
	add r1, r1, r4
	goto_lt L33, r1, r3
	add r0, r0, r4
	goto_lt L32, r0, r2
	stop
