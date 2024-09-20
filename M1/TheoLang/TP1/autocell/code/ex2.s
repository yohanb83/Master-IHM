	seti r0, #0
	seti r1, #1
	invoke 1, 2, 3
	sub r2, r2, r1
	sub r3, r3, r1

l1:
	invoke 3, 0, 0
	invoke 4, 1, 0 
	
	invoke 3, 0, 3
	invoke 4, 1, 0
		
	invoke 3, 2, 0
	invoke 4, 1, 0
	
	invoke 3, 2, 3
	invoke 4, 1, 0
	
	STOP
