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
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(addu) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src1->val + op_src2->val);
		sprintf(assembly, "addu   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(add) {

    decode_r_type(instr);
    reg_w(op_dest->reg) = (op_src1->val + op_src2->val);
    int32_t rs = op_src1->val;
    int32_t rt = op_src2->val;
    int32_t sum = rs + rt;
    if((rs<0&&rt<0&&sum>=0)||(rs>0&&rt>0&&sum<=0)){
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
    sprintf(assembly, "add   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(subu) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src1->val - op_src2->val);
		sprintf(assembly, "subu   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(sub) {

    decode_r_type(instr);
    reg_w(op_dest->reg) = (op_src1->val - op_src2->val);
    int32_t rs = op_src1->val;
    int32_t rt = op_src2->val;
    int32_t sum = rs - rt;
    if((rs<0&&rt>0&&sum>=0)||(rs>0&&rt<0&&sum<=0)){
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
    sprintf(assembly, "sub   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(nor) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = ~(op_src1->val | op_src2->val);
		sprintf(assembly, "nor   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(or) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src1->val | op_src2->val);
		sprintf(assembly, "or   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(xor) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src1->val ^ op_src2->val);
		sprintf(assembly, "xor   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(sll) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = (op_src2->val) << (op_sham);
	sprintf(assembly, "sll   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), op_sham);
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(srl) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = (op_src2->val) >> (op_sham);
	sprintf(assembly, "srl   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), op_sham);
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(sllv) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src2->val << op_src1->val);
		sprintf(assembly, "sllv   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), REG_NAME(op_src1->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(srlv) {

		decode_r_type(instr);
		reg_w(op_dest->reg) = (op_src2->val >> op_src1->val);
		sprintf(assembly, "srlv   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), REG_NAME(op_src1->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(sra) {

		decode_r_type(instr);
		int32_t rt=op_src2->val;
		reg_w(op_dest->reg) = (rt >> op_sham);
		sprintf(assembly, "sra   %s,   %s,   0x%04x", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), op_sham);
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(srav) {

		decode_r_type(instr);
		int32_t rt=op_src2->val;
		reg_w(op_dest->reg) = (rt >> op_src1->val);
		sprintf(assembly, "srav   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src2->reg), REG_NAME(op_src1->reg));
        golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(slt) {

	decode_r_type(instr);
	int32_t rs = op_src1->val; 
	int32_t rt = op_src2->val;
	reg_w(op_dest->reg) = (rs < rt) ? 1 : 0;
	sprintf(assembly, "slt   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(sltu) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = (op_src1->val < op_src2->val) ? 1 : 0;
	sprintf(assembly, "sltu   %s,   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}

make_helper(mfhi) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = cpu.hi;
	sprintf(assembly, "mfhi   %s", REG_NAME(op_dest->reg));
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
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
    golden_trace(pc, op_dest->reg, reg_w(op_dest->reg));
}
make_helper(mtlo) {

	decode_r_type(instr);
	cpu.lo = op_src1->val;
	sprintf(assembly, "mtlo   %s", REG_NAME(op_src1->reg));
}
//TODO:
make_helper(mult) {

	decode_r_type(instr);
	int32_t rs = op_src1->val; 
	int32_t rt = op_src2->val;
	int64_t res = rs * rt;
	cpu.hi = res >> 32;
	cpu.lo = res;
	sprintf(assembly, "mult   %s,   %s", REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}
make_helper(multu) {

	decode_r_type(instr);
	uint64_t res = op_src1->val * op_src2->val;
	cpu.hi = res >> 32;
	cpu.lo = res;
	sprintf(assembly, "multu   %s,   %s", REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}
make_helper(div) {

	decode_r_type(instr);
	int32_t rs = op_src1->val; 
	int32_t rt = op_src2->val;
	cpu.lo = rs / rt;
	cpu.hi = rs % rt;
	sprintf(assembly, "div   %s,   %s", REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}
make_helper(divu) {

	decode_r_type(instr);
	cpu.hi = op_src1->val / op_src2->val;
	cpu.lo = op_src1->val % op_src2->val;
	sprintf(assembly, "divu   %s,   %s", REG_NAME(op_src1->reg), REG_NAME(op_src2->reg));
}

make_helper(jr) {

	decode_r_type(instr);
	cpu.pc = op_src1->val - 4;    				////cpu-exec中执行完指令后cpu.pc会+4，所以要-4
	sprintf(assembly, "jr   %s", REG_NAME(op_src1->reg));
	delayed_transfer = 1;
}
make_helper(jalr) {

	decode_r_type(instr);
	reg_w(op_dest->reg) = cpu.pc + 8;
	cpu.pc = op_src1->val - 4;    				////cpu-exec中执行完指令后cpu.pc会+4，所以要-4
	sprintf(assembly, "jalr   %s,   %s", REG_NAME(op_dest->reg), REG_NAME(op_src1->reg));
	delayed_transfer = 1;
}
make_helper(syscall) {

    cp0.ExcCode = 0x08;
    if(delayed_transfer){
        cp0.EPC = cpu.pc - 4;
        cp0.BD = 1;
    }
    else{
        cp0.EPC = cpu.pc;
        cp0.BD = 0;
    }
    cp0.EXL = 1;
    sprintf(assembly, "syscall");
    printf("syscall ...");
    assert(0);
}
make_helper(BREAK) {

    cp0.ExcCode = 0x09;
    if(delayed_transfer){
        cp0.EPC = cpu.pc - 4;
        cp0.BD = 1;
    }
    else{
        cp0.EPC = cpu.pc;
        cp0.BD = 0;
    }
    cp0.EXL = 1;
    sprintf(assembly, "break");
    printf("break ...");
    assert(0);
}