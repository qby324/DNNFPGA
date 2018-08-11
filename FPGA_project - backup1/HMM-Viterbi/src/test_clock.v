`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:56:29 09/20/2013
// Design Name:   clock_divide
// Module Name:   C:/haru/NNsp/test_clock.v
// Project Name:  NNsp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divide
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_clock;

	// Inputs
	reg clk;

	// Outputs
	wire clk_div;

	// Instantiate the Unit Under Test (UUT)
	clock_divide#(.DIVCOUNT(25)) uut (
		.clk(clk), 
		.clk_div(clk_div)
	);

	// ÉNÉçÉbÉN
	//ìÆçÏé¸îgêî 1MHz:1000 1.2MHz: 2MHz:500 5MHz:200 10MHz:100 50MHz:20 (1/clock *1,000,000,000)
	parameter STEP = 200;
	parameter STEP_half=100;
	always begin
	
		#STEP_half;
		clk<=~clk;
	
	end
	

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

