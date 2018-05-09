	.type min_of_three_a, @function
	.global min_of_three_a

min_of_three_a:	
	mov %rdi, %rax
	mov %rsi, %rbx

	cmp %rax, %rbx
	jle f_0

f_e:
	mov %rdx, %rbx
	cmp %rax, %rbx
	jle f_1
	ret
	
f_0:
	mov %rbx, %rax
	jmp f_e

f_1:
	mov %rbx, %rax
	ret


