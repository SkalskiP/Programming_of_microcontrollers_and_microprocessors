all: lab_9a lab_9b lab_9c clean

lab_9a: lab_9a.s
	gcc -no-pie -lm -o ./bin/lab_9a lab_9a.s

lab_9b: lab_9b.s
	gcc -no-pie -lm -o ./bin/lab_9b lab_9b.s

lab_9c: lab_9c.c lab_9c.s
	gcc -no-pie -o ./bin/lab_9c lab_9c.c lab_9c.s -lm

.PHONY: clean

clean:
	rm -f *.o
