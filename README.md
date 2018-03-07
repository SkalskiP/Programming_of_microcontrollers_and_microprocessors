# Programming of microcontrollers and microprocessors

The content of the repository was created as part of the course Programming of microcontrollers and microprocessors at AGH University of Science and Technology. More information can be found <a href="http://home.agh.edu.pl/~buba/">here</a>.

## Setup

To install DDD on your Ubuntu device run ```setup.sh``` script, that is located in the main repository folder. During labs we also used as (The portable GNU assembler) and gdb (The GNU Debugger) which are available by default on Ubuntu-type operating systems.

## Syntax

During laboratory classes we worked on Unix OS and used <a href="https://en.wikipedia.org/wiki/X86_assembly_language#Syntax">AT&T syntax</a>. It means that constant are prefixed with a "$" and registers are prefixed with a "%". Mnemonics are suffixed with a letter indicating the size of the operands: "q" for qword, "l" for long (dword), "w" for word, and "b" for byte. We write source before the destination, for example ```mov $5, %eax```.

## Compilation basics

To compile:   ```as -o file_name.o file_name.s```

To link:      ```ld -o file_name file_name.o```

To run:       ```./file_name```

## Debugging basics

To compile:   ```as -gstabs -o file_name.o file_name.s```

To link:      ```ld -o file_name file_name.o```

To run:       ```gdb file_name```

More information on debugging using gdb can be found <a href="https://github.com/SkalskiP/Programming_of_microcontrollers_and_microprocessors/blob/master/Lab_2/gdb_info.pdf">here</a>.

## Cheat sheet

### Assembler Directives

<b>Directives</b> are commands that are part of the assembler syntax but are not related to the x86 processor instruction set. All assembler directives begin with a period (.) More information: <a href="https://docs.oracle.com/cd/E26502_01/html/E28388/eoiyg.html">oracle</a>, <a href="http://web.mit.edu/gnu/doc/html/as_7.html">MIT</a> and <a href="http://downloads.ti.com/docs/esd/SLAU131K/Content/SLAU131K_HTML/assembler_directives.html">Texas Instruments Incorporated</a>.

```.equ```  directive is used to give name to some value or symbol. Each time the assembler finds the given names in the program, it will replace the name with the value or a symbol.

```.data``` directive changes the current section to .data.

```.ascii``` directive places the characters in string into the object module at the current location but does not terminate the string with a null byte (\0). String must be enclosed in double quotes (")

```.byte``` directive generates initialized bytes into the current section. Each byte must be an 8-bit value.

```.word``` directive initializes one or more 16-bit integers

```.long``` directive generates a long integer (32-bit, two's complement value) for each expression into the current section. Each expression must be a 32–bit value and must evaluate to an integer value.

```.text``` directive defines the current section as .text.

```.global``` directive declares each symbol in the list to be global. Each symbol is either defined externally or defined in the input file and accessible in other files. Default bindings for the symbol are overridden. A global symbol definition in one file satisfies an undefined reference to the same global symbol in another file. Multiple definitions of a defined global symbol are not allowed. If a defined global symbol has more than one definition, an error occurs. The .globl directive only declares the symbol to be global in scope, it does not define the symbol.

### Instructions

```MOV``` instruction copies the source operand to the destination operand without affecting the source.

```SYSCALL``` instruction is the fundamental interface between an application and the Linux kernel. The x86_64 architecture introduced a dedicated instruction to make a syscall. It does not access the interrupt descriptor table and is faster. Parameters are passed by setting the general purpose registers as following:

| Syscall #  | Param 1 | Param 2 | Param 3 | Param 4 | Param 5 | Param 6 |
| ---------- |:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|
| rax        | rdi	   | rsi	   | rdx	   | r10	   | r8  	   | r9 	   |

```NOP``` instruction performs no operation. It is a one-byte or multi-byte NOP that takes up space in the instruction stream but does not impact machine context, except for the EIP register. <a href="https://stackoverflow.com/questions/234906/whats-the-purpose-of-the-nop-opcode">Why</a> we use NOPs?

```ADD``` instruction adds the first operand (destination operand) and the second operand (source operand) and stores the result in the destination operand. The destination operand can be a register or a memory location; the source operand can be an immediate, a register, or a memory location. (However, two memory operands cannot be used in one instruction.) When an immediate value is used as an operand, it is sign-extended to the length of the destination operand format.

```SUB``` instruction subtracts the second operand (source operand) from the first operand (destination operand) and stores the result in the destination operand. The destination operand can be a register or a memory location; the source operand can be an immediate, register, or memory location.
