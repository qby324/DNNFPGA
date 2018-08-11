`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:13:35 01/14/2015
// Design Name:   BRAM_node
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_bram1.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BRAM_node
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bram1;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [5:0] addra;
	reg [15:0] dina;

	// Outputs
	wire [15:0] douta;

	// Instantiate the Unit Under Test (UUT)
	BRAM_node uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);
	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clka<=~clka;
	end
	
	initial begin
		// Initialize Inputs
		clka = 1;
		wea = 0;
		addra = 0;
		dina = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		addra = 0;
		dina = 55423;
		wea = 1;
		
		#20;
		wea = 0;
		addra = 1;
		dina = 30000;
		#20
		addra = 0;
		#20
		wea = 1;
		#20
		wea = 0;
		
        
		// Add stimulus here

	end
      
endmodule

