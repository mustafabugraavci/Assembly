.global _start
_start:
	
	mov r0, #10 //r0 = 10
	lsl r1, r0, #2 //r1 = r0 << 2
	
	lsr r2, r0, #1 // r2 = r0 << 1
	
	mov r3, r0, lsl #1
	
	ror r4, r0, #1
	