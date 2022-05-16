module touch_led(
    input sys_clk,
    input sys_rst_n,
    input touch_key,
    output reg led
);
    reg touch_key_d0;
    reg touch_key_d1;
    wire touch_en;
    assign  touch_en = (~touch_key_d1) & touch_key_d0;
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n) begin
            touch_key_d0 <= 1'b0;
            touch_key_d1 <= 1'b0;
        end
        else begin
            touch_key_d0 <= touch_key;
            touch_key_d1 <= touch_key_d0;
        end 
    end
    always @ (posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            led <= 1'b1;
        else begin 
            if (touch_en)
                led <= ~led;
        end
    end
endmodule