#----------------------------------------------------------------
# Funkcja do programu lab_6b - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------

	.type fiba, @function
	.globl fiba

fiba:	push %rbp
	mov %rsp,%rbp

	sub $8,%rsp

	cmp $0, %rdi		# check if the argument is zero
	jz f_0

	cmp $1, %rdi		# check if the argument is one
	jz f_1

	push %rdi

	sub $2,%rdi		# prepere new argument
	call fiba
	mov %rax,-8(%rbp)	# local variable, rbp moved 8 bytes down

	pop %rdi

	dec %rdi
	call fiba
	add -8(%rbp),%rax

f_e:	mov %rbp,%rsp		# epilogue
	pop %rbp
	ret

f_0:
	mov $0, %rax
	jmp f_e			# making an epilogue

f_1:
	mov $1, %rax
	jmp f_e			# making an epilogue
