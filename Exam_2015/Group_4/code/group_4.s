# EXPLANATION
# registers edi, esi, edx, ecx store subsequent arguments passed to the function
# (x, a, b, c)
# %r10d x
# %r11d a
# %r12d b
# %r13d c

    .type range, @function
	.global range

range:
    mov %edi, %r10d
    mov %esi, %r11d
    mov %edx, %r12d
    mov %ecx, %r13d

    cmp %r10d, %r11d
    jb x_over_a

    mov $0, %rax
    ret

x_over_a:
    cmp %r10d, %r12d
    jb x_over_b

    mov $1, %rax
    ret

x_over_b:
    cmp %r10d, %r13d
    jb x_over_c

    mov $2, %rax
    ret

x_over_c:

    mov $3, %rax
    ret