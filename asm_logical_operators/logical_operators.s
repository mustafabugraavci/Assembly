.global _start
_start:
	mov r0, #0xff
	mov r1, #22
	and r2, r0, r1 //r2 = r0 & r1
	
	ands r3, r0, r1 //r3 = r0 & r1 with flags
	
	orr r4, r0, r1 //r4 = r0 | r1
	
	eor r5, r0, r1 //r5 = r0 ^ r1
	
	mvn r6, r0 // r6 = !r0
	