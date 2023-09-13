.global _start
_start:
    mov r0, #2       // Load the value 2 into register R0
    mov r1, #4       // Load the value 4 into register R1
    cmp r0, r1       // Compare the values in R0 and R1

    addlt r2, #1     // If R0 is less than R1 (LT: Less Than), add 1 to R2

    mov r0, #6       // Load the value 6 into register R0
    mov r1, #4       // Load the value 4 into register R1
    cmp r0, r1       // Compare the values in R0 and R1

    movge r3, #1     // If R0 is greater than or equal to R1 (GE: Greater Than or Equal), set R3 to 1
