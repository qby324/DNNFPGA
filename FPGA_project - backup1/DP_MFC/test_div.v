`timescale 10ns / 10ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:58 12/18/2014
// Design Name:   div_gen_v4_0
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_div.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: div_gen_v4_0
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_div;

	// Inputs
	reg clk;
	reg aclk;
	reg s_axis_divisor_tvalid;
	reg s_axis_dividend_tvalid;
	reg [31:0] s_axis_divisor_tdata;
	reg [31:0] s_axis_dividend_tdata;

	// Outputs
	wire s_axis_divisor_tready;
	wire s_axis_dividend_tready;
	wire m_axis_dout_tvalid;
	wire [47:0] m_axis_dout_tdata;

	// Instantiate the Unit Under Test (UUT)
	div_gen_v4_0 uut (
		.aclk(aclk), 
		.s_axis_divisor_tvalid(s_axis_divisor_tvalid), 
		.s_axis_dividend_tvalid(s_axis_dividend_tvalid), 
		.s_axis_divisor_tready(s_axis_divisor_tready), 
		.s_axis_dividend_tready(s_axis_dividend_tready), 
		.m_axis_dout_tvalid(m_axis_dout_tvalid), 
		.s_axis_divisor_tdata(s_axis_divisor_tdata), 
		.s_axis_dividend_tdata(s_axis_dividend_tdata), 
		.m_axis_dout_tdata(m_axis_dout_tdata)
	);

	parameter STEP = 2;
	parameter STEP_half=1;
	always begin
		#STEP_half;
		aclk<=~aclk;
	end
	
	
	parameter MEANMUL = 1024/IDIM;
	parameter IDIM = 26;
	
	initial begin
		// Initialize Inputs
		aclk = 0;
		s_axis_divisor_tvalid = 0;
		s_axis_dividend_tvalid = 0;
		#60
		s_axis_divisor_tvalid = 1;
		s_axis_dividend_tvalid = 1;
		s_axis_divisor_tdata = 909312;
		s_axis_dividend_tdata = 910336;
		
		
		

		// Wait 100 ns for global reset to finish
		#100;
		s_axis_divisor_tvalid = 0;
		s_axis_dividend_tvalid = 0;

        
		// Add stimulus here

	end
      
endmodule

