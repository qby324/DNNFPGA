`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:38 11/19/2014 
// Design Name: 
// Module Name:    DP_multi 
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
module DP_multi#(parameter SWIDTH=64,LWIDTH=7)(
		input clk,
		input signed [SWIDTH-1:0] indataS,
		input signed [LWIDTH-1:0] indataL,
		output signed [SWIDTH+LWIDTH-1:0] outdataX
    );
	assign outdataX =indataS * indataL;
endmodule
