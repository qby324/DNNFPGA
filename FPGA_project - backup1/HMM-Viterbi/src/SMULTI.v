`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:14 02/28/2012 
// Design Name: 
// Module Name:    SMULTI 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//　とても大きなビットを扱える乗算器
//
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SMULTI#(parameter BWIDTH=64)(
		input clk,
		input signed [BWIDTH-1:0] indataA,
		input signed [BWIDTH-1:0] indataB,
		output signed [BWIDTH*2-1:0] outdataX
    );
	assign outdataX =indataA * indataB;

endmodule
