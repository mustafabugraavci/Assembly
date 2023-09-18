.global _start

.section .data
msg:
    .asciz "Hello, ARM Assembly!\n"

.section .text
_start:
    mov r0, #4;
    ldr r1, =msg
    mov r2, #18;
    mov r7, #4;
    swi 0

    mov r7, #1
    swi 0
