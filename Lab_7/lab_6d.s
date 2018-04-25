#----------------------------------------------------------------
# Funkcja do programu lab_6a - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------

	.text
	.type add_three_numa, @function
	.globl add_three_numa	

add_three_numa:	mov %rdi, %rax
	add %rsi, %rax
	add %rdx, %rax
	ret

