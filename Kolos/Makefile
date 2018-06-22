all: skalski clean

skalski: ./skalski.c ./skalski_new.s
	gcc -o ./skalski ./skalski.c ./skalski_new.s

.PHONY: clean

clean:
	rm -f *.o
