#ifndef __MEMORY_H__
#define __MEMORY_H__

#include "common.h"

#define HW_MEM_SIZE (128 * 1024 * 1024)

extern uint8_t *hw_mem;

uint32_t mem_read(uint32_t, size_t);
void mem_write(uint32_t, size_t, uint32_t);

#endif
