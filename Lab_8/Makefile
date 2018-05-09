all: lab_7a lab_7b lab_7c clean

lab_7a: lab_7a.c lab_7a_asm.s
	gcc -o ./bin/lab_7a lab_7a.c lab_7a_asm.s

lab_7b: lab_7b.c lab_7b_asm.s
	gcc -o ./bin/lab_7b lab_7b.c lab_7b_asm.s

lab_7c: lab_7c.c lab_7c_asm.s
	gcc -o ./bin/lab_7c lab_7c.c lab_7c_asm.s

# lab_7c: lab_7c.c
# 	gcc -o ./bin/lab_7c lab_7c.c

.PHONY: clean

clean:
	rm -f *.o
