all: lab_1 clean

lab_1: lab_1.s
	as -o lab_1.o lab_1.s
	ld -o lab_1 lab_1.o

.PHONY: clean

clean:
	rm -f *.o
