`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:48:34 12/21/2014
// Design Name:   softmax
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_softmax.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: softmax
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_softmax;

	// Inputs
	reg clk;
	reg dv_in;
	reg [19:0] sofin;

	// Outputs
	wire dv_out;
	wire [10:0] sofout;

	// Instantiate the Unit Under Test (UUT)
	softmax uut (
		.clk(clk), 
		.dv_in(dv_in), 
		.dv_out(dv_out), 
		.sofin(sofin), 
		.sofout(sofout)
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
		dv_in = 0;
		sofin = 0;
		#1000;
		dv_in = 1;
		sofin = 8*667;
		#20;
		sofin = 8*286;
		#20;
		sofin = 8*502;
		#20;
		sofin = 8*846;
		#20;
		sofin = 8*113;
		#20;
		sofin = 8*454;
		#20;
		sofin = 8*870;
		#20;
		sofin = 8*568;
		#20;
		sofin = 8*389;
		#20;
		sofin = 8*408;
		#20;
		sofin = 8*884;
		#20;
		sofin = 8*763;
		#20;
		sofin = 8*6;
		#20;
		dv_in = 0;
		
		#5000;
		dv_in = 1;
		sofin = 667;
		#20;
		sofin = 286;
		#20;
		sofin = 502;
		#20;
		sofin = 846;
		#20;
		sofin = 113;
		#20;
		sofin = 454;
		#20;
		sofin = 870;
		#20;
		sofin = 568;
		#20;
		sofin = 389;
		#20;
		sofin = 408;
		#20;
		sofin = 884;
		#20;
		sofin = 763;
		#20;
		sofin = 6;
		#20;
		dv_in = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

