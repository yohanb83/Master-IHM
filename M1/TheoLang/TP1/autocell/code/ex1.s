	seti r0, #0
	seti r1, #1
	seti r2, #2
	
l1: 
	goto_ge l2, r0, r2
	add r0, r0, r1
	goto l1
	
l2:
	stop
