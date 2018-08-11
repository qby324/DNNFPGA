`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:18:14 12/19/2014
// Design Name:   sigmoid
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_sigmoid.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sigmoid
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_sigmoid;

	// Inputs
	reg clk;
	reg dv_in;
	reg signed[31:0] sigin;

	// Outputs
	wire dv_out;
	wire signed [10:0] sigout;

	// Instantiate the Unit Under Test (UUT)
	sigmoid uut (
		.clk(clk), 
		.dv_in(dv_in), 
		.dv_out(dv_out), 
		.sigin(sigin), 
		.sigout(sigout)
	);

	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clk<=~clk;
	end

	reg signed [31:0] test1;
	reg signed [15:0] test2;

	reg signed [28:0] divisor = {7'b1100010,22'b0};	// divisor = 98

	initial begin
		// Initialize Inputs
		clk = 0;
		dv_in = 0;
		sigin = -3317;
		test2 = 1024;
		test1 = test2;
		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here
		dv_in = 1;
	end
      
endmodule

