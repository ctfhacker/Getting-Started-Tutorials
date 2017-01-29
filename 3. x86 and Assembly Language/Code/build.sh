rm -f Kernel.o Kernel.bin ISO/Kernel.bin SampleKernel.iso

echo "Executing NASM..."
nasm -g -f elf -o Kernel.o Kernel.asm

echo "Executing linker (ld)..."
ld -m elf_i386 -T linker.ld -o Kernel.bin Kernel.o

echo Copying bin file...
/bin/cp Kernel.bin ISO/Kernel.bin

echo Generating ISO9660...
wine "$PWD\Tools\ISO9660Generator.exe" 4 "../../CurrentKernel.iso" "$PWD\ISO\isolinux-debug.bin" true "$PWD\ISO"

echo Complete.
