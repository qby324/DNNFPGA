`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Chiba University
// Engineer: Haruka NAGATANI
// 
// Create Date:    13:50:24 03/10/2014
// Target Devices: Spartan6 
// Description: 
//					Extract MFCC
// 
// Memo:
//				
//
//////////////////////////////////////////////////////////////////////////////////
module MFCC(clk,sclk,x_i,write,x_o,out_index,dv_out,vad);
   input clk;                      	//!< Global Clock
   input sclk;				//!< sclk
   input write;				//!< Data write
   input signed [15:0] x_i; 		//!< speech data
   output signed [25:0] x_o;		//!< MFCC
   output [4:0] 	out_index;	//!< index of MFCC
   output 		dv_out;		//!< output during 1
	output vad;
   reg signed [31:0] 	x_o=0;		//!<  
   reg [4:0] 		out_index=0;	//!< 
   reg 			dv_out=0;	//!<  
   	
   //!	Register instance
`include "register.v"
   
	///////////////////<<<<<<<<Added by Annoyy
	///////////////////START
	reg vad = 0;
	wire vad_result;
	reg pow_done = 0;
	vad usevad(.clk(clk),	.dv(write_po),	.data(indata_po),	.reset(dv_out),	.ready(pow_done),	.result(vad_result));
	
	
	///////////////////<<<<<<<<END (by Annoyy)	
   //!	Processing
   reg [4:0] 		process_index=0;

   //!	Estimate MFCC
   always@(posedge sclk) begin
      vad <= vad_result;	// added by annoyy
//		dv_out <= 0;			//	added by annoyy
`include "ringbuffer.v" 	

      case(process_index)
	//!	Hamming Window
	1:begin
`include "hamwin.v"
	end
	//!	Use FFT Module
	2:begin
`include "fft_use.v"
	end
	//!	Estimate Power Spectrum
	3:begin
`include "fft_power.v"
	end
	//!	MelFilterBank
	4:begin
`include "MFB.v"
	end
	//! 	Discrete Cosine Transform
	5:begin
`include "DCT.v"
	end
	//! 	pick low dimension
	6:begin
`include "pick.v" 
	end
	//!	Liftering
	7:begin
`include "liftering.v"
	end
	//!	 Ready MFCC Output


	8:begin
	   dv_out<=0;
	   addr3<=0;
	   out_index<=0;
	   process_index<=process_index+1;
	end
/*	
	9:begin
	   if(addr3==11)begin
	      process_index<=process_index+1;
	      addr3<=0;
	   end else begin
	      addr3<=addr3+1;
	      dv_out<=1;
	   end
	   //x_o<=outdata3+CS_max+CS_dat_o2[CS_j]+CS_dat_o2[0];			
	   x_o<=outdata3;
	   out_index<=addr3-1;
	end
	
	10:begin
	   dv_out<=0;
	end
		
*/
	// by annoyy
	
	9:begin
		x_o <= outdata3;
		out_index <= addr3-1;
		case (addr3)
		0:begin
			addr3 <= addr3 + 1;
			dv_out <= 0;
		end
		13:begin
			process_index <= process_index + 1;
			addr3 <= 0;
			dv_out <= 0;
			out_index <= 0;
			x_o <= 0;
		end
		default:begin
			addr3 <= addr3 + 1;
			dv_out <= 1;
		end
		endcase
	end
	

	//////////////////
	default:begin
	end
      endcase

   end

endmodule
