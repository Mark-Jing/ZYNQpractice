`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/11 21:26:26
// Design Name: 
// Module Name: key_led
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


module key_led(
    input clk,
    input rst_n,
    input [1:0] key,
    output reg [1:0] led
    );
    reg [25:0] cnt;
    reg led_ctl;
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n) cnt<=0;
        else if(cnt<=50000000) cnt<=cnt+1;
        else cnt<=0;
    end
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n) led_ctl<=0;
        else if(cnt==50000000)
            led_ctl<=~led_ctl;
    end
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n) led<=2'b00;
        else begin
            case(key)
                2'b10:
                    begin
                        if(led_ctl) led<=2'b10;
                        else led<=2'b01;
                    end
                2'b11:
                    led<=2'b11;
                2'b01:
                    begin
                        if(led_ctl) led<=2'b11;
                        else led<=2'b00;
                    end
                default:;
            endcase
        end
    end
endmodule
