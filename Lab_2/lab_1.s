#----------------------------------------------------------------
# Program lab_1.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_1.o lab_1.s
#  To link:    ld -o lab_1 lab_1.o
#  To run:     ./lab_1
#
#----------------------------------------------------------------

	.equ	write_64, 1						# write data to file function (64bit)
	.equ	exit_64, 60						# exit program function (64bit)
	.equ	stdout, 0x01					# handle to stdout
	
	.data									# data section

starttxt:									# first message (First sign of first text)
	.ascii	"Start\n"
endtxt:										# second message (First sign of second text)
	.ascii	"Finish\n"
arg1:										# first argument (8 bits long)
	.byte		1
arg2:										# second argument (16 bits long)
	.word		2
arg3:										# third argument (32 bits long)
	.long		3
result:										# result (32 bits long)
	.long		0	

	.equ	startlen, endtxt - starttxt		# Length of first text
	.equ	endlen, arg1 - endtxt			# Length of second text
 
	.text									# text section
	.global _start							# declares _start function to be global
	
_start:
	MOV		$write_64,%rax 					# Instruction copies the source operand to the destination operand without affecting the source
											# Instruction to move precisely indicated 8 bits of data B - 1 bite, W - 2 bites, L - 4 bites
	MOVQ	$stdout,%rdi
	MOV		$starttxt,%rsi
	MOVQ	$startlen,%rdx
	
	# OS function we use 64 bit registers that begin with letter "r"
	# we need place function arguments in correct registers: rax, rdi, rsi and rdx
	# at last labs we used registers which names started with "e" they were 32 bits OS

	# rax with size of 64 bits
	# if rax is to big for us we can use eax with size of eax
	# if eax is to big than we can use ax withsize of 16 bits
	# ax is made of two smaller registers ah and al, both with size of 8 bits
	
	SYSCALL

	NOP 									# Instruction performs no operation. 

	MOVB	arg1,%al
	# or we can do MOVL arg1,%eax
	MOVW	arg2,%bx
	MOVL	arg3,%ecx
	
	ADD	%ebx,%eax							# Addition
											# One of arguments used in addition is replaced with result
											# Result is located in %eax - that means in place of second argument
	
	SUB	%ecx,%eax							# Subtraction
											# Moving result from %eax to register 
	MOVL	%eax,result

	NOP

	MOV	$write_64,%rax
	MOVQ	$stdout,%rdi
	MOV	$endtxt,%rsi
	MOVQ	$endlen,%rdx
	SYSCALL

	NOP

theend:
	MOV	$exit_64,%rax
	SYSCALL

