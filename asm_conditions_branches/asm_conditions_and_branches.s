.global _start
_start:
	mov r0, #12
	mov r1, #9
	
	cmp r0, r1
	bgt greater
	
greater:
	mov r2, #1 //if r0>r1 r2 = 1
	
	
