`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:06 12/22/2014 
// Design Name: 
// Module Name:    recwav 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module recwav(clk,dv_in,in,out
    );
	input clk;
	input dv_in;
	input signed [15:0]in;
	output [2559:0]out;
	
	reg [1279:0]out;
	
	reg done = 0;
	reg [15:0] wav[0:159];
	reg [7:0] i = 0;
	reg [11:0] j = 0;
	
	always@ (posedge clk)
	begin
		if (dv_in)
		begin
			wav[i] <= in;
			if (i == 159)
			begin
				i <= 0;
				done <= 1;
			end else begin
				i <= i + 1;
			end
		end
		
		if (done)
		begin
			out [i+15] <= dv_in; //zhu
		end

	end

endmodule
