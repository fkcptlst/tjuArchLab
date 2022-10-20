//
// Created by kevin on 2022/10/20.
//

#ifndef MINIMIPS32_GOLDEN_TRACE_H
#define MINIMIPS32_GOLDEN_TRACE_H

#include <stdio.h>

extern FILE *golden_trace_fp;

#define golden_trace(pc, dest_reg_idx, dest_reg_val) \
    do { \
        fprintf(golden_trace_fp, "%x\t%d\t%x", pc, dest_reg_idx, dest_reg_val); \
        fflush(golden_trace_fp);                                                \
    } while(0)

#endif //MINIMIPS32_GOLDEN_TRACE_H
