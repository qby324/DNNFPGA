`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:19 09/08/2014 
// Design Name: 
// Module Name:    HMM_1 
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
module HMM_1(clk,reset, x_i,write, result_dv, result);
   input clk;			
   input reset;
   input signed [15:0] x_i;	  // input data
   input 	       write;  	  // Sampling rate
   output 	       result_dv; // Data valid
   output 	       result;	  // Result(word:1,other:0)
   wire 	       result_dv; // 
   wire 	       result;    // 

//////////////////////////////////////////////////////////////////////////////
// Acoustic Feature MFCC
//////////////////////////////////////////////////////////////////////////////
   wire signed [31:0]  x_o; // Output MFCC
   wire 	       dv;
   wire [4:0] 	       x_index;
   MFCC MFCC(.clk(clk),
	     .sclk(clk),
	     .x_i(x_i), 
	     .write(write),
	     .dv_out(dv), 
	     .out_index(x_index), 
	     .x_o(x_o));
//----------------------------------------------------------------------------

//////////////////////////////////////////////////////////////////////////////
// Calc Likelihood (HMM)
//////////////////////////////////////////////////////////////////////////////
   reg 		    hmm_start=0;
   // Word Model(aka)
   wire 	       hmm_load1;
   wire 	       hmm_done1;
   wire 	       ll_dv1;
   wire signed [63:0]  ll1;
   reg 		       hmm_pop1=0;
	wire			[15:0] out_index1;
   HMM green(.clk(clk),.reset(reset),.start(hmm_start),.x_i(x_o), 
	   .load(hmm_load1),.out_index(out_index1),.dv(ll_dv1),.done(hmm_done1),.x_o(ll1));



////////////////////////////////////////////////////////////////////////////
// Viterbi Algorithm : Return "result" Word(1) or Garbage+sil(0)
////////////////////////////////////////////////////////////////////////////
   reg 		    viterbi_start=1;
   //wire viterbi_write;
   wire 	       viterbi_busy;
   //wire viterbi_dv;
   //wire viterbi_result;
   viterbi_1 #(.STATE(3),.BAND(32))
   viterbi (.clk(clk),.reset(reset),.start(viterbi_start),.out_index(out_index1),
	    .x_i(ll1[31:0]),.write(ll_dv1),.busy(viterbi_busy),.dv(result_dv),.result(result));
   
//--------------------------------------------------------------------------


//////////////////////////////////////////////////////////////////////////////
// Management of each module
//////////////////////////////////////////////////////////////////////////////
   always@(posedge clk)begin
      if(dv==1)begin
	 hmm_start<=1;
      end
      if(hmm_done1==1)begin
	 hmm_start<=0;
      end
      
      if(ll_dv1==1)begin
	 viterbi_start<=1;
      end else begin
	 if(result_dv==1)begin
	    viterbi_start<=0;
	 end
      end
      
   end
//----------------------------------------------------------------------------


endmodule
