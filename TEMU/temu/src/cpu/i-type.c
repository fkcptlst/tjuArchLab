#include "helper.h"
#include "monitor.h"
#include "reg.h"

extern uint32_t instr;
extern char assembly[80];

#define signed_ext_16_mask 0xffff0000
#define signed_ext_8_mask  0xffffff00
#define signed_ext_18_mask 0xfffc0000
#define signed_ext_28_mask 0xf0000000

int32_t signed_ext(uint32_t imm,uint32_t place)
{
	switch (place)
	{
	case 16:
		if (imm >= 0x8000)
		{
			return imm | signed_ext_16_mask;
		}
		else
		{
			return imm;
		}
	case 8:
		if (imm >= 0x80)
		{
			return imm | signed_ext_8_mask;
		}
		else
		{
			return imm;
		}
	case 18:
		if(imm>= 0x20000){
			return imm | signed_ext_18_mask;
		}
		else{
			return imm;
		}
	case 28:
		if(imm>=8000000)
		{
			return imm | signed_ext_28_mask;
		}
		else{
			return imm;
		}
	}
    return 0;
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
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(ori) {

	decode_imm_type(instr);
	reg_w(op_dest->reg) = op_src1->val | op_src2->val;
	sprintf(assembly, "ori   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(addiu){

		decode_imm_type(instr);
		//op_src2->val=op_src2->simm;	//TODO:
		reg_w(op_dest->reg) = op_src1->val + signed_ext(op_src2->val,16);
		sprintf(assembly, "addiu   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(addi){

    decode_imm_type(instr);
    //op_src2->val=op_src2->simm;	//TODO:
    reg_w(op_dest->reg) = op_src1->val + signed_ext(op_src2->val,16);
    int32_t rs = op_src1->val;
    int32_t imm = signed_ext(op_src2->val,16);
    int32_t sum = rs + imm;
    if((rs<0&&imm<0&&sum>=0)||(rs>0&&imm>0&&sum<=0)){
        cp0.ExcCode = 0x0c;
        if(delayed_transfer){
            cp0.EPC = cpu.pc - 4;
            cp0.BD = 1;
        }
        else{
            cp0.EPC = cpu.pc;
            cp0.BD = 0;
        }
        cp0.EXL = 1;
        printf("IntegerOverflow ...");
        assert(0);
    }
    sprintf(assembly, "addi   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(andi){

		decode_imm_type(instr);
		reg_w(op_dest->reg) = op_src1->val & op_src2->val;
		sprintf(assembly, "andi   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(xori){

		decode_imm_type(instr);
		reg_w(op_dest->reg) = op_src1->val ^ op_src2->val;
		sprintf(assembly, "xori   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(slti){

		decode_imm_type(instr);
		int32_t rs = op_src1->val; 
		int32_t imme = signed_ext(op_src2->val,16);
		reg_w(op_dest->reg) = (rs < imme) ? 1 : 0;
		sprintf(assembly, "slti   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(sltiu){

		decode_imm_type(instr);
		int32_t imme = signed_ext(op_src2->val,16);
		reg_w(op_dest->reg) = (op_src1->val < imme) ? 1 : 0;
		sprintf(assembly, "sltiu   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), op_src2->imm);
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(lb){

		decode_imm_type(instr);
		int32_t offset = signed_ext(op_src2->val,16);
		uint32_t paddr = (op_src1->val + offset) & 0x7fffffff;
		uint32_t membyte = mem_read(paddr, 1);
		reg_w(op_dest->reg) = signed_ext(membyte,8);
		sprintf(assembly, "lb   %s,   0x%04x(%s)", REG_NAME(op_dest->reg), op_src2->imm, REG_NAME(op_src1->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(lbu){

		decode_imm_type(instr);
		int32_t offset = signed_ext(op_src2->val,16);
		uint32_t paddr = (op_src1->val + offset) & 0x7ffffff;
		uint32_t membyte = mem_read(paddr, 1);
		reg_w(op_dest->reg) = membyte;
		sprintf(assembly, "lbu   %s,   0x%04x(%s)", REG_NAME(op_dest->reg), op_src2->imm, REG_NAME(op_src1->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(sb){

		decode_imm_type(instr);
		int32_t offset = signed_ext(op_src2->val,16);
		uint32_t paddr = (op_src1->val + offset) & 0x7fffffff;
		uint32_t databyte = reg_b(op_dest->reg);
		mem_write(paddr, 1, databyte);
		sprintf(assembly, "sb   %s,   0x%04x(%s)", REG_NAME(op_dest->reg), op_src2->imm, REG_NAME(op_src1->reg));
}
make_helper(lh) {
    decode_imm_type(instr);
    int32_t offset = signed_ext(op_src2->val,16);
    uint32_t paddr = (op_src1->val + offset) & 0x7fffffff;
    if(paddr % 2 != 0){
        cp0.ExcCode = 0x04;
        if(delayed_transfer){
            cp0.EPC = cpu.pc - 4;
            cp0.BD = 1;
        }
        else{
            cp0.EPC = cpu.pc;
            cp0.BD = 0;
        }
        cp0.EXL = 1;
        printf("AddressError ...");
        assert(0);
    }
    uint32_t membyte = mem_read(paddr, 2);
    reg_w(op_dest->reg) = signed_ext(membyte,16);
    sprintf(assembly, "lh   %s,   0x%04x(%s)", REG_NAME(op_dest->reg), op_src2->imm, REG_NAME(op_src1->reg));
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
	
}
make_helper(lhu) {
    decode_imm_type(instr);
    int32_t offset = signed_ext(op_src2->val,16);
    uint32_t paddr = (op_src1->val + offset) & 0x7ffffff;
    if(paddr % 2 != 0){
        cp0.ExcCode = 0x04;
        if(delayed_transfer){
            cp0.EPC = cpu.pc - 4;
            cp0.BD = 1;
        }
        else{
            cp0.EPC = cpu.pc;
            cp0.BD = 0;
        }
        cp0.EXL = 1;
        printf("AddressError ...");
        assert(0);
    }
    uint32_t membyte = mem_read(paddr, 2);
    reg_w(op_dest->reg) = membyte;
    sprintf(assembly, "lhu   %s,   0x%04x(%s)", REG_NAME(op_dest->reg), op_src2->imm, REG_NAME(op_src1->reg));
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
	
}
make_helper(lw) {
    decode_imm_type(instr);
    int32_t offset = signed_ext(op_src2->val,16);
    uint32_t paddr = (op_src1->val + offset) & 0x7fffffff;
    if(paddr % 4 != 0){
        cp0.ExcCode = 0x04;
        if(delayed_transfer){
            cp0.EPC = cpu.pc - 4;
            cp0.BD = 1;
        }
        else{
            cp0.EPC = cpu.pc;
            cp0.BD = 0;
        }
        cp0.EXL = 1;
        printf("AddressError ...");
        assert(0);
    }
    uint32_t membyte = mem_read(paddr, 4);
    reg_w(op_dest->reg) = membyte;
    sprintf(assembly, "lw   %s,   0x%04x(%s)", REG_NAME(op_dest->reg), op_src2->imm, REG_NAME(op_src1->reg));
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
	
}
make_helper(sh) {
    decode_imm_type(instr);
    int32_t offset = signed_ext(op_src2->val,16);
    uint32_t paddr = (op_src1->val + offset) & 0x7fffffff;
    if(paddr % 2 != 0){
        cp0.ExcCode = 0x05;
        if(delayed_transfer){
            cp0.EPC = cpu.pc - 4;
            cp0.BD = 1;
        }
        else{
            cp0.EPC = cpu.pc;
            cp0.BD = 0;
        }
        cp0.EXL = 1;
        printf("AddressError ...");
        assert(0);
    }
    uint32_t databyte = reg_h(op_dest->reg);
    mem_write(paddr, 2, databyte);
    sprintf(assembly, "sh   %s,   0x%04x(%s)", REG_NAME(op_dest->reg), op_src2->imm, REG_NAME(op_src1->reg));
	
}
make_helper(sw) {
    decode_imm_type(instr);
    int32_t offset = signed_ext(op_src2->val,16);
    uint32_t paddr = (op_src1->val + offset) & 0x7fffffff;
    if(paddr % 4 != 0){
        cp0.ExcCode = 0x05;
        if(delayed_transfer){
            cp0.EPC = cpu.pc - 4;
            cp0.BD = 1;
        }
        else{
            cp0.EPC = cpu.pc;
            cp0.BD = 0;
        }
        cp0.EXL = 1;
        printf("AddressError ...");
        assert(0);
    }
    uint32_t databyte = reg_w(op_dest->reg);
    mem_write(paddr, 4, databyte);
    sprintf(assembly, "sw   %s,   0x%04x(%s)", REG_NAME(op_dest->reg), op_src2->imm, REG_NAME(op_src1->reg));
	
}

make_helper(beq) {
	decode_imm_type(instr);
	if(reg_w(op_dest->reg) == op_src1->val){
		int32_t offset = signed_ext(op_src2->val << 2 ,18);
		cpu.pc = cpu.pc + offset;
		delayed_transfer = 1;
	}
	sprintf(assembly, "beq   %s,   %s,   0x%04x", REG_NAME(op_src1->reg), REG_NAME(op_dest->reg), op_src2->imm);
}
make_helper(bne) {
	decode_imm_type(instr);
	if(reg_w(op_dest->reg) != op_src1->val){
		int32_t offset = signed_ext(op_src2->val << 2 ,18);
		cpu.pc = cpu.pc + offset;
		delayed_transfer = 1;
	}
	sprintf(assembly, "bne   %s,   %s,   0x%04x", REG_NAME(op_src1->reg), REG_NAME(op_dest->reg), op_src2->imm);
}
make_helper(bgez) {
	decode_imm_type(instr);
	int32_t rs = op_src1->val;
	if(rs >= 0){
		int32_t offset = signed_ext(op_src2->val << 2 ,18);
		cpu.pc = cpu.pc + offset;
		delayed_transfer = 1;
	}
	sprintf(assembly, "bgez   %s,   0x%04x", REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(bgtz) {
	decode_imm_type(instr);
	int32_t rs = op_src1->val;
	if(rs > 0){
		int32_t offset = signed_ext(op_src2->val << 2 ,18);
		cpu.pc = cpu.pc + offset;
		delayed_transfer = 1;
	}
	sprintf(assembly, "bgtz   %s,   0x%04x", REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(blez) {
	decode_imm_type(instr);
	int32_t rs = op_src1->val;
	if(rs <= 0){
		int32_t offset = signed_ext(op_src2->val << 2 ,18);
		cpu.pc = cpu.pc + offset;
		delayed_transfer = 1;
	}
	sprintf(assembly, "blez   %s,   0x%04x", REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(bltz) {
	decode_imm_type(instr);
	int32_t rs = op_src1->val;
	if(rs <= 0){
		int32_t offset = signed_ext(op_src2->val << 2 ,18);
		cpu.pc = cpu.pc + offset;
		delayed_transfer = 1;
	}
	sprintf(assembly, "bltz   %s,   0x%04x", REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(bgezal) {
	decode_imm_type(instr);
	int32_t rs = op_src1->val;
	cpu.gpr[31]._32 = cpu.pc + 8;
	if(rs >= 0){
		int32_t offset = signed_ext(op_src2->val << 2 ,18);
		cpu.pc = cpu.pc + offset;
		delayed_transfer = 1;
	}
	
	sprintf(assembly, "bgezal   %s,   0x%04x", REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(bltzal) {
	decode_imm_type(instr);
	int32_t rs = op_src1->val;
	cpu.gpr[31]._32 = cpu.pc + 8;
	if(rs < 0){
		int32_t offset = signed_ext(op_src2->val << 2 ,18);
		cpu.pc = cpu.pc + offset;
		delayed_transfer = 1;
	}
	
	sprintf(assembly, "bltzal   %s,   0x%04x", REG_NAME(op_src1->reg), op_src2->imm);
}
make_helper(j){
	uint32_t instr_index = instr & 0x0cffffff;
	cpu.pc = ((cpu.pc + 4) & 0xf0000000) + signed_ext(instr_index << 2, 28) - 4;   //cpu-exec中执行完指令后cpu.pc会+4，所以要-4
	sprintf(assembly, "j   0x%08x", instr_index);
	delayed_transfer = 1;
}
make_helper(jal){
	uint32_t instr_index = instr & 0x0cffffff;
	cpu.gpr[31]._32 = cpu.pc + 8;
	cpu.pc = ((cpu.pc + 4) & 0xf0000000) + signed_ext(instr_index << 2, 28) - 4;   //cpu-exec中执行完指令后cpu.pc会+4，所以要-4
	sprintf(assembly, "jal   0x%08x", instr_index);
	delayed_transfer = 1;
}

make_helper(eret){
    cpu.pc = cp0.EPC;
    cp0.EXL = 0;
    sprintf(assembly, "eret");
}

make_helper(mfc0){
    uint32_t rt = (instr & 0x001f0000) >> 16;
    uint32_t rd = (instr & 0x0000f800) >> 11;
    reg_w(rt) = cp0.reg[rd];
    sprintf(assembly, "mfc0   %s,   %d", REG_NAME(rt), rd);
}
make_helper(mtc0){
    uint32_t rt = (instr & 0x001f0000) >> 16;
    uint32_t rd = (instr & 0x0000f800) >> 11;
    cp0.reg[rd] = reg_w(rt);
    sprintf(assembly, "mtc0   %s,   %d", REG_NAME(rt), rd);
}