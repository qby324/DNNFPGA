`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:26 07/11/2012 
// Design Name: 
// Module Name:    recog
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
//	
//	
//	load==
//
//	
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// 
//
// BWIDTH			: input data size 
// MFCC_SIZE		: MFCC dimension 
// AWIDTH			: MFCC address size
//
//////////////////////////////////////////////////////////////////////////////////
module recog #(parameter BWIDTH=16,AWIDTH=5,MFCC_SIZE=12)
   (clk, reset, x_i, write, load, result, dv, done,port);
   input clk;				//!< Clock
   input reset;				//!< 0:reset 1:normal
   input signed [BWIDTH-1:0] x_i;	//!< 
   input 		     write;	//!< 
   output 		     load;	//!< 
   output [1:0] 	     result;	//!< 
   output 		     dv;	//!< 
   output 		     done;	//!< 
   output 		     port;
   reg 			     load=0;
   reg [1:0] 		     result=0;
   reg 			     dv=0;
   reg 			     done=0;
   reg 			     port=0;
   
   /*	mean MFCC */
   reg signed [BWIDTH*2-1:0] mean[0:5];
   
   /* diff*/
   reg signed [BWIDTH*2-1:0] diff=0;
   reg signed [BWIDTH*2-1:0] diff_tmp=0;
   reg signed [BWIDTH*2-1:0] diff_bfr=2**(BWIDTH*2-1)-1;
   /* input MFCC */
   reg signed [BWIDTH-1:0]   buff [0:MFCC_SIZE-1];
   reg [5:0] 		     addr_buf=0;
   
   integer 		     init_i=0;
   initial begin
      for(init_i=0;init_i<5;init_i=init_i+1)begin
	 diff[init_i]<=0;
      end
   end
   
   parameter MODEL_NUM=6;
   
   /*************************
    *	      MFCC          *
    *************************/
   always@(posedge clk)begin
`include "src/mean.v"
   end
   
   reg [4:0]i=0;
   reg [3:0] j=0;
   reg 	     beforedv=0;
   reg 	     start=0;
   reg [1:0] wait1=0;
   reg [4:0] min_model=8;
   always@(posedge clk or negedge reset)begin
      if(!reset)begin
	 /*reset*/
      end else begin
	 /*module active*/
	 
	 /* Read Data */
	 beforedv<=write;
	 if(write==1)begin
	    if(addr_buf==MFCC_SIZE-1)begin
	       start<=1;
	       addr_buf<=0;
	    end else begin
	       addr_buf<=addr_buf+1;
	    end
	    buff[addr_buf]<=x_i;
	    
	 end else begin
	    if(start==1)begin
	       if(j==MODEL_NUM)begin
		  if(min_model==0)begin						
		     result<=2'b01;
		  end else if(min_model==5)begin
		     result<=2'b00;
		  end else begin
		     result<=2'b00;
		  end
		  i<=0;
		  j<=0;
		  buff[0]<=0;
		  buff[1]<=0;
		  buff[2]<=0;
		  buff[3]<=0;
		  buff[4]<=0;
		  buff[5]<=0;
		  buff[6]<=0;
		  buff[7]<=0;
		  buff[8]<=0;
		  buff[9]<=0;
		  buff[10]<=0;
		  buff[11]<=0;
		  dv<=1;
		  done<=1;
		  start<=0;
		  diff<=0;
		  diff_bfr<=2**(BWIDTH*2-1)-1;
		  diff_tmp<=0;
		  min_model<=8;
	       end else begin
		  if(i==MFCC_SIZE+1)begin // i:mfcc_dim j:model
		     j<=j+1;
		     i<=0;
		     wait1<=0;
		     if(diff < diff_bfr)begin
			min_model<=j;
			diff_bfr<=diff;
		     end
		  end else begin
		     if(wait1 == 0)begin
			wait1<=1;
			i<=1;
			diff<=0;	
		     end else if(wait1==1)begin
			wait1<=2;
			i<=2;
			diff_tmp<=buff[i-1] - mean[j];
		     end else begin
			if(i<MFCC_SIZE+1)begin
			   diff_tmp<=buff[i-1] - mean[j];
			end
			diff<=diff+diff_tmp*diff_tmp;
			i<=i+1;
		     end
		  end
	       end
	       
	    end else begin
	       dv<=0;
	       done<=0;
	    end
	    
	 end
      end
   end
   
   
   
   /*
    if(start==1)begin
    if(i==MFCC_SIZE+1)begin
    if(diff1<diff2 && diff1<diff3 && diff1<diff4 && diff1<diff5)begin
    result<=1;
							end else begin
    result<=0;
							end
    i<=0;
    buff<=0;
    dv<=1;
    done<=1;
    start<=0;
    diff1<=0;
    diff2<=0;
    diff3<=0;
    diff4<=0;
    diff5<=0;
						end else begin
    buff<=x_i;
    diff1<=diff1+(buff-mean1)*(buff-mean1);
    diff2<=diff2+(buff-mean2)*(buff-mean2);
    diff3<=diff3+(buff-mean3)*(buff-mean3);
    diff4<=diff4+(buff-mean4)*(buff-mean4);
    diff5<=diff5+(buff-mean5)*(buff-mean5);
    i<=i+1;
						end
					end else begin
    dv<=0;
    done<=0;
					end
    
    */
endmodule
