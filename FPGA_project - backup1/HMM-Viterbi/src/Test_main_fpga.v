`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:05:26 09/26/2013
// Design Name:   main
// Module Name:   C:/haru/NNsp/Test_main_fpga.v
// Project Name:  NNsp
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

module Test_main_fpga;

	// Inputs
	reg clk;
	reg dat_i;

	// Outputs
	wire sclk;
	wire led1;
	wire led2;
	wire led3;
	wire beep;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.dat_i(dat_i), 
		.sclk(sclk), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3),
		.beep(beep)
	);

	//!	Global Clock
	//!	1MHz:1000 1.2MHz: 2MHz:500 5MHz:200 10MHz:100 50MHz:20 
	//!	(1/clock *1,000,000,000)
	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clk<=~clk;
	end

	reg [31:0] tmp=0;
	parameter STEP_2M=500;
	always begin
		#STEP_2M;
		tmp<=$random;
		dat_i<=tmp[0];
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		dat_i = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

