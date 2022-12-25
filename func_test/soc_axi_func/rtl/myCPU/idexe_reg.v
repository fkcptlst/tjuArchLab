`include "defines.v"

module idexe_reg (
    input  wire 				  cpu_clk_50M,
    input  wire 				  cpu_rst_n,
    input   wire    [`STALL_BUS ]   stall,

    // ��������׶ε����?
    input  wire [`ALUTYPE_BUS  ]  id_alutype,
    input  wire [`ALUOP_BUS    ]  id_aluop,
    input  wire [`REG_BUS      ]  id_src1,
    input  wire [`REG_BUS      ]  id_src2,
    input  wire [`REG_ADDR_BUS ]  id_wa,
    input  wire                   id_wreg,
	input  wire                   id_mreg,
	input  wire                   id_whilo,
	input  wire [`REG_BUS      ]  id_din,
	
	input  wire [`REG_BUS      ]  id_ret_addr,
	
	input wire [`REG_ADDR_BUS ]	   id_cp0_addr,
	input  wire 			       id_in_delay,
	input wire [`INST_ADDR_BUS]    id_pc,
	/* input wire 				       next_delay_i, */
	input wire [`EXC_CODE_BUS]	   id_exccode,
	input wire 				       flush,
	
	
	output reg [`REG_ADDR_BUS ]	  exe_cp0_addr,
    output reg [`INST_ADDR_BUS]   exe_pc,
    output reg 			          exe_in_delay,
    /* output reg 				      next_delay_o, */
    output reg [`EXC_CODE_BUS]	  exe_exccode,
    
    // ����ִ�н׶ε���Ϣ
    output reg  [`ALUTYPE_BUS  ]  exe_alutype,
    output reg  [`ALUOP_BUS    ]  exe_aluop,
    output reg  [`REG_BUS      ]  exe_src1,
    output reg  [`REG_BUS      ]  exe_src2,
    output reg  [`REG_ADDR_BUS ]  exe_wa,
    output reg                    exe_wreg,
	output reg                    exe_mreg,
	output reg                    exe_whilo,
	output reg  [`REG_BUS      ]  exe_ret_addr,
	output reg  [`REG_BUS      ]  exe_din
    );

    always @(posedge cpu_clk_50M) begin
        // ��λ��ʱ������ִ�н׶ε���Ϣ��0
        if (cpu_rst_n == `RST_ENABLE || flush) begin
            exe_alutype 	   <= `NOP;
            exe_aluop 		   <= `MINIMIPS32_SLL;
            exe_src1 		   <= `ZERO_WORD;
            exe_src2 		   <= `ZERO_WORD;
			exe_din 		   <= `ZERO_WORD;
            exe_wa 			   <= `REG_NOP;
            exe_wreg    	   <= `WRITE_DISABLE;
			exe_mreg		   <= 1'b0;
			exe_whilo		   <= 1'b0;
			exe_ret_addr       <= `ZERO_WORD;
			exe_cp0_addr       <= `REG_NOP;
			exe_pc             <= `PC_INIT;
			exe_in_delay       <= 1'b0;
			/* next_delay_o       <= 1'b0; */
			exe_exccode        <= `EXC_NONE;
			
        end
		else if (stall[2] == `STOP && stall[3] == `NOSTOP) begin
		      exe_alutype      <= `NOP;
		      exe_aluop        <= `MINIMIPS32_SLL;
		      exe_src1 		   <= `ZERO_WORD;
              exe_src2 		   <= `ZERO_WORD;
			  exe_din 		   <= `ZERO_WORD;
              exe_wa 		   <= `REG_NOP;
              exe_wreg    	   <= `WRITE_DISABLE;
		      exe_mreg		   <= `FALSE_V;
		  	  exe_whilo		   <= `WRITE_DISABLE;
		  	  exe_ret_addr     <= `ZERO_WORD;
			exe_cp0_addr       <= `REG_NOP;
			exe_pc             <= `PC_INIT; // id_pc ?
			exe_in_delay       <= 1'b0;
			/* next_delay_o       <= 1'b0; */
			exe_exccode        <= `EXC_NONE;
		end
        // ����������׶ε���Ϣ�Ĵ沢����ִ�н׶�?
        else if (stall[2] == `NOSTOP) begin
            exe_alutype 	   <= id_alutype;
            exe_aluop 		   <= id_aluop;
            exe_src1 		   <= id_src1;
            exe_src2 		   <= id_src2;
			exe_din 		   <= id_din;
            exe_wa 			   <= id_wa;
            exe_wreg			   <= id_wreg;
			exe_mreg			   <= id_mreg;
			exe_whilo			   <= id_whilo;
			exe_ret_addr       <= id_ret_addr;
			exe_cp0_addr       <= id_cp0_addr ;
			exe_pc             <= id_pc;
			exe_in_delay       <= id_in_delay;
			/* next_delay_o       <= next_delay_i; */
			exe_exccode        <= id_exccode;
			
        end
    end

endmodule
