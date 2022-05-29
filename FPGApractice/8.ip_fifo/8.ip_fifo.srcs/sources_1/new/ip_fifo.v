module ip_fifo(
    input sys_clk,
    input sys_rst_n
    );
    wire fifo_wr_en,fifo_rd_en;
    wire[7:0] fifo_din,fifo_dout;
    wire almost_empty,almost_full;
    wire fifo_full,fifo_empty;
    wire[7:0] fifo_wr_data_cnt,fifo_rd_data_count;
    
    fifo_rd u_fifo_rd(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .fifo_rd_en(fifo_rd_en),
        .fifo_dout(fifo_dout),
        .almost_empty(almost_empty),
        .almost_full(almost_full)
    );
    
    fifo_wr u_fifo_wr(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .fifo_wr_en(fifo_wr_en),
        .fifo_din(fifo_din),
        .almost_empty(almost_empty),
        .almost_full(almost_full)
    );
    
    fifo_generator_0 u_fifo_generator_0 (
        .rst(sys_rst_n),                      // input wire rst
        .wr_clk(sys_clk),                // input wire wr_clk
        .rd_clk(sys_clk),                // input wire rd_clk
        .din(fifo_din),                      // input wire [7 : 0] din
        .wr_en(fifo_wr_en),                  // input wire wr_en
        .rd_en(fifo_rd_en),                  // input wire rd_en
        .dout(fifo_dout),                    // output wire [7 : 0] dout
        .full(fifo_full),                    // output wire full
        .almost_full(almost_full),      // output wire almost_full
        .empty(fifo_empty),                  // output wire empty
        .almost_empty(almost_empty),    // output wire almost_empty
        .rd_data_count(fifo_rd_data_count),  // output wire [7 : 0] rd_data_count
        .wr_data_count(fifo_wr_data_count)  // output wire [7 : 0] wr_data_count
    //    .wr_rst_busy(wr_rst_busy),      // output wire wr_rst_busy
//        .rd_rst_busy(rd_rst_busy)      // output wire rd_rst_busy
    );
    
    ila_0 u_checker (
    	.clk(sys_clk), // input wire clk
    
    	.probe0(fifo_wr_en), // input wire [0:0]  probe0  
    	.probe1(fifo_rd_en), // input wire [0:0]  probe1 
    	.probe2(fifo_din), // input wire [7:0]  probe2 
    	.probe3(fifo_dout) // input wire [7:0]  probe3
    );
    
endmodule
