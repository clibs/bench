
CC ?= gcc
OS = $(shell uname)
CFLAGS = -std=c99 -Wall -Wextra
LDFLAGS =

ifneq ($(OS), Darwin)
	LDFLAGS += ltr
endif

all: clean test

clean:
	rm -f bench *.o

test: test.o
	$(CC) $^ -o bench $(CFLAGS) $(LDFLAGS)
	./bench

%.o: %.c
	$(CC) $< -c -o $@ $(CFLAGS)

.PHONY: all clean test
