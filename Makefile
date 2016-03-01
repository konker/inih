# Simple makefile to build inih as a static library using gcc

SRC = ini.c
OBJ = $(SRC:.c=.o)
OUT = libinih.a
INCLUDES = -I.
CCFLAGS = -g -O2 -Wall
CC = gcc

default: $(OUT)

.c.o:
	$(CC) $(INCLUDES) $(CCFLAGS) $(EXTRACCFLAGS) -c $< -o $@

$(OUT): $(OBJ)
	ar rcs $(OUT) $(OBJ) $(EXTRAARFLAGS)

clean:
	rm -f $(OBJ) $(OUT)

all: $(OUT)
.PHONY: all clean
