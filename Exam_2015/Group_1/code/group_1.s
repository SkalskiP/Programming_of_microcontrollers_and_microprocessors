# EXPLANATION
# registers rdi, rsi, rdx, rcx store subsequent arguments passed to the function
# (a, b, c)

    .type greatest, @function
	.global greatest

greatest:

    cmp %edi, %esi
    jge second_bigger

    mov %edi, %eax
    jmp first_bigger

second_bigger:
    mov %esi, %eax

first_bigger:

    cmp %eax, %edx
    jge third_bigger

    mov %eax, %eax
    ret

third_bigger:
    mov %edx, %eax
    ret