`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/23 20:53:36
// Design Name: 
// Module Name: rom_test
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


module rom_test(
    input sys_clk,  //25Mhz系统时钟
    input rst_n    //复位信号，低电平有效
    );

wire [7:0] rom_data;    //rom中的数据
reg [4:0] rom_addr;    //rom中的数据所在的地址

always @ (posedge sys_clk or negedge rst_n)
begin
    if(!rst_n)
        rom_addr <= 10'd0;
    else
        rom_addr <= rom_addr +1'b1;
end

//实例化rom ip
rom_ip rom_ip_inst(
    .clka(sys_clk),  //input system clk
    .addra(rom_addr),    //input rom address
    .douta(rom_data)    //output rom data
);

//实例化ila ip

ila_0 ila_0_inst(
    .clk(sys_clk),
    .probe0(rom_addr),
    .probe1(rom_data)
);

endmodule
