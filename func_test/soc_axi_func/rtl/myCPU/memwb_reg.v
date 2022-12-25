`include "defines.v"

module memwb_reg (
    input  wire                     cpu_clk_50M,
	input  wire                     cpu_rst_n,

	// ���Էô�׶ε���Ϣ
	input  wire [`REG_ADDR_BUS  ]   mem_wa,
	input  wire                     mem_wreg,
	input  wire [`REG_BUS       ] 	mem_dreg,
	input  wire                     mem_mreg,
	input  wire                     mem_whilo,
	input  wire [`DOUBLE_REG_BUS]   mem_hilo,
	input  wire [`BSEL_BUS 		]   mem_dre,
	input  wire [`ALUOP_BUS     ]  mem_aluop,
	input  wire [`INST_ADDR_BUS]   mem_pc,

	// ����д�ؽ׶ε���Ϣ 
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
	output reg  [`REG_BUS     ]   wb_cp0_wdata,
	
	input  wire [`STALL_BUS    ]   stall,
    
    input wire [`REG_BUS]         dm_i,
    output reg [`REG_BUS]          dm_o
    );

    always @(posedge cpu_clk_50M) begin
		// ��λ��ʱ������д�ؽ׶ε���Ϣ��0
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
			dm_o         <=  `ZERO_WORD;
		end
		// �����Էô�׶ε���Ϣ�Ĵ沢����д�ؽ׶�
		else if (stall[4] == `NOSTOP) begin
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
			dm_o         <=  dm_i;
		end
	end

endmodule
