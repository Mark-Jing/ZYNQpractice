`timescale 1ns / 1ps

module beep_control(
    input sys_clk,
    input sys_rst_n,
    input key_value,
    input key_flag,
    output reg beep
    );
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) beep<=1;
        else if(key_flag==1&&key_value==0) beep<=~beep;
    end
endmodule