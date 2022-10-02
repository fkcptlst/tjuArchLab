#include "helper.h"
#include "monitor.h"
#include "reg.h"

extern uint32_t instr;
extern char assembly[80];

/* decode R-type instrucion */
static void decode_r_type(uint32_t instr) {

	op_src1->type = OP_TYPE_REG;
	op_src1->reg = (instr & RS_MASK) >> (RT_SIZE + IMM_SIZE);
	op_src1->val = reg_w(op_src1->reg);
	
	op_src2->type = OP_TYPE_REG;
	op_src2->reg = (instr & RT_MASK) >> (RD_SIZE + SHAMT_SIZE + FUNC_SIZE);
	op_src2->val = reg_w(op_src2->reg);

	op_dest->type = OP_TYPE_REG;
	op_dest->reg = (instr & RD_MASK) >> (SHAMT_SIZE + FUNC_SIZE);

	
	op_sham = instr & SHAMT_MASK;
	
}

make_helper(and) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = (op_src1->val & op_src2->val);
	sprintf(assembly, "and   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}
make_helper(addu) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src1->val + op_src2->val);
		sprintf(assembly, "addu   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}
make_helper(subu) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src1->val - op_src2->val);
		sprintf(assembly, "subu   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}
make_helper(nor) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = ~(op_src1->val | op_src2->val);
		sprintf(assembly, "nor   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}
make_helper(or) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src1->val | op_src2->val);
		sprintf(assembly, "or   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}
make_helper(xor) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src1->val ^ op_src2->val);
		sprintf(assembly, "xor   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}

make_helper(sll) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = (op_src2->val) << (op_sham);
	sprintf(assembly, "sll   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), op_sham);
}

make_helper(srl) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = (op_src2->val) >> (op_sham);
	sprintf(assembly, "srl   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), op_sham);
}

make_helper(sllv) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src2->val << op_src1->val);
		sprintf(assembly, "sllv   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), REG_NAME(op_src1->reg));
}
make_helper(srlv) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src2->val >> op_src1->val);
		sprintf(assembly, "srlv   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), REG_NAME(op_src1->reg));
}
make_helper(sra) {

		decode_r_type(instr);
		int32_t rt=op_src2->val;
		reg_w(op_dest->reg) = (rt >> op_sham);
		sprintf(assembly, "sra   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), op_sham);
}
make_helper(srav) {

		decode_r_type(instr);
		int32_t rt=op_src2->val;
		reg_w(op_dest->reg) = (rt >> op_src1->val);
		sprintf(assembly, "srav   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), REG_NAME(op_src1->reg));
}

make_helper(slt) {

	decode_r_type(instr);
	int32_t rs = op_src1->val; 
	int32_t rt = op_src2->val;
	reg_w(op_dest->reg) = (rs < rt) ? 1 : 0;
	sprintf(assembly, "slt   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}

make_helper(sltu) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = (op_src1->val < op_src2->val) ? 1 : 0;
	sprintf(assembly, "sltu   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}

make_helper(mfhi) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = cpu.hi;
	sprintf(assembly, "mfhi   %s", REG_NAME(op_dest->reg));
}
make_helper(mthi) {

	decode_r_type(instr);
	cpu.hi = op_src1->val;
	sprintf(assembly, "mfhi   %s", REG_NAME(op_src1->reg));
}
make_helper(mflo) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = cpu.lo;
	sprintf(assembly, "mflo   %s", REG_NAME(op_dest->reg));
}
make_helper(mtlo) {

	decode_r_type(instr);
	cpu.lo = op_src1->val;
	sprintf(assembly, "mtlo   %s", REG_NAME(op_src1->reg));
}