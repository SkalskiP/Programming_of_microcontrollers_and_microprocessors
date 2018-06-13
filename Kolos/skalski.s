# Piotr Skalski
# Proram nie działa odpowiednio udało mi się rozdzielić logikę operacji ale
# Błędnie (na razie nei wiem czemu) wykrywa rozmiaru dostarczonych stringów co prowadzi do pytania o błądą wartość w pamięci / porównanie wartości w pramięci z NULL znajduje koniec ale nie jest to poprawna długość
# Program myśli że pierwszy string ma 20 kilka znaków, a drugi string 30 kilka
# Różnica między niki jest poprawna czyli 6... ale ten problem uniemożliwia mi skuteczne sięganie po wartości. Reszte programu napisałem tak jak uważam że powinien zadziałać

# neistety wynik to po prostu tablica składająca się tylko z jedynek albo tylko z zer i to jeszcze za długa

# Brak obsługi ADD

# registers rdi, rsi, rdx, rcx store subsequent arguments passed to the function
# (a, b, c, d)

	.type binary_op, @function
	.global binary_op

binary_op:

	push %rdi		# push wskaznika na wskaznik wyjscia

	mov %rdi, %r8
	mov %rsi, %r9
	mov %rdx, %r10
	mov %rcx, %r11

	cmp $0, %rcx		# switch dla wyboru operacjii binarnej
	je ADD

	cmp $1, %rcx
	je AND

	cmp $2, %rcx
	je OR

	cmp $3, %rcx
	je XOR

ADD:
	jmp end

AND:

and_loop:
	movb $49, (%r8)
	mov (%r9), %rdx
	cmp $48, %rdx
	jne and_a_not_0
	movb $48, (%r8)

and_a_not_0:

	mov (%r10), %rdx
	cmp $48, %rdx
	jne and_b_not_0
	movb $48, (%r8)

and_b_not_0:

	inc %r8
	inc %r9
	inc %r10

	mov (%r9), %rdx
	cmp $0, %rdx
	jne and_loop
	jmp end
	

OR:

or_loop:
	movb $48, (%r8)
	mov (%r9), %rdx
	cmp $49, %rdx
	jne or_a_not_1
	movb $49, (%r8)

or_a_not_1:

	mov (%r10), %rdx
	cmp $49, %rdx
	jne or_b_not_1
	movb $49, (%r8)
or_b_not_1:

	inc %r8
	inc %r9
	inc %r10

	mov (%r9), %rdx
	cmp $0, %rdx
	jne or_loop
	jmp end

XOR:

xor_loop:
	movb $48, (%r8)
	mov (%r9), %rdx
	cmp $49, %rdx
	jne xor_a_not_1
	movb $49, (%r8)

xor_a_not_1:
	mov (%r10), %rdx
	cmp $49, %rdx
	jne xor_b_not_1
	movb $49, (%r8)

xor_b_not_1:

	inc %r8
	inc %r9
	inc %r10

	mov (%r9), %rdx
	cmp $0, %rdx
	jne xor_loop
	jmp end

		
	
end:
	pop %rax
	ret
