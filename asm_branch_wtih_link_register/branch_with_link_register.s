.global _start
_start:
    mov r0, #1         // Load the value 1 into register R0
    mov r1, #3         // Load the value 3 into register R1
    BL add2            // Call the add2 function

    mov r3, #4         // Load the value 4 into register R3

add2:
    add r2, r0, r1     // Add the values in R0 and R1, result in R2
    bx lr              // Return from the function using the link register (LR)