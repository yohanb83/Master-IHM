	.meta source "\"autos/divmod.auto\""
	.meta fields "[{ \"name\": \"\", \"num\": 0, \"lo\": 0, \"hi\": 9 }]"
	invoke 1, 2, 3
	seti r4, #1
	seti r0, #0
L76:
	seti r1, #0
L77:
	invoke 3, 0, 1
	invoke 5, 269, 0
	seti r270, #3
	div r271, r269, r270
	set r219, r271
	invoke 5, 266, 0
	seti r267, #3
	mod r268, r266, r267
	set r220, r268
	seti r262, #1
	invoke 5, 263, 1
	div r264, r262, r263
	div r265, r264, r220
	invoke 4, 265, 0
	seti r258, #1
	invoke 5, 259, 1
	mod r260, r258, r259
	mod r261, r260, r220
	invoke 4, 261, 0
	seti r254, #1
	invoke 5, 255, 0
	div r256, r220, r255
	add r257, r254, r256
	set r221, r257
	seti r250, #1
	invoke 5, 251, 0
	mod r252, r221, r251
	add r253, r250, r252
	set r222, r253
	invoke 5, 246, 0
	div r247, r222, r246
	seti r248, #1
	add r249, r247, r248
	set r223, r249
	invoke 5, 242, 0
	mod r243, r223, r242
	seti r244, #1
	add r245, r243, r244
	set r224, r245
	seti r238, #1
	add r239, r238, r224
	invoke 5, 240, 0
	div r241, r239, r240
	set r225, r241
	seti r234, #1
	add r235, r234, r225
	invoke 5, 236, 0
	mod r237, r235, r236
	set r226, r237
	invoke 5, 228, 0
	invoke 5, 229, 6
	mul r230, r226, r229
	seti r231, #2
	div r232, r230, r231
	sub r233, r228, r232
	set r227, r233
	add r1, r1, r4
	goto_lt L77, r1, r3
	add r0, r0, r4
	goto_lt L76, r0, r2
	stop
