`include "defines.v"

module if_stage (
    input 	wire 					cpu_clk_50M,
    input 	wire 					cpu_rst_n,
    
    input 	wire 					flush,
    input   wire[`INST_ADDR_BUS]   jump_addr_1,
    input   wire[`INST_ADDR_BUS]   jump_addr_2,
    input   wire[`INST_ADDR_BUS]   jump_addr_3,
    input   wire[1:0]              jtsel,
    input   wire[`INST_ADDR_BUS]   cp0_excaddr,
    
    /* input  wire                    pre_flush_i, */
    /*  */
    /* output  wire                    ice, */
    output 	reg  [`INST_ADDR_BUS] 	pc,
    /* output 	wire [`INST_ADDR_BUS]	iaddr, */
    
    input   wire [`STALL_BUS    ]   stall,
    
    output reg              inst_req     ,
    output wire             inst_wr      ,
    output wire [1 :0]      inst_size    ,
    output wire [31:0]      inst_addr    ,
    input  wire [31:0]      inst_rdata   ,
    output wire [31:0]      inst_wdata   ,
    input  wire             inst_addr_ok ,
    input  wire             inst_data_ok ,
    
    output reg              stallreq_if,
    
    output wire [`EXC_CODE_BUS]    if_exccode_o,
    
    output reg  [`INST_BUS      ]       inst
    );
    
    wire                    ice;
	reg                            flag;
    
    assign inst_wr = 1'b0;
    assign inst_size = 2'b10;
    assign inst_wdata = 32'b0;
    
    reg [`INST_ADDR_BUS] pc_next; 
    wire ce = (cpu_rst_n == `RST_ENABLE) ? `CHIP_DISABLE : `CHIP_ENABLE;
//    assign pc_next =(jtsel == 2'b01)?jump_addr_1:(jtsel == 2'b10)?jump_addr_2:(jtsel == 2'b11)?jump_addr_3: pc + 4 ;                  // ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿?
    assign ice = (stall[1] == `TRUE_V || flush) ? 1'b0 : ce;
    always @(posedge cpu_clk_50M) begin 
        if (ce == `CHIP_DISABLE )begin
            pc <= `PC_INIT;
            pc_next <= `PC_INIT+4;
			inst <= `ZERO_WORD;
			flag <= 1'b0;
            inst_req <= 1'b1;
            stallreq_if <= 1'b1;
        end                    
        else if(flush == `FLUSH) begin 
            pc <= cp0_excaddr;
            pc_next <= cp0_excaddr+4;
			inst <= `ZERO_WORD;
			flag <= 1'b0;
            inst_req <= 1'b1;
            stallreq_if <= 1'b1;
        end
        else if(stall[0] == `NOSTOP) begin
            pc <= pc_next;
            pc_next <= (jtsel == 2'b01)?jump_addr_1:(jtsel == 2'b10)?jump_addr_2:(jtsel == 2'b11)?jump_addr_3: pc_next + 4 ;
            inst_req <= 1'b1;
            stallreq_if <= 1'b1;
        end
		else begin
            if (inst_req == 1'b1 && inst_addr_ok == 1'b1) begin
                inst_req <= 1'b0;
                flag <= 1'b1;
            end
            else if (flag == 1'b1 && inst_data_ok == 1'b1) begin
                stallreq_if <= 1'b0;
                inst <= inst_rdata;
                flag <= 1'b0;
            end
            if(jtsel == 2'b01)begin
                pc_next <= jump_addr_1;
            end
            else if(jtsel == 2'b10)begin
                pc_next <= jump_addr_2;
            end
            else if(jtsel == 2'b11)begin
                pc_next <= jump_addr_3;
            end
        end
    end
    
    assign if_exccode_o = (pc[1:0] == 2'b00) ? `EXC_NONE : `EXC_ADEL;
    
    assign inst_addr = 32'h1fffffff&pc;    
    
    
            
endmodule
