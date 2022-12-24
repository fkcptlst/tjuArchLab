// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Nov  2 22:14:13 2021
// Host        : LAPTOP-BEASOA6F running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub D:/soc_axi_func/rtl/xilinx_ip/clk_pll/clk_pll_stub.v
// Design      : clk_pll
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_pll(cpu_clk, sys_clk, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="cpu_clk,sys_clk,clk_in1_p,clk_in1_n" */;
  output cpu_clk;
  output sys_clk;
  input clk_in1_p;
  input clk_in1_n;
endmodule
