	.meta source "\"autos/addsub.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 9 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L12:
	seti r1, #0
L13:
	invoke 3, 0, 1
	invoke 5, 59, 6
	seti r60, #1
	add r61, r59, r60
	set r42, r61
	seti r57, #1
	sub r58, r42, r57
	invoke 4, 58, 0
	seti r53, #5
	sub r54, r53, r42
	invoke 5, 55, 6
	sub r56, r54, r55
	set r43, r56
	seti r49, #5
	add r50, r49, r42
	invoke 5, 51, 6
	sub r52, r50, r51
	set r44, r52
	seti r45, #5
	sub r46, r45, r42
	invoke 5, 47, 6
	add r48, r46, r47
	invoke 4, 48, 0
	add r1, r1, r4
	goto_lt L13, r1, r3
	add r0, r0, r4
	goto_lt L12, r0, r2
	stop
