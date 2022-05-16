`timescale 1ns / 1ps

module breath_led(
    input sys_clk,
    input sys_rst_n,
    output led
    );
    reg [15:0] period_cnt;
    reg [15:0] duty_cnt;
    reg inc_dec_flag;
    assign led=(period_cnt>=duty_cnt)?1'b1:1'b0;
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) period_cnt<=16'd0;
        else if(period_cnt==16'd50000) period_cnt<=16'd0;
        else period_cnt<=period_cnt+1'd1;
    end
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            duty_cnt<=16'd0;
            inc_dec_flag<=0;
        end
        else if(period_cnt==16'd50000) begin
            if(inc_dec_flag==0) begin
                if(duty_cnt==16'd50000) inc_dec_flag<=1;
                else duty_cnt<=duty_cnt+25;
            end else begin
                if(duty_cnt==16'd0) inc_dec_flag<=0;
                else duty_cnt<=duty_cnt-25;
            end
        end
    end
endmodule