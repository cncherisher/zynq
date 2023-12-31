`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/23 13:47:40
// Design Name: 
// Module Name: led
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led(
    input sys_clk,
    input rst_n,
    output reg[3:0] led
    );
reg[31:0] timer_cnt;
always@(posedge sys_clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        led <= 4'd0;
        timer_cnt <= 32'd0;
    end
    else if(timer_cnt >= 32'd24_999_999)
    begin
        led <= ~led;
        timer_cnt <= 32'd0;
    end
    else
    begin
        led<=led;
        timer_cnt<=timer_cnt + 32'd1;
    end
end

endmodule
