`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:54:56 07/03/2013 
// Design Name: 
// Module Name:    viterbi 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//							ޓx͂ăr^rASYs
//							2HMMɑ΂ĎsAXRA̍ʂƂďo͂
/*

b  ^  ^  ^  ^  ^  ^
b
b  ^  ^  ^  ^  ^  ^
b
b  ^  ^  ^  ^  ^  ^
b
b  ^  ^  ^  ^  ^  ^
b
\\\\\\\\\\\\\\\\\
t[eԂ̖ޓxĂāA
Ot[̎}łǂ傫L^

͂HMM0̖ޓx(state:0...state:end)HMM1̖ޓx̏

*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module viterbi#(parameter STATE=5,BAND=32)(clk,reset,start,x_i1,x_i2,x_i3,write,busy,dv,result);
    input clk;
    input reset;
    input start;
    input signed [31:0] x_i1;
    input signed [31:0] x_i2;
    input signed [31:0] x_i3;	 
    input write;
    output busy;
    output dv;
    output result;	// 1:HMM1 0:HMM2,HMM3
	reg busy=0;
	reg dv=0;
	reg result=0;

//////////////////////////////////////////////////////////////////////////
// o͈ȊÕWX^�
//////////////////////////////////////////////////////////////////////////
	reg signed [31:0] node1 [0:BAND-1][0:STATE-1];	// em[h̖ޓx
	reg branch1 [0:BAND-1][0:STATE-1];			   	// ǂ̎}I΂�0:܂A1:�
	reg [4:0] addr_state1 =0; 						// AhX:m[h̏

	reg signed [31:0] node2 [0:BAND-1][0:STATE-1];	// em[h̖ޓx
	reg branch2 [0:BAND-1][0:STATE-1];			    // ǂ̎}(0:܂A1:�
	reg [4:0] addr_state2 =0; 						// AhX:m[h̏

	reg signed [31:0] node3 [0:BAND-1][0:STATE-1];	// em[h̖ޓx
	reg branch3 [0:BAND-1][0:STATE-1];			    // ǂ̎}(0:܂A1:�
	reg [4:0] addr_state3 =0; 						// AhX:m[h̏


	reg [4:0] addr_band =0; 						//
	reg [4:0]addr_band_now=0;						// ޓxt[̃̈ʒu

	reg [4:0] process=0;   							// r^r̐isx
	reg signed [63:0] tmp1=0;						// ޓx̓̍vXRA(HMM1)
	reg signed [63:0] tmp2=0;						//
	reg signed [63:0] tmp3=0;
	
	reg signed [15:0] TRANS1[0:STATE-1][0:STATE-1]; 		// Jڊm1(ΐ)
	reg signed [15:0] TRANS2[0:STATE-1][0:STATE-1]; 		// Jڊm2(ΐ)
	reg signed [15:0] TRANS3[0:STATE-1][0:STATE-1]; 		// Jڊm2(ΐ)
	initial begin
		`include "transitions.dat"
/*		
TRANS1[0][0]=1;
TRANS1[0][1]=1;
TRANS1[0][2]=1;
TRANS1[1][0]=1;
TRANS1[1][1]=1;
TRANS1[1][2]=1;
TRANS1[2][0]=1;
TRANS1[2][1]=1;
TRANS1[2][2]=1;

TRANS2[0][0]=1;
TRANS2[0][1]=1;
TRANS2[0][2]=1;

TRANS2[1][0]=1;
TRANS2[1][1]=1;
TRANS2[1][2]=1;

TRANS2[2][0]=1;
TRANS2[2][1]=1;
TRANS2[2][2]=1;
*/
	end
	reg [7:0] state_cnt=0;							// Ԉړ̃JEg
	reg [7:0] band_cnt=0;							// oh̃JEg

//////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////
integer i,j;
initial begin

	for (i=0;i<BAND;i=i+1)begin
		for(j=0;j<STATE;j=j+1)begin
			node1[i][j]=0;
			node2[i][j]=0;
			node3[i][j]=0;
			branch1[i][j]=0;
			branch2[i][j]=0;
			branch3[i][j]=0;
		end
	end
	
end

