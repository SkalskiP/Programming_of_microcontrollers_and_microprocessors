all: lab_3a lab_3b clean

lab_3a: lab_3a.s
	as -o lab_3a.o lab_3a.s
	ld -o lab_3a lab_3a.o

lab_3b: lab_3b.s
	as -o lab_3b.o lab_3b.s
	ld -o lab_3b lab_3b.o

.PHONY: clean

clean:
	rm -f *.o
