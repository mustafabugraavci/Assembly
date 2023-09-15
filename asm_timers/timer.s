.equ TIMER_BASE, 0xFF202000
.equ TIMER_LOAD_OFFSET, 0x0000
.equ TIMER_CONTROL_OFFSET, 0x0008
.equ TIMER_INTCLR_OFFSET, 0x000C
.equ TIMER_RIS_OFFSET, 0x0010
.equ TIMER_MIS_OFFSET, 0x0014
.equ TIMER_BGLOAD_OFFSET, 0x0018
.equ TIMER_DELAY, 1000000

.global _start
_start:
    // Load the base address of the timer peripheral into R0
    ldr R0, =TIMER_BASE

    // Initialize the timer (set the load value and enable it)
    ldr R1, =TIMER_DELAY   // Load value for a 1-second delay (adjust as needed)
    str R1, [R0, #TIMER_LOAD_OFFSET]
    mov R1, #(1 << 7)  // Enable timer and set interrupt mask (bit 7)
    str R1, [R0, #TIMER_CONTROL_OFFSET]

wait_for_timer:
    // Poll the timer status (bit 5 in TIMER_RIS)
    ldr R1, [R0, #TIMER_RIS_OFFSET]
    tst R1, #(1 << 5)
    beq wait_for_timer  // Wait until the timer flag is set

    // Timer has expired, clear the interrupt (bit 5 in TIMER_INTCLR)
    mov R1, #(1 << 5)
    str R1, [R0, #TIMER_INTCLR_OFFSET]

    // Your code here (this is where you can perform actions when the timer expires)

    // Repeat the timer operation (if needed)
    b wait_for_timer
