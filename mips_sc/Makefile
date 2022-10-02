include src/Makefile.testcase 

.PHONY: clean

ifndef CROSS_COMPILE
CROSS_COMPILE := mips-sde-elf-
endif
ifndef TESTCASE_SRC_DIR
TESTCASE_SRC_DIR := src/
endif
ifndef TESTCASE_BUILD_DIR
TESTCASE_BUILD_DIR := build/
endif
DEBUG := false

CC :=  $(CROSS_COMPILE)gcc
AS := $(CROSS_COMPILE)as
LD := $(CROSS_COMPILE)ld
OBJCOPY := $(CROSS_COMPILE)objcopy
OBJDUMP := $(CROSS_COMPILE)objdump

CFLAGS := -mips1 -EL

ifeq ($(DEBUG), true)
CFLAGS += -g
endif

OBJECTS := $(TESTCASE_BUILD_DIR)$(USER_PROGRAM).o

export	CROSS_COMPILE
export	TESTCASE_SRC_DIR
export	TESTCASE_BUILD_DIR

# ********************
# Rules of Compilation
# ********************

all: inst.bin data.bin convert
	@./convert inst.bin data.bin
	@mv convert $(TESTCASE_BUILD_DIR)
	@mv inst_rom.coe $(TESTCASE_BUILD_DIR)$(USER_PROGRAM)_inst.coe
	@mv data_ram.coe $(TESTCASE_BUILD_DIR)$(USER_PROGRAM)_data.coe
	@mv inst.bin ../
	@mv data.bin ../


$(TESTCASE_BUILD_DIR)$(USER_PROGRAM).o: $(TESTCASE_SRC_DIR)$(USER_PROGRAM).S
	@mkdir -p $(TESTCASE_BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(TESTCASE_BUILD_DIR)$(USER_PROGRAM): default.ld $(OBJECTS)
	$(LD) -T default.ld $(CFLAGS) $(OBJECTS) -o $@
	$(OBJDUMP) -alD $@ > $@.asm

inst.bin: $(TESTCASE_BUILD_DIR)$(USER_PROGRAM)
	$(OBJCOPY) -O binary -j .text $<  $@

data.bin: $(TESTCASE_BUILD_DIR)$(USER_PROGRAM)
	$(OBJCOPY) -O binary -j .data $<  $@

convert: convert.c
	gcc $< -o $@
