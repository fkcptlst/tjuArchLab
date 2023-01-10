`include "defines.v"

module memwb_reg (
    input  wire                     cpu_clk_50M,
	input  wire                     cpu_rst_n,

	// 来自访存阶段的信息
	input  wire [`REG_ADDR_BUS  ]   mem_wa,
	input  wire                     mem_wreg,
	input  wire [`REG_BUS       ] 	mem_dreg,
	input  wire                     mem_mreg,
	input  wire                     mem_whilo,
	input  wire [`DOUBLE_REG_BUS]   mem_hilo,
	input  wire [`BSEL_BUS 		]   mem_dre,
	input  wire [`ALUOP_BUS     ]  mem_aluop,
	input  wire [`INST_ADDR_BUS]   mem_pc,

	// 送至写回阶段的信息 
	output reg  [`REG_ADDR_BUS  ]   wb_wa,
	output reg                      wb_wreg,
	output reg  [`REG_BUS       ]   wb_dreg,
	output reg                     	wb_mreg,
	output reg                     	wb_whilo,
	output reg 	[`DOUBLE_REG_BUS]   wb_hilo,
	output reg 	[`BSEL_BUS 		]   wb_dre,
	output reg [`ALUOP_BUS     ]    wb_aluop,
	output reg [`INST_ADDR_BUS ]    wb_pc,
	
	input  wire                   mem_cp0_we,
	input  wire [`REG_ADDR_BUS]   mem_cp0_waddr,
	input  wire [`REG_BUS     ]   mem_cp0_wdata,
	
	input  wire                   flush,
	
	output reg                    wb_cp0_we,
	output reg  [`REG_ADDR_BUS]   wb_cp0_waddr,
	output reg  [`REG_BUS     ]   wb_cp0_wdata
    );

    always @(posedge cpu_clk_50M) begin
		// 复位的时候将送至写回阶段的信息清0
		if (cpu_rst_n == `RST_ENABLE || flush) begin
			wb_wa       <= `REG_NOP;
			wb_wreg     <= `WRITE_DISABLE;
			wb_dreg     <= `ZERO_WORD;
			wb_mreg     <= 1'b0;
			wb_whilo    <= 1'b0;
			wb_hilo     <= 64'b0;
			wb_dre      <= 4'b0;
			wb_aluop    <= `MINIMIPS32_SLL;
			wb_pc       <= `PC_INIT;
			
			wb_cp0_we   <= `FALSE_V;
			wb_cp0_waddr<= `ZERO_WORD;
			wb_cp0_wdata<= `ZERO_WORD;
		end
		// 将来自访存阶段的信息寄存并送至写回阶段
		else begin
		    wb_aluop    <= mem_aluop;
			wb_wa 	    <= mem_wa;
			wb_wreg     <= mem_wreg;
			wb_dreg     <= mem_dreg;
			wb_mreg     <= mem_mreg;
			wb_whilo    <= mem_whilo;
			wb_hilo     <= mem_hilo;
			wb_dre      <= mem_dre;
			wb_pc       <= mem_pc;
			
			wb_cp0_we   <= mem_cp0_we;
			wb_cp0_waddr<= mem_cp0_waddr;
			wb_cp0_wdata<= mem_cp0_wdata;
		end
	end

endmodule