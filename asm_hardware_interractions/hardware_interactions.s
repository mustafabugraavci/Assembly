.equ switch, 0xff200040
.equ leds, 0xff200000

.global _start
_start:
    // Load the address of the 'switch' memory-mapped register into R0
    ldr r0, =switch

    // Read the value stored at the 'switch' address into R1
    ldr r1, [r0]

    // Load the address of the 'leds' memory-mapped register into R2
    ldr r2, =leds

    // Store the value from R1 into the 'leds' address
    str r1, [r2]
