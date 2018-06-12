# EXPLANATION
# registers edi, esi store subsequent arguments passed to the function
# (a, b)
# %r10d a
# %r11d b
# %r12d sum

    .type sum, @function
	.global sum

sum:
    mov %edi, %r10d
    mov %esi, %r11d
    mov $0, %r12d

loop:
    add %r10d, %r12d
    inc %r10d
    cmp %r10d, %r11d
    jge loop
    mov %r12d, %eax
    ret