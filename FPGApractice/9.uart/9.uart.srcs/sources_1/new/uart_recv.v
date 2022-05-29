module uart_recv(
    input sys_clk,
    input sys_rst_n,
    input uart_txd,
    output reg uart_done,
    output reg[7:0] uart_data
    );
    
    parameter CLK_FREQ=50000000;
    parameter UART_BPS=9600;//don't care
    localparam BPS_CNT=CLK_FREQ/UART_BPS;
    
    reg uart_txd_d0,uart_txd_d1;
    reg[15:0] clk_cnt;
    reg[3:0] rx_cnt;
    reg rx_flag;
    reg[7:0] rx_data;
    wire start_flag;
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            uart_txd_d0<=0;
            uart_txd_d1<=0;
        end
        else begin
            uart_txd_d0<=uart_txd;
            uart_txd_d1<=uart_txd_d0;
        end
    end
    assign start_flag=uart_txd_d1&(~uart_txd_d0);
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) rx_flag<=0;
        else begin
            if(start_flag) rx_flag<=1;
            else if(rx_cnt==9&&clk_cnt==BPS_CNT/2) rx_flag<=0;
            else rx_flag<=rx_flag;
        end
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) clk_cnt<=0;
        else if(rx_flag) begin
            if(clk_cnt<BPS_CNT-1) clk_cnt<=clk_cnt+1;
            else clk_cnt<=0;
        end
        else clk_cnt<=0;
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) rx_cnt<=0;
        else if(rx_flag) begin
            if(clk_cnt==BPS_CNT-1) rx_cnt<=rx_cnt+1;
            else rx_cnt<=rx_cnt;
        end
        else rx_cnt<=0;
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) rx_data<=0;
        else if(rx_flag)
            if(clk_cnt==BPS_CNT/2) begin
                case(rx_cnt)
                    4'd1: rx_data[0]<=uart_txd_d1;
                    4'd2: rx_data[1]<=uart_txd_d1;
                    4'd3: rx_data[2]<=uart_txd_d1;
                    4'd4: rx_data[3]<=uart_txd_d1;
                    4'd5: rx_data[4]<=uart_txd_d1;
                    4'd6: rx_data[5]<=uart_txd_d1;
                    4'd7: rx_data[6]<=uart_txd_d1;
                    4'd8: rx_data[7]<=uart_txd_d1;
                    default:;
                endcase
            end
            else rx_data<=rx_data;
            else rx_data<=8'd0;
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            uart_done<=1;
            uart_data<=0;
        end
        else if(rx_cnt==9) begin
            uart_done<=1;
            uart_data<=rx_data;
        end
        else begin
            uart_data<=0;
            uart_done<=0;
        end
    end
    
endmodule