`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Chiba University
// Engineer: Harua N.
// 
// Create Date:    16:52:37 01/08/2012 
// Design Name:	 BRAM
// Module Name:    BRAM 
// Project Name:  MASTER
// Target Devices: any
// Tool versions: any
// Description:
//	
// BRAM #(.DWIDTH(16),.AWIDTH(10),.WORDS(1024)) 
//  RINGBUFFER(.clk(clk),.write(write),.addr(index),.indata(indata),.outdata(outdata));
// 
// DWIDTH: BRAM Data width
// AWIDTH: BRAM Adress width
// WORDS:  BRAM Word Size
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BRAM #(parameter DWIDTH=40,AWIDTH=9,WORDS=512) (clk, write, addr, indata, outdata);

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

   integer i;
   initial begin
      for(i=0;i<WORDS;i=i+1)
	mem[i]=0;
   end

endmodule
