# EXPLANATION
# registers edi, esi, edx store subsequent arguments passed to the function
# (a, b, c)
# %r10d saved a value
# %r11d max
# %r12d min

    .type is_outside, @function
	.global is_outside

is_outside:
    mov %edi, %r10d
    cmp %esi, %edx
    jg b_is_max

    mov %esi, %r11d
    mov %edx, %r12d
    jmp a_is_max

b_is_max:

    mov %edx, %r11d
    mov %esi, %r12d

a_is_max:

    cmp %r10d, %r11d
    jg a_not_greater

    mov $1, %rax
    ret

a_not_greater:

    cmp %r10d, %r12d
    jb b_not_smaller

    mov $-1, %rax
    ret

b_not_smaller:
    mov $0, %rax
    ret

