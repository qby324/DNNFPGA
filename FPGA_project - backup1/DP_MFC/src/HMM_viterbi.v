`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:07 07/13/2012 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//	Execute viterbi algorithm with using HMM likelihood
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
///////////////////////////////////////////////////////////////////////////////
module HMM_viterbi(clk,reset, x_i,write, result_dv, result);
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
   reg 		       hmm_start=0;
   // Word Model
   wire 	       hmm_load1;
   wire 	       hmm_done1;
   wire 	       ll_dv1;
   wire signed [63:0]  ll1;
   reg 		       hmm_pop1=0;
   HMM HMM(.clk(clk),.reset(reset),.start(hmm_start),.x_i(x_o), 
	   .load(hmm_load1),.dv(ll_dv1),.done(hmm_done1),.x_o(ll1));
   
   // Garbage Model
   wire 	       hmm_load2;
   wire 	       hmm_done2;
   wire 	       ll_dv2;
   wire signed [63:0]  ll2;
   reg 		       hmm_pop2=0;
   gbHMM gbHMM(.clk(clk),.reset(reset),.start(hmm_start),.x_i(x_o), 
	       .load(hmm_load2),.dv(ll_dv2),.done(hmm_done2),.x_o(ll2));

   // Sil Model
   wire 	       hmm_load3;
   wire 	       hmm_done3;
   wire 	       ll_dv3;
   wire signed [63:0]  ll3;
   reg 		       hmm_pop3=0;
   silHMM silHMM(.clk(clk),.reset(reset),.start(hmm_start),.x_i(x_o), 
		 .load(hmm_load3),.dv(ll_dv3),.done(hmm_done3),.x_o(ll3));

//----------------------------------------------------------------------------


////////////////////////////////////////////////////////////////////////////
// Viterbi Algorithm : Return "result" Word(1) or Garbage+sil(0)
////////////////////////////////////////////////////////////////////////////
   reg 		       viterbi_start=1;
   //wire viterbi_write;
   wire 	       viterbi_busy;
   //wire viterbi_dv;
   //wire viterbi_result;
   viterbi #(.STATE(12),.BAND(32))
   viterbi (.clk(clk),.reset(reset),.start(viterbi_start),
	    .x_i1(ll1[31:0]),.x_i2(ll2[31:0]),.x_i3(ll3[31:0]),
	    .write(ll_dv1),.busy(viterbi_busy),.dv(result_dv),.result(result));
   
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
      
      if(ll_dv==1)begin
	 viterbi_start<=1;
      end else begin
	 if(result_dv==1)begin
	    viterbi_start<=0;
	 end
      end
      
   end
//----------------------------------------------------------------------------

endmodule
