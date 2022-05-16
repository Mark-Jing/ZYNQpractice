`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/09 23:43:15
// Design Name: 
// Module Name: led_twinkle
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_twinkle(
    input sys_clk,
    input sys_rst_n,
    output[1:0] led
);
    reg[31:0] cnt;
    assign led=(cnt<100000000)?2'b10:2'b01;
    always@ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) cnt<=0;
        else if(cnt<200000000) cnt<=cnt+1;
        else cnt<=0;
    end
endmodule