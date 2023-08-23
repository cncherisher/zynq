`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/23 16:54:01
// Design Name: 
// Module Name: vtf_ram_test
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


module vtf_ram_test;
//Iuputs
reg sys_clk;
reg rst_n;

ram_test uut(
    .sys_clk(sys_clk),
    .rst_n(rst_n)
);

initial
begin
// Initialize Inputs
sys_clk = 0;
rst_n = 0 ;
#100 ;
rst_n = 1;
end
//Create clock
always #10 sys_clk = ~ sys_clk;

endmodule
