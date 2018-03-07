# Programming of microcontrollers and microprocessors

The content of the repository was created as part of the course Programming of microcontrollers and microprocessors at AGH University of Science and Technology. More information can be found <a href="http://home.agh.edu.pl/~buba/">here</a>.

## Setup

To install DDD on your Ubuntu device run ```setup.sh``` script, that is located in the main repository folder. During labs we also used as (The portable GNU assembler) and gdb (The GNU Debugger) which are available by default on Ubuntu-type operating systems.

## Syntax

During laboratory classes we worked on Unix OS and used <a href="https://en.wikipedia.org/wiki/X86_assembly_language#Syntax">AT&T syntax</a>. It means:

* Constant are prefixed with a "$"
* Registers are prefixed with a "%"
* Mnemonics are suffixed with a letter indicating the size of the operands: q for qword, l for long (dword), w for word, and b for byte
* We write source before the destination, for example ```mov $5, %eax```

## Compilation basics

To compile:   ```as -o file_name.o file_name.s```

To link:      ```ld -o file_name file_name.o```

To run:       ```./file_name```

## Debugging basics

To compile:   ```as -gstabs -o file_name.o file_name.s```

To link:      ```ld -o file_name file_name.o```

To run:       ```gdb file_name```

More information on debugging using gdb can be found <a href="https://github.com/SkalskiP/Programming_of_microcontrollers_and_microprocessors/blob/master/Lab_2/gdb_info.pdf">here</a>.
