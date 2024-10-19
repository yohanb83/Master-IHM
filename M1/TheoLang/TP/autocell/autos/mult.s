	.meta source "\"autos/mult.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 9 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L56:
	seti r1, #0
L57:
	invoke 3, 0, 1
	invoke 5, 161, 0
	seti r162, #3
	mul r163, r161, r162
	set r141, r163
	seti r157, #1
	invoke 5, 158, 1
	mul r159, r157, r158
	mul r160, r159, r141
	invoke 4, 160, 0
	seti r153, #1
	invoke 5, 154, 0
	mul r155, r141, r154
	add r156, r153, r155
	set r142, r156
	invoke 5, 149, 0
	mul r150, r142, r149
	seti r151, #1
	add r152, r150, r151
	set r143, r152
	seti r145, #1
	add r146, r145, r143
	invoke 5, 147, 0
	mul r148, r146, r147
	set r144, r148
	add r1, r1, r4
	goto_lt L57, r1, r3
	add r0, r0, r4
	goto_lt L56, r0, r2
	stop
