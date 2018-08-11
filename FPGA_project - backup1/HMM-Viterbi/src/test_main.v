`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:19:49 07/26/2013
// Design Name:   main
// Module Name:   C:/haru/HMM-viterbi/test_main.v
// Project Name:  HMM-viterbi
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_main;

	// Inputs
	reg clk;
	reg P_SDATA;

	// Outputs
	wire P_SCLK;
	wire P_nCS;
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.P_SDATA(P_SDATA), 
		.P_SCLK(P_SCLK), 
		.P_nCS(P_nCS), 
		.led(led)
	);

	// ÉNÉçÉbÉN
	parameter STEP = 500; //1MHz (1/clock *1,000,000,000)
	always begin
	
		#STEP;
		clk<=~clk;
	
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		P_SDATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

