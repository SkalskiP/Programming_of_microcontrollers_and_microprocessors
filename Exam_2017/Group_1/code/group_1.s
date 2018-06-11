# EXPLANATION
# registers rdi, rsi, rdx store subsequent arguments passed to the function
# (a, b, c)

    .type check_div, @function
	.global check_div

check_div:
    cmp $0, %rdx        # comparing the third function argument with zero
    jnz c_not_zero      # if the value of the third argument is different 
                        # from zero we jump to c_not_zero

    push %rdx           # because we will need an rdx register during the
                        # division operation, we copy its value on the stack

    xor %rdx, %rdx      # XOR is the method recommended by Intel and AMD that
                        # sets the registry value to zero

    mov %rdi, %rax      # moving the value of the argument a from rdi to rax, 
                        # before dividing

    div %rsi            # dividing the connected register rdx:rax by rsi 
                        # (b argument). the rest of the division is in rdx
                        # outcome is in rax

    cmp $0, %rdx        # taking rest from dividing a by b and comparing to 0if the rest from 
    jnz a_not_dividable_by_b

    mov $0, %rax        # moving 0 do rax and return
    ret   

c_not_zero:

mov $32, %rcx
mov $0, %rsi

loop:
    shl $1, %rsi

    xor %rdx, %rdx      # XOR is the method recommended by Intel and AMD that
                        # sets the registry value to zero

    mov %rdi, %rax      # moving the value of the argument a from rdi to rax, 
                        # before dividing

    div  %rcx           # dividing the connected register rdx:rax by rsi 
                        # (b argument). the rest of the division is in rdx
                        # outcome is in rax

    cmp $0, %rdx        # taking rest from dividing a by b and comparing to 0if the rest from 
    jnz loop_end

    inc %rsi

loop_end:

    dec 	%rcx 		# decrementing counter with size of byte by one
	jnz 	loop		# if flag not zero jump to label loop

    mov %rsi, %rax  # moving 0 do rax and return
    ret  

a_not_dividable_by_b:
    mov $1, %rax        # moving 1 do rax and return
    ret      
