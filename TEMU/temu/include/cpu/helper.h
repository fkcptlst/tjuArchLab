#ifndef __HELPER_H__
#define __HELPER_H__

#include "temu.h"
#include "operand.h"

#define FUNC_MASK 0x0000003F
#define RS_MASK 0x03E00000
#define RT_MASK 0x001F0000
#define RD_MASK 0x0000F800
#define SHAMT_MASK 0x000007C0
#define IMM_MASK 0x0000FFFF
#define INDEX_MASK 0x03FFFFFF

#define OPCODE_SIZE 6
#define FUNC_SIZE 6
#define RS_SIZE 5
#define RT_SIZE 5
#define RD_SIZE 5
#define SHAMT_SIZE 5
#define IMM_SIZE 16
#define INDEX_SIZE 26

#define REG_NAME(index) regfile[index]

/* All function defined with 'make_helper' return the length of the operation. */
#define make_helper(name) void name(uint32_t pc)

static inline uint32_t instr_fetch(uint32_t addr, size_t len) {
	return mem_read(addr, len);
}

/* shared by all helper function */
extern Operands ops_decoded;

#define op_src1 (&ops_decoded.src1)
#define op_src2 (&ops_decoded.src2)
#define op_dest (&ops_decoded.dest)

#ifdef DEBUG
#define print_asm(...) Assert(snprintf(assembly, 80, __VA_ARGS__) < 80, "buffer overflow!")
#else
#define print_asm(...)
#endif


#endif
