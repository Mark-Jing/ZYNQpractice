set_property SLEW SLOW [get_ports uart_txd]
set_property DRIVE 12 [get_ports uart_txd]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]
set_property PACKAGE_PIN N16 [get_ports sys_rst_n]
set_property PACKAGE_PIN U18 [get_ports sys_clk]
set_property PACKAGE_PIN K14 [get_ports uart_rxd]
set_property PACKAGE_PIN M15 [get_ports uart_txd]
