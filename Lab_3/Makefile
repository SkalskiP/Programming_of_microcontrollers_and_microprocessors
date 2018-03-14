all: lab_2 clean

lab_2: lab_2.s
	as -o lab_2.o lab_2.s
	ld -o lab_2 lab_2.o

.PHONY: clean

clean:
	rm -f *.o
