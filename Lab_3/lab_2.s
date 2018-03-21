#----------------------------------------------------------------
# Program lab_2.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_2.o lab_2.s
#  To link:    ld -o lab_2 lab_2.o
#  To run:     ./lab_2
#
#----------------------------------------------------------------

	.equ	write_64, 1	#write data to file function
	.equ	exit_64, 60	#exit program function
	.equ	stdout, 1 	#handle to stdout
				# Write wyswietla tylko stringa a nie liczbe.
	.data
	
arg1txt:
	.ascii	"Arg1 = "
arg2txt:
	.ascii	"Arg2 = "
sumtxt:
	.ascii	"Sum  = "
difftxt:
	.ascii	"Diff = "
ortxt:
	.ascii	"OR   = "
andtxt:
	.ascii	"AND  = "
xortxt:
	.ascii	"XOR  = "
arg1:				#first argument
	.byte	0xA0		# Na jednym bajcie mozna zapisac 16 znakow. Kazdej wartosci musimy
				# zapisac wartosc. Gdy mamy 0 -> '0', 1 -> '1', 10 -> 'A', 15 -> 'F'
				# Musimy przekonwertowac wartosc na znak (dla 0-9 bedzie liczba + 48,
				# dla 10-15 bedzie liczba + 55)
				# Po tej zamianie znaki nalezy przeniesc do pamieci zapisac je jeden po
				# drugim i mamy odpowiedni string juz

				# podzial bajtu na dwie polowki: prawa czworka = liczba AND 00001111,
				# lewa czworka = liczba > 4;
arg2:				#second argument
	.byte	0x05
result:				#result
	.byte	0
tmp:
	.byte	0
restxt:
	.ascii	"  \n"
txtlen:
	.quad	7
reslen:
	.quad	3
 
	.text
	.global _start
	
_start:
	NOP

	MOVB	arg1,%al
	MOV	$arg1txt,%rsi
	CALL	disp_line		# Wywolanie funkcji z argumentem, przerywany jest program, skok
					# do etykiety wywolania i wykonanie jej az do instrukcji RET
					# RET - return z C, po prostu wraca sie z funkcji 

	NOP

	MOVB	arg2,%al
	MOV	$arg2txt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ADDB	arg2,%al
	MOVB	%al,result
	MOV	$sumtxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	SUBB	arg2,%al
	MOVB	%al,result
	MOV	$difftxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ORB	arg2,%al		# ORB - Suma logiczna bajtu
	MOVB	%al,result
	MOV	$ortxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ANDB	arg2,%al
	MOVB	%al,result
	MOV	$andtxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	XORB	arg2,%al
	MOVB	%al,result
	MOV	$xortxt,%rsi
	CALL	disp_line

	NOP

	MOV	$exit_64,%rax
	XOR	%rdi,%rdi 
	SYSCALL

#----------------------------------------------------------------
# disp_line - displays line of text (prompt + hexadecimal number)
#----------------------------------------------------------------

	.type disp_line,@function	# Wprowadzenie funkcji aby wyswietlac
					# .type - tutaj bedzie zdefiniowana funkcja: nazwa oraz
					# @function - to jest funkcja

disp_line:
	MOVB	%al,tmp

	MOV	$write_64,%rax
	MOV	$stdout,%rdi
	MOV	txtlen,%rdx			# bez dolara jest wartosc
	SYSCALL

	MOVB	tmp,%al			# w rejestrze al jest liczba w postaci 1 bajta
	ANDB	$0x0F,%al
	CMPB	$10,%al			# Compare - porownaj dwie rzeczy ze soba: sprawdzamy rejestr
					# z liczba 10, aby miec wynik to sprawdzamy flagi ustawione
					# w wyniku dzialania CMP
	JB	digit1			# Jump if below - w wyniku sprawdzania cmp ustawi sie ze jest
					# below (czyli przypadek x < 10). 
	ADDB	$('A'-0x0a),%al
	JMP	insert1
digit1:
	ADDB	$'0',%al
insert1:
	MOV	%al,%ah

	MOVB	tmp,%al
	SHR	$4,%al
	CMPB	$10,%al
	JB	digit2
	ADDB	$('A'-0x0a),%al
	JMP	insert2
digit2:
	ADDB	$'0',%al
insert2:
	MOVW	%ax,restxt		# $zmienna - adres, zmienna - wartosc

	MOV	$write_64,%rax
	MOV	$stdout,%rdi
	MOV	$restxt,%rsi
	MOV	reslen,%rdx
	SYSCALL

	RET				# Konczymy funkcje i wracamy (return)
	
# * Nie uzywamy binarnej bo petla i nie za bardzo umiemy tego zrobic, w dodatku jest to klopotliwe bardzo
# * Nie uzywamy osemkowego bo trudno go odroznic od innych metod zapisu i w ogole, nierowny podzial
#   bitow
# * Najlepsza bedzie reprezentacja szesnstkowa, popularna, najmniej klopotliwa, wygodna bo jeden bajt
#   mozemy zapisac z uzyciem dwoch cyfr szesnastowych (razem z A-F), tylko 2 znaki, nie trzeba tworzyc
#   petli aby je wyswietlic
# * Nie bedzie,y korzystac z lancuchow standardowyh tylk osami bedziemy je tworzyc aby sie zmienialy


