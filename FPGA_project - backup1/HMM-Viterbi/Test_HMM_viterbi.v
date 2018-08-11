`timescale 10ns / 10ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:38 01/21/2014
// Design Name:   HMM_viterbi
// Module Name:   /work2/haruka/HMM-V/Test_HMM_viterbi.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HMM_viterbi
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_HMM_viterbi;

	// Inputs
	reg clk;
//	reg reset;
	reg [15:0] x_i;
	reg write;
/*
   wire signed [31:0]  x_o; // Output MFCC
   wire 	       dv;
   wire [4:0] 	       x_index;
	MFCC MFCC(.clk(clk),
	     .sclk(clk),
	     .x_i(x_i), 
	     .write(write),
	     .dv_out(dv), 
	     .out_index(x_index), 
	     .x_o(x_o));
//---------------------
*/


/*
	// Outputs
	wire result_dv;
	wire result;



	// Instantiate the Unit Under Test (UUT)
	HMM_viterbi uut (
		.clk(clk), 
		.reset(reset), 
		.x_i(x_i), 
		.write(write), 
		.result_dv(result_dv), 
		.result(result)
	);
*/

   wire 	      dv;
//   wire [1:0] 	      active_frame;	
	wire active_frame;
	
		DP_main DP_main(
			.clk(clk),
			.reset(reset), 
			.x_i(x_i),
			.write(write),
			.result_dv(dv), 
			.result(active_frame)
			);
			
			
	/* Global Clock */
	parameter STEP = 2;
	parameter STEP_half=1;
	always begin
		#STEP_half;
		clk<=~clk;
	end

	reg signed [31:0]tmp = 32'b_1111_1111_1111_1100_0011_0110_1110_1110;
	reg signed [32:0]tmp3 = 32'b_1111_1111_1111_1100_0011_0110_1110_1110;
	reg [31:0] tmp2;

	parameter STEP_data=6250;
	parameter STEP_data_half=3125;
	reg signed [15:0] counter=0;
	always begin
		#STEP_data;
		x_i<=counter;
		counter<=counter+1;
	end
	parameter STEP_write=STEP_data-STEP;
	always begin
		#STEP_write;
		write<=1;
		#STEP;
		write<=0;
	end
	
//	parameter NTYPE =1;
//	reg ntype = 0;
	initial begin
		// Initialize Inputs
		clk = 0;
//		reset = 1;
		x_i = 0;
		write = 0;
		tmp2 = $unsigned(~tmp + 1);
		// Wait 100 ns for global reset to finish
		
		
//		if (NTYPE == 1)
//		begin
//			ntype <= 1;
//		end
		#10;
        
		// Add stimulus here

	end
      
endmodule

