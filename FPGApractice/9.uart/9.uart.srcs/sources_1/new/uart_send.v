module uart_send(
    input sys_clk,
    input sys_rst_n,
    input[7:0] uart_din,
    input uart_en,
    output uart_tx_busy,
    output reg uart_txd
    );
    
    parameter CLK_FREQ=50000000;
    parameter UART_BPS=9600;
    localparam BPS_CNT=CLK_FREQ/UART_BPS;
    
    reg uart_en_d0,uart_en_d1;
    wire en_flag;
    reg[15:0] clk_cnt;
    reg[3:0] tx_cnt;
    reg tx_flag;
    reg[7:0] tx_data;
    
    assign uart_tx_busy=tx_flag;
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            uart_en_d0<=0;
            uart_en_d1<=0;
        end
        else begin
            uart_en_d0<=uart_en;
            uart_en_d1<=uart_en_d0;
        end
    end
    assign en_flag=uart_en_d0&&(~uart_en_d1);
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            tx_flag<=0;
            tx_data<=0;
        end
        else if(en_flag) begin
            tx_flag<=1;
            tx_data<=uart_din;
        end
        else if(tx_cnt==9&&clk_cnt==BPS_CNT-(BPS_CNT/16)) begin
            tx_flag<=0;
            tx_data<=0;
        end
        else begin
            tx_flag<=tx_flag;
            tx_data<=tx_data;
        end
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) clk_cnt<=0;
        else if(tx_flag) begin
            if(clk_cnt<BPS_CNT-1) clk_cnt<=clk_cnt+1;
            else clk_cnt<=0;
        end
        else clk_cnt<=0;
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) tx_cnt<=0;
        else if(tx_flag) begin
            if(clk_cnt==BPS_CNT-1) tx_cnt<=tx_cnt+1;
            else tx_cnt<=tx_cnt;
        end
        else tx_cnt<=0;
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) uart_txd<=1;
        else if(tx_flag) begin
            case(tx_cnt)
                4'd0:uart_txd<=1'b0;
                4'd1:uart_txd<=tx_data[0];
                4'd2:uart_txd<=tx_data[1];
                4'd3:uart_txd<=tx_data[2];
                4'd4:uart_txd<=tx_data[3];
                4'd5:uart_txd<=tx_data[4];
                4'd6:uart_txd<=tx_data[5];
                4'd7:uart_txd<=tx_data[6];
                4'd8:uart_txd<=tx_data[7];
                4'd9:uart_txd<=1'b1;
                default:;
            endcase
        end
        else uart_txd<=1;
    end
    
endmodule