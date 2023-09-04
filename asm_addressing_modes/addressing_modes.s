.global _start
_start:

//-----------Array Summation---------------------------------------//

    MOV R0, #0          // Initialize the sum to 0
    MOV R1, #0          // Initialize the index to 0
    MOV R2, #10         // Number of elements in the array

Loop:
    LDR R3, [R4, R1]     // Load the value at array[R1] into R3
    ADD R0, R0, R3       // Add the value to the sum in R0
    ADD R1, R1, #4       // Increment the index by 4 (assuming 4-byte integers)
    CMP R1, R2           // Compare the index to the number of elements
    BNE Loop             // If not equal, repeat the loop

//-----------Conditional Branching---------------------------------------//

    MOV R0, #42         // Load a value into R0
    CMP R0, #50         // Compare R0 to 50
    BEQ Equal           // Branch if equal to the "Equal" label
    BNE NotEqual        // Branch if not equal to the "NotEqual" label

Equal:
    // Code to execute if R0 is equal to 50
    //...

NotEqual:
    // Code to execute if R0 is not equal to 50
    //...