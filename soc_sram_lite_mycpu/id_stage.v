`include "defines.v"

module id_stage(
    input  wire 					cpu_rst_n,
    
    input  wire [`INST_ADDR_BUS]    id_pc_i,

   
    input  wire [`INST_BUS     ]    id_inst_i,

    
    input  wire [`REG_BUS      ]    rd1,
    input  wire [`REG_BUS      ]    rd2,
    
    input wire [`REG_BUS 		] 	exe2id_wd_i,
	input wire [`REG_ADDR_BUS 	] 	exe2id_wa_i,
	input wire 					    exe2id_wreg_i,
	input wire [`REG_BUS       ]    mem2id_wd_i,
	input wire                      mem2id_wreg_i,
	input wire [`REG_ADDR_BUS  ]    mem2id_wa_i,
      
    input  wire 					id_in_delay_i,
    input  wire 					flush_im,
    input  wire[`EXC_CODE_BUS]      id_exccode_i,
    
    output wire [`REG_ADDR_BUS ]	cp0_addr,
    output wire [`INST_ADDR_BUS]    id_pc_o,
    output wire 					id_in_delay_o,
    output wire 					next_delay_o,
    output wire [`EXC_CODE_BUS]		id_exccode_o,
    
     
    // ??????��?��????????
    output wire [`ALUTYPE_BUS  ]    id_alutype_o,
    output wire [`ALUOP_BUS    ]    id_aluop_o,
	output wire                     id_whilo_o,
    output wire [`REG_ADDR_BUS ]    id_wa_o,
	//output wire [`REG_ADDR_BUS ]    id_we_o,
	output wire                     id_mreg_o,
    output wire                     id_wreg_o,
	output wire [`REG_BUS      ]    id_din_o,
	

    // ??????��?��????????1?????????2
    output wire [`REG_BUS      ]    id_src1_o,
    output wire [`REG_BUS      ]    id_src2_o,
      
    // ????????��???????????????
    output wire                     rreg1,
    output wire [`REG_ADDR_BUS ]    ra1,
    output wire                     rreg2,
    output wire [`REG_ADDR_BUS ]    ra2,
    
    input   wire                    exe2id_mreg,
    input   wire                    mem2id_mreg,
    
    output  wire                    stallreq_id,
    output wire[`INST_ADDR_BUS]   ret_addr,
    output wire[`INST_ADDR_BUS]   jump_addr_1,
    output wire[`INST_ADDR_BUS]   jump_addr_2,
    output wire[`INST_ADDR_BUS]   jump_addr_3,
    output wire[1:0]              jtsel,
    
    output wire                   pre_flush_o
    );
    
    // ????��????????????
    wire [`INST_BUS] id_inst = (flush_im == 1'b1)?`ZERO_WORD:{id_inst_i[7:0], id_inst_i[15:8], id_inst_i[23:16], id_inst_i[31:24]};
 // wire [`INST_BUS] id_inst = (flush_im == 1'b1)?`ZERO_WORD:id_inst_i;
    // ?????????��?????��????
    wire [5 :0] op   = id_inst[31:26];
    wire [5 :0] func = id_inst[5 : 0];
    wire [4 :0] rd   = id_inst[15:11];
    wire [4 :0] rs   = id_inst[25:21];
    wire [4 :0] rt   = id_inst[20:16];
    wire [4 :0] sa   = id_inst[10: 6];
    wire [15:0] imm  = id_inst[15: 0]; 
    wire [25:0] instr_index  = id_inst[25: 0];
	

	wire   rtsel;
	wire   shift;
	wire   immsel;
	wire   sext;
	wire   upper;
	wire[1:0]   fwrd1;
	wire[1:0]   fwrd2;
    

	wire   equ;
	wire   jal;
	
	wire [`INST_ADDR_BUS]    pc_4;
    assign  pc_4  = id_pc_i + 4;

    wire inst_reg  = ~|op;
    
	

    wire inst_add  = inst_reg& func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & ~func[0];//100_000
	wire inst_addi = ~op[5] & ~op[4] & op[3] & ~op[2] & ~op[1] & ~op[0];//001_000	
	wire inst_addu = inst_reg & func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & func[0];//100_001
	wire inst_addiu = ~op[5] & ~op[4] & op[3] & ~op[2] & ~op[1] & op[0];//001_001
	wire inst_sub = inst_reg & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & ~func[0];//100_010
	wire inst_subu = inst_reg & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & func[0];//100_011
	wire inst_slt = inst_reg & func[5] & ~func[4] & func[3] & ~func[2] & func[1] & ~func[0];//101_010
	wire inst_slti = ~op[5] & ~op[4] & op[3] & ~op[2] & op[1] & ~op[0];//001_010
	wire inst_sltu = inst_reg & func[5] & ~func[4] & func[3] & ~func[2] & func[1] & func[0];//101_011
	wire inst_sltiu = ~op[5] & ~op[4] & op[3] & ~op[2] & op[1] & op[0];//001_011
	wire inst_mult  = inst_reg & ~func[5] & func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];//011_000
	wire inst_multu  = inst_reg & ~func[5] & func[4] & func[3] & ~func[2] & ~func[1] & func[0];//011_001
	

	wire inst_and  = inst_reg & func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & ~func[0];//100_100
	wire inst_andi = ~op[5] & ~op[4] & op[3] & op[2] & ~op[1] & ~op[0];//001_100
	wire inst_lui = ~op[5] & ~op[4] & op[3] & op[2] & op[1] & op[0];//001_111
	wire inst_nor  = inst_reg & func[5] & ~func[4] & ~func[3] & func[2] & func[1] & func[0];//100_111
	wire inst_or  = inst_reg & func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & func[0];//100_101
	wire inst_ori = ~op[5] & ~op[4] & op[3] & op[2] & ~op[1] & op[0];//001_101
	wire inst_xor  = inst_reg & func[5] & ~func[4] & ~func[3] & func[2] & func[1] & ~func[0];//100_110
	wire inst_xori = ~op[5] & ~op[4] & op[3] & op[2] & op[1] & ~op[0];//001_110
	

	wire inst_sll  = inst_reg & ~func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & ~func[0];//000_000
	wire inst_sllv  = inst_reg & ~func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & ~func[0];//000_100
	wire inst_sra  = inst_reg & ~func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & func[0];//000_011
	wire inst_srav  = inst_reg&~func[5] & ~func[4] & ~func[3] & func[2] & func[1] & func[0];//000_111
	wire inst_srl  = inst_reg & ~func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] &~func[0];//000_010
	wire inst_srlv  = inst_reg & ~func[5] & ~func[4] & ~func[3] & func[2] & func[1] &~func[0];//000_110
	

	wire inst_mfhi  = inst_reg & ~func[5] & func[4] & ~func[3] & ~func[2] & ~func[1] & ~func[0];//010_000
	wire inst_mflo  = inst_reg & ~func[5] & func[4] & ~func[3] & ~func[2] & func[1] & ~func[0];//010_010
	wire inst_mthi  = inst_reg & ~func[5] & func[4] & ~func[3] & ~func[2] & ~func[1] & func[0];//010_001
	wire inst_mtlo  = inst_reg & ~func[5] & func[4] & ~func[3] & ~func[2] & func[1] & func[0];//010_011
	wire inst_div = inst_reg & ~func[5] & func[4] & func[3] & ~func[2] & func[1] & ~func[0];
	wire inst_divu = inst_reg & ~func[5] & func[4] & func[3] & ~func[2] & func[1] & func[0];
	

	wire inst_lb =  op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & ~op[0];//100_000
	wire inst_lbu =  op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];//100_100
	wire inst_lh =  op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & op[0];//100_001
	wire inst_lhu =  op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & op[0];//100_101
	wire inst_lw =  op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];//100_011
	wire inst_sb =  op[5] &~op[4] & op[3] &~op[2] &~op[1] &~op[0];//101_000
	wire inst_sh =  op[5] &~op[4] & op[3] &~op[2] &~op[1] & op[0];//101_001
	wire inst_sw =  op[5] &~op[4] & op[3 ]&~op[2] & op[1] & op[0];//101_011
	
	// wire inst_div = inst_reg & ~func[5] & func[4] & func[3] & ~func[2] & func[1] & ~func[0];//011010
	// wire inst_divu = inst_reg & ~func[5] & func[4] & func[3] & ~func[2] & func[1] & func[0];//011011
	


	wire inst_beq = ~op[5] & ~op[4] & ~op[3] &  op[2] & ~op[1] & ~op[0];//000_100
	wire inst_bne = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] &  op[0];//000_101
	wire inst_bgez = ~op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & op[0]& rt[0]& ~rt[4];//000_001 >>
	wire inst_bgtz = ~op[5] & ~op[4] & ~op[3] & op[2] &  op[1] &  op[0];//000_111
	wire inst_blez = ~op[5] & ~op[4] & ~op[3] & op[2] &  op[1] & ~op[0];//000_110
	wire inst_bltz = ~op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & op[0]& ~rt[0]& ~rt[4];//000_001 >>??????????????
	wire inst_bgezal = ~op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & op[0]& rt[0]&rt[4];//000_001 >>
	wire inst_bltzal = ~op[5] & ~op[4] & ~op[3] & ~op[2] & ~op[1] & op[0]& ~rt[0]&rt[4];//000_001 >>
	wire inst_j = ~op[5] & ~op[4] & ~op[3] & ~op[2] &  op[1] & ~op[0];//000_010
	wire inst_jal = ~op[5] & ~op[4] & ~op[3] & ~op[2] &  op[1] &  op[0];//000_011

	wire inst_jr  = inst_reg & ~func[5] & ~func[4] &  func[3] & ~func[2] & ~func[1] & ~func[0];//001_000
	wire inst_jalr  = inst_reg & ~func[5] & ~func[4] &  func[3] & ~func[2] & ~func[1] &  func[0];//001_001
    
    wire inst_mfc0 = ~op[5] & op[4] & ~op[3] & ~op[2] & ~op[1] & ~op[0] & ~rs[4] & ~rs[3] & ~rs[2] & ~rs[1] & ~rs[0]; //010_000 rs == 00000
	wire inst_mtc0 = ~op[5] & op[4] & ~op[3] & ~op[2] & ~op[1] & ~op[0] & ~rs[4] & ~rs[3] & rs[2] & ~rs[1] & ~rs[0];  //010_000 rs == 00100
	wire inst_eret = ~op[5] & op[4] & ~op[3] & ~op[2] & ~op[1] & ~op[0] & ~func[5] & func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];//010000 func == 011000
	wire inst_syscall = inst_reg & ~func[5] & ~func[4] & func[3] & func[2] & ~func[1] & ~func[0];//001100
	wire inst_break = inst_reg & ~func[5] & ~func[4] & func[3] & func[2] & ~func[1] & func[0];//001101
	
    /*------------------------------------------------------------------------------*/

    /*-------------------- ???????????????????????????? --------------------*/

    assign id_alutype_o[2] = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_sll+inst_sllv+inst_sra+inst_srav+inst_srl+inst_srlv
                                                   +inst_beq+inst_bne+inst_bgez+inst_bgtz+inst_blez+inst_bltz+inst_bgezal+inst_bltzal
                                                   +inst_j+inst_jal+inst_jr+inst_jalr
                                                   +inst_syscall+inst_break+inst_eret
                                                   +inst_mult+inst_multu+inst_div+inst_divu);
    assign id_alutype_o[1] = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_and+inst_andi+inst_lui+inst_nor+inst_or+inst_ori+inst_xor+inst_xori  
                            +inst_mfhi+inst_mflo 
                            +inst_mthi+inst_mtlo 
                            +inst_mtc0+inst_mfc0+inst_syscall+inst_break+inst_eret+inst_mult+inst_multu+inst_div+inst_divu);
    assign id_alutype_o[0] = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_add+inst_addi+inst_addiu+inst_addu+inst_sub+inst_subu+inst_slt+inst_sltu+inst_sltiu+inst_slti   
			+inst_mfhi+inst_mflo 
			+inst_mthi+inst_mtlo 
			+inst_lb+inst_lbu+inst_lh+inst_lhu+inst_lw+inst_sb+inst_sw+inst_sh
			+inst_beq+inst_bne+inst_bgez+inst_bgtz+inst_blez+inst_bltz+inst_bgezal+inst_bltzal
            +inst_j+inst_jal+inst_jr+inst_jalr
            +inst_mtc0+inst_mfc0
            +inst_mult+inst_multu+inst_div+inst_divu);


    assign id_aluop_o[7]   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_lb+inst_lbu+inst_lh+inst_lhu+inst_lw+inst_sb+inst_sw+inst_sh +inst_j+inst_jal+inst_jr+inst_jalr +inst_mtc0+inst_mfc0+inst_syscall+inst_break+inst_eret);
    assign id_aluop_o[6]   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_sll+inst_sllv+inst_sra+inst_srav+inst_srl+inst_srlv
        +inst_beq+inst_bne+inst_bgez+inst_bgtz+inst_blez+inst_bltz+inst_bgezal+inst_bltzal
        +inst_mtc0+inst_mfc0+inst_syscall+inst_break+inst_eret);
    assign id_aluop_o[5]   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_sub+inst_subu+inst_slt+inst_sltu+inst_sltiu+inst_slti 
		+inst_ori+inst_xor+inst_xori
		+inst_div+inst_divu
		+inst_beq+inst_bne+inst_bgez+inst_bgtz+inst_blez+inst_bltz+inst_bgezal+inst_bltzal);
    assign id_aluop_o[4]   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_add+inst_addi+inst_addiu+inst_addu+inst_sub+inst_subu
		+inst_mult+inst_multu
		+inst_and+inst_andi+inst_nor+inst_or+
		inst_lb+inst_lbu+inst_lh+inst_lhu+inst_lw+inst_sb+inst_sw+inst_sh
		+inst_div+inst_divu
		+inst_beq+inst_bne+inst_bgez+inst_bgtz+inst_blez+inst_bltz+inst_bgezal+inst_bltzal);
    assign id_aluop_o[3]   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_add+inst_addi+inst_addiu+inst_addu
		+inst_and+inst_andi+inst_nor+inst_or
		+inst_mfhi+inst_mflo+inst_mthi+inst_mtlo
		+inst_sb+inst_sw+inst_sh
		+inst_beq+inst_bne+inst_bgez+inst_bgtz+inst_blez+inst_bltz+inst_bgezal+inst_bltzal
		+inst_eret);
    assign id_aluop_o[2]   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_slt+inst_sltu+inst_sltiu+inst_slti
		+inst_and+inst_andi+inst_lui+inst_nor+inst_or+inst_mult+inst_multu
		+inst_mfhi+inst_mflo+inst_mthi+inst_mtlo+inst_srl+inst_srlv
		+inst_lhu
		+inst_div+inst_divu
		+inst_blez+inst_bltz+inst_bgezal+inst_bltzal
		+inst_jalr
		+inst_syscall+inst_break);
		
    assign id_aluop_o[1]   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_addiu+inst_addu+inst_sltu+inst_sltiu
		+inst_nor+inst_or+inst_xori+inst_sra+inst_srav
		+inst_mthi+inst_mtlo
		+inst_lw+inst_lh+inst_sw
	    +inst_bgez+inst_bgtz+inst_bgezal+inst_bltzal
	    +inst_jal+inst_jr
	    +inst_mtc0);
    assign id_aluop_o[0]   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_addi+inst_addiu+inst_subu+inst_slti+inst_sltiu+inst_multu
		+inst_andi+inst_lui+inst_or+inst_xor+inst_sllv+inst_srav+inst_srlv
		+inst_mflo+inst_mtlo
		+inst_lbu+inst_lh+inst_sh
		+inst_divu
		+inst_bne+inst_bgtz+inst_bltz+inst_bltzal
		+inst_j+inst_jr
		+inst_mfc0+inst_break);


    assign id_wreg_o       = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(inst_add+inst_addi+inst_addiu+inst_addu+inst_sub+inst_subu+inst_slt+inst_sltu+inst_sltiu+inst_slti
		+inst_and+inst_andi+inst_lui+inst_nor+inst_or+inst_ori+inst_xor+inst_xori+inst_sll+inst_sllv+inst_sra+inst_srav+inst_srl+inst_srlv
		+inst_mfhi+inst_mflo+inst_mfc0
		+inst_lb+inst_lbu+inst_lh+inst_lhu+inst_lw
		+inst_bgezal+inst_bltzal
		+inst_jal+inst_jalr);

    assign rreg1 		= (cpu_rst_n == `RST_ENABLE) ? 1'b0: (inst_add+inst_addi+inst_addiu+inst_addu+inst_sub+inst_subu+inst_slt+inst_slti+inst_sltu+inst_sltiu+inst_mult+inst_multu
		+inst_and+inst_andi+inst_nor+inst_or+inst_ori+inst_xor+inst_xori+inst_sllv+inst_srav+inst_srlv
		+inst_mthi+inst_mtlo
		+inst_lb+inst_lbu+inst_lh+inst_lhu+inst_lw+inst_sb+inst_sw+inst_sh
		+inst_div+inst_divu
		+inst_beq+inst_bne+inst_bgez+inst_bgtz+inst_blez+inst_bltz+inst_bgezal+inst_bltzal
		+inst_jal+inst_jalr+inst_jr);

    assign rreg2 		= (cpu_rst_n == `RST_ENABLE) ? 1'b0: (inst_add+inst_addu+inst_sub+inst_subu+inst_slt+inst_sltu+inst_mult+inst_multu
		+inst_and+inst_nor+inst_or+inst_xor+inst_sll+inst_sllv+inst_sra+inst_srav+inst_srl+inst_srlv
		+inst_sb+inst_sw+inst_sh
		+inst_div+inst_divu
		+inst_beq+inst_bne
		+inst_mtc0);
	
	assign rtsel		= inst_addi+inst_addiu+inst_slti+inst_sltiu
		+inst_andi+inst_lui+inst_ori+inst_xori
		+inst_lb+inst_lw+inst_lbu+inst_lh+inst_lhu;
	
	assign shift		= inst_sll+inst_sra+inst_srl;
	assign immsel		= inst_addi+inst_addiu+inst_slti+inst_sltiu
		+inst_andi+inst_lui+inst_lb+inst_lbu+inst_lh+inst_lhu+inst_lw+inst_sb+inst_sw+inst_sh+inst_ori+inst_xori;
	assign sext			= inst_addi+inst_addiu+inst_slti+inst_sltiu
		+inst_lb+inst_lbu+inst_lh+inst_lhu+inst_lw+inst_sb+inst_sw+inst_sh;
	assign upper		= inst_lui;
	assign fwrd1        =  (cpu_rst_n == `RST_ENABLE) ? 2'b00:
	                       (exe2id_wreg_i == 1'b1)    ? ((exe2id_wa_i == rs) ?  2'b01 : ( (mem2id_wreg_i == 1'b1)    ? ((mem2id_wa_i == rs) ?  2'b10 : 2'b00 ): 2'b00 ) ):
	                       (mem2id_wreg_i == 1'b1)    ? ((mem2id_wa_i == rs) ?  2'b10 : 2'b00 ): 2'b00;
	assign fwrd2        =  (cpu_rst_n == `RST_ENABLE) ? 2'b00:
	                       (exe2id_wreg_i == 1'b1)    ? ((exe2id_wa_i == rt) ?  2'b01 : ( (mem2id_wreg_i == 1'b1)    ? ((mem2id_wa_i == rt) ?  2'b10 : 2'b00 ): 2'b00 ) ):
	                       (mem2id_wreg_i == 1'b1)    ? ((mem2id_wa_i == rt) ?  2'b10 : 2'b00 ): 2'b00;
	
	assign jal          = inst_jal+inst_jalr+inst_bgezal+inst_bltzal;   
	
    /*------------------------------------------------------------------------------*/


    assign ra1   = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD: rs;
    assign ra2   = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD: rt;
    
    
                                            

    assign id_wa_o   = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:(jal == 1'b1)? 5'b11111 :(rtsel == `RTSEL_ENABLE || inst_mfc0) ?	rt	: rd;
    assign id_src1_o = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:
                       (rreg1 == `READ_ENABLE ) ? ((fwrd1 == 2'b01 ) ? exe2id_wd_i:
                                                   (fwrd1 == 2'b10 ) ? mem2id_wd_i : rd1) :
                       (shift == `SHIFT_ENABLE) ? {{27{1'b0}},sa} : `ZERO_WORD;

    wire[`REG_BUS] id_imm_o  = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:(upper == `UPPER_ENABLE  ) ? (imm << 16):( (sext == `SIGNED_EXT)  ?  {{16{imm[15]}},imm}: {{16{1'b0}},imm}); 
    
    assign id_src2_o = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:
                       (immsel == `IMM_ENABLE   ) ? id_imm_o : 
                       (rreg2 == `READ_ENABLE   ) ? ((fwrd2 == 2'b01 ) ? exe2id_wd_i:
                                                    (fwrd2 == 2'b10 ) ? mem2id_wd_i : rd2) : `ZERO_WORD;       
	
	assign id_mreg_o    = (cpu_rst_n == `RST_ENABLE) ? 1'b0:inst_lb+inst_lbu+inst_lh+inst_lhu+inst_lw;
	assign id_whilo_o   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:inst_mthi+inst_mtlo+inst_mult+inst_multu+inst_div+inst_divu;
	assign id_din_o 	= (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD: 
                           (fwrd2 == 2'b01 ) ? exe2id_wd_i:
                           (fwrd2 == 2'b10 ) ? mem2id_wd_i:rd2;
	
	assign stallreq_id = (cpu_rst_n == `RST_ENABLE) ? `NOSTOP :
	                     (((exe2id_wreg_i == `WRITE_ENABLE && exe2id_wa_i == ra1 && rreg1 == `READ_ENABLE)
	                     || (exe2id_wreg_i == `WRITE_ENABLE && exe2id_wa_i == ra2 && rreg2 == `READ_ENABLE))
	                     && (exe2id_mreg == `TRUE_V)) ? `STOP :
	                     (((mem2id_wreg_i == `WRITE_ENABLE && mem2id_wa_i == ra1 && rreg1 == `READ_ENABLE)
	                     || (mem2id_wreg_i == `WRITE_ENABLE && mem2id_wa_i == ra2 && rreg2 == `READ_ENABLE))
	                     && (mem2id_mreg == `TRUE_V)) ? `STOP : `NOSTOP;
	/*------------------------------------------------------------------------------*/

	assign id_pc_o 	    = (cpu_rst_n == `RST_ENABLE) ? `PC_INIT:id_pc_i;
	assign id_in_delay_o= (cpu_rst_n == `RST_ENABLE) ? 1'b0:id_in_delay_i;
	assign next_delay_o = (cpu_rst_n == `RST_ENABLE) ? 1'b0:
	                      (inst_beq+inst_bne+inst_bgez+inst_bgtz+inst_blez+inst_bltz+inst_bgezal+inst_bltzal
                          +inst_j+inst_jal+inst_jr+inst_jalr);
    assign id_exccode_o = (cpu_rst_n == `RST_ENABLE) ? `EXC_NONE:
                          (id_exccode_i != `EXC_NONE)? id_exccode_i:
                          (inst_syscall == 1'b1)?`EXC_SYS:
                          (inst_eret == 1'b1)?`EXC_ERET:
                          (inst_break== 1'b1)?`EXC_BP:
                          (id_alutype_o == 3'b000)? `EXC_RI : `EXC_NONE;
    assign cp0_addr     = (cpu_rst_n == `RST_ENABLE) ? `REG_NOP:rd;    

  
	
	/*------------------------------------------------------------------------------*/

	assign ret_addr     = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:pc_4 + 4;
    assign equ          = (cpu_rst_n == `RST_ENABLE) ? 1'b0:(id_src1_o == id_src2_o&&(inst_bne||inst_beq))? 1'b1:1'b0;
    assign jtsel        = (cpu_rst_n == `RST_ENABLE) ? 2'b00:
                          (inst_jr == 1'b1||inst_jalr == 1'b1)? 2'b10 : 
                          (equ == 1'b1 && inst_beq == 1'b1)? 2'b11 :
                          (equ == 1'b0 && inst_bne == 1'b1)? 2'b11 :
                          (inst_j  == 1'b1 || inst_jal == 1'b1)? 2'b01 :
                          ($signed(id_src1_o) >  0 && inst_bgtz == 1'b1 )? 2'b11 :
                          ($signed(id_src1_o) <= 0 && inst_blez == 1'b1 )? 2'b11 :
                          ($signed(id_src1_o) >= 0 && inst_bgez == 1'b1)? 2'b11 :
                          ($signed(id_src1_o) <  0 && inst_bltz == 1'b1)? 2'b11 :
                          ($signed(id_src1_o) >= 0 && inst_bgezal == 1'b1)? 2'b11 :
                          ($signed(id_src1_o) <  0 && inst_bltzal == 1'b1)? 2'b11 :2'b00;
    assign jump_addr_1  = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:
                          (inst_j  == 1'b1 || inst_jal == 1'b1)?{pc_4[31:28],instr_index,2'b00}:`ZERO_WORD;
    assign jump_addr_2  = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:
                          (inst_jr  == 1'b1 || inst_jalr == 1'b1)?id_src1_o:`ZERO_WORD;
    assign jump_addr_3  = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:
                          (inst_beq  == 1'b1 || inst_bne == 1'b1)? pc_4+{{14{imm[15]}},imm, 2'b00}:
                          ($signed(id_src1_o) >  0 && inst_bgtz == 1'b1 )? pc_4+{{14{imm[15]}},imm, 2'b00}:
                          ($signed(id_src1_o) <= 0 && inst_blez == 1'b1 )? pc_4+{{14{imm[15]}},imm, 2'b00}:
                          ($signed(id_src1_o) >= 0 && inst_bgez == 1'b1)? pc_4+{{14{imm[15]}},imm, 2'b00}:
                          ($signed(id_src1_o) <  0 && inst_bltz == 1'b1)? pc_4+{{14{imm[15]}},imm, 2'b00}:
                          ($signed(id_src1_o) >= 0 && inst_bgezal == 1'b1)? pc_4+{{14{imm[15]}},imm, 2'b00} :
                          ($signed(id_src1_o) <  0 && inst_bltzal == 1'b1)? pc_4+{{14{imm[15]}},imm, 2'b00} :`ZERO_WORD;
   
   /////////////////////////////////
//   wire [`INST_ADDR_BUS] pc_next;
//   assign pc_next =(jtsel == 2'b01)?jump_addr_1:(jtsel == 2'b10)?jump_addr_2:(jtsel == 2'b11)?jump_addr_3: id_pc_i + 4 ;     
//   assign pre_flush_o = (pc_next == id_pc_i + 4) ? `FLUSH : `NOFLUSH;
	
endmodule
