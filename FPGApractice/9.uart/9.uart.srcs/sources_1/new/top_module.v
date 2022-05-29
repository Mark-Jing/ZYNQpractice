module top_module(
    input sys_clk,
    input sys_rst_n,
    input uart_rxd,
    output uart_txd
    );
    
    parameter CLK_FREQ=50000000;
    parameter UART_BPS=115200;
    
    wire uart_recv_done;
    wire[7:0] uart_recv_data;
    wire uart_send_en;
    wire[7:0] uart_send_data;
    wire uart_tx_busy;
    
    uart_recv #(
        .CLK_FREQ(CLK_FREQ),
        .UART_BPS(UART_BPS)
    ) u_uart_recv(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .uart_txd(uart_rxd),
        .uart_data(uart_recv_data),
        .uart_done(uart_recv_done)
    );
    
    uart_send #(
        .CLK_FREQ(CLK_FREQ),
        .UART_BPS(UART_BPS)
    ) u_uart_send(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .uart_din(uart_send_data),
        .uart_en(uart_send_en),
        .uart_tx_busy(uart_tx_busy),
        .uart_txd(uart_txd)
    );
    
    uart_loop u_uart_loop(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .recv_data(uart_recv_data),
        .recv_done(uart_recv_done),
        .tx_busy(uart_tx_busy),
        .send_data(uart_send_data),
        .send_en(uart_send_en)
    );
    
endmodule
