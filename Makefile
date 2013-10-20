all: clean test

clean:
	rm -f bench

test:
	gcc test.c -o bench -lrt
	./bench

.PHONY: all clean test
