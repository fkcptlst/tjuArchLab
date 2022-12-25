`include "defines.v"

module mem_stage (
    input  wire 				cpu_rst_n,
    // 从执行阶段获得的信息
    input  wire [`ALUOP_BUS     ]       mem_aluop_i,
    input  wire [`REG_ADDR_BUS  ]       mem_wa_i,
    input  wire                         mem_wreg_i,
    input  wire [`REG_BUS       ]       mem_wd_i,
	input  wire                         mem_whilo_i,
	input  wire [`DOUBLE_REG_BUS]       mem_hilo_i,
	input  wire 				        mem_mreg_i,
	input  wire [`REG_BUS 	  ] 		mem_din_i,
    
    // 送至写回阶段的信息
    output wire [`REG_ADDR_BUS  ]       mem_wa_o,
    output wire [`ALUOP_BUS     ]       mem_aluop_o,
    output wire                         mem_wreg_o,
    output wire [`REG_BUS       ]       mem_dreg_o,
	output wire                         mem_whilo_o,
	output wire [`DOUBLE_REG_BUS]       mem_hilo_o,
	output wire 				        mem_mreg_o,
	output wire [`BSEL_BUS 		]       dre,
	
	output wire [`REG_BUS       ]       mem2id_wd_o,
	output wire                         mem2id_wreg_o,
	output wire [`REG_ADDR_BUS  ]       mem2id_wa_o,
	
	input  wire                   cp0_we_i,
	input  wire [`REG_ADDR_BUS]   cp0_waddr_i,
	input  wire [`REG_BUS     ]   cp0_wdata_i,
	input  wire                   wb2mem_cp0_we,
	input  wire [`REG_ADDR_BUS]   wb2mem_cp0_wa,
	input  wire [`REG_BUS     ]   wb2mem_cp0_wd,
	
	input  wire [`INST_ADDR_BUS]  mem_pc_i,
	input  wire                   mem_in_delay_i,
	input  wire [`EXC_CODE_BUS ]  mem_exccode_i,

	input  wire [`WORD_BUS     ]  cp0_status,
	input  wire [`WORD_BUS     ]  cp0_cause,
	
	output wire                   cp0_we_o,
	output wire [`REG_ADDR_BUS]   cp0_waddr_o,
	output wire [`REG_BUS     ]   cp0_wdata_o,
	
	output wire [`INST_ADDR_BUS]  mem_pc_o,
	output wire                   mem_in_delay_o,
	output wire [`EXC_CODE_BUS ]  mem_exccode_o,
	
	input wire        data_req_i     ,
    input wire        data_wr_i      ,
    input wire [31:0] data_addr_i    ,
    input wire [31:0] dm_i           ,
    input wire         stallreq_mem_i,
    
    output wire        data_req_o     ,
    output wire        data_wr_o      ,
    output wire [1 :0] data_size_o    ,
    output wire [31:0] data_addr_o    ,
    output wire [31:0] dm_o           ,
    output wire [31:0] data_wdata_o   ,
    output wire         stallreq_mem_o
    );
	wire [3:0  ]                 we;
	wire [`REG_BUS 	    ] 		din;
//	wire [`REG_BUS       ]       daddr;
    
    assign stallreq_mem_o = (mem_exccode_o == `EXC_NONE) ? stallreq_mem_i : 1'b0;
    assign data_req_o = (mem_exccode_o == `EXC_NONE) ? data_req_i : 1'b0;
    assign data_wr_o = (mem_exccode_o == `EXC_NONE) ? data_wr_i : 1'b0;
    assign data_size_o = (data_wr_i == 1'b0) ? ((dre == 4'b1111) ? 2'b10 : (dre == 4'b1100 || dre == 4'b0011) ? 2'b01 : 2'b00) : 
                                               ((we == 4'b1111) ? 2'b10 : (we == 4'b1100 || we == 4'b0011) ? 2'b01 : 2'b00);
    assign data_addr_o = (mem_exccode_o == `EXC_NONE) ? data_addr_i : `ZERO_WORD;
    assign dm_o = dm_i;
    assign data_wdata_o = (mem_exccode_o == `EXC_NONE) ? din : `ZERO_WORD;

    // 如果当前不是访存指令，则只需要把从执行阶段获得的信息直接输出
    assign mem_wa_o     = (cpu_rst_n == `RST_ENABLE) ? 5'b0:mem_wa_i;
    assign mem_wreg_o   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:mem_wreg_i;
    assign mem_dreg_o   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:mem_wd_i;
	assign mem_whilo_o 	= (cpu_rst_n == `RST_ENABLE) ? 1'b0:mem_whilo_i;
	assign mem_hilo_o 	= (cpu_rst_n == `RST_ENABLE) ? 64'b0:mem_hilo_i;
