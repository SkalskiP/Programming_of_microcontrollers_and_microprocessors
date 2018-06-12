# EXPLANATION
# registers rdi, rsi, rdx store subsequent arguments passed to the function
# (a, b, c)

    .data
counts: 
    .fill   128, 0, 2
output:
    .asciz "%d\n"
loop_count:
    .quad   0
    
    .text
    .global _start

_start:

loop:
    mov loop_count, %r13        # loop counter with initial value of 0
    shl $2, %r13                # multiply value of counter by 4, becouse array stores int values

    mov $output, %rdi
    mov %r13, %rsi
    mov $0, %al
    call printf

    incq loop_count           # increment value of loop counter
    cmp $64, loop_count
    jnz loop