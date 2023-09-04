.global _start
_start:
	mov r0,#30
	
	mov r7, #1
	swi 0

	// This ARM assembly code sets the r0 register to 30, 
	//places 1 in the r7 register, 
	//and triggers a software interrupt with code 0, 
	//typically used for making system calls in ARM-based operating systems.
	
	

