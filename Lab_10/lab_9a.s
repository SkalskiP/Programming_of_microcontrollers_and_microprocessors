#----------------------------------------------------------------
# Program lab_9a.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#   to compile & link:  gcc -no-pie -lm -o lab_9a lab_9a.s
#   to run: 		./lab_9a
#
#----------------------------------------------------------------

	.data
i:				# loop counter (integer)
	.long		1
x:				# function argument
	.double		0.0
y:
	.double		0.0
sqr_a:				# function result (x87)
	.double		0.0
sqr_b:				# function result (SSE)
	.double		0.0
sqr_c:				# function result (x87 software approximation)
	.double		0.0

two:				# constant
	.long		2
fmt_str:
	.asciz	"Square root of %lf = %.20lf\n"

	
	.text
	.global main
	
main:
	FINIT			# FPU initialization
				# all FPU instructions begin with F (floating point)
next:
	FILDL	i		# i -> ST(0) F (floating point) I (integer) LD (load) L (long)
	FSTPL	x		# ST(0) -> x & pop from stack ST (store) P (pop) L (long)
				# ST - stack
				#------------------------------
	FLDL	x		# function argument -> ST(0)
	FSQRT			# sqrt( ST(0) ) -> ST(0)
	FSTPL	sqr_a		# ST(0) -> sqr_a  & pop from stack
				#------------------------------
	FLDL	sqr_a		# load & display first result
	FSTPL	y
	CALL	disp

	MOVSD	x, %xmm1	# function argument -> xmm1 xmm registers 128 bitów 16 bajtów
	SQRTSD	%xmm1, %xmm0	# sqrt( xmm1 ) -> xmm0
	MOVSD	%xmm0, sqr_b	# xmm0 -> sqr_b

	MOVSD	%xmm0, y	# load & display second result
	CALL	disp
				#------------------------------
	FLDL	x		# first approximation (a0) -> ST(0)

iter:	FLDL	x		# function argument -> ST(0), ak in ST(1)
	FDIV	%ST(1), %ST(0)	# ST(0)/ST(1) -> ST(0)    x/ak
	FADD	%ST(1), %ST(0)	# ST(0)+ST(1) -> ST(0)    ak+x/ak
	FIDIVL	two		# ST(0)/two -> ST(0)      (ak+x/ak)/2
	FCOMI	%ST(1)		# ST(1) ? ST(0)           ak ? ak+1 comare 2 
	FSTP	%ST(1)		# ST(0) -> ST(1) & pop from stack
	JNZ	iter		# test of convergence

	FSTPL	sqr_c		# ST(0) -> sqr_b & pop from stack
				#------------------------------
	FLDL	sqr_c		# load & display second result
	FSTPL	y
	CALL	disp
				#------------------------------

	INCL	i		# next argument
	CMPL	$10, i		# enough ?
	JBE	next
				#------------------------------
	mov $0, %rdi		# the end
	CALL	exit
	

	.type	disp, @function	# printf( fmt_str, x, y )
disp:
	movq	x, %xmm0
	movq	y, %xmm1
	mov	$fmt_str, %rdi	# address of fmt_str
	mov $2, %al
	CALL	printf
	RET

