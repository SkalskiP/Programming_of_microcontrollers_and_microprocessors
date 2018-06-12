# EXPLANATION
# registers rdi, rsi, rdx, rcx store subsequent arguments passed to the function
# (a, b, c, d)

    .type generate_str, @function
	.global generate_str

generate_str:
    push %rdi
    mov %rdi, %r12
    mov %rsi, %r13
    mov %rdx, %r14
    cmp $0, %rcx
    jnz loop_different

loop_same:
    mov %r13, (%r12)
    inc %r12
    dec %r14
    cmp $0, %r14
    jg loop_same
    jmp end

loop_different:
    mov %r13, (%r12)
    inc %r12
    inc %r13
    dec %r14
    cmp $0, %r14
    jg loop_different
    jmp end

end:
    pop %rax
    ret
