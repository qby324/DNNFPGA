`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:25:27 07/30/2013
// Design Name:   NN
// Module Name:   C:/haru/HMM-viterbi/Test_nn.v
// Project Name:  HMM-viterbi
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NN
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_SPM0405HD4H;

	// Inputs
	reg clk;
	reg reset;
	reg sclk;
	reg dat_i;

	// Outputs
	wire dv;
	wire signed [15:0] dat_o;

	// Instantiate the Unit Under Test (UUT)
	SPM0405HD4H uut (
			.clk(clk),
			.reset(reset),
			.sclk(sclk),
			.dat_i(dat_i),
			.dv(dv),
	.dat_o(dat_o));

	// クロック
	//動作周波数 1MHz:1000 1.2MHz: 2MHz:500 5MHz:200 10MHz:100 50MHz:20 (1/clock *1,000,000,000)
	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clk<=~clk;
	end

	parameter STEP_2M = 500;
	parameter STEP_2M_half=250;
	always begin
		#STEP_2M_half;
		sclk<=~sclk;
	end
	
	// 実データ
	parameter STEP_input = STEP_2M;
	reg [31:0] tmp=0;
	always begin

		#STEP_2M;
		tmp<=$random;
		dat_i<=tmp[0];

	end
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		sclk = 0;
		dat_i = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
		
	end
      
endmodule

