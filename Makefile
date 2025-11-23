# EIDOLON KERNEL BUILD SYSTEM v4.2
# ARCH: SPARC / IRIX
# COMPILER: gcc 2.7.2

CC=gcc
CFLAGS=-O2 -Wall -D_POSIX_SOURCE -D_NO_SAFETY_CHECKS
LIBS=-lm -lsocket -lnsl

all: eidolon_core network_d

eidolon_core: src/core.c src/memory.c
	$(CC) $(CFLAGS) -o bin/eidolon_core src/core.c src/memory.c $(LIBS)

network_d: src/uplink.c
	$(CC) $(CFLAGS) -o bin/network_d src/uplink.c $(LIBS)

clean:
	rm -f bin/* *.o