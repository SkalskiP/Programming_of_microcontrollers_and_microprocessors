all: lab_5 clean

lab_5: lab_5.s
	as -o lab_5.o lab_5.s
	ld -o lab_5 lab_5.o

.PHONY: clean

clean:
	rm -f *.o
