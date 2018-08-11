`timescale 10ns / 10ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:53:09 01/17/2015
// Design Name:   MFCC
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_dnndp.v
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

module test_dnndp;

	// Inputs
	reg clk;
	reg [15:0] x_i;
	reg write;

	// Outputs
	wire [31:0] mfc_o;
	wire [4:0] mfc_index;
	wire mfc_dv;
	wire vad_in;

	// Instantiate the Unit Under Test (UUT)
	MFCC uut (
		.clk(clk), 
		.sclk(clk), 
		.x_i(x_i), 
		.write(write), 
		.x_o(mfc_o), 
		.out_index(mfc_index), 
		.dv_out(mfc_dv), 
		.vad(vad_in)
	);
	
	wire signed [10:0] dnn_o;
	wire dnn_dv;

	// Instantiate the Unit Under Test (UUT)
	DNN_main DNN_main (
		.clk(clk), 
		.reset(reset), 
		.vec_in(mfc_o), 
		.dv_in(mfc_dv), 
		.vec_out(dnn_o), 
		.dv_out(dnn_dv)
	);	
	
   wire dp_dv;
	wire vad_out;
	wire active_frame;
	
	DP_main #(.BIT(11),	.HPENALTY(0),	.VPENALTY(0),	.DETECTED(65536),	.TMPSIZE(35) )
		DP_main(
			.clk(clk),
			.reset(reset), 
			.vec_in(dnn_o),
			.dv_in(dnn_dv),
			.vad_in(mfc_vad),
			.result_dv(dp_dv), 
			.result(active_frame),
			.vad_out(vad_out)
			);

	parameter STEP = 2;
	parameter STEP_half=1;
	always begin
		#STEP_half;
		clk<=~clk;
	end
	
	parameter STEP_data=625;
	parameter STEP_data_half=312;
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

	initial begin
		// Initialize Inputs
		clk = 1;
		x_i = 0;
		write = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

