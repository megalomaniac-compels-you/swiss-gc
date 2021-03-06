del *.o
mkdir built
powerpc-eabi-gcc -O2 -c dvd\base.S
powerpc-eabi-gcc -O2  -c dvd\dvd.c
powerpc-eabi-gcc -O2 -c sdgecko\sd.c
powerpc-eabi-gcc -O2 -c base\frag.c
powerpc-eabi-gcc -O2  -c base\usbgecko.c
powerpc-eabi-gcc -O2  -c base\dvdqueue.c
powerpc-eabi-ld -o dvd.elf base.o frag.o sd.o dvd.o dvdqueue.o usbgecko.o --section-start .text=0x80001800
del *.o
powerpc-eabi-objdump -D dvd.elf > built\dvd_disasm.txt
powerpc-eabi-objcopy -O binary dvd.elf dvd.bin
bin2s dvd.bin > dvd_final.s
mv -f dvd_final.s ../swiss/source/patches/DVDPatch.s
del *.bin
del *.elf
pause