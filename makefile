all:
	nasm -f elf64 1.asm -l 1.lst
	gcc 1.o -static -o hell
