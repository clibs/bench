CC ?= gcc
OS = $(shell uname)
CFLAGS = -O3 -std=c99 -Wall -Wextra
LDFLAGS =

ifneq ($(OS), Darwin)
	LDFLAGS += -lrt
endif

all: clean test

clean:
	rm -f bench *.o

test: test.o
	$(CC) $^ -o bench $(CFLAGS) $(LDFLAGS)
	./bench

%.o: %.c
	$(CC) $< -c -o $@ $(CFLAGS) $(LDFLAGS)

.PHONY: all clean test
