//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com 
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           ram_rw
// Last modified Date:  2019/05/08 8:41:06
// Last Version:        V1.0
// Descriptions:       
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2019/05/08 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module ram_rw(
    input clk,
    input rst_n,
    
    output ram_en     ,
    output ram_wea    , 
    output reg[4:0] ram_addr   ,
    output reg[7:0] ram_wr_data,
    input [7:0] ram_rd_data  
    );

    reg[5:0] rw_cnt;

    assign ram_en = rst_n;
    assign ram_wea = (rw_cnt <= 6'd31 && ram_en == 1'b1) ? 1'b1 : 1'b0;
    always @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)
            rw_cnt <= 1'b0;    
        else if(rw_cnt == 6'd63)
            rw_cnt <= 1'b0;
        else
            rw_cnt <= rw_cnt + 1'b1;    
    end  

    always @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)
            ram_wr_data <= 1'b0;  
        else if(rw_cnt <= 6'd31)
            ram_wr_data <= ram_wr_data + 1'b1;
        else
            ram_wr_data <= 1'b0 ;   
    end  
    
    always @(posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0)
            ram_addr <= 1'b0;
        else if(ram_addr == 5'd31)
            ram_addr <= 1'b0;
        else    
            ram_addr <= ram_addr + 1'b1;
    end
    
    ila_0 your_instance_name (
        .clk(clk), 
    
        .probe0(ram_en),
        .probe1(ram_wea), 
        .probe2(ram_addr),   
        .probe3(ram_wr_data),
        .probe4(ram_rd_data)
    );

endmodule
