`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:40 09/08/2014 
// Design Name: 
// Module Name:    viterbi_1 
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
module viterbi_1#(parameter STATE=5,BAND=32)(clk,reset,start,out_index,x_i,write,busy,dv,result);
    input clk;
    input reset;
    input start;
	 input [15:0] out_index;		//i
	 input signed [31:0] x_i;
    input write;
    output busy;
    output dv;
    output result;	// 1:HMM1 0:HMM2,HMM3
	reg busy=0;
	reg dv=0;
	reg result=0;
	parameter INITIAL=1000000; 


//////////////////////////////////////////////////////////////////////////
// oﾍ以外ﾌジX^骭
//////////////////////////////////////////////////////////////////////////
	reg signed [31:0] observ [0:STATE-1];		//b(t,i)
	reg signed [31:0] observ_buff [0:STATE-1];
	
	reg [4:0] addr_state = 0;										//i

	reg signed [63:0] delta [0:STATE-1] = 0;			//delta(t)
//	reg signed [63:0] delta_last [0:STATE-1] = 0;		//delta(t-1)
	
	reg [6:0] frame_now = 0;		//t
	reg [6:0] frame_start = 0;			//T
	
	reg signed [15:0] TRANS [0:STATE] [0:STATE];		//a(i,j)
	
	reg [4:0] process=0;   							// r^rﾌ進sx	

	reg signed [63:0] tmp1=0;						// ﾞ度ﾌ椴貢XRA(HMM1)
	reg signed [63:0] tmp2=0;						//


	initial begin
		`include "transitions.dat"
	end
	
	reg [4:0] state_cnt=0;	
	reg forward[STATE-1] = 0;
	reg [63:0] tmp3 = 0;								//1/(t-T)

//////////////////////////////////////////////////////////////////////////
// 
//////////////////////////////////////////////////////////////////////////
integer j;
initial begin

		for(j=0;j<STATE;j=j+1)begin
			observ [j] = 0; 
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
	
	end else 
	begin	
		if(start==1 && write==1 && busy==0)begin
			// Data load
			observ_buff[out_index] <= x_i;
			state_cnt <= state_cnt + 1;
			dv <= 0;
		end
		
		if(start == 1 && write ==0 && busy==0)begin
			if(state_cnt == STATE)
			begin
					busy<=1;
					process<=1;
					state_cnt<=0;
					addr_state<=STATE;
					frame_now <= frame_now + 1;
					
					for(j=0;j<STATE;j=j+1)
					begin
						observ[j] <= observ_buff[j]; 
					end
					
			end
		end

		if(start==1 && write==0 && busy==1)begin
			case(process)
			
/*				1:begin
					if (addr_state == STATE)
					begin
						if (delta[addr_state] > INITIAL)
						begin
							result <= 1;
						end
						else begin
							result <= 0;
						end
					end
*/					
				//////////////////////////////////////////////////////////////////////////
				// Step.1 Delta & Transition
				//////////////////////////////////////////////////////////////////////////
				1:
				begin
					if(addr_state == 0)
					begin
						addr_state <= STATE;
						prosess <= process + 1;
					end else
					begin
						tmp1 <= delta[addr_state] + TRANS[out_index][out_index];
						tmp2 <= delta[addr_state-1] + TRANS[out_index-1][out_index];
						if (tmp1 > tmp2)
						begin
							forward[addr_state] <= 0;
							delta[addr_state] <= tmp1 + observ[addr_state];
						end else
						begin
							forward[addr_state] <= 1;
							delta[addr_state] <= tmp2 + observ[addr_state];
						end
						
						addr_state <= addr_state - 1;
					end
				end
				//////////////////////////////////////////////////////////////////////////
				// Step.2 Start Point
				//////////////////////////////////////////////////////////////////////////
				2:
				begin
					if (addr_state == 0)
					begin
						if (forward[1] == 1)
						begin
							frame_start <= frame_now - 1;
						end
						process <= process + 1;
					end else
					begin					
						if (delta[1] < delta[addr_state])
						begin
							process <= process + 1;
						end else
						begin
							addr_state <= addr_state - 1;
						end
					end
				end
				
				//////////////////////////////////////////////////////////////////////////
				// Step.3 t-T
				//////////////////////////////////////////////////////////////////////////
			   
				3:
				begin
					case(frame_now - frame_start)
						`include "divide.dat"
					endcase
					addr_state <= STATE;
					process = process + 1;
				end
				
				
				//////////////////////////////////////////////////////////////////////////
				// Step.4 1/(t-T)
				//////////////////////////////////////////////////////////////////////////
				
				4:
				begin
					if (addr_state == 0)
					begin
						process = process + 1;
					end else
					begin
						delta[addr_state] <= delta[addr_state] + tmp3;
						addr_state <= addr_state - 1;
					end
				end
						
				
				//////////////////////////////////////////////////////////////////////////
				// Step.5 Result
				//////////////////////////////////////////////////////////////////////////
				5:
				begin
					busy<=0;
					addr_state<=0;
					tmp1<=0;
					tmp2<=0;
					delta[0] <= 0;
					if (delta[STATE] > INITIAL)
					begin
						result <= 1;
						frame_start <= frame_now - 1;
					end else
					begin
						result <= 0;
					end
					dv<=1;
				end
				
				default:
				begin
				end
				
			endcase
	
		end else 
		begin // if(start)
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
