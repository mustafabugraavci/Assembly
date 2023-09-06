.global _start
_start:
	mov r0, #5
	mov r1, #6
	add r2, r1, r0 // r2 = r1 + r0
	
	sub r3, r0, r1 // r3 = r0 - r1
	
	mul r4, r0, r1 // r4 = r0 * r1
	
	subs r5, r0, r1 // r3 = r0 - r1 
	
	mov r6, #0xffffffff
	mov r7, #0x10
	adds r8, r6, r7 // r2 = r1 + r0 
	