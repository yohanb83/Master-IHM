	seti r0, #0
	seti r1, #1
	seti r2, #0
	seti r3, #0
	invoke 1, 4, 5
	sub r4, r4, r1
	sub r5, r5, r1

l1:
	invoke 3, 2, 3
	invoke 4, 1, 0
	goto_lt l2, r2, r4
	goto_lt l3, r3, r5
	goto lfin
	
l2:
	add r2, r2, r1	
	goto l1
	
l3:
	seti r2, #0
	add r3, r3, r1
	goto l1

lfin:
	stop 
