module lcd_rgb_colorbar(
    input sys_clk,
    input sys_rst_n,
    
    output lcd_de,
    output lcd_hs,
    output lcd_vs,
    output lcd_bl,
    output lcd_pclk,
    output lcd_rst,
    inout[23:0] lcd_rgb
    );
    
    wire[23:0] lcd_rgb_i;
    wire[23:0] lcd_rgb_o;
    wire[15:0] lcd_id;
    
    assign lcd_rgb_i=lcd_rgb;
    assign lcd_rgb=lcd_de?lcd_rgb_o:{24{1'bz}};
    
    rd_id u_rd_id(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .lcd_rgb(lcd_rgb_i),
        .lcd_id(lcd_id)
    );
    
    clk_div u_clk_div(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .lcd_id(lcd_id),
        .lcd_pclk(lcd_pclk)
    );
    
    wire[10:0] pixel_xpos;
    wire[10:0] pixel_ypos;
    wire[10:0] h_disp;
    wire[10:0] v_disp;
    wire[23:0] pixel_data;
    
    lcd_display u_lcd_display(
        .lcd_pclk(lcd_pclk),
        .sys_rst_n(sys_rst_n),
        .pixel_xpos(pixel_xpos),
        .pixel_ypos(pixel_ypos),
        .h_disp(h_disp),
        .v_disp(v_disp),
        .pixel_data(pixel_data)
    );
    
    lcd_drive u_lcd_drive(
        .lcd_pclk(lcd_pclk),
        .rst_n(sys_rst_n),
        .lcd_id(lcd_id),
        .pixel_data(pixel_data),
        .pixel_xpos(pixel_xpos),
        .pixel_ypos(pixel_ypos),
        .h_disp(h_disp),
        .v_disp(v_disp),
        .lcd_de(lcd_de),
        .lcd_hs(lcd_hs),
        .lcd_vs(lcd_vs),
        .lcd_bl(lcd_bl),
        .lcd_clk(lcd_clk),
        .lcd_rst(lcd_rst),
        .lcd_rgb(lcd_rgb_o)
    );
    
endmodule