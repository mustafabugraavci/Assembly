.equ TIMER_BASE, 0xFF202000
.equ TIMER_LOAD_OFFSET, 0x0000
.equ TIMER_CONTROL_OFFSET, 0x0008
.equ TIMER_INTCLR_OFFSET, 0x000C
.equ TIMER_RIS_OFFSET, 0x0010
.equ TIMER_MIS_OFFSET, 0x0014
.equ TIMER_BGLOAD_OFFSET, 0x0018
.equ TIMER_DELAY, 100000

.equ leds, 0xff200000

.global _start
_start:
    // Load the base address of the timer peripheral into R0
    ldr R0, =TIMER_BASE

    // Initialize the timer (set the load value and enable it)
    ldr R1, =TIMER_DELAY   // Load value for a 1-second delay (adjust as needed)
    str R1, [R0, #TIMER_LOAD_OFFSET]
    mov R1, #(1 << 7)  // Enable timer and set interrupt mask (bit 7)
    str R1, [R0, #TIMER_CONTROL_OFFSET]

	ldr r6, =leds
	mov r7, #0x1

wait_for_timer:
	
	ror r7, r7, #1
	str r7, [r6]
	
    ldr R1, [R0, #TIMER_RIS_OFFSET]
    cmp R1, #(1 << 5)

    beq wait_for_timer 

  
    mov R1, #(1 << 5)
    str R1, [R0, #TIMER_INTCLR_OFFSET]

    b wait_for_timer
