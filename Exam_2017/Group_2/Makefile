all: group_2 group_2_debug clean

group_2: ./code/group_2.c ./code/group_2.s 
	gcc -o ./bin/group_2 ./code/group_2.c ./code/group_2.s /lib64/ld-linux-x86-64.so.2

group_2_debug: ./code/group_2_debug.s
	as -o lab_8.o ./code/group_2_debug.s
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc -o ./bin/group_2_debug lab_8.o

.PHONY: clean

clean:
	rm -f *.o
