`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:11:20 01/12/2015
// Design Name:   DNN_main
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_dnn.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DNN_main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_dnn;

	// Inputs
	reg clk;
	reg reset;
	reg [25:0] vec_in;
	reg dv_in;

	// Outputs
	wire [10:0] vec_out;
	wire dv_out;

	// Instantiate the Unit Under Test (UUT)
	DNN_0117 uut (
		.clk(clk), 
		.reset(reset), 
		.vec_in(vec_in), 
		.dv_in(dv_in), 
		.vec_out(vec_out), 
		.dv_out(dv_out)
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
		reset = 0;
		vec_in = 0;
		dv_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
			dv_in = 1;
			vec_in = -71483;
			#20;
			vec_in = -14237;
			#20;
			vec_in = -68960;
			#20;
			vec_in = 155254;
			#20;
			vec_in = 82984;
			#20;
			vec_in = -27803;
			#20;
			vec_in = 154009;
			#20;
			vec_in = -41746;
			#20;
			vec_in = -11730;
			#20;
			vec_in = -15138;
			#20;
			vec_in = -106872;
			#20;
			vec_in = 20414;
			#20;
			dv_in = 0;       
		// Add stimulus here

	end
      
endmodule

