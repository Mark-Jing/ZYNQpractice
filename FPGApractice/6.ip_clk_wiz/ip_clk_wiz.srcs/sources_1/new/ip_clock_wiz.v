`timescale 1ns / 1ps

module ip_clock_wiz(
    input sys_clk,
    input sys_rst_n,
    output clk_100m,
    output clk_100m_180,
    output clk_50m,
    output clk_25m
    );
    wire locked;
    clk_wiz_0 u_clk_wiz_0
   (
    // Clock out ports
    .clk_out1_100m(clk_100m),     // output clk_out1_100m
    .clk_out2_100m_180(clk_100m_180),     // output clk_out2_100m_180
    .clk_out3_50m(clk_50m),     // output clk_out3_50m
    .clk_out4_25m(clk_25m),     // output clk_out4_25m
    // Status and control signals
    .reset(~sys_rst_n), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk));      // input clk_in1
endmodule