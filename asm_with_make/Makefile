# Compiler settings
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
CFLAGS = -Wall -Wextra -g -I include

# Source and object files
SRCS := $(wildcard src/*.c src/*.s)
OBJS := $(SRCS:src/%.c=build/%.o)
TARGET = bin/my_program

# Build rule
$(TARGET): $(OBJS)
	$(CC) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s
	$(CC) $(CFLAGS) -c $< -o $@

# Dependency generation
DEPS := $(OBJS:.o=.d)
-include $(DEPS)

# Compile C source files
build/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -MMD -c -o $@ $<

# Compile assembly source files
build/%.o: src/%.s
	@mkdir -p $(@D)
	$(AS) -o $@ $<

# Clean rule
clean:
	rm -rf build/ bin/

.PHONY: clean
