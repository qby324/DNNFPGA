`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:31:55 01/14/2015
// Design Name:   multiplier
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_multi.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_multi;

	// Inputs
	reg signed[19:0] a;
	reg signed[13:0] b;

	// Outputs
	wire [15:0] p;

	// Instantiate the Unit Under Test (UUT)
	multiplier uut (
		.a(a), 
		.b(b), 
		.p(p)
	);
	
	reg signed [15:0]c = 507;
	reg signed [9:0]tmp = -306;
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a=-16384;
		b=7753;
		#20;
		a= 683;
		b=-5234;
		
		c = c + (~tmp + 1);
        
		// Add stimulus here

	end
      
endmodule

