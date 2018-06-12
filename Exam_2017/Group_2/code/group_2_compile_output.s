# EXPLANATION
# registers rdi, rsi, rdx store subsequent arguments passed to the function
# (a, b, c)
    
    .type check_tab, @function
	.global check_tab

check_tab:
    ; pushq %rbp
    movq %rsp, %rbp
    subq $64, %rsp
    movq %rdi, -168(%rbp)
    movl %esi, -172(%rbp)
    movq %rdx, -184(%rbp)
    leaq -160(%rbp), %rdx
    movl $0, %eax
    movl $16, %ecx
    movq %rdx, %rdi
    rep stosq
    movl $0, -28(%rbp)
    movl $0, -4(%rbp)
    movq $0, -16(%rbp)
    movl $0, -20(%rbp)
    jmp .L2
.L3:
    movl -20(%rbp), %eax
    cltq
    leaq 0(,%rax,4), %rdx
    movq -168(%rbp), %rax
    addq %rdx, %rax
    movl (%rax), %eax
    movl $1, %edx
    movl %eax, %ecx
    sall %cl, %edx
    movl %edx, %eax
    cltq
    orq %rax, -16(%rbp)
    movl -20(%rbp), %eax
    cltq
    leaq 0(,%rax,4), %rdx
    movq -168(%rbp), %rax
    addq %rdx, %rax
    movl (%rax), %eax
    movslq %eax, %rdx
    movl -160(%rbp,%rdx,4), %edx
    addl $1, %edx
    cltq
    movl %edx, -160(%rbp,%rax,4)
    addl $1, -20(%rbp)
.L2:
    movl -20(%rbp), %eax
    cmpl -172(%rbp), %eax
    jl .L3
    movl $0, -24(%rbp)
    jmp .L4
.L6:
    movl -24(%rbp), %eax
    cltq
    movl -160(%rbp,%rax,4), %eax
    cmpl %eax, -4(%rbp)
    jg .L5
    movl -24(%rbp), %eax
    movl %eax, -28(%rbp)
    movl -24(%rbp), %eax
    cltq
    movl -160(%rbp,%rax,4), %eax
    movl %eax, -4(%rbp)
.L5:
    addl $1, -24(%rbp)
.L4:
    movl -24(%rbp), %eax
    cmpl -172(%rbp), %eax
    jl .L6
    movq -184(%rbp), %rax
    movl -4(%rbp), %edx
    movl %edx, (%rax)
    movq -16(%rbp), %rax
    leave
    ret