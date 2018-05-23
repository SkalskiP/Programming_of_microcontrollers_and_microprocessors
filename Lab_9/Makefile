all: lab_8 lab_8_new clean

lab_8: lab_8.s
	as -o lab_8.o lab_8.s
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc -o ./bin/lab_8 lab_8.o

lab_8_new: lab_8_new.s
	gcc -no-pie -o ./bin/lab_8_new lab_8_new.s

.PHONY: clean

clean:
	rm -f *.o
