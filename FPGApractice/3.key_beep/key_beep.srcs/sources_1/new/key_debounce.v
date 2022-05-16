`timescale 1ns / 1ps

module key_debounce(
    input sys_clk,
    input sys_rst_n,
    input key,
    output reg key_value,
    output reg key_flag
    );
    reg [19:0] cnt;
    reg key_reg;
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            cnt<=20'd0;
            key_reg<=1;
        end
        else begin
            key_reg<=key;
            if(key!=key_reg)
                cnt<=20'd1000000;
            else begin
                if(cnt>20'b0)
                    cnt<=cnt-1'd1;
                else
                    cnt<=20'd0;
            end
        end
    end
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            key_value=1;
            key_reg<=0;
        end
        else if(cnt==20'd1) begin
            key_value<=key;
            key_flag<=1;
        end
        else begin
            key_value<=key_value;
            key_flag<=0;
        end
    end
endmodule
