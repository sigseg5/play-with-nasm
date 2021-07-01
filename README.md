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