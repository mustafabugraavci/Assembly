# Define the cross-compiler
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as

# Source files directory
SRC_DIR = src

# Output directory
BUILD_DIR = build

# List of assembly source files
SRC_FILES = $(wildcard $(SRC_DIR)/*.s)

# Object files derived from source files
OBJ_FILES = $(patsubst $(SRC_DIR)/%.s,$(BUILD_DIR)/%.o,$(SRC_FILES))

# Name of the final executable
TARGET = my_program

# Compiler flags
CFLAGS = -g -Wall

# Linker flags (if needed)
LDFLAGS =

# Rule to compile assembly source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to link object files into the final executable
$(BUILD_DIR)/$(TARGET): $(OBJ_FILES)
	$(CC) $(LDFLAGS) $^ -o $@

# Default target: build the executable
all: $(BUILD_DIR)/$(TARGET)

# Clean up object files and the executable
clean:
	rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/$(TARGET)
	