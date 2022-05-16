`timescale 1ns / 1ps

module sim_ip_clk_wiz();

reg sys_clk;
reg sys_rst_n;
wire clk_100m;
wire clk_100m_180;
wire clk_50m;
wire clk_25m;

always #10 sys_clk=~sys_clk;

initial begin
    sys_clk=1'b0;
    sys_rst_n=1'b0;
    #200
    sys_rst_n=1'b1;
end

ip_clock_wiz u_ip_clock_wiz(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .clk_100m(clk_100m),
    .clk_100m_180(clk_100m_180),
    .clk_50m(clk_50m),
    .clk_25m(clk_25m)
);

endmodule