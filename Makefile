CROSSPATH=/usr/home/hiroki/ZRouter/obj/usr/home/hiroki/ZRouter/zrouter/tmp/mips.mips/usr/home/hiroki/ZRouter/FreeBSD/head/tmp/usr/bin

CROSS = $(CROSSPATH)/
CROSS_CC = $(CROSS)gcc
CROSS_CFLAGS = -G 0 -mno-abicalls -fno-pic
CROSS_LD = $(CROSS)ld
CROSS_ASFLAGS = -G 0

all: main.elf

start.o: start.S
	$(CROSS_CC) -O2 $(CROSS_CFLAGS) -c start.S

main.o: main.c
	$(CROSS_CC) -O2 $(CROSS_CFLAGS) -c main.c

main.elf: main.o start.o main.ld
	$(CROSS_LD) -T main.ld main.o start.o -o main.elf

disas: main.elf
	`find ../obj -name objdump -type f | head -1` -d main.elf

head: main.elf
	readelf -h main.elf

clean:
	rm -rf *.o *.elf
