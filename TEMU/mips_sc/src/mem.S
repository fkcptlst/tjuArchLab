#include "trap.h"
   .set nomacro
   .set noat
   .globl main
   .text
main:
   ori  $at,$zero,0xff
   nop
   nop
   sb   $at,0x3($zero)       # [0x3] = 0xff
   ori  $at,$zero,0xee
   nop
   nop
   sb   $at,0x2($zero)       # [0x2] = 0xee
   ori  $at,$zero,0xdd
   nop
   nop
   sb   $at,0x1($zero)       # [0x1] = 0xdd
   ori  $at,$zero,0xcc
   nop
   nop
   sb   $at,0x0($zero)       # [0x0] = 0xcc
   lb   $v0,0x3($zero)       # $v0 = 0xffffffff
   nop

   lui  $at,0x4455
   nop
   nop
   ori  $at,$at,0x6677
   nop
   nop     
   sw   $at,0x8($zero)       # [0x8] = 0x44, [0x9]= 0x55, [0xa]= 0x66, [0xb] = 0x77
   lw   $v0,0x8($zero)       # $v0 = 0x44556677
   nop
   HIT_GOOD_TRAP		#stop temu

