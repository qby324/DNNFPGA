`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:59 07/13/2012 
// Design Name: 
// Module Name:    HMM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
//	    
//		case(state_index)
//			0:begin
//				case(mix_index)
//					0:begin
//						case(feature_index)
//							0:begin
//								mean<=0;
//								SIG1<=1;
//								SIG2<=3;
//							end
//						endcase
//					end
//				endcase
//			end
//		endcase
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module silHMM #(parameter BWIDTH=16)(clk,reset,start,x_i,load,out_index,dv,done,x_o);
	input clk;
	input reset;
	input start;					
	input signed [BWIDTH*2-1:0] x_i; 
	output load;			
	output [15:0] out_index;	
	output dv;
	output done;		
	output signed [63:0] x_o;
	reg load=0;
	reg dv=0;
	reg done=0;
	reg result=0;
	reg signed [63:0] x_o=0;
	reg [15:0] out_index=0;
	
	parameter DIM=12; 
	parameter MIX=4;  
	parameter STATE=12;
	
	reg start_calc=0;				
	reg [3:0] i=0;					
	reg signed [31:0] data [0:11];

	reg [3:0] k=0;
	initial begin
		for(k=0;k<DIM;k=k+1)
			data[k]<=0;
	end

	reg [4:0] feature_index=0; // 
	reg [5:0] mix_index=0;     // 
	reg [4:0] state_index=0;   // 
	reg [3:0] hmm_cnt=0;       // 
	reg signed [63:0] lltmp=0; // 
	reg signed [63:0] ll=0;    // 
	
	reg signed [31:0] indataA=0;
	reg signed [31:0] indataB=0;
	wire signed [63:0] outdataX;
	SMULTI #(.BWIDTH(32)) SMULTI(.clk(clk),.indataA(indataA),.indataB(indataB),.outdataX(outdataX));
	
	reg signed [31:0] mean;		// 
	reg signed [31:0] SIG1; 	// 1/(2*pi*var)
	reg signed [31:0] SIG2;		// (1/var)
	reg signed [62:0] SIG4=0;	// 
		
	always@(posedge clk)begin

		`include "sil.dat"

		if(start==0)begin
			dv<=0;
			done<=0;
			load<=0;
			start_calc<=0;
			i<=0;
			feature_index<=0;
			mix_index<=0;
			state_index<=0;
			ll<=0;
			hmm_cnt<=0;
			lltmp<=0;
			indataA<=0;
			indataB<=0;
		end
		
		if(start==1 && start_calc==0)begin

			if(i==DIM)begin
				start_calc<=1;
				load<=0;
			end else begin
				data[i]<=x_i;
				i<=i+1;
				load<=1;
			end
		end
		
		if(start_calc==1)begin
			if(state_index==STATE)begin
					
					dv<=0;
					done<=1;			
					state_index<=0;

			end else begin
					
				//------------------------------------------
				// 		  1 state 
				//------------------------------------------
				if(mix_index==MIX)begin 
					
					state_index<=state_index+1;
					mix_index<=0;
					ll<=0;
					
					dv<=1;
					x_o<=ll;
					out_index<=state_index;
					
				end else begin
					
					//---------------------------------------------
					//		      1 mix
					//---------------------------------------------
					if(feature_index==DIM)begin
						feature_index<=0;
						mix_index<=mix_index+1;
						
						ll<=ll+lltmp;
						lltmp<=0;
						
					end else begin
						dv<=0;
						case(hmm_cnt)
							0:begin
								// 
							end
							1:begin // (x-u)^2
								indataA<=data[feature_index]-mean;
								indataB<=data[feature_index]-mean;
							end
							2:begin // (x-u)^2 / v
								indataA<=outdataX;
								indataB<=SIG2;
							end
							3:begin
								SIG4<=outdataX;
							end
							4:begin
								indataA<=$signed(SIG4[62:40]);
								indataB<=10000;
							end
							5:begin
								lltmp<=lltmp+SIG1+outdataX;
								feature_index<=feature_index+1;
							end
							default:begin
							end
						endcase
					
						if(hmm_cnt<6)begin
							hmm_cnt<=hmm_cnt+1;
						end else begin
							hmm_cnt<=0;
						end

					end//if feature_index
					//-------------------------------------
				end 
				//-----------------------------------------
			end 
		end
		
	end	

endmodule
