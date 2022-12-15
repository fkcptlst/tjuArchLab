`include "defines.v"

module hilo(
    input  wire 				 cpu_clk_50M,
	input  wire 				 cpu_rst_n,
	

	input  wire  [`DOUBLE_REG_BUS] hilo,
	input  wire 				   we,
	
	output reg   [`REG_BUS 	   ] hi_o,
	output reg   [`REG_BUS 	   ] lo_o

    );

    //定义hi、lo寄存�?
	reg [`REG_BUS] 	hi;
	reg [`REG_BUS] 	lo;
	
	always @(posedge cpu_clk_50M) begin
		if (cpu_rst_n == `RST_ENABLE) begin
				hi <= 32'b0;
				lo <= 32'b0;
		end
		else begin
			if (we == `WRITE_ENABLE) begin
				hi <= hilo[63:32];
				lo <= hilo[31:0];
			end 
		end
	end
	
	//读操�? 
	always @(*) begin
		if (cpu_rst_n == `RST_ENABLE) begin
			hi_o <= `ZERO_WORD;
			lo_o <= `ZERO_WORD;
		end	
		else begin
			hi_o <= hi;
			lo_o <= lo;
		end	
	end
	

endmodule
