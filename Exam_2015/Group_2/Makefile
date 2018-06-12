all: group_1 clean

group_1: ./code/group_2.c ./code/group_2.s
	gcc -o ./bin/group_2 ./code/group_2.c ./code/group_2.s

.PHONY: clean

clean:
	rm -f *.o
