`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:01:01 12/31/2022
// Design Name:   ControlUnit
// Module Name:   F:/Computer Architecture/Project/CUTB.v
// Project Name:  Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CUTB;

	// Inputs
	reg [5:0] opcode;
	reg [5:0] func;

	// Outputs
	wire RegDst;
	wire ALUSrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemWrite;
	wire Jump;
	wire [2:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemWrite(MemWrite), 
		.Jump(Jump), 
		.ALUOp(ALUOp), 
		.opcode(opcode), 
		.func(func)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		func = 24;
		#100;
		// Wait 100 ns for global reset to finish
		opcode = 0;
		func = 32;
		#100;
		
		opcode = 0;
		func = 33;
		#100;
		
		opcode = 0;
		func = 36;
		#100;
        
		opcode = 0;
		func = 37;
		#100;
		
		opcode = 2;
		func = 0;
		#100;
		
		opcode = 8;
		func = 0;
		#100;
		
		opcode = 9;
		func = 0;
		#100;
		
		opcode = 12;
		func = 0;
		#100;
		
		opcode = 13;
		func = 0;
		#100;
		// Add stimulus here

	end
      
endmodule

