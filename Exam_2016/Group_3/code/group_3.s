# EXPLANATION
# registers rdi, rsi, rdx store subsequent arguments passed to the function
# (buff, a, b)
# %r9 buff
# %r10 a
# %r11 b

    .type fun, @function
	.global fun

fun:

    push %rdi
    mov %rdi, %r9
    mov %rsi, %r10
    mov %rdx, %r11

    mov $1, %r14        # flag can I use a string?
    mov $1, %r15        # flag can I use b string?

loop:
    cmp $0, %r14                # check can I use a string
    je end_of_a_operations      # if cant jump

    mov (%r10), %r8
    cmp $0, %r8
    je end_of_a

    mov (%r10), %r8
    mov %r8, (%r9)
    inc %r9
    inc %r10
    jmp end_of_a_operations

end_of_a:
    mov $0, %r14
    
end_of_a_operations:

    cmp $0, %r15                # check can I use a string
    je end_of_b_operations      # if cant jump

    mov (%r11), %r8
    cmp $0, %r8
    je end_of_b

    mov (%r11), %r8
    mov %r8, (%r9)
    inc %r9
    inc %r11
    jmp end_of_b_operations

end_of_b:
    mov $0, %r15
    
end_of_b_operations:

    cmp $0, %r14
    jne loop

    cmp $0, %r15
    jne loop

    # movb $0, (%r9)

    pop %rdi
    ret
