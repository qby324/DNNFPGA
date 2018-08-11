`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:53:22 11/26/2014
// Design Name:   floating_point_v6_1
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_float.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: floating_point_v6_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_float;

	// Inputs
	reg aclk;
	reg s_axis_a_tvalid;
	reg [31:0] s_axis_a_tdata;

	// Outputs
	wire m_axis_result_tvalid;
	wire [31:0] m_axis_result_tdata;

	// Instantiate the Unit Under Test (UUT)

	parameter STEP = 2;
	parameter STEP_half=1;
	always begin
		#STEP_half;
		aclk<=~aclk;
	end
	always begin
		#100;
		s_axis_a_tvalid = ~s_axis_a_tvalid;
	end
	
	reg signed [3:0]a = ; 

	initial begin
		// Initialize Inputs
		aclk = 0;
		s_axis_a_tvalid = 0;
		s_axis_a_tdata = 200;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