//////////////////////////////////////////////////////////////////////////
// W[{
//////////////////////////////////////////////////////////////////////////
always@(posedge clk or negedge reset)begin

	if(!reset)begin
		busy<=0;
		dv<=0;
		result<=0;
	
	end else begin
	
		if(start==1 && write==1 && busy==0)begin
			// Data load
			node1[addr_band_now][addr_state1]<=x_i1;
			node2[addr_band_now][addr_state2]<=x_i2;
			node3[addr_band_now][addr_state3]<=x_i3;
			state_cnt<=state_cnt+1;
			dv<=0;
		end
		if(start == 1 && write ==0 && busy==0)begin
			if(state_cnt == STATE)begin
					busy<=1;
					process<=1;
					state_cnt<=0;
					addr_band<=addr_band_now;
					addr_state1<=STATE-1;
					addr_state2<=STATE-1;
					addr_state3<=STATE-1;
			end
		end

		//////////////////////////////////////////////////////////////////////////
		// r^rASY
		//////////////////////////////////////////////////////////////////////////
		if(start==1 && write==0 && busy==1)begin
			case(process)
			
				//////////////////////////////////////////////////////////////////////////
				// Ot[̓̃`FbN
				//////////////////////////////////////////////////////////////////////////
				1:begin

						if(addr_state1==0)begin
							addr_state1<=STATE-1;
							addr_state2<=STATE-1;
							addr_state3<=STATE-1;
							process<=process+1;
						end else begin
							addr_state1<=addr_state1-1;
							
							if(node1[addr_band-1][addr_state1]+TRANS1[addr_state1][addr_state1]
								> node1[addr_band-1][addr_state1-1]+TRANS1[addr_state1-1][addr_state1])begin
								
								branch1[addr_band][addr_state1]<=0;
							end else begin
								branch1[addr_band][addr_state1]<=1;
							end
														
							if(node2[addr_band-1][addr_state1]+TRANS2[addr_state1][addr_state1]
								> node2[addr_band-1][addr_state1-1]+TRANS2[addr_state1-1][addr_state1])begin
								
								branch2[addr_band][addr_state1]<=0;
							end else begin
								branch2[addr_band][addr_state1]<=1;
							end

							if(node3[addr_band-1][addr_state1]+TRANS3[addr_state1][addr_state1]
								> node3[addr_band-1][addr_state1-1]+TRANS3[addr_state1-1][addr_state1])begin
								
								branch3[addr_band][addr_state1]<=0;
							end else begin
								branch3[addr_band][addr_state1]<=1;
							end

						end

				end
				
				//////////////////////////////////////////////////////////////////////////
				// obNg[X
				//////////////////////////////////////////////////////////////////////////
				2:begin

						if(band_cnt == BAND)begin
							band_cnt<=0;
							process<=process+1;
						end else begin
													
							band_cnt<=band_cnt+1;
							addr_band<=addr_band-1;
							
							tmp1<=tmp1+node1[addr_band][addr_state1]
								+TRANS1[addr_state1-branch1[addr_band][addr_state1]][addr_state1];
							if(branch1[addr_band][addr_state1] == 1)begin
								addr_state1<=addr_state1-1;
							end

							tmp2<=tmp2+node2[addr_band][addr_state2]
								+TRANS2[addr_state2-branch2[addr_band][addr_state2]][addr_state2];
							if(branch2[addr_band][addr_state2] == 1)begin
								addr_state2<=addr_state2-1;
							end
							
							tmp3<=tmp3+node3[addr_band][addr_state3]
								+TRANS3[addr_state3-branch3[addr_band][addr_state3]][addr_state3];
							if(branch3[addr_band][addr_state3] == 1)begin
								addr_state3<=addr_state3-1;
							end

						end

				end
				
				//////////////////////////////////////////////////////////////////////////
				// ʏo
				//////////////////////////////////////////////////////////////////////////				
				3:begin
					busy<=0;
					addr_band<=0;
					addr_state1<=0;
					addr_state2<=0;
					addr_state3<=0;
					tmp1<=0;
					tmp2<=0;
					tmp3<=0;
					addr_band_now<=addr_band_now+1;
					if(tmp1 >= tmp2 && tmp1 >= tmp3)begin
						result<=1;
					end else begin
						result<=0;
					end
					dv<=1;
				end
				default:begin
				end
			endcase
	
		end else begin // if(start)
			dv<=0;
			//busy<=0;
			//addr_band<=0;
			//addr_state1<=0;
			//addr_state2<=0;
			tmp1<=0;
			tmp2<=0;
		end
	end // (reset)


end




endmodule
