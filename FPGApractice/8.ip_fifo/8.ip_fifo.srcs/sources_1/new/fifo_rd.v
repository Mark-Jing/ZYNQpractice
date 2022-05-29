module fifo_rd(
    input sys_clk,
    input sys_rst_n,
    input[7:0] fifo_dout,
    input almost_full,
    input almost_empty,
    output reg fifo_rd_en
    );
    
    parameter start=0,waiting=1,reading=2;
    reg[1:0] state;
    reg almost_full_d0,almost_full_d1;
    reg[3:0] dly_cnt;
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            almost_full_d0<=0;
            almost_full_d1<=0;
        end else begin
            almost_full_d0<=almost_full;
            almost_full_d1<=almost_full_d0;
        end
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            state<=start;
            dly_cnt<=0;
            fifo_rd_en<=0;
        end else begin
            case(state)
                start: begin
                    if(almost_full_d1) begin
                        state<=waiting;
                    end else begin
                        state<=state;
                    end
                end
                waiting: begin
                    if(dly_cnt==10) begin
                        dly_cnt<=0;
                        state<=reading;
                        fifo_rd_en<=1;
                    end else begin
                        dly_cnt<=dly_cnt+1;
                        state<=state;
                    end
                end
                reading: begin
                    if(~almost_empty) begin
                        fifo_rd_en<=1;
                        state<=state;
                    end else begin
                        state<=start;
                        fifo_rd_en<=0;
                    end
                end
                default: state<=start;
            endcase
        end
    end
    
endmodule
