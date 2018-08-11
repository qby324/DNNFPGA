`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:52:27 01/17/2013 
// Design Name: 
// Module Name:    align 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//   2 Input, 1output
// "input"
// xxxxxxx
// yyyyyyy
//
// "output"
// xxxxxxxyyyyyyy
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module align #(parameter ROMSIZE=2)(clk, x_i1, x_i2, write, x_o, dv,done);
    input clk;
    input signed [31:0] x_i1;
    input signed [31:0] x_i2;
    input write;
    output signed [31:0] x_o;
    output dv;
    output done;
	 reg signed [31:0] x_o=0;
	 reg dv=0;
	 reg done=0;

	reg switch=0;
	reg [4:0] pos=0;
	reg signed [31:0] rom1 [0:ROMSIZE-1];
	reg signed [31:0] rom2 [0:ROMSIZE-1];

	integer i=0;
	initial begin
		for(i=0;i<ROMSIZE;i=i+1)begin
			rom1[i]=0;
			rom2[i]=0;
		end
	end

always@(posedge clk)begin

	if(done == 1)begin

	// Complete Data for ROMSIZE, and start output data
		if(switch==0)begin
			dv<=1;
			if(pos==ROMSIZE-1)begin
				pos<=0;
				switch<=1;
			end else begin
				pos<=pos+1;
			end
			x_o<=rom1[pos];
		end else begin
			if(pos==ROMSIZE)begin
			// Done output
				switch<=0;
				dv<=0;
				pos<=0;
				done<=0;
			end else begin
				pos<=pos+1;
				x_o<=rom2[pos];
			end
		end
		
	 	end else if(pos == ROMSIZE && done == 0)begin
		done<=1;
		dv<=0;
		pos<=0;
		switch<=0;
	end else begin
	// loading input data
		if(write==1)begin
			rom1[pos]<=x_i1;
			rom2[pos]<=x_i2;
			pos<=pos+1;
		end

	end

end


endmodule
