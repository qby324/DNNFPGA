`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:34:49 01/12/2015
// Design Name:   DNN_norm
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_norm.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DNN_norm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_norm;

	// Inputs
	reg clk;
	reg dv_i;
	reg [25:0] vec_in;

	// Outputs
	wire dv_o;
	wire [12:0] vec_o;
	wire [7:0] index_o;

	// Instantiate the Unit Under Test (UUT)
	DNN_norm uut (
		.clk(clk), 
		.dv_i(dv_i), 
		.vec_i(vec_in), 
		.dv_o(dv_o), 
		.vec_o(vec_o), 
		.index_o(index_o)
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
		dv_i = 0;
		vec_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
			dv_i = 1;
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
			dv_i = 0;
			#4000;

			dv_i = 1;
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
			dv_i = 0;
			#4000;
			
						dv_i = 1;
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
			dv_i = 0;
			#4000;
			
						dv_i = 1;
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
			dv_i = 0;
			#4000;
			
			dv_i = 1;
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
			dv_i = 0;
			#4000;


			vec_in = 190660;
			#20;
			vec_in = 2768;
			#20;
			vec_in = 8863;
			#20;
			vec_in = 12648;
			#20;
			vec_in = -6488;
			#20;
			vec_in = 16580;
			#20;
			vec_in = -35110;
			#20;
			vec_in = -28852;
			#20;
			vec_in = -12042;
			#20;
			vec_in = -17055;
			#20;
			vec_in = -29032;
			#20;
			vec_in = -8355;
			#20;
			vec_in = 1081;
			#20;
			vec_in = 2703;
			#20;
			dv_i = 0;

		// Add stimulus here

	end
      
endmodule

