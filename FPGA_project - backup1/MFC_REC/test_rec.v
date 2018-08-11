`timescale 10ns / 10ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:36:49 11/12/2014
// Design Name:   MFCC
// Module Name:   C:/.Xilinx/MFC_REC/test_rec.v
// Project Name:  MFC_REC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MFCC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_rec;

	// Inputs
	reg clk;
	reg [15:0] x_i;
	reg write;

	// Outputs
	wire [31:0] x_o;
	wire [4:0] out_index;
	wire dv_out;
	wire vad;

	// Instantiate the Unit Under Test (UUT)
	MFCC uut (
		.clk(clk), 
		.sclk(clk), 
		.x_i(x_i), 
		.write(write), 
		.x_o(x_o), 
		.out_index(out_index), 
		.dv_out(dv_out), 
		.vad(vad)
	);

	wire vad_out;
	wire max;
	wire [31:0] dat_out;
	
//	rec_dim rec_dim(.clk(clk),	.dv(dv_out),	.x_o(x_o),	.vad_in(vad),	.vad_out(vad_out),
//				.max(max),	.dat_out(dat_out)
//    );


	/* Global Clock */
	parameter STEP = 2;
	parameter STEP_half=1;
	always begin
		#STEP_half;
		clk<=~clk;
	end


	parameter STEP_data=6250;
	parameter STEP_data_half=3125;
	reg signed [15:0] counter=0;
	always begin
		#STEP_data;
		x_i<=counter;
		counter<=counter+1;
	end
	parameter STEP_write=STEP_data-STEP;
	always begin
		#STEP_write;
		write<=1;
		#STEP;
		write<=0;
	end

	reg signed [31:0]tmp1 = -539738977;
	reg [31:0]tmp2;
//	assign tmp2 = ~tmp1 + 1;
	
	reg [2:0] test1 [7:0];
	reg [23:0] test2 = 0;

	initial begin
		// Initialize Inputs
		clk = 0;
		x_i = 0;
		write = 0;
		
		test1[0] = 0;
		test1[1] = 1;
		test1[2] = 2;
		test1[3] = 3;
		test1[4] = 4;
		test1[5] = 5;
		test1[6] = 6;
		test1[7] = 7;
		
		
		test2 <= {test1[7],test1[6],test1[5],test1[4],test1[3],test1[2],test1[1],test1[0]};
		tmp2 <= ~tmp1 + 1;
		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		
	end
      
endmodule

