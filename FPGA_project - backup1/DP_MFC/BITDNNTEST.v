`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:17:02 04/10/2017
// Design Name:   DNN_0117
// Module Name:   C:/Users/tslab-802-2/Desktop/newtest4/FPGA_project - backup1/DP_MFC/BITDNNTEST.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DNN_0117
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BITDNNTEST;

	// Inputs
	reg clk;
	reg reset;
	reg [19:0] vec_in;
	reg dv_in;
	reg [15:0] index2=0;	
	// Outputs
	wire [10:0] vec_out;
	wire dv_out;
	wire [15:0] outdataP;
	wire [14:0] dinV;

	// Instantiate the Unit Under Test (UUT)
	DNN_0117 uut (
		.clk(clk), 
		.reset(reset), 
		.vec_in(vec_in), 
		.dv_in(dv_in), 
		.vec_out(vec_out), 
		.dv_out(dv_out),
		.outdataP(outdataP),
		.dinV(dinV)
		
	);
always begin
		#5
		clk=~clk; 
		
		
	end
	always begin
		#10
		if(index2==20) begin 
			dv_in=1;
			index2=0;
		end
		else begin
			dv_in=0;
			index2=index2+1;
		end
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		vec_in = 0;
		dv_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

      
endmodule

