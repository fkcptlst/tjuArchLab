#include "helper.h"
#include "all-instr.h"

typedef void (*op_fun)(uint32_t);
static make_helper(_2byte_esc);
static make_helper(branch);
static make_helper(privileged);

Operands ops_decoded;
uint32_t instr;
	

/* TODO: Add more instructions!!! */

op_fun opcode_table [64] = {
/* 0x00 */	_2byte_esc, branch, j, jal,
/* 0x04 */	beq, bne, blez, bgtz,
/* 0x08 */	addi, addiu, slti, sltiu,
/* 0x0c */	andi, ori, xori, lui,
/* 0x10 */	privileged, inv, temu_trap, inv,
/* 0x14 */	inv, inv, inv, inv,
/* 0x18 */	inv, inv, inv, inv,
/* 0x1c */	inv, inv, inv, inv,
/* 0x20 */	lb, lh, inv, lw,
/* 0x24 */	lbu, lhu, inv, inv,
/* 0x28 */	sb, sh, inv, sw,
/* 0x2c */	inv, inv, inv, inv,
/* 0x30 */	inv, inv, inv, inv,
/* 0x34 */	inv, inv, inv, inv,
/* 0x38 */	inv, inv, inv, inv,
/* 0x3c */	inv, inv, inv, inv
};

op_fun _2byte_opcode_table [64] = {
/* 0x00 */	sll, inv, srl, sra, 
/* 0x04 */	sllv, inv, srlv, srav, 
/* 0x08 */	jr, jalr, inv, inv, 
/* 0x0c */	syscall, BREAK, inv, inv,
/* 0x10 */	mfhi, mthi, mflo, mtlo, 
/* 0x14 */	inv, inv, inv, inv, 
/* 0x18 */	mult, multu, div, divu, 
/* 0x1c */	inv, inv, inv, inv, 
/* 0x20 */	add, addu, sub, subu,
/* 0x24 */	and, or, xor, nor,
/* 0x28 */	inv, inv, slt, sltu, 
/* 0x2c */	inv, inv, inv, inv, 
/* 0x30 */	inv, inv, inv, inv, 
/* 0x34 */	inv, inv, inv, inv,
/* 0x38 */	inv, inv, inv, inv, 
/* 0x3c */	inv, inv, inv, inv
};

op_fun _branch_table [32] = {
/* 0x00 */	bltz, bgez, inv, inv,
/* 0x04 */	inv, inv, inv, inv,
/* 0x08 */	inv, inv, inv, inv,
/* 0x0c */	inv, inv, inv, inv,
/* 0x10 */	bltzal, bgezal, inv, inv,
/* 0x14 */	inv, inv, inv, inv,
/* 0x18 */	inv, inv, inv, inv,
/* 0x1c */	inv, inv, inv, inv
};

//op_fun eret;
//op_fun mfc0;
//op_fun mtc0;

make_helper(exec) {
	instr = instr_fetch(pc, 4);
	ops_decoded.opcode = instr >> 26;
	opcode_table[ ops_decoded.opcode ](pc);
}

static make_helper(_2byte_esc) {
	ops_decoded.func = instr & FUNC_MASK;
	_2byte_opcode_table[ops_decoded.func](pc); 
}

static make_helper(branch) {
	ops_decoded.func = (instr & RT_MASK) >> IMM_SIZE;
	_branch_table[ops_decoded.func](pc); 
}

static make_helper(privileged) {
    ops_decoded.func = (instr & RS_MASK) >> 21;
    if(ops_decoded.func==0){
        mfc0(pc);
    }
    else if(ops_decoded.func==4){
        mtc0(pc);
    }
    else{
        eret(pc);
    }
}