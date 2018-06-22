# registers rdi, rsi, rdx, rcx store subsequent arguments passed to the function
# (a, b, c, d)
# 48 is 0 in ASCII
# 49 is 1 in ASCII
   
    .text
    .type binary_op,@function
    .global binary_op

binary_op:
    push %rdi                       # saving pointer to buffor for later usage
    
loop:
    mov (%rsi), %r8                 # taking char from string a
    mov (%rdx), %r9                 # taking char from string b

    sub $48, %r8                    # calculating decimal value of char in string a
    sub $48, %r9                    # calculating decimal value of char in string b

    # switch to select wchich operation to perform
    cmp $0,%rcx
    je ADD
    cmp $1,%rcx
    je AND
    cmp $2,%rcx
    je OR
    cmp $3,%rcx
    je XOR    


ADD:
    add %r8,%r9
    add $48,%r9
    mov %r9,(%rdi)
    jmp nextloop

AND:
    and %r8,%r9
    add $48,%r9

    cmp $2, %r9
    je and_2_to_0
    mov %r9,(%rdi)
    jmp and_correct

and_2_to_0:
    movq $0,(%rdi)
and_correct:

    jmp nextloop

OR:
    or %r8,%r9
    add $48,%r9
    mov %r9,(%rdi)
    jmp nextloop

XOR:
    xor %r8,%r9
    add $48,%r9
    mov %r9,(%rdi)


nextloop:                               # group of operations that is done every time when loop ends
    inc %rsi                            # buffor increment
    inc %rdx                            # string a increment
    inc %rdi                            # string b increment
    cmp $0,(%rsi)                       # chceck for string end
    jne loop                            # jump to next loop iteration


result:
    pop %rax    
    ret