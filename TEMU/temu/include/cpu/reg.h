#ifndef __REG_H__
#define __REG_H__

#include "common.h"

enum { R_ZERO, R_AT, R_V0, R_V1, R_A0, R_A1, R_A2, R_A3, R_T0, R_T1, R_T2, R_T3, R_T4, R_T5, R_T6, R_T7, R_S0, R_S1, R_S2, R_S3, R_S4, R_S5, R_S6, R_S7, R_T8, R_T9, R_K0, R_K1, R_GP, R_SP, R_FP, R_RA };

typedef struct {
     union {
	union {
		uint32_t _32;
		uint16_t _16;
		uint8_t _8;
	} gpr[32];

	/* Do NOT change the order of the GPRs' definitions. */

	uint32_t zero, at, v0, v1, a0, a1, a2, a3;
	uint32_t t0, t1, t2, t3, t4, t5, t6, t7;
	uint32_t s0, s1, s2, s3, s4, s5, s6, s7;
	uint32_t t8, t9, k1, k2, gp, sp, fp, ra;
     };
	uint32_t pc;
	uint32_t hi, lo;

} CPU_state;

extern CPU_state cpu;

static inline int check_reg_index(int index) {
	assert(index >= 0 && index < 31);
	return index;
}

#define reg_w(index) (cpu.gpr[check_reg_index(index)]._32)
#define reg_h(index) (cpu.gpr[check_reg_index(index)]._16)
#define reg_b(index) (cpu.gpr[check_reg_index(index)]._8)

extern const char* regfile[];

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;

typedef struct {

    union {
        uint32_t reg[32];

        uint32_t Index, // 0
        Random, // 1
        EntryLo0, // 2
        EntryLo1, // 3
        Context, // 4
        PageMask, // 5
        Wired, // 6
        Reserved7,  // 7
        BadVAddr,  // 8
        Count, // 9
        EntryHi, // 10
        Compare; // 11
        union {
            uint32_t Status; // 12

            uint32_t IE: 1; // 0
            uint32_t EXL: 1; // 1
            uint32_t ERL: 1; // 2
            uint32_t R3: 2; // 3
            uint32_t UM: 1; // 4
            uint32_t R5_7: 3; // 5-7
            uint32_t IM0: 1; // 8
            uint32_t IM1: 1; // 9
            uint32_t IM2: 1; // 10
            uint32_t IM3: 1; // 11
            uint32_t IM4: 1; // 12
            uint32_t IM5: 1; // 13
            uint32_t IM6: 1; // 14
            uint32_t IM7: 1; // 15
            uint32_t R16_18: 2; // 16-18
            uint32_t NMI: 1; // 19
            uint32_t SR: 1; // 20
            uint32_t TS: 1; // 21
            uint32_t BEV: 1; // 22
            uint32_t R23_24: 2; // 23-24
            uint32_t RE: 1; // 25
            uint32_t R26: 1; // 26
            uint32_t RP: 1; // 27
            uint32_t CU0: 1; // 28
            uint32_t CU1: 1; // 29
            uint32_t CU2: 1; // 30
            uint32_t CU3: 1; // 31
        };
        union{
            uint32_t Cause; // 13

            uint32_t pad0_1: 2; // 0-1
            uint32_t ExcCode: 5; // 2-6
            uint32_t pad7: 1; // 7
            uint32_t IP0: 1; // 8
            uint32_t IP1: 1; // 9
            uint32_t IP2: 1; // 10
            uint32_t IP3: 1; // 11
            uint32_t IP4: 1; // 12
            uint32_t IP5: 1; // 13
            uint32_t IP6: 1; // 14
            uint32_t IP7: 1; // 15
            uint32_t pad16_21: 6; // 16-21
            uint32_t WP: 1; // 22
            uint32_t IV: 1; // 23
            uint32_t pad24_25: 2; // 24-25
            uint32_t PCI: 1; // 26
            uint32_t DC: 1; // 27
            uint32_t CE: 2; // 28-29
            uint32_t R: 1; // 30
            uint32_t BD: 1; // 31
        };

        uint32_t EPC, // 14
        PRId, // 15
        Config, // 16
        LLAddr, // 17
        WatchLo, // 18
        WatchHi, // 19
        Reserved20_22[3], // 20-22
        Debug, // 23
        DEPC, // 24
        Reserved, // 25
        ErrCtl, // 26
        Reserved27; // 27
        uint16_t TagLo, DataLo; // 28
        uint32_t Reserved29, // 29
        ErrorEPC, // 30
        DESAVE; // 31
    };

} CP0_state;

CP0_state cp0;
#endif
