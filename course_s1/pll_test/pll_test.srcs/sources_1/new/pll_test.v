`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/23 15:04:17
// Design Name: 
// Module Name: pll_test
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


module pll_test(
input sys_clk,  //system clock 25MHZ
input rst_n,    //reset,low active
output clk_out1,
output clk_out2,
output clk_out3,
output clk_out4
    );
wire locked;

wire sys_clkbuf;

BUFG BUFG_inst(
    .O(sys_clkbuf), //1-bit clock output
    .I(sys_clk) //1-bit clock input
);
//PLL IP Instantiate
clk_wiz_0 clk_wiz_0_inst(
    .clk_in1(sys_clkbuf),   //Clock in 25Mhz
    .clk_out1(clk_out1),    //Clock out 200Mhz,cannot reach for testing
    .clk_out2(clk_out2),    //Clock out 100Mhz
    .clk_out3(clk_out3),    //Clock out 50Mhz
    .clk_out4(clk_out4),    //Clock out 25Mhz
    .reset(~rst_n),     //PLL reset
    .locked(locked)     //OUT
);
endmodule
