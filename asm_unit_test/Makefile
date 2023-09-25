# Define the cross-compiler
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld

C_COMPILER = gcc

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
CFLAGSARM = -mcpu=cortex-m4 -mthumb -Wall -I./include

TEST_EXECUTABLE = test/test_output

TARGET_EXTENSION=.out
UNITY_ROOT = test/unity
TARGET_BASE1=test1
TARGET1 = $(TARGET_BASE1)$(TARGET_EXTENSION)
SRC_FILES1=$(UNITY_ROOT)/src/unity.c test/test_module.c test/test_module_Runner.c src/main.c
INC_DIRS=-Iinclude -I$(UNITY_ROOT)/src
SYMBOLS=
# Build rule
all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) -T linker_script.ld -o $@ $^

%.o: %.c
	$(CC) $(CFLAGSARM) -c -o $@ $<

%.o: %.s
	$(AS) -o $@ $<

CFLAGS=-std=c89
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -Wpointer-arith
CFLAGS += -Wcast-align
CFLAGS += -Wwrite-strings
CFLAGS += -Wswitch-default
CFLAGS += -Wunreachable-code
CFLAGS += -Winit-self
CFLAGS += -Wmissing-field-initializers
CFLAGS += -Wno-unknown-pragmas
CFLAGS += -Wstrict-prototypes
CFLAGS += -Wundef
CFLAGS += -Wold-style-definition

test: $(SRC_FILES1)
	$(C_COMPILER) $(CFLAGS) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES1) -o $(TARGET1)
	- ./$(TARGET1)

test/test_module_Runner.c: test/test_module.c
	ruby $(UNITY_ROOT)/auto/generate_test_runner.rb test/test_module.c  test/test_module_Runner.c

clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean
