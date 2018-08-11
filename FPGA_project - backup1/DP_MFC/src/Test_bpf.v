`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:23:18 09/18/2013
// Design Name:   BPF
// Module Name:   C:/haru/mictest/test_BPF.v
// Project Name:  mictest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BPF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_BPF;

	// Inputs
	reg clk;
	reg dat_i;

	// Outputs
	wire led1;
	wire led2;
	wire led3;
	wire beep;
	wire sclk;
	
	// Instantiate the Unit Under Test (UUT)
	mictest uut (
		.clk(clk), 
		.sclk(sclk), 
		.dat_i(dat_i), 
		.led1(led1),
		.led2(led2),
		.led3(led3),
		.beep(beep)
	);

	//*	Global Clock	*//
	parameter STEP = 10; //2MHz (1/clock *1,000,000,000)/2
	always begin
		#STEP;
		clk<=~clk;
	end
	
	parameter STEP_S = 500; //2MHz (1/clock *1,000,000,000)/2
	integer tmp=0;
	/*
	always@(posedge sclk)begin

		tmp<=$random;
		dat_i<=tmp[0];
	
	end
	*/
	initial begin
		// Initialize Inputs
		clk = 0;
		dat_i = 0;

		// Wait 100 ns for global reset to finish
		#200;
        
		// Add stimulus here
		`include "src/dat_i.dat"
	end
      
endmodule

