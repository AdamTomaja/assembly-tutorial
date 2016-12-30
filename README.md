# assembly-tutorial
Code written by me for learning purpouses.
All source files are designed to work on Linux OS.

## How to compile and run the examples

### Compile
 ```bash
    nasm -f elf helloworld.asm
```

### Link
```bash
    ld -m elf_i386 -s -o helloworld helloworld.o
```

### Run
```bash
    ./helloworld
```

### Link to the tutorial i used
https://www.tutorialspoint.com/assembly_programming/index.htm