//	assign daddr		= (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD : (32'h1fffffff&mem_wd_i);
	assign mem_mreg_o	= (cpu_rst_n == `RST_ENABLE) ? 1'b0:mem_mreg_i;
	
	//mem前推给id
	assign mem2id_wd_o  = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD:mem_wd_i;
	assign mem2id_wreg_o   = (cpu_rst_n == `RST_ENABLE) ? 1'b0:mem_wreg_i;
	assign mem2id_wa_o     = (cpu_rst_n == `RST_ENABLE) ? 5'b0:mem_wa_i;
	
    assign mem_aluop_o = (cpu_rst_n == `RST_ENABLE) ? 8'b0 : mem_aluop_i;
	
	assign dre[3] = (cpu_rst_n == `RST_ENABLE) ? 1'b0 :
	                ((( (mem_aluop_i == `MINIMIPS32_LBU)|(mem_aluop_i == `MINIMIPS32_LB) )&(data_addr_i[1:0] == 2'b00))	
		            |(( (mem_aluop_i == `MINIMIPS32_LHU)|(mem_aluop_i == `MINIMIPS32_LH) )&(data_addr_i[1:0] == 2'b00))
		            |(mem_aluop_i == `MINIMIPS32_LW));
		
	assign dre[2] = (cpu_rst_n == `RST_ENABLE) ? 1'b0 :
	                ((( (mem_aluop_i == `MINIMIPS32_LBU)|(mem_aluop_i == `MINIMIPS32_LB) )&(data_addr_i[1:0] == 2'b01))	
		            |(( (mem_aluop_i == `MINIMIPS32_LHU)|(mem_aluop_i == `MINIMIPS32_LH) )&(data_addr_i[1:0] == 2'b00))
		            |(mem_aluop_i == `MINIMIPS32_LW));
		
	assign dre[1] = (cpu_rst_n == `RST_ENABLE) ? 1'b0 :
	                ((( (mem_aluop_i == `MINIMIPS32_LBU)|(mem_aluop_i == `MINIMIPS32_LB) )&(data_addr_i[1:0] == 2'b10))	
		            |(( (mem_aluop_i == `MINIMIPS32_LHU)|(mem_aluop_i == `MINIMIPS32_LH) )&(data_addr_i[1:0] == 2'b10))
		            |(mem_aluop_i == `MINIMIPS32_LW));
		
	assign dre[0] = (cpu_rst_n == `RST_ENABLE) ? 1'b0 :
	                ((( (mem_aluop_i == `MINIMIPS32_LBU)|(mem_aluop_i == `MINIMIPS32_LB) )&(data_addr_i[1:0] == 2'b11))	
		            |(( (mem_aluop_i == `MINIMIPS32_LHU)|(mem_aluop_i == `MINIMIPS32_LH) )&(data_addr_i[1:0] == 2'b10))
		            |(mem_aluop_i == `MINIMIPS32_LW));
		
	
	assign we[3] = (cpu_rst_n == `RST_ENABLE) ? 1'b0 :
	               (((mem_aluop_i == `MINIMIPS32_SB)&(data_addr_i[1:0] == 2'b00))
	               |((mem_aluop_i == `MINIMIPS32_SH)&(data_addr_i[1:0] == 2'b00))
		           |(mem_aluop_i == `MINIMIPS32_SW));
		
	assign we[2] = (cpu_rst_n == `RST_ENABLE) ? 1'b0:
	               (((mem_aluop_i == `MINIMIPS32_SB)&(data_addr_i[1:0] == 2'b01))	
		           |((mem_aluop_i == `MINIMIPS32_SH)&(data_addr_i[1:0] == 2'b00))
		           |(mem_aluop_i == `MINIMIPS32_SW));
		
	assign we[1] = (cpu_rst_n == `RST_ENABLE) ? 1'b0:
	               (((mem_aluop_i == `MINIMIPS32_SB)&(data_addr_i[1:0] == 2'b10))	
		           |((mem_aluop_i == `MINIMIPS32_SH)&(data_addr_i[1:0] == 2'b10))
		           |(mem_aluop_i == `MINIMIPS32_SW));
		
	assign we[0] = (cpu_rst_n == `RST_ENABLE) ? 1'b0:
	               (((mem_aluop_i == `MINIMIPS32_SB)&(data_addr_i[1:0] == 2'b11))	
		           |((mem_aluop_i == `MINIMIPS32_SH)&(data_addr_i[1:0] == 2'b10))
		           |(mem_aluop_i == `MINIMIPS32_SW));
	
	wire[`WORD_BUS] din_reverse = mem_din_i;
//	wire[`WORD_BUS] din_reverse = {mem_din_i[7:0],mem_din_i[15:8],mem_din_i[23:16],mem_din_i[31:24]};
	wire[`WORD_BUS] din_reverse_h = {mem_din_i[15:0],mem_din_i[15:0]};
	wire[`WORD_BUS] din_byte = {mem_din_i[7:0],mem_din_i[7:0],mem_din_i[7:0],mem_din_i[7:0]};
	assign din 	= (cpu_rst_n == `RST_ENABLE) ? 32'b0:
	              (we == 4'b1111)? din_reverse:
	              (we == 4'b1100) ? din_reverse_h :
	              (we == 4'b0011) ? din_reverse_h :
	              (we == 4'b1000)? din_byte:
	              (we == 4'b0100)? din_byte:
	              (we == 4'b0010)? din_byte:
	              (we == 4'b0001)? din_byte:`ZERO_WORD;
	              
	assign cp0_we_o = (cpu_rst_n == `RST_ENABLE) ? 1'b0 : cp0_we_i;
	assign cp0_waddr_o = (cpu_rst_n == `RST_ENABLE) ? 5'b00000 : 
	                     (mem_exccode_i == `EXC_ADEL)? 5'b01000 : 
	                     (mem_exccode_i != `EXC_NONE) ? cp0_waddr_i :
	                     (mem_exccode_o == `EXC_ADEL || mem_exccode_o == `EXC_ADES)? 5'b01000 : 
	                     (mem_aluop_i == `MINIMIPS32_MTC0) ? mem_wa_i : 5'b00000 ;
	assign cp0_wdata_o = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD : 
	                     (mem_exccode_i == `EXC_ADEL) ? mem_pc_i :
	                     (mem_exccode_i != `EXC_NONE)? cp0_wdata_i :
	                     (mem_exccode_o == `EXC_ADEL || mem_exccode_o == `EXC_ADES || mem_aluop_i == `MINIMIPS32_MTC0)? mem_wd_i : `ZERO_WORD;
	
	wire [`WORD_BUS] status;
	wire [`WORD_BUS] cause;
	
	assign status = (wb2mem_cp0_we == `WRITE_ENABLE && wb2mem_cp0_wa == `CP0_STATUS) ? wb2mem_cp0_wd : cp0_status;
	assign cause = (wb2mem_cp0_we == `WRITE_ENABLE && wb2mem_cp0_wa == `CP0_CAUSE) ? wb2mem_cp0_wd : cp0_cause;
	
	assign mem_in_delay_o = (cpu_rst_n == `RST_ENABLE) ? 1'b0 : mem_in_delay_i;
	assign mem_exccode_o = (cpu_rst_n == `RST_ENABLE) ? `EXC_NONE : 
	                     (mem_exccode_i != `EXC_NONE) ? mem_exccode_i:
	                     ((status[15 : 8] & cause[15 : 8]) != 8'h00 && status[1] == 1'b0 && status[0] == 1'b1) ? `EXC_INT :
	                     ((mem_aluop_i == `MINIMIPS32_LH || mem_aluop_i == `MINIMIPS32_LHU) && data_addr_i[0] != 1'b0) ? `EXC_ADEL:
	                     ( mem_aluop_i == `MINIMIPS32_LW  && data_addr_i[1:0] != 2'b00 ) ? `EXC_ADEL:
	                     ( mem_aluop_i == `MINIMIPS32_SW  && data_addr_i[1:0] != 2'b00 ) ? `EXC_ADES:
	                     ( mem_aluop_i == `MINIMIPS32_SH  && data_addr_i[0] != 1'b0 )  ? `EXC_ADES:
	                     mem_exccode_i;
	assign mem_pc_o     = (cpu_rst_n == `RST_ENABLE) ? `PC_INIT : mem_pc_i;

endmodule
