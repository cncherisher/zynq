`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/23 14:18:32
// Design Name: 
// Module Name: vtf_led_test
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


module vtf_led_test;
//inputs
reg sys_clk;
reg rst_n;
//outputs
wire [3:0] led;
//Instantiate
led uut(
    .sys_clk(sys_clk),
    .rst_n(rst_n),
    .led(led)
);
initial
begin
//Initialize inputs
    sys_clk=0;
    rst_n=0;
    #1000;
    rst_n=1;
end
//create clock
always #20 sys_clk=~sys_clk;

endmodule
