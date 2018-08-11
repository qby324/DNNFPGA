`timescale 10ns / 10ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:46:54 11/18/2014
// Design Name:   DP_main
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_dpmain.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DP_main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_dpmain;

	// Inputs
	reg clk;
	reg reset;
	reg signed [31:0] vec_in;
	reg dv_in;
	reg vad_in;

	// Outputs
	wire result_dv;
	wire result;
	wire vad_out;

	// Instantiate the Unit Under Test (UUT)
	DP_main uut (
		.clk(clk), 
		.reset(reset), 
		.vec_in(vec_in), 
		.dv_in(dv_in), 
		.vad_in(vad_in), 
		.result_dv(result_dv), 
		.result(result), 
		.vad_out(vad_out)
	);
	
	/* Global Clock */
	parameter STEP = 2;
	parameter STEP_half=1;
	always begin
		#STEP_half;
		clk<=~clk;
	end

	parameter STEP_data=6250;
	parameter STEP_data_half=3125;
	reg signed [19:0] counter=0;
	always begin
		#STEP_data;
		counter<=counter+1;
		vec_in <= counter;
	end
	
	always begin
		#999954;
		dv_in<=1;	//d0
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d1
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d2
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d3
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d4
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d5
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d6
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d7
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d8
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d9
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d10
		#2;
		dv_in<=0;
		#2;
		dv_in<=1;	//d11
		#2;
		dv_in<=0;
	end
	
/*	reg [31:0]temp1 = -1;
	reg [23:0]temp2 = 65536;
	reg signed [31:0]tmp1 = -1;
	reg [31:0]temp3 = 0;
	reg temp4 = 0;
	reg temp5 = 0;
	reg temp6 = 0;
*/	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		vec_in = 0;
		dv_in = 0;
		vad_in = 0;
		

		//temp3 = temp1 * temp2;
		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
      
endmodule

