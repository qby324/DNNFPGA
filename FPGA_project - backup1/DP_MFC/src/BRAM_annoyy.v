`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:11:53 01/08/2015 
// Design Name: 
// Module Name:    BRAM_annoyy 
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
module BRAM_annoyy #(parameter DWIDTH=30,AWIDTH=9,WORDS=400) (clk, write, addr, indata, outdata);

   input clk,write;
   input [AWIDTH-1:0] addr;
   input [DWIDTH-1:0] indata;
   output signed [DWIDTH-1:0] outdata;
   reg signed [DWIDTH-1:0]    outdata;
   reg signed [DWIDTH-1:0]    mem [0:WORDS-1];

   always @(posedge clk)
     begin
	if(write) mem[addr] <= indata;
	outdata <= mem[addr];
     end

   initial begin
	`include "wavtest.txt"
   end

endmodule
