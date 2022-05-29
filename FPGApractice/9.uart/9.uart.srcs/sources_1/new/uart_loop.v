module uart_loop(
    input sys_clk,
    input sys_rst_n,
    input recv_done,
    input[7:0] recv_data,
    input tx_busy,
    output reg send_en,
    output reg[7:0] send_data
);

    reg recv_done_d0,recv_done_d1;
    reg tx_ready;
    wire recv_done_flag;
    
    assign recv_done_flag=(~recv_done_d1)&recv_done_d0;
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            recv_done_d0<=0;
            recv_done_d1<=0;
        end
        else begin
            recv_done_d0<=recv_done;
            recv_done_d1<=recv_done_d0;
        end
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            tx_ready<=0;
            send_en<=0;
            send_data<=0;
        end
        else begin
            if(recv_done_flag) begin
                tx_ready<=1;
                send_en<=0;
                send_data<=recv_data;
            end
            else if(tx_ready&&(~tx_busy)) begin
                tx_ready<=0;
                send_en<=1;
            end
        end
    end

endmodule