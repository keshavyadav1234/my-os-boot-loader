# Simple Bootloader

This project is a simple x86 bootloader written in NASM assembly language.

It prints "Hello, I am a new OS !" on the screen using BIOS interrupts.

## Build

```bash
nasm -f bin bootloader.asm -o bootloader.bin
the bootloader.bin file will be created
