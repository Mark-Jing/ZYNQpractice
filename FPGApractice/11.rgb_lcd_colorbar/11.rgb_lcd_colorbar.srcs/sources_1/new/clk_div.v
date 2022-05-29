module clk_div(
    input sys_clk,
    input sys_rst_n,
    input[15:0] lcd_id,
    output reg lcd_pclk
    );
    
    reg clk_25m;
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) clk_25m<=0;
        else clk_25m<=~clk_25m;
    end
    
    reg clk_12_5m;
    reg div4_cnt;
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            clk_12_5m<=0;
            div4_cnt<=0;
        end
        else begin
            div4_cnt<=div4_cnt+1;
            if(div4_cnt==1) clk_12_5m<=~clk_12_5m;
        end
    end
    
    always @ (*) begin
        case(lcd_id)
            16'h4342:lcd_pclk=clk_12_5m;
            16'h7084:lcd_pclk=clk_25m;
            16'h7016:lcd_pclk=sys_clk;
            16'h4384:lcd_pclk=clk_25m;
            16'h1018:lcd_pclk=sys_clk;
            default: lcd_pclk=0;
        endcase
    end
    
endmodule