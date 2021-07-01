# play-with-nasm
Some fun with asm in SASM editor. Mode: x64

## Assembly options
```
-g -f elf64 $SOURCE$ -l $LSTOUTPUT$ -o $PROGRAM.OBJ$
```
## Linking options:
```
$PROGRAM.OBJ$ $MACRO.OBJ$ -g -o $PROGRAM$ -m64 -fno-pie -no-pie
```

## Misc.

- [linux syscalls info](http://asm.sourceforge.net/syscall.html)
- [nasm docs](https://www.nasm.us/doc/)
- [nasm ref](https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html)
- [nasm syscalls info](https://www.tutorialspoint.com/assembly_programming/assembly_system_calls.htm)
