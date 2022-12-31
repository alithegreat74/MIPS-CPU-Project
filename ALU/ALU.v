`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:13:18 12/31/2022 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(value1,value2,opcode,func,result
    );
	 input [31:0] value1,value2;
	 input [5:0] opcode;
	 input [5:0] func;
	 output reg [31:0] result;
	 
	 always @ (*)begin
		if(opcode==0)begin
			if(func==32)
				 result=value1+value2;
			else if(func==33)
				 result=value1-value2;
			else if(func==37)
				 result=value1|value2;
			else if(func==36)
				 result=value1&value2;
			else if(func==24)
				 result=value1*value2;
			else
				result=0;
		end
		
		else if(opcode==8)
			 result=value1+value2;
		else if(opcode==9)
			 result=value1-value2;
		else if(opcode==12)
			 result=value1&value2;
		else if(opcode==13)
			 result=value1|value2;
		else
			result=0;
	 end

endmodule
