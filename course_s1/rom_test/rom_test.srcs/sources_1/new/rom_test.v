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
    input sys_clk,  //25Mhzϵͳʱ��
    input rst_n    //��λ�źţ��͵�ƽ��Ч
    );

wire [7:0] rom_data;    //rom�е�����
reg [4:0] rom_addr;    //rom�е��������ڵĵ�ַ

always @ (posedge sys_clk or negedge rst_n)
begin
    if(!rst_n)
        rom_addr <= 10'd0;
    else
        rom_addr <= rom_addr +1'b1;
end

//ʵ����rom ip
rom_ip rom_ip_inst(
    .clka(sys_clk),  //input system clk
    .addra(rom_addr),    //input rom address
    .douta(rom_data)    //output rom data
);

//ʵ����ila ip

ila_0 ila_0_inst(
    .clk(sys_clk),
    .probe0(rom_addr),
    .probe1(rom_data)
);

endmodule
