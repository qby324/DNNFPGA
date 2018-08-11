`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:04:45 01/14/2015
// Design Name:   BROM
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_brom.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BROM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_brom;

	// Inputs
	reg clk;
	reg [12:0] addra;

	// Outputs
	wire [13:0] douta;

	// Instantiate the Unit Under Test (UUT)
	BROM uut (
		.clka(clk), 
		.addra(addra), 
		.douta(douta)
	);

	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clk<=~clk;
	end
	always begin
		#STEP;
		addra<= addra + 1;
	end

	initial begin
		// Initialize Inputs
		clk = 1;
		addra = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

