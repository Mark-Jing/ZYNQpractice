
p
Command: %s
53*	vivadotcl2?
+write_bitstream -force lcd_rgb_colorbar.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2D
 ".
u_rd_id/CLKu_rd_id/CLK2default:default2default:default2n
 "X
 u_rd_id/lcd_pclk_OBUF_inst_i_1/O u_rd_id/lcd_pclk_OBUF_inst_i_1/O2default:default2default:default2j
 "T
u_rd_id/lcd_pclk_OBUF_inst_i_1	u_rd_id/lcd_pclk_OBUF_inst_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 25 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2j
 "T
u_rd_id/lcd_pclk_OBUF_inst_i_1	u_rd_id/lcd_pclk_OBUF_inst_i_12default:default2default:default2?	
 "X
 u_lcd_display/pixel_data_reg[15]	 u_lcd_display/pixel_data_reg[15]2default:default"X
 u_lcd_display/pixel_data_reg[23]	 u_lcd_display/pixel_data_reg[23]2default:default"V
u_lcd_display/pixel_data_reg[7]	u_lcd_display/pixel_data_reg[7]2default:default"H
u_lcd_drive/h_cnt_reg[0]	u_lcd_drive/h_cnt_reg[0]2default:default"J
u_lcd_drive/h_cnt_reg[10]	u_lcd_drive/h_cnt_reg[10]2default:default"H
u_lcd_drive/h_cnt_reg[1]	u_lcd_drive/h_cnt_reg[1]2default:default"H
u_lcd_drive/h_cnt_reg[2]	u_lcd_drive/h_cnt_reg[2]2default:default"H
u_lcd_drive/h_cnt_reg[3]	u_lcd_drive/h_cnt_reg[3]2default:default"H
u_lcd_drive/h_cnt_reg[4]	u_lcd_drive/h_cnt_reg[4]2default:default"H
u_lcd_drive/h_cnt_reg[5]	u_lcd_drive/h_cnt_reg[5]2default:default"H
u_lcd_drive/h_cnt_reg[6]	u_lcd_drive/h_cnt_reg[6]2default:default"H
u_lcd_drive/h_cnt_reg[7]	u_lcd_drive/h_cnt_reg[7]2default:default"H
u_lcd_drive/h_cnt_reg[8]	u_lcd_drive/h_cnt_reg[8]2default:default"H
u_lcd_drive/h_cnt_reg[9]	u_lcd_drive/h_cnt_reg[9]2default:default"D
u_lcd_drive/v_cnt_reg[0]	u_lcd_drive/v_cnt_reg[0]2default:..."/
(the first 15 of 25 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
?
uPS7 block required: The PS7 cell must be used in this Zynq design in order to enable correct default configuration.%s*DRC2;
 #DRC|PS7|Zynq requires PS7 block|PS72default:default8ZZPS7-1h px? 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 3 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
g
Writing bitstream %s...
11*	bitstream2*
./lcd_rgb_colorbar.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a ULT device. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.698*projectZ1-1876h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
122default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:092default:default2
00:00:082default:default2
2403.5942default:default2
458.1992default:defaultZ17-268h px? 


End Record