CC=cc
CFLAGS=-Wall -g
LD=cc
AR=ar

all: libdes.a testdes

libdes.a: des.o
	$(AR) r libdes.a des.o
	
des.o: des.c
	$(CC) -c $(CFLAGS) des.c

testdes.o: testdes.c
	$(CC) -c $(CFLAGS) testdes.c

testdes: testdes.o libdes.a
	$(LD) $(LDFLAGS) -o testdes testdes.o libdes.a

test: testdes
	./testdes

clean:
	-rm -f testdes libdes.a *.o
