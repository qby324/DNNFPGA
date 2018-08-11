`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:45:11 01/06/2015
// Design Name:   inv_sqrt
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_sqrt.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: inv_sqrt
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_sqrt;

	// Inputs
	reg clk;
	reg dv_i;
	reg [31:0] sq_i;

	// Outputs
	wire dv_o;
	wire [9:0] isrt_o;

	// Instantiate the Unit Under Test (UUT)
	inv_sqrt uut (
		.clk(clk), 
		.dv_i(dv_i), 
		.sq_i(sq_i), 
		.dv_o(dv_o), 
		.isrt_o(isrt_o)
	);
	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clk<=~clk;
	end

	always@ (dv_o)begin
		dv_i <= 0;
		#100;
		sq_i <= sq_i +8;
		dv_i <= 1;
	end
	
	reg signed [2:0] test =0;
	reg [31:0] magicnum = 1597463040;
	reg [31:0] bitsign = 1129141707;
	reg [17:0] m1;
	reg [17:0] m2;
	

	initial begin
		// Initialize Inputs
		clk = 0;
		dv_i = 1;
		sq_i = 4000;
		
		m1 = magicnum[31:14];
		m2 = bitsign[31:14];
		
		mul_inA = 0;
		mul_inB = 0;
		
		test = 3'b111;
		// Wait 100 ns for global reset to finish
		#100;
       
		test = 3'b011;
		// Add stimulus here

	end
      
endmodule

