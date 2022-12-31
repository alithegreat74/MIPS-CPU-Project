`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:31:58 12/31/2022 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(RegDst,ALUSrc,MemtoReg,RegWrite,MemWrite,Jump,ALUOp,opcode,func
    );
	 output reg RegDst,ALUSrc,MemtoReg,RegWrite,MemWrite,Jump;
	 output reg [2:0] ALUOp;
	 input [5:0] opcode,func;
	 reg [19:0] trash;
	 initial begin
		RegDst=0;
		ALUSrc=0;
		MemtoReg=0;
		RegWrite=0;
		MemWrite=0;
		Jump=0;
	 end
	 
	 always @(*)begin
	 
		if(opcode==0)begin
			RegDst=1;
			RegWrite=1;
			ALUSrc=0;
			MemtoReg=0;
			MemWrite=0;
			Jump=0;
			if(func==36)
				ALUOp=0;
			else if(func==37)
				ALUOp=1;
			else if(func==32)
				ALUOp=2;
			else if(func==33)
				ALUOp=3;
			else if(func==24)
				ALUOp=4;
		end
		
		else if(opcode==2)begin
			RegDst=0;
			RegWrite=0;
			ALUSrc=0;
			MemtoReg=0;
			MemWrite=0;
			Jump=1;
		end

		else if(opcode==12)begin
			MemtoReg=0;
			MemWrite=0;
			Jump=0;
			ALUSrc=1;
			RegWrite=1;
			ALUOp=0;
		end
		
		else if(opcode==13)begin
			MemtoReg=0;
			MemWrite=0;
			Jump=0;
			ALUSrc=1;
			RegWrite=1;
			ALUOp=1;
		end
		
		else if(opcode==8)begin
			MemtoReg=0;
			MemWrite=0;
			Jump=0;
			ALUSrc=1;
			RegWrite=1;
			ALUOp=2;
		end
		
		else if(opcode==9)begin
			MemtoReg=0;
			MemWrite=0;
			Jump=0;
			ALUSrc=1;
			RegWrite=1;
			ALUOp=3;
		end
		
	 end

endmodule
