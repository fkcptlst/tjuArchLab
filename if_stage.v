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
    
    input  wire                    pre_flush_i,
    
    output  wire                    ice,
    output 	reg  [`INST_ADDR_BUS] 	pc,
    output 	wire [`INST_ADDR_BUS]	iaddr,
    
    input   wire [`STALL_BUS    ]   stall,
    
    output wire [`EXC_CODE_BUS]    if_exccode_o,
    output wire [`INST_ADDR_BUS]    pc_next
    );
    
    //wire [`INST_ADDR_BUS] pc_next; 
    reg ce;
    
    assign pc_next =(jtsel == 2'b01)?jump_addr_1:(jtsel == 2'b10)?jump_addr_2:(jtsel == 2'b11)?jump_addr_3: pc + 4 ;                  // ������һ��ָ��ĵ��?
    always @(posedge cpu_clk_50M) begin
		if (cpu_rst_n == `RST_ENABLE) begin
			ce <= `CHIP_DISABLE;		      // ��λ��ʱ��ָ��洢������?? 
		end else begin
			ce <= `CHIP_ENABLE; 		      // ��λ������ָ��洢��ʹ��??
		end
	end
    assign ice = (stall[1] == `TRUE_V || flush) ? 1'b0 : ce;
    always @(posedge cpu_clk_50M) begin 
        if (ce == `CHIP_DISABLE )begin
            pc <= `PC_INIT;   
        end                   
        else begin
            if(flush == `FLUSH) begin 
                pc <= cp0_excaddr;
            end
            /////////////////////////////////////
//            else if(pre_flush_i == `FLUSH) begin
//                pc <= pc_next;
//            end
            
            else if (stall[0] == `NOSTOP) begin
                pc <= pc_next; 
                //pc <= pc + 4;
            end
        end
    end
    
    assign if_exccode_o = (pc[1:0] == 2'b00) ? `EXC_NONE : `EXC_ADEL;
    
    // TODO��ָ��洢���ķ��ʵ�ַû�и�����������Χ���н��й̶���ַӳ�䣬��Ҫ�޸�??!!!
    assign iaddr = 32'h1fffffff&(ice == `CHIP_DISABLE) ? `PC_INIT : pc;    // ��÷���ָ��洢���ĵ�ַ
    
    
            
endmodule