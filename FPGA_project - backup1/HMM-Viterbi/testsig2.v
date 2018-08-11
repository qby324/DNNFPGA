`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:43:19 01/27/2015
// Design Name:   sigmoid2
// Module Name:   C:/.Xilinx/HMM-Viterbi/testsig2.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sigmoid2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testsig2;

	// Inputs
	reg clk;
	reg dv_in;
	reg [31:0] sigin;

	// Outputs
	wire dv_out;
	wire [10:0] sigout;
	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clk<=~clk;
	end
	// Instantiate the Unit Under Test (UUT)
	sigmoid2 uut (
		.clk(clk), 
		.dv_in(dv_in), 
		.dv_out(dv_out), 
		.sigin(sigin), 
		.sigout(sigout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		dv_in = 0;
		sigin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		dv_in = 1;
		sigin = 4032;
        
		// Add stimulus here

	end
      
endmodule

