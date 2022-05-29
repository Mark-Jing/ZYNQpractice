module fifo_wr(
    input sys_clk,
    input sys_rst_n,
    input almost_empty,
    input almost_full,
    output reg fifo_wr_en,
    output reg[7:0] fifo_din
    );
    
    reg almost_empty_d0,almost_empty_d1;
    reg[3:0] dly_cnt;
    parameter start=0,waiting=1,writing=2;
    reg[1:0] state;
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            almost_empty_d0<=0;
            almost_empty_d1<=1;
        end else begin
            almost_empty_d0<=almost_empty;
            almost_empty_d1<=almost_empty_d0;
        end
    end
    
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            state<=start;
            dly_cnt<=0;
            fifo_wr_en<=0;
            fifo_din<=0;
        end else begin
            case(state)
                start: begin
                    if(almost_empty_d1) begin
                        state<=waiting;
                    end else begin
                        state<=state;
                    end
                end
                waiting: begin
                    if(dly_cnt==10) begin
                        state<=writing;
                        dly_cnt<=0;
                        fifo_wr_en<=1;
                    end else begin
                        dly_cnt<=dly_cnt+1;
                    end
                end
                writing: begin
                    if(almost_full) begin
                        state<=start;
                        fifo_wr_en<=0;
                        fifo_din<=0;
                    end else begin
                        fifo_din<=fifo_din+1;
                        fifo_wr_en<=1;
                    end
                end
                default: state<=start;
            endcase
        end
    end
    
endmodule