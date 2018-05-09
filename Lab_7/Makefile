all: lab_6a lab_6b lab_6c lab_6d clean

lab_6a: lab_6a.c lab_6a_asm.s
	gcc -o ./bin/lab_6a lab_6a.c lab_6a_asm.s

lab_6b: lab_6b.c lab_6b_asm.s
	gcc -o ./bin/lab_6b lab_6b.c lab_6b_asm.s

lab_6c: lab_6c.s
	gcc -no-pie -o ./bin/lab_6c lab_6c.s

lab_6d: lab_6d.c lab_6d.s
	gcc -o ./bin/lab_6d lab_6d.c lab_6d.s

.PHONY: clean

clean:
	rm -f *.o
