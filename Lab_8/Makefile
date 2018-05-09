all: lab_7a lab_7b clean

lab_7a: lab_7a.c lab_7a_asm.s
	gcc -o ./bin/lab_7a lab_7a.c lab_7a_asm.s

lab_7b: lab_7b.c lab_7b_asm.s
	gcc -o ./bin/lab_7b lab_7b.c lab_7b_asm.s

.PHONY: clean

clean:
	rm -f *.o
