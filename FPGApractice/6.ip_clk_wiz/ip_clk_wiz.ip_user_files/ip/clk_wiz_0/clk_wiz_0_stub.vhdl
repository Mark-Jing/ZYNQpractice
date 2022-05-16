-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Sat May 14 15:20:23 2022
-- Host        : DESKTOP-O59LNIU running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               f:/ZYNQ/ip_clk_wiz/ip_clk_wiz.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clk_out1_100m : out STD_LOGIC;
    clk_out2_100m_180 : out STD_LOGIC;
    clk_out3_50m : out STD_LOGIC;
    clk_out4_25m : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1_100m,clk_out2_100m_180,clk_out3_50m,clk_out4_25m,reset,locked,clk_in1";
begin
end;
