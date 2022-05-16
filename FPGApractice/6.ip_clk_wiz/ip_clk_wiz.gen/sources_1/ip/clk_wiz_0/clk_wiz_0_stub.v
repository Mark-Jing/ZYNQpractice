// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Sat May 14 15:20:23 2022
// Host        : DESKTOP-O59LNIU running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/ZYNQ/ip_clk_wiz/ip_clk_wiz.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_out1_100m, clk_out2_100m_180, 
  clk_out3_50m, clk_out4_25m, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1_100m,clk_out2_100m_180,clk_out3_50m,clk_out4_25m,reset,locked,clk_in1" */;
  output clk_out1_100m;
  output clk_out2_100m_180;
  output clk_out3_50m;
  output clk_out4_25m;
  input reset;
  output locked;
  input clk_in1;
endmodule
