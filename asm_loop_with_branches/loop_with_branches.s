/**
 * @file loop_with_branches.s
 * @brief Calculates the sum of elements in an array.
 *
 * This code snippet is an assembly code that calculates the sum of the elements in an array called 'list'.
 *
 * Example Usage:
 * ```assembly
 * .global _start
 * .equ endlist, 0xaaaaaaaa
 *
 * _start:
 *     ldr r0, =list
 *     ldr r3, =endlist
 *     ldr r1, [r0]
 *     add r2, r2, r1
 *
 * loop:
 *     ldr r1, [r0, #4]!
 *     cmp r1, r3
 *     beq exit
 *     add r2, r2, r1
 *     BAL loop
 *
 * exit:
 *
 * .data
 * list:
 *     .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
 * ```
 *
 * Code Analysis:
 * - Inputs:
 *   - The array 'list' containing the elements to be summed.
 * - Flow:
 *   1. The address of the 'list' array is loaded into register r0.
 *   2. The address of the 'endlist' variable is loaded into register r3.
 *   3. The first element of the 'list' array is loaded into register r1.
 *   4. The value of r1 is added to the sum in register r2.
 *   5. The next element of the 'list' array is loaded into register r1.
 *   6. The value of r1 is compared to the value of r3.
 *   7. If r1 is equal to r3, the program branches to the 'exit' label.
 *   8. If r1 is not equal to r3, the value of r1 is added to the sum in register r2.
 *   9. The program jumps back to the 'loop' label.
 *   10. The 'exit' label marks the end of the program.
 * - Outputs:
 *   - The sum of the elements in the 'list' array is stored in register r2.
 */

.global _start
.equ endlist, 0xaaaaaaaa

_start:
    ldr r0, =list
    ldr r3, =endlist
    ldr r1, [r0]
    add r2, r2, r1

loop:
    ldr r1, [r0, #4]!
    cmp r1, r3
    beq exit
    add r2, r2, r1
    BAL loop

exit:

.data
list:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	