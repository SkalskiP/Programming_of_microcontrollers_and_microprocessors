# EXPLANATION
# registers rdi, rsi, rdx store subsequent arguments passed to the function
# (a, b, c)

    .data
output:
    .asciz "%d\n"
count:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
loop_count:
    .quad   0
ext_loop_count:
    .quad   12
    
    .text
    .type check_tab, @function
	.global check_tab

check_tab:
    xor %r11, %r11
    mov $5, %r11

    xor %r10, %r10
    mov %rdx, %r10
    mov %rdi, %r14              # pointer to beginnig of array
    mov %rsi, %r12              # moving argument n - number of elements to %r12 register to use it later
    push $0                     # push value representing the maximum number of occurrences of any number
                                # it will be poped ad the end of each iteration

    mov $0, %r15                # number that will be our output value

loop_over_numbers:
    push $0
    movq $0, loop_count

loop:
    mov loop_count, %r13        # loop counter with initial value of 0
    shl $2, %r13                # multiply value of counter by 4, becouse array stores int values

    add %r14, %r13              # calculate location in array

/*
    mov $output, %rdi
    mov (%r13), %rsi
    mov $0, %al
    call printf

    mov $output, %rdi
    mov ext_loop_count, %rsi
    mov $0, %al
    call printf
*/
    mov ext_loop_count, %rdi
    cmp (%r13), %rdi
    jne not_equal

    pop %rsi
    inc %rsi
    push %rsi
/*
    mov $output, %rdi
    mov $0, %al
    call printf
*/
not_equal:

    incq loop_count             # increment value of loop counter
    cmp %r12, loop_count        # compere curent counter value with max counter value
    jb loop                    # jump if not zero
    
    pop %rsi
    pop %rbx
/*
    mov $output, %rdi
    mov $0, %al
    call printf
*/
    cmp %rsi, %rbx
    jg not_high_enough
    
    push %rsi
    jmp back_on_track

not_high_enough:
    push %rdi

back_on_track:

    decq    ext_loop_count	    # decrementing counter of loop_over_numbers with size of byte by one
    jnz loop_over_numbers  		# if flag not zero jump to label loop  

    pop %rax
    mov %r11, (%r10)
    ret


/*
loop:
    mov loop_count, %r13        # loop counter with initial value of 0
    shl $2, %r13                # multiply value of counter by 4, becouse array stores int values

    add %r14, %r13

    mov $output, %rdi
    mov (%r13), %rsi
    mov $0, %al
    call printf

    incq loop_count           # increment value of loop counter
    cmp %r12, loop_count      # compere curent counter value with max counter value
    jnz loop                  # jump if not zero
*/