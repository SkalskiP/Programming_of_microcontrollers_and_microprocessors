all: group_3 clean

group_3: ./code/group_3.c ./code/group_3.s
	gcc -o ./bin/group_3 ./code/group_3.c ./code/group_3.s

.PHONY: clean

clean:
	rm -f *.o
