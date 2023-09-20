.global matrix_multiply

matrix_multiply:
    // Input:
    // r0: Pointer to matrix A
    // r1: Pointer to matrix B
    // r2: Pointer to the result matrix C
    // r3: Matrix size (number of rows/columns)
    
    push {r4, r5, r6, r7}
    
    mov r4, r0      // Copy the address of matrix A to r4
    mov r5, r1      // Copy the address of matrix B to r5
    mov r6, r2      // Copy the address of matrix C to r6
    
    // Clear the result matrix C
    ldr r7, =0
    mov r8, r3
    muls r8, r8, #4
    clear_loop:
        str r7, [r6], #4
        subs r8, r8, #4
        bne clear_loop
    
    // Perform matrix multiplication
    mul_loop_outer:
        mov r9, r0      // Reload the address of matrix A to r9
        mul_loop_inner:
            ldr r10, [r5], #4
            ldr r11, [r9]
            mul r10, r10, r11
            ldr r11, [r6]
            add r11, r11, r10
            str r11, [r6]
            add r9, r9, #4
            subs r8, r8, #1
            bne mul_loop_inner
        
        // Move to the next row of matrix A
        add r0, r0, r3, lsl #2
        
        // Move to the next row of matrix C
        add r6, r6, r3, lsl #2
        
        // Reset the column pointer of matrix B
        mov r5, r1
        
        // Decrease the row counter
        subs r7, r7, #1
        bne mul_loop_outer
    
    pop {r4, r5, r6, r7}
    bx lr