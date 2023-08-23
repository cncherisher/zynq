`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/23 16:05:17
// Design Name: 
// Module Name: ram_test
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


module ram_test(
    input sys_clk,
    input rst_n
    );
//memony address and data register defination
reg     [8:0]   w_addr; //RAM PORTA Write Address
reg     [15:0]  w_data; //RAM PORTA Write Data
reg             wea;    //write enable
reg     [8:0]   r_addr; //RAM PORTB Read Address
wire     [15:0]  r_data; //RAM PORTB Read Data

//generate RAM PORTA Write Enable signal
always @ (posedge sys_clk or negedge rst_n)
begin
    if(!rst_n)
        wea <= #1 1'b0; //delay 1ns
    else
    begin
        if(&w_addr) //��w_addrȫΪ1������д����ɣ���д��2^9=512bit������
            wea <= #1 1'b0;     //delay 1ns��д����ɣ��ر�дʹ��
        else
            wea <= #1 1'b1;     //delay 1ns���������д��
    end
end

//generate RAM PORTA Write address and data
always@(posedge sys_clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        w_addr <= 9'd0;
        w_data <= 16'd1;
    end
    else
    begin
        if(wea)
        begin
            if(&w_addr)
            begin
                w_addr <= w_addr;
                w_data <= w_data;
            end
            else
            begin
                w_addr <= w_addr + 1'b1;
                w_data <= w_data + 1'b1;
            end
        end
    end
end

//generate RAM PORTB Read Address
always @(posedge sys_clk or negedge rst_n)
begin
    if(!rst_n)
        r_addr <= 9'd0;
    else if(|w_addr)    //��λ���������λ������������
    //�ж�w_addr�Ƿ�Ϊ0����Ϊ0����ִ�и���䣬��ַ��һ
        r_addr <= r_addr + 1'b1;
    else 
        r_addr <= 9'd0;
end

//ʵ����RAM
ram_ip ram_ip_init(
    .clka(sys_clk),     //input system clk
    .wea(wea),          //input write enable
    .addra(w_addr),     //input write address
    .dina(w_data),      //input write data
    .clkb(sys_clk),     //input system clk
    .addrb(r_addr),     //input read address
    .doutb(r_data)      //output read data
);

//ʵ����ila�߼�������
ila_0 ila_0_inst(
    .clk(sys_clk),
    .probe0(r_data),
    .probe1(r_addr)
);
endmodule
