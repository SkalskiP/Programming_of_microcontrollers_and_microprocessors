#----------------------------------------------------------------
# Program lab_1.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_1.o lab_1.s
#  To link:    ld -o lab_1 lab_1.o
#  To run:     ./lab_1
#
#----------------------------------------------------------------

	.equ	write_64, 1	# write data to file function (64bit)
	.equ	exit_64, 60	# exit program function (64bit)
	.equ	stdout, 0x01	# handle to stdout
	
	.data

# First sign of first text
starttxt:			# first message
	.ascii	"Start/n"
# First sign of second text
endtxt:				# second message
	.ascii	"Finish/n"
arg1:				# first argument
	.byte		1
arg2:				# second argument
	.word		2
arg3:				# third argument
	.long		3
result:				# result
	.long		0	

	# Length of first text
	.equ	startlen, endtxt - starttxt
	# Length of second text
	.equ	endlen, arg1 - endtxt
 
	.text
	.global _start
	
_start:
	# Instruction to move data from one place to other
	MOV	$write_64,%rax
	# Instruction to move precisely indicated 8 bits of data
	# B - 1 bite
	# W - 2 bites
	# L - 4 bites
	# second argument of MOV is register address and we know how big is it
	MOVQ	$stdout,%rdi
	MOV	$starttxt,%rsi
	MOVQ	$startlen,%rdx
	# OS function we use 64 bit registers that begin with letter "r"
	# we need place function arguments in correct registers: rax, rdi, rsi and rdx
	# at last labs we used registers which names started with "e" they were 32 bits OS

	# rax with size of 64 bits
	# if rax is to big for us we can use eax with szie of eax
	# if eax is to gib than we can use ax withsize of 16 bits
	# ax is made of two smaller registers ah and al, both with szie of 8 bits
	
	SYSCALL

	NOP
	# Basic aritmetic operations
	MOVB	arg1,%al
	# or we can do MOVL arg1,%eax
	MOVW	arg2,%bx
	MOVL	arg3,%ecx
	# Addition
	# One of arguments used in addition is replaced with result
	# Result is located in %eax - that means in place of second argument
	ADD	%ebx,%eax
	# Subtraction
	SUB	%ecx,%eax
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

