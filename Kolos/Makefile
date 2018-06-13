all: skalski clean

skalski: ./skalski.c ./skalski.s
	gcc -o ./skalski ./skalski.c ./skalski.s

.PHONY: clean

clean:
	rm -f *.o
