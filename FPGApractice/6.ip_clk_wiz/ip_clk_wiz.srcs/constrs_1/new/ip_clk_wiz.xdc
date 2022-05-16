#----------------------系统时钟---------------------------
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports sys_clk]

#----------------------系统复位---------------------------
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]

set_property -dict {PACKAGE_PIN U20 IOSTANDARD LVCMOS33} [get_ports clk_100m]
set_property -dict {PACKAGE_PIN T20 IOSTANDARD LVCMOS33} [get_ports clk_100m_180]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS33} [get_ports clk_50m]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports clk_25m]