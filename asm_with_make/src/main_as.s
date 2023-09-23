.global calculate_fibonacci
calculate_fibonacci:
    // Input:
    // r0: n (the Fibonacci number to compute)
    
    // Base cases: F(0) = 0, F(1) = 1
    cmp r0, #1
    itt ls
    movls r0, #1
    movls pc, lr
    
    // Initialize variables
    mov r1, #0   // F(0)
    mov r2, #1   // F(1)
    mov r3, #2   // Current index (starts from 2)

calculate_loop:
    // Compute F(n) = F(n-1) + F(n-2)
    add r4, r1, r2
    mov r1, r2
    mov r2, r4
    
    // Increment current index
    add r3, r3, #1
    
    // Check if we've reached n
    cmp r3, r0
    bne calculate_loop
    
    // Result is in r2, store it in the GRV
    str r2, [r0]
    
    bx lr
    