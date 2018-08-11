`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:31:30 01/14/2015
// Design Name:   MultAccum
// Module Name:   C:/.Xilinx/HMM-Viterbi/tes_mac.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MultAccum
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tes_mac;

	// Inputs
	reg clk;
	reg ce;
	reg sclr;
	reg signed [16:0] a;
	reg signed [13:0] b;

	// Outputs
	wire signed [22:0] s;

	// Instantiate the Unit Under Test (UUT)
	MultAccum uut (
		.clk(clk), 
		.ce(ce), 
		.sclr(sclr), 
		.a(a), 
		.b(b), 
		.s(s)
	);

	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clk<=~clk;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		ce = 0;
		sclr = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#10
		ce = 1;
		a = 900;
		b = 10000;
		#20;
		a = -768;
		b = 80000;
		#20;
		a = 0;
		b = 0;
		#20;
		ce = 0;
      #100;
		ce = 1;
		sclr = 1;
		#20;
		ce = 0;
		sclr = 0;
		// Add stimulus here

	end
      
endmodule

