# NASM Educational Projects

This repository contains two projects created for the **Computer Architecture** course. These projects demonstrate foundational and advanced concepts of assembly language programming using NASM and integration with higher-level languages.

## Project Descriptions

### **Project 1: 16-bit Assembly for DOS**
- **Objective**: Write a program that takes an input string and removes all uppercase letters from it. The program allows repeated operations with different input strings until the user presses the space key to exit.
- **Key Features**:
  - User input processing and output display using DOS interrupts.
  - Use of the stack for subroutine calls and exception handling.
  - Modular design with separate procedures for processing strings and handling special cases.
- **Educational Value**:
  - Demonstrates low-level programming concepts in a 16-bit environment.
  - Explores the use of DOS interrupts and stack management.
  - Highlights procedural programming and handling edge cases in assembly.

### **Project 2: 32-bit Assembly with C Interface**
- **Objective**: Write a program to calculate the base-2 logarithm (`log2(x)`) of a user-provided number using the Floating Point Unit (FPU). The interface is written in C to take input and display results.
- **Key Features**:
  - Integration of 32-bit assembly with C for a user-friendly interface.
  - Use of the FPU (`fyl2x` instruction) for logarithmic calculations.
  - Input validation for numbers and decimal precision handling in the C interface.
- **Educational Value**:
  - Demonstrates the integration of assembly with a high-level programming language.
  - Teaches the use of the FPU for mathematical computations.
  - Highlights the importance of input validation and user interface design.

## Folder Structure
- **`Project1/`**: Contains the source code for the 16-bit DOS program.
  - `projekt1.asm`: Main assembly file for the DOS program.
- **`Project2/`**: Contains the source code for the 32-bit program with C interface.
  - `projekt.c`: C file handling user input, output, and interaction with the assembly function.
  - `projekt.asm`: Assembly file containing the logarithmic computation logic.

## Educational Purpose
These projects represent an educational journey in understanding computer architecture and programming at the hardware-near level. They are published on GitHub to:
- Serve as reference material for students and enthusiasts learning NASM and low-level programming.
- Illustrate practical applications of assembly language in handling real-world problems.
- Highlight the integration of assembly with other programming paradigms, like C, for creating functional applications.

## How to Build and Run

### Project 1
1. Assemble the program using NASM:
   ```bash
   nasm -f bin -o projekt1.com projekt1.asm
   ```
2. Run the program in a DOS-compatible environment (e.g., DOSBox).

### Project 2
1. Assemble the assembly file:
   ```bash
   nasm -f elf32 -o projekt.o projekt.asm
   ```
2. Compile the C interface with the assembly object file:
   ```bash
   gcc -m32 -o projekt projekt.o projekt.c
   ```
3. Run the program:
   ```bash
   ./projekt
   ```

## License
This repository is shared for educational purposes. Feel free to use it as a learning resource, but please credit the author when referencing or using the code.
