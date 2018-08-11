`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:58:16 01/04/2015
// Design Name:   log2_10bit
// Module Name:   C:/.Xilinx/MFC_REC/testlog.v
// Project Name:  MFC_REC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: log2_10bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testlog;

	// Inputs
	reg clk;
	reg start;
	reg [63:0] indata;

	// Outputs
	wire [20:0] outdata;
	wire dv;

	// Instantiate the Unit Under Test (UUT)
	log2_10bit uut (
		.clk(clk), 
		.start(start), 
		.indata(indata), 
		.outdata(outdata), 
		.dv(dv)
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
		start = 0;
		indata = 548674;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		start = 1;

	end
      
endmodule

