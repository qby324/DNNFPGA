`timescale 10ns / 10ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:52:24 01/08/2015
// Design Name:   MFCC
// Module Name:   C:/.Xilinx/HMM-Viterbi/src/test_MFCC.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MFCC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_MFCC;

	// Inputs
	reg clk;
	reg sclk;
	reg [15:0] x_i;
	reg write;

	// Outputs
	wire [31:0] x_o;
	wire [4:0] out_index;
	wire dv_out;
	wire vad;

	// Instantiate the Unit Under Test (UUT)
	MFCCtest uut (
		.clk(clk), 
		.sclk(clk), 
		.x_i(x_i), 
		.write(write), 
		.x_o(x_o), 
		.out_index(out_index), 
		.dv_out(dv_out), 
		.vad(vad)
	);

	parameter STEP = 2;
	parameter STEP_half=1;
	
	reg dv_tmp;
	always begin
		#STEP_half;
		clk<=~clk;
		dv_tmp <= dv_out;
/*		if (dv_tmp == 1 && dv_out == 0)begin
		write <= 1;
		#20;
		write <= 0;
		end*/
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		sclk = 0;
		x_i = 0;
		write = 0;

		// Wait 100 ns for global reset to finish
		#100;
		write = 1;
		#20;
		write = 0;
		#20000;
		write = 1;
		#20;
		write = 0;

		// Add stimulus here
	end
      
endmodule

