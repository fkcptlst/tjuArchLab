`include "defines.v"

module exemem_reg (
    input  wire 				cpu_clk_50M,
    input  wire 				cpu_rst_n,

    // ����ִ�н׶ε���Ϣ
    input  wire [`ALUOP_BUS   ] exe_aluop,
    input  wire [`REG_ADDR_BUS] exe_wa,
    input  wire                 exe_wreg,
    input  wire [`REG_BUS 	  ] exe_wd,
	input  wire [`DOUBLE_REG_BUS] 	exe_hilo,
	input  wire  					exe_whilo,
	input  wire  					exe_mreg,
	input  wire [`REG_BUS 	  ] 	exe_din,
	
    
    input  wire                 exe_cp0_we,
    input  wire[`REG_ADDR_BUS]  exe_cp0_waddr,
    input  wire[`REG_BUS     ]  exe_cp0_wdata,
    
    input  wire                 flush,
    input  wire[`INST_ADDR_BUS] exe_pc,
    input  wire                 exe_in_delay,
    input  wire[`EXC_CODE_BUS]  exe_exccode,
    
    // �͵��ô�׶ε����? 
    output reg  [`ALUOP_BUS   ] mem_aluop,
    output reg  [`REG_ADDR_BUS] mem_wa,
    output reg                  mem_wreg,
    output reg  [`REG_BUS 	  ] mem_wd,
    
	output reg  [`DOUBLE_REG_BUS] 	mem_hilo,
	output reg                  mem_mreg,
	output reg                  mem_whilo,
	output reg  [`REG_BUS 	  ] mem_din,
	
	input  wire    [`STALL_BUS ]   stall,
    
	output reg                 mem_cp0_we,
	output reg [`REG_ADDR_BUS] mem_cp0_waddr,
	output reg [`REG_BUS     ] mem_cp0_wdata,
	
	output reg [`INST_ADDR_BUS]    mem_pc,
	output reg                 mem_in_delay,
	output reg [`EXC_CODE_BUS] mem_exccode,

	output reg        data_req     ,
    output reg        data_wr      ,
    output reg [31:0] data_addr    ,
    input wire [31:0] data_rdata   ,
    input wire       data_addr_ok ,
    input wire       data_data_ok ,
    
    output reg         stallreq_mem,
    
    output reg [`REG_BUS]           dm_o
    );	
    
    reg flag;
	wire [`REG_BUS 	  ]         daddr;
                 
	assign daddr = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD : (32'h1fffffff&exe_wd);

    always @(posedge cpu_clk_50M) begin
    if (cpu_rst_n == `RST_ENABLE || flush) begin
        mem_aluop              <= `MINIMIPS32_SLL;
        mem_wa 				   <= `REG_NOP;
        mem_wreg   			   <= `WRITE_DISABLE;
        mem_wd   			   <= `ZERO_WORD;
		mem_hilo  			   <= 64'b0;
		mem_whilo  			   <= 1'b0;
		mem_mreg   			   <= 1'b0;
		mem_din   			   <= `ZERO_WORD;
		
		mem_cp0_we             <= `FALSE_V;
		mem_cp0_waddr          <= `ZERO_WORD;
		mem_cp0_wdata          <= `ZERO_WORD;
		mem_pc                 <= `PC_INIT;
		mem_in_delay           <= `FALSE_V;
		mem_exccode            <= `EXC_NONE;
			
        dm_o         <=  `ZERO_WORD;
        
        flag         <=  1'b0;
        
        stallreq_mem <= 1'b0;
        data_req     <= 1'b0;
        data_wr      <= 1'b0;
        data_addr    <= 32'b0;	
    end
	else if (stall[3] == `STOP && stall[4] == `NOSTOP) begin
        mem_aluop              <= `MINIMIPS32_SLL;
        mem_wa 				   <= `REG_NOP;
        mem_wreg   			   <= `WRITE_DISABLE;
        mem_wd   			   <= `ZERO_WORD;
        mem_hilo  			   <= `ZERO_DWORD;
        mem_whilo  			   <= `WRITE_DISABLE;
        mem_mreg   			   <= `WRITE_DISABLE;
        mem_din   			   <= `ZERO_WORD;
        
        mem_cp0_we             <= `FALSE_V;
        mem_cp0_waddr          <= `ZERO_WORD;
        mem_cp0_wdata          <= `ZERO_WORD;
        mem_pc                 <= exe_pc;
        mem_in_delay           <= `FALSE_V;
        mem_exccode            <= `EXC_NONE;
			
        dm_o         <=  `ZERO_WORD;
        
        flag         <=  1'b0;
        
        stallreq_mem <= 1'b0;
        data_req     <= 1'b0;
        data_wr      <= 1'b0;
        data_addr    <= 32'b0;
	end
    else if (stall[3] == `NOSTOP) begin
        mem_aluop              <= exe_aluop;
        mem_wa 				   <= exe_wa;
        mem_wreg 			   <= exe_wreg;
        mem_wd 		    	   <= exe_wd;
		mem_whilo 		    	   <= exe_whilo;
		mem_mreg 		    	   <= exe_mreg;
		mem_hilo 		    	   <= exe_hilo;
		mem_din   			   	   <= exe_din;
        data_addr               <= daddr;
		
		mem_cp0_we             <= exe_cp0_we;
		mem_cp0_waddr          <= exe_cp0_waddr;
		mem_cp0_wdata          <= exe_cp0_wdata;
		mem_pc                 <= exe_pc;
		mem_in_delay           <= exe_in_delay;
		mem_exccode            <= exe_exccode;
		
		dm_o                   <= `ZERO_WORD;
		
		if ( exe_aluop == `MINIMIPS32_LB 
             || exe_aluop == `MINIMIPS32_LBU 
             || exe_aluop == `MINIMIPS32_LH 
             || exe_aluop == `MINIMIPS32_LHU 
             || exe_aluop == `MINIMIPS32_LW ) begin
		    stallreq_mem <= 1'b1;
            data_req     <= 1'b1;
            data_wr      <= 1'b0;
		end
        else if ( exe_aluop == `MINIMIPS32_SB 
                  || exe_aluop == `MINIMIPS32_SH 
                  || exe_aluop == `MINIMIPS32_SW ) begin
            stallreq_mem <= 1'b1;
            data_req     <= 1'b1;
            data_wr      <= 1'b1;
//            data_addr    <= daddr;
        end
    end
    else if (data_req == 1'b1 && data_addr_ok == 1'b1) begin
        if(data_wr == 1'b1) begin
            stallreq_mem <= 1'b0;
            data_req     <= 1'b0;
            data_wr      <= 1'b0;
//            data_addr    <= 32'b0;
        end
        else begin
            data_req     <= 1'b0;
//            data_addr    <= 32'b0;
            flag <= 1'b1;
        end
    end
    else if (flag == 1'b1 && data_data_ok == 1'b1) begin
        stallreq_mem <= 1'b0;
        dm_o <= data_rdata;
        flag <= 1'b0;
    end
  end

endmodule
