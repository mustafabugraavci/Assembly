# Define the cross-compiler
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld

# Source files directory
SRC_C = $(wildcard src/*.c)
SRC_ASM = $(wildcard src/*.s)

# Output directory
BUILD_DIR = build


# Object files derived from source files
OBJ_C = $(SRC_C:.c=.o)
OBJ_ASM = $(SRC_ASM:.s=.o)
OBJ = $(OBJ_C) $(OBJ_ASM)

# Name of the final executable
TARGET = build/my_arm_program.elf

# Compiler flags
CFLAGS = -mcpu=cortex-m4 -mthumb -Wall -I./include

# Build rule
all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) -T linker_script.ld -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.s
	$(AS) -o $@ $<

clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean

