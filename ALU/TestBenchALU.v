`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:46:21 12/31/2022
// Design Name:   ALU
// Module Name:   F:/Computer Architecture/Project/TestBenchALU.v
// Project Name:  Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBenchALU;

	// Inputs
	reg [31:0] value1;
	reg [31:0] value2;
	reg [5:0] opcode;
	reg [5:0] func;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.value1(value1), 
		.value2(value2), 
		.opcode(opcode), 
		.func(func), 
		.result(result)
	);
	
	initial begin
		// Initialize Inputs
		value1 = 2;
		value2 = 3;
		opcode = 0;
		func = 32;
		#100;
		
		value1 = 2;
		value2 = 3;
		opcode = 0;
		func = 33;
		#100;
		
		value1 = 2;
		value2 = 3;
		opcode = 0;
		func = 37;
		#100;
		
		value1 = 2;
		value2 = 3;
		opcode = 0;
		func = 36;
		#100;
		
		value1 = 2;
		value2 = 3;
		opcode = 0;
		func = 24;
		#100;
		
		value1 = 2;
		value2 = 3;
		opcode = 8;
		func = 0;
		#100;
		
		value1 = 2;
		value2 = 3;
		opcode = 9;
		func = 0;
		#100;
        
		value1 = 2;
		value2 = 3;
		opcode = 12;
		func = 0;
		#100;
		
		value1 = 2;
		value2 = 3;
		opcode = 9;
		func = 0;
		#100;
		
		value1 = 2;
		value2 = 3;
		opcode = 13;
		func = 0;
		#100;
		// Add stimulus here

	end
      
endmodule

