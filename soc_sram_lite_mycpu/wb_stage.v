`include "defines.v"

module wb_stage(
    input  wire 				cpu_rst_n,

	input wire [`REG_ADDR_BUS  ] wb_wa_i,
	input wire [`ALUOP_BUS     ] wb_aluop_i,
	input wire                   wb_wreg_i,
	input wire [`REG_BUS       ] wb_dreg_i,
	input wire                   wb_mreg_i,
	input wire                   wb_whilo_i,
	input wire [`DOUBLE_REG_BUS] wb_hilo_i,
	input wire [`REG_BUS       ] dm,
	input wire [`BSEL_BUS 	   ] wb_dre_i,
	input wire [`INST_ADDR_BUS]  wb_pc_i,
	

    output wire [`REG_ADDR_BUS  ] wb_wa_o,
	output wire                   wb_wreg_o,
    output wire [`WORD_BUS      ] wb_wd_o,
	output wire                   wb_whilo_o,
	output wire [`DOUBLE_REG_BUS] wb_hilo_o,
	output wire [`INST_ADDR_BUS ] wb_pc_o,
	
	input  wire                   cp0_we_i,
	input  wire [`REG_ADDR_BUS]   cp0_waddr_i,
	input  wire [`REG_BUS     ]   cp0_wdata_i,
	
	output wire                   cp0_we_o,
	output wire [`REG_ADDR_BUS]   cp0_waddr_o,
	output wire [`REG_BUS     ]   cp0_wdata_o

	// // for test
	// // output pc
	// output wire [`INST_ADDR_BUS]  debug_wb_pc,
	// // output reg we
	// output wire 			      debug_wb_rf_wen,
	// // output reg addr
	// output wire [`REG_ADDR_BUS]   debug_wb_rf_wnum,
	// // output reg data
	// output wire [`REG_BUS]        debug_wb_rf_wdata
    );

    assign wb_wa_o      = (cpu_rst_n == `RST_ENABLE) ? 5'b0:wb_wa_i;  // write reg addr
    assign wb_wreg_o    = (cpu_rst_n == `RST_ENABLE) ? 1'b0:wb_wreg_i;  // write reg enable
    wire[`WORD_BUS] data = (cpu_rst_n == `RST_ENABLE) ? 32'b0:
                           (wb_dre_i == 4'b1111) ? dm :
//                           (wb_dre_i == 4'b1111) ? {dm[7:0],dm[15:8],dm[23:16],dm[31:24]}:
                           (wb_dre_i == 4'b0011) ? ( (wb_aluop_i == `MINIMIPS32_LH) ? {{16{dm[31]}},dm[31:16]} : {{16{1'b0}},dm[31:16]} )  :
                           (wb_dre_i == 4'b1100) ? ( (wb_aluop_i == `MINIMIPS32_LH) ? {{16{dm[15]}},dm[15:0]} : {{16{1'b0}},dm[15:0]} )  :
                           (wb_dre_i == 4'b0001) ? ( (wb_aluop_i == `MINIMIPS32_LB) ? {{24{dm[31]}},dm[31:24]} : {{24{1'b0}},dm[31:24]} ) :
                           (wb_dre_i == 4'b0010) ? ( (wb_aluop_i == `MINIMIPS32_LB) ? {{24{dm[23]}},dm[23:16]} : {{24{1'b0}},dm[23:16]} ) :
                           (wb_dre_i == 4'b0100) ? ( (wb_aluop_i == `MINIMIPS32_LB) ? {{24{dm[15]}},dm[15:8]} : {{24{1'b0}},dm[15:8]} ) :
                           (wb_dre_i == 4'b1000) ? ( (wb_aluop_i == `MINIMIPS32_LB) ? {{24{dm[7]}},dm[7:0]} : {{24{1'b0}},dm[7:0]} ) :
                           32'b0;
                           
    assign wb_wd_o      =  (cpu_rst_n == `RST_ENABLE) ? 32'b0:
                           (wb_mreg_i == 1'b1)?data:wb_dreg_i;
	assign wb_hilo_o	= (cpu_rst_n == `RST_ENABLE) ? 64'b0:wb_hilo_i;
	assign wb_whilo_o	= (cpu_rst_n == `RST_ENABLE) ? 1'b0:wb_whilo_i;
	
	assign wb_pc_o = (cpu_rst_n == `RST_ENABLE) ? `PC_INIT : wb_pc_i;
	
	// for cp0
	assign cp0_we_o = (cpu_rst_n == `RST_ENABLE) ? 1'b0 : cp0_we_i;
    assign cp0_waddr_o = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD : cp0_waddr_i;
	assign cp0_wdata_o = (cpu_rst_n == `RST_ENABLE) ? `ZERO_WORD : cp0_wdata_i;

	// // for test
	// assign debug_wb_rf_wen = wb_wreg_o;  // write reg enable
	// assign debug_wb_rf_wnum = wb_wa_o;  // write reg addr
	// assign debug_wb_rf_wdata = wb_wd_o;  // write reg data
	// assign debug_wb_pc = wb_pc_o;  // write back pc

endmodule
