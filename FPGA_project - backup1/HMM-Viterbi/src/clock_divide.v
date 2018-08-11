`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:42:46 06/11/2012 
// Design Name: 
// Module Name:    clock_divide 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//	Clock Divide Module
//
//
//      clk_div[Hz] = clock[Hz] / DIVCOUNT
//      DIVCOUNT: divide value
//      AWIDTH:   divcount bit width(ex. DIVCOUNT=7,AWIDTH=3)
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divide #(parameter DIVCOUNT=2,AWIDTH=20) (clk,clk_div);
   input clk;                      //!< Source Clock
   output clk_div;                 //!< Divided Clock
   reg 	  clk_div=0;
   reg [AWIDTH-1:0] clk_div_cnt=0; //!< Divide counter

   always@(posedge clk) begin

      if(DIVCOUNT[0]==0)begin //!< odd or even
	 if(clk_div_cnt==DIVCOUNT[31:1]-1)begin
	    clk_div<=~clk_div;
	    clk_div_cnt<=0;
	 end else begin
	    clk_div_cnt<=clk_div_cnt+1;
	 end
      end else begin
	 if(clk_div_cnt==DIVCOUNT[31:1]-1 & clk_div==1)begin
	    clk_div<=0;
	    clk_div_cnt<=0;
	 end else if(clk_div_cnt==DIVCOUNT[31:1])begin
	    clk_div<=1;
	    clk_div_cnt<=0;
	 end else begin
	    clk_div_cnt<=clk_div_cnt+1;
	 end
      end
   end

endmodule
