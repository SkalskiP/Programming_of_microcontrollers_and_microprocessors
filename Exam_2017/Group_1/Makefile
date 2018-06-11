all: group_1 clean

group_1: ./code/group_1.c ./code/group_1.s
	gcc -o ./bin/group_1 ./code/group_1.c ./code/group_1.s

.PHONY: clean

clean:
	rm -f *.o
