`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:24:09 01/09/2015 
// Design Name: 
// Module Name:    BRAM_test5 
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
module BRAM_test5 #(parameter DWIDTH=21,AWIDTH=5,WORDS=24) (clk, write, addr, indata, outdata);

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

   initial begin;
mem[0]=241930;
mem[1]=214839;
mem[2]=204812;
mem[3]=192254;
mem[4]=198471;
mem[5]=198393;
mem[6]=201124;
mem[7]=200092;
mem[8]=200613;
mem[9]=203709;
mem[10]=199573;
mem[11]=206642;
mem[12]=203402;
mem[13]=204491;
mem[14]=208220;
mem[15]=207979;
mem[16]=206846;
mem[17]=210129;
mem[18]=215226;
mem[19]=214922;
mem[20]=218212;
mem[21]=221289;
mem[22]=221116;
mem[23]=230322;

   end

endmodule
