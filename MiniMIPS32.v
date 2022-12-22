`include "defines.v"

module MiniMIPS32(
    input  wire                  cpu_clk_50M,
    input  wire                  cpu_rst_n,
    
    // inst_rom
    output wire [`INST_ADDR_BUS] iaddr,
    output wire                  ice,
    output wire [3:0  ]      we,
    input  wire [`INST_BUS]      inst,
    output  wire [`REG_BUS 	     ] 		din,
    output wire [`REG_BUS       ]      daddr,
	output wire 				        dce,
	input wire [`REG_BUS       ] dm,
	
	input wire [`CP0_INT_BUS   ]   int,
	
	output wire [`INST_ADDR_BUS]   debug_wb_pc,
	output wire [`REG_ADDR_BUS  ]  debug_wb_rf_wnum,
	output wire [`WORD_BUS      ]  debug_wb_rf_wdata,
	output wire [3:0]              debug_wb_rf_wen
    );

    wire [`WORD_BUS      ] pc;
    wire [`EXC_CODE_BUS  ] if_exccode_o;
    // ����IF/IDģ��������׶�IDģ��ı���?? 
    wire [`WORD_BUS      ] id_pc_i;
    
    wire[`INST_ADDR_BUS]   jump_addr_1;
    wire[`INST_ADDR_BUS]   jump_addr_2;
    wire[`INST_ADDR_BUS]   jump_addr_3;
    wire[1:0]              jtsel;
    
    // ��������׶�IDģ����ͨ�üĴ���Regfileģ��ı���? 
    wire 				   re1;
    wire [`REG_ADDR_BUS  ] ra1;
    wire [`REG_BUS       ] rd1;
    wire 				   re2;
    wire [`REG_ADDR_BUS  ] ra2;
    wire [`REG_BUS       ] rd2;
    
    wire [`ALUOP_BUS     ] id_aluop_o;
    wire [`ALUTYPE_BUS   ] id_alutype_o;
    wire [`REG_BUS 	     ] id_src1_o;
    wire [`REG_BUS 	     ] id_src2_o;
    wire 				   id_wreg_o;
    wire [`REG_ADDR_BUS  ] id_wa_o;
	
	wire                   id_whilo_o;
	wire                   id_mreg_o;
	wire [`REG_BUS      ]  id_din_o;
	wire [`INST_ADDR_BUS]   ret_addr;
	
	wire [`REG_ADDR_BUS ]  id_cp0_addr;
    wire [`INST_ADDR_BUS]  id_pc;
    wire 				   id_in_delay;
    wire 					id_next_delay;
    wire [`EXC_CODE_BUS]   id_exccode_i;
    wire [`EXC_CODE_BUS]   id_exccode_o;
	
    wire [`ALUOP_BUS     ] exe_aluop_i;
    wire [`ALUTYPE_BUS   ] exe_alutype_i;
    wire [`REG_BUS 	     ] exe_src1_i;
    wire [`REG_BUS 	     ] exe_src2_i;
    wire 				   exe_wreg_i;
    wire [`REG_ADDR_BUS  ] exe_wa_i;
	
	wire                   exe_whilo_i;
	wire                   exe_mreg_i;
	wire [`REG_BUS      ]  exe_din_i;


    wire [`REG_BUS 	     ] exe_hi_i;
    wire [`REG_BUS 	     ] exe_lo_i;
    
    wire [`ALUOP_BUS     ] exe_aluop_o;
    wire 				   exe_wreg_o;
    wire [`REG_ADDR_BUS  ] exe_wa_o;
    wire [`REG_BUS 	     ] exe_wd_o;
    wire [`INST_ADDR_BUS]  exe_ret_addr;
	
	wire [`DOUBLE_REG_BUS] 	exe_hilo_o;
	wire  					exe_whilo_o;
	wire  					exe_mreg_o;
	wire [`REG_BUS      ]   exe_din_o;
	
	wire [`REG_BUS 		] 	exe2id_wd_o;
	wire [`REG_ADDR_BUS ] 	exe2id_wa_o;
	wire 					exe2id_wreg_o;
	
    wire [`REG_ADDR_BUS ]	  exe_cp0_addr;
    wire [`INST_ADDR_BUS]      exe_pc;
    wire 			          exe_in_delay;
    wire 				      exe_next_delay;
    wire [`EXC_CODE_BUS]	      exe_exccode_i;
    
    wire [`INST_ADDR_BUS]   exe_pc_o;
    wire                    exe_in_delay_o;
    wire [`EXC_CODE_BUS]    exe_exccode_o;
    wire                    exe_cp0_re;
    wire [`REG_ADDR_BUS]    exe_cp0_raddr;
    wire                    exe_cp0_we;
    wire [`REG_ADDR_BUS]   exe_cp0_waddr;
    wire [`REG_BUS]         exe_cp0_wdata;
	
	
    wire [`ALUOP_BUS     ] mem_aluop_i;
    wire 				   mem_wreg_i;
    wire [`REG_ADDR_BUS  ] mem_wa_i;
    wire [`REG_BUS 	     ] mem_wd_i;
	
	wire  [`DOUBLE_REG_BUS] mem_hilo_i;
	wire                    mem_mreg_i;
	wire                    mem_whilo_i;
	wire  [`REG_BUS 	  ] mem_din_i;

    wire [`ALUOP_BUS     ] mem_aluop_o;
    wire 				   mem_wreg_o;
    wire [`REG_ADDR_BUS  ] mem_wa_o;
    wire [`REG_BUS 	     ] mem_dreg_o;
	
	wire                         mem_whilo_o;
	wire [`DOUBLE_REG_BUS]       mem_hilo_o;
	wire 				        mem_mreg_o;
	
	wire [`REG_BUS       ]       mem2id_wd_o;
	wire                         mem2id_wreg_o;
	wire [`REG_ADDR_BUS  ]       mem2id_wa_o;
	
	wire [`INST_ADDR_BUS]  mem_pc;
	wire                   mem_in_delay;
	wire [`EXC_CODE_BUS ]  mem_exccode_i;
	wire                   mem_cp0_we;
	wire [`REG_ADDR_BUS]   mem_cp0_waddr;
	wire [`REG_BUS     ]   mem_cp0_wdata;

    wire [`INST_ADDR_BUS]  mem_pc_o;
	wire                   mem_in_delay_o;
	wire [`EXC_CODE_BUS ]  mem_exccode_o;
	wire                   mem_cp0_we_o;
	wire [`REG_ADDR_BUS]   mem_cp0_waddr_o;
	wire [`REG_BUS     ]   mem_cp0_wdata_o;
	
	wire [`BSEL_BUS 		]   dre;
	
	wire [`ALUOP_BUS     ] wb_aluop_i;
    wire 				   wb_wreg_i;
    wire [`REG_ADDR_BUS  ] wb_wa_i;
    wire [`REG_BUS       ] wb_dreg_i;
    wire [`INST_ADDR_BUS]  wb_pc_i;
	
	wire                     	wb_mreg_i;
	wire                     	wb_whilo_i;
	wire 	[`DOUBLE_REG_BUS]   wb_hilo_i;
	wire 	[`BSEL_BUS 		]   wb_dre_i;

    wire 				   wb_wreg_o;
    wire [`REG_ADDR_BUS  ] wb_wa_o;
    wire [`REG_BUS       ] wb_wd_o;
	wire                   wb_whilo_o;
	wire [`DOUBLE_REG_BUS] wb_hilo_o;
	wire [`INST_ADDR_BUS]  wb_pc_o;
	
	wire                   wb_cp0_we;
	wire [`REG_ADDR_BUS]   wb_cp0_waddr;
	wire [`REG_BUS     ]   wb_cp0_wdata;
	
	wire                   wb_cp0_we_o;
	wire [`REG_ADDR_BUS]   wb_cp0_waddr_o;
	wire [`REG_BUS     ]   wb_cp0_wdata_o;
	
	wire                   stallreq_id;
	wire                   stallreq_exe;
	wire   [`STALL_BUS ]   stall;
	
	wire                    flush;  
    wire                    flush_im;
    wire [`REG_BUS]         cp0_excaddr;
    
    wire [`REG_BUS]         data_o;
    wire [`REG_BUS]         status_o;
    wire [`REG_BUS]         cause_o;
    wire [`CP0_INT_BUS]     cp0_int_i;
    wire [`INST_ADDR_BUS ]  cp0_BadVaddr;
    
    wire [`INST_ADDR_BUS]    if_pc_next;
    wire                     pre_flush;
    
    assign cp0_int_i = (cpu_rst_n == `RST_ENABLE) ? 6'b000000 : int;

    // for test
    assign debug_wb_pc = (cpu_rst_n == `RST_ENABLE) ? `PC_INIT : wb_pc_o;
    assign debug_wb_rf_wnum = (cpu_rst_n == `RST_ENABLE) ? 5'b00000 : wb_wa_o;
	assign debug_wb_rf_wdata = (cpu_rst_n == `RST_ENABLE) ? 32'h00000000 : wb_wd_o;
	assign debug_wb_rf_wen = (cpu_rst_n == `RST_ENABLE) ? 4'b0000 : {4{wb_wreg_o}};
	
    if_stage if_stage0(.cpu_clk_50M(cpu_clk_50M), .cpu_rst_n(cpu_rst_n),
        .jump_addr_1(jump_addr_1),.jump_addr_2(jump_addr_2),.jump_addr_3(jump_addr_3),.jtsel(jtsel),.stall(stall),
        .pc(pc), .ice(ice), .iaddr(iaddr),.if_exccode_o(if_exccode_o),
        .pre_flush_i(pre_flush),
        
        .flush(flush),.cp0_excaddr(cp0_excaddr),
        .pc_next(if_pc_next)
    );
        
    ifid_reg ifid_reg0(
        .cpu_clk_50M(cpu_clk_50M), 
        .cpu_rst_n(cpu_rst_n),
        .if_pc(pc), 
        .id_pc(id_pc_i),
        .stall(stall),
        .if_exccode(if_exccode_o),
        .id_exccode(id_exccode_i),
        .flush(flush)
    );

    id_stage id_stage0(.id_pc_i(id_pc_i),.cpu_rst_n(cpu_rst_n),
        .id_inst_i(inst),
        .rd1(rd1), .rd2(rd2),
        .rreg1(re1), .rreg2(re2), 	  
        .ra1(ra1), .ra2(ra2), 
        .id_aluop_o(id_aluop_o), .id_alutype_o(id_alutype_o),
        .id_src1_o(id_src1_o), .id_src2_o(id_src2_o),
        .id_wa_o(id_wa_o), .id_wreg_o(id_wreg_o),
		.id_mreg_o(id_mreg_o),.id_whilo_o(id_whilo_o),
		.id_din_o(id_din_o),
		.exe2id_mreg(exe_mreg_o), .mem2id_mreg(mem_mreg_o),
		.stallreq_id(stallreq_id),
		.exe2id_wd_i(exe2id_wd_o),.exe2id_wa_i(exe2id_wa_o),.exe2id_wreg_i(exe2id_wreg_o),
		.mem2id_wd_i(mem2id_wd_o),.mem2id_wreg_i(mem2id_wreg_o),.mem2id_wa_i(mem2id_wa_o),
		.jump_addr_1(jump_addr_1),.jump_addr_2(jump_addr_2),.jump_addr_3(jump_addr_3),.jtsel(jtsel),
		.ret_addr(ret_addr),
		
		.id_in_delay_i(exe_next_delay),.flush_im(flush_im),
		.id_exccode_o(id_exccode_o),.id_exccode_i(id_exccode_i),.id_pc_o(id_pc),.next_delay_o(id_next_delay),
		.cp0_addr(id_cp0_addr),.id_in_delay_o(id_in_delay),
		.pre_flush_o(pre_flush)
    );
    
    regfile regfile0(.cpu_clk_50M(cpu_clk_50M), .cpu_rst_n(cpu_rst_n),
        .we(wb_wreg_o), .wa(wb_wa_o), .wd(wb_wd_o),
        .re1(re1), .ra1(ra1), .rd1(rd1),
        .re2(re2), .ra2(ra2), .rd2(rd2)
    );
    
    idexe_reg idexe_reg0(.cpu_clk_50M(cpu_clk_50M), .cpu_rst_n(cpu_rst_n), 
        .id_alutype(id_alutype_o), .id_aluop(id_aluop_o),
        .id_src1(id_src1_o), .id_src2(id_src2_o),
        .id_wa(id_wa_o), .id_wreg(id_wreg_o),
		.id_mreg(id_mreg_o),.id_whilo(id_whilo_o),
		.id_din(id_din_o),.id_ret_addr(ret_addr),
		
        .exe_alutype(exe_alutype_i), .exe_aluop(exe_aluop_i),
        .exe_src1(exe_src1_i), .exe_src2(exe_src2_i), 
        .exe_wa(exe_wa_i), .exe_wreg(exe_wreg_i),
		.exe_mreg(exe_mreg_i),.exe_whilo(exe_whilo_i),
		.exe_din(exe_din_i),
        .stall(stall),
		.exe_ret_addr(exe_ret_addr),
		
		.id_exccode(id_exccode_o),.id_pc(id_pc),.next_delay_i(id_next_delay),
		.id_cp0_addr(id_cp0_addr),.id_in_delay(id_in_delay),
		.flush(flush),
		.exe_exccode(exe_exccode_i),.exe_pc(exe_pc),.next_delay_o(exe_next_delay),
		.exe_cp0_addr(exe_cp0_addr),.exe_in_delay(exe_in_delay)
    );
    
    exe_stage exe_stage0(
        .cpu_rst_n(cpu_rst_n), .cpu_clk_50M(cpu_clk_50M),
        .exe_alutype_i(exe_alutype_i), .exe_aluop_i(exe_aluop_i),
        .exe_src1_i(exe_src1_i), .exe_src2_i(exe_src2_i),
        .exe_wa_i(exe_wa_i), .exe_wreg_i(exe_wreg_i),
		.exe_mreg_i(exe_mreg_i),.exe_whilo_i(exe_whilo_i),
		.exe_din_i(exe_din_i),.exe_hi_i(exe_hi_i),.exe_lo_i(exe_lo_i),
		.ret_addr(exe_ret_addr),
		
        .exe_aluop_o(exe_aluop_o),
        .exe_wa_o(exe_wa_o), .exe_wreg_o(exe_wreg_o), .exe_wd_o(exe_wd_o),
		.exe_hilo_o(exe_hilo_o),.exe_whilo_o(exe_whilo_o),.exe_mreg_o(exe_mreg_o),
		.exe_din_o(exe_din_o),
		
		.mem2exe_whilo(mem_whilo_o), .mem2exe_hilo(mem_hilo_o),
		.wb2exe_whilo(wb_whilo_o), .wb2exe_hilo(wb_hilo_o),
		
		.stallreq_exe(stallreq_exe),
		.exe2id_wd_o(exe2id_wd_o),.exe2id_wa_o(exe2id_wa_o),.exe2id_wreg_o(exe2id_wreg_o),
		
		.mem2exe_cp0_we(mem_cp0_we_o),.mem2exe_cp0_wa(mem_cp0_waddr_o),.mem2exe_cp0_wd(mem_cp0_wdata_o),
		.wb2exe_cp0_we(wb_cp0_we_o),.wb2exe_cp0_wa(wb_cp0_waddr_o),.wb2exe_cp0_wd(wb_cp0_wdata_o),
		
		.exe_exccode_i(exe_exccode_i),.exe_pc_i(exe_pc),.cp0_data_i(data_o),
		.exe_cp0_addr_i(exe_cp0_addr),.exe_in_delay_i(exe_in_delay),
		
		.exe_exccode_o(exe_exccode_o),.exe_pc_o(exe_pc_o),.exe_in_delay_o(exe_in_delay_o),
		.cp0_re_o(exe_cp0_re),.cp0_raddr_o(exe_cp0_raddr),.cp0_we_o(exe_cp0_we),
		.cp0_waddr_o(exe_cp0_waddr),.cp0_wdata_o(exe_cp0_wdata)
    );
	
	hilo hilo0(
		.cpu_clk_50M(cpu_clk_50M), .cpu_rst_n(cpu_rst_n), 
		.hilo(wb_hilo_o),.we(wb_whilo_o),
		.hi_o(exe_hi_i),.lo_o(exe_lo_i)
    );
        
    exemem_reg exemem_reg0(.cpu_clk_50M(cpu_clk_50M), .cpu_rst_n(cpu_rst_n),
        .exe_aluop(exe_aluop_o),		
        .exe_wa(exe_wa_o), .exe_wreg(exe_wreg_o), .exe_wd(exe_wd_o),
		.exe_hilo(exe_hilo_o),.exe_whilo(exe_whilo_o),.exe_mreg(exe_mreg_o),
		.exe_din(exe_din_o),
		
        .mem_aluop(mem_aluop_i),
        .mem_wa(mem_wa_i), .mem_wreg(mem_wreg_i), .mem_wd(mem_wd_i),
		.mem_hilo(mem_hilo_i),.mem_mreg(mem_mreg_i),.mem_whilo(mem_whilo_i),
		.mem_din(mem_din_i),
		
		.stall(stall),
		
		.exe_exccode(exe_exccode_o),.exe_pc(exe_pc_o),.exe_in_delay(exe_in_delay),
		.exe_cp0_we(exe_cp0_we),.exe_cp0_waddr(exe_cp0_waddr),.exe_cp0_wdata(exe_cp0_wdata),
		.flush(flush),
		.mem_exccode(mem_exccode_i),.mem_pc(mem_pc),.mem_in_delay(mem_in_delay),
		.mem_cp0_we(mem_cp0_we),.mem_cp0_waddr(mem_cp0_waddr),.mem_cp0_wdata(mem_cp0_wdata)
    );

    mem_stage mem_stage0(.mem_aluop_i(mem_aluop_i), .cpu_rst_n(cpu_rst_n),
        .mem_wa_i(mem_wa_i), .mem_wreg_i(mem_wreg_i), .mem_wd_i(mem_wd_i),
		.mem_whilo_i(mem_whilo_i),.mem_hilo_i(mem_hilo_i),.mem_mreg_i(mem_mreg_i),
		.mem_din_i(mem_din_i),
        .mem_wa_o(mem_wa_o), .mem_wreg_o(mem_wreg_o), .mem_dreg_o(mem_dreg_o), .mem_aluop_o(mem_aluop_o),
		.mem_whilo_o(mem_whilo_o),.mem_hilo_o(mem_hilo_o),.mem_mreg_o(mem_mreg_o),
		.we(we),.din(din),.daddr(daddr),.dce(dce),.dre(dre),
		.cp0_badvaddr(cp0_BadVaddr),
		
		.mem2id_wd_o(mem2id_wd_o),.mem2id_wreg_o(mem2id_wreg_o),.mem2id_wa_o(mem2id_wa_o),
		
		.mem_exccode_i(mem_exccode_i),.mem_pc_i(mem_pc),.mem_in_delay_i(mem_in_delay),
		.cp0_we_i(mem_cp0_we),.cp0_waddr_i(mem_cp0_waddr),.cp0_wdata_i(mem_cp0_wdata),
		.wb2mem_cp0_we(wb_cp0_we_o),.wb2mem_cp0_wa(wb_cp0_waddr_o),.wb2mem_cp0_wd(wb_cp0_wdata_o),
		.cp0_status(status_o),.cp0_cause(cause_o),		
		.mem_exccode_o(mem_exccode_o),.mem_pc_o(mem_pc_o),.mem_in_delay_o(mem_in_delay_o),
		.cp0_we_o(mem_cp0_we_o),.cp0_waddr_o(mem_cp0_waddr_o),.cp0_wdata_o(mem_cp0_wdata_o)
    );
    	
    memwb_reg memwb_reg0(.cpu_clk_50M(cpu_clk_50M), .cpu_rst_n(cpu_rst_n),
        .mem_wa(mem_wa_o), .mem_wreg(mem_wreg_o), .mem_dreg(mem_dreg_o),
		.mem_whilo(mem_whilo_o),.mem_hilo(mem_hilo_o),.mem_dre(dre),
		.mem_mreg(mem_mreg_o), .mem_aluop(mem_aluop_o), .mem_pc(mem_pc_o),
        .wb_wa(wb_wa_i),.wb_wreg(wb_wreg_i), .wb_dreg(wb_dreg_i),
		.wb_mreg(wb_mreg_i),.wb_whilo(wb_whilo_i),.wb_hilo(wb_hilo_i),
		.wb_dre(wb_dre_i), .wb_aluop(wb_aluop_i), .wb_pc(wb_pc_i),
		
		.mem_cp0_we(mem_cp0_we),.mem_cp0_waddr(mem_cp0_waddr),.mem_cp0_wdata(mem_cp0_wdata),
		.flush(flush),
		.wb_cp0_we(wb_cp0_we),.wb_cp0_waddr(wb_cp0_waddr),.wb_cp0_wdata(wb_cp0_wdata)
    );

    wb_stage wb_stage0(
        .cpu_rst_n(cpu_rst_n),
        .wb_wa_i(wb_wa_i), .wb_wreg_i(wb_wreg_i), .wb_dreg_i(wb_dreg_i), .wb_aluop_i(wb_aluop_i),
		.wb_mreg_i(wb_mreg_i),.wb_whilo_i(wb_whilo_i),.wb_hilo_i(wb_hilo_i), .wb_pc_i(wb_pc_i),
		.dm(dm),.wb_dre_i(wb_dre_i),
        .wb_wa_o(wb_wa_o), .wb_wreg_o(wb_wreg_o), .wb_wd_o(wb_wd_o),
		.wb_whilo_o(wb_whilo_o),.wb_hilo_o(wb_hilo_o), .wb_pc_o(wb_pc_o),
		
		.cp0_we_i(wb_cp0_we),.cp0_waddr_i(wb_cp0_waddr),.cp0_wdata_i(wb_cp0_wdata),
		.cp0_we_o(wb_cp0_we_o),.cp0_waddr_o(wb_cp0_waddr_o),.cp0_wdata_o(wb_cp0_wdata_o)
    );

    SCU scu0(
        .cpu_rst_n(cpu_rst_n),
        .stallreq_id(stallreq_id),
        .stallreq_exe(stallreq_exe),
        .stall(stall)
    );
    
    cp0 cp0(
        .cpu_clk_50M(cpu_clk_50M),.cpu_rst_n(cpu_rst_n),
        .exccode_i(mem_exccode_o),.pc_i(mem_pc_o), .in_delay_i(mem_in_delay_o),
        .re(exe_cp0_re),.raddr(exe_cp0_raddr),.we(mem_cp0_we_o),.waddr(mem_cp0_waddr_o),.wdata(mem_cp0_wdata_o),
        .int_i( cp0_int_i), .pc_next_i(if_pc_next),
        .badvaddr_i(cp0_BadVaddr),
        .flush_im(flush_im),.cp0_excaddr(cp0_excaddr),.flush(flush),
        .data_o(data_o),.status_o(status_o),.cause_o(cause_o)
    );

endmodule
