#include "helper.h"
#include "monitor.h"
#include "reg.h"

extern uint32_t instr;
extern char assembly[80];

#define signed_ext_mask 0xffff0000

int32_t signed_ext(uint32_t imm){
	if(imm>=0x8000){
		return imm | signed_ext_mask;
	}
	else{
		return imm;
	}
}

/* decode I-type instrucion with unsigned immediate */
static void decode_imm_type(uint32_t instr) {

	op_src1->type = OP_TYPE_REG;
	op_src1->reg = (instr & RS_MASK) >> (RT_SIZE + IMM_SIZE);
	op_src1->val = reg_w(op_src1->reg);
	
	op_src2->type = OP_TYPE_IMM;
	op_src2->imm = instr & IMM_MASK;
	//op_src2->simm=((instr & IMM_MASK)<<16)>>16;
	op_src2->val = op_src2->imm;

	op_dest->type = OP_TYPE_REG;
	op_dest->reg = (instr & RT_MASK) >> (IMM_SIZE);
}

make_helper(lui) {

	decode_imm_type(instr);
	reg_w(op_dest->reg) = (op_src2->val << 16);
	sprintf(assembly, "lui   %s,   0x%04x", REG_NAME(op_dest->reg), op_src2->imm);
}

make_helper(ori) {

	decode_imm_type(instr);
	reg_w(op_dest->reg) = op_src1->val | op_src2->val;
	sprintf(assembly, "ori   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
}

make_helper(addiu){

		decode_imm_type(instr);
		//op_src2->val=op_src2->simm;	//TODO:
		reg_w(op_dest->reg) = op_src1->val + signed_ext(op_src2->val);
		sprintf(assembly, "addiu   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(andi){

		decode_imm_type(instr);
		reg_w(op_dest->reg) = op_src1->val & op_src2->val;
		sprintf(assembly, "andi   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(xori){

		decode_imm_type(instr);
		reg_w(op_dest->reg) = op_src1->val ^ op_src2->val;
		sprintf(assembly, "xori   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
}

make_helper(slti){

		decode_imm_type(instr);
		int32_t rs = op_src1->val; 
		int32_t imme = signed_ext(op_src2->val)
		reg_w(op_dest->reg) = (rs < imme) ? 1 : 0;
		sprintf(assembly, "slti   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(sltiu){

		decode_imm_type(instr);
		int32_t imme = signed_ext(op_src2->val)
		reg_w(op_dest->reg) = (op_src1->val < imme) ? 1 : 0;
		sprintf(assembly, "sltiu   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
}


