//
// Created by 王家鹏 on 2022/10/20.
//

#ifndef TEMU_GOLDEN_TRACE_H
#define TEMU_GOLDEN_TRACE_H

#include <stdio.h>

extern FILE *golden_trace_fp;

#define golden_trace(pc, dest_reg_idx, dest_reg_val) \
    do { \
        fprintf(golden_trace_fp, "%x\t%d\t%x\n", pc, dest_reg_idx, dest_reg_val); \
        fflush(golden_trace_fp);                                                \
    } while(0)

#endif //TEMU_GOLDEN_TRACE_H
