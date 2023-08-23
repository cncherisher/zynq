`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/23 21:07:37
// Design Name: 
// Module Name: rom_test_tb
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


module rom_test_tb();
//Inputs
reg sys_clk;
reg rst_n;

rom_test uut(
    .sys_clk(sys_clk),
    .rst_n(rst_n)
    );
initial
begin
//Initial inputs
sys_clk=0;
rst_n=0;
#100;
rst_n=1;
end
//create clock
always #10 sys_clk = ~sys_clk;

endmodule
