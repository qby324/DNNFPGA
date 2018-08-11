`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:31 10/23/2014 
// Design Name: 
// Module Name:    DP_matching 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//		CLK cost = 1(i=0)+dist(distance cost)+3*length(i=1~SIZE)+2(i=SIZE+1)+1(i=SIZE+2)
//					= 4+dim*3+length*3 ~~  120 ~ 340(N1,12dim)  170 ~ 380 (N2,25dim)  N2
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DP_matching#(parameter HPENALTY=0,VPENALTY=0,MAXHMOVE=10,MAXVMOVE=10,SIZE=100,BIT=32)
(clk,reset,switch,dv_in,vec_in,dv_o,scr_o,len_o);//,hmv_o,vmv_o);
	input clk;
	input reset;
	input switch;
	input dv_in;							//input_dv
	input signed [BIT-1:0] vec_in;		//input
	output dv_o;
	output [BIT+12:0] scr_o;				
	output [6:0] len_o;						

	//for test
//	output [3:0]hmv_o;
//	output [3:0]vmv_o;
	
	//////////////////////
	//// I/O & Storage
	//////////////////////	
	reg [BIT+12:0]scr_o = 0;
	reg [6:0]len_o = 0;
	reg dv_o = 0;
	
	//for test
//	reg [3:0]hmv_o = 0;
//	reg [3:0]vmv_o = 0;
	
	reg [BIT+12:0] scr [0:1][0:SIZE+1];	//SIZE*DIM*BIT < 2^(7+6+11)
	reg [6:0] len [0:1][0:SIZE+1];		//100+10+10=120 < 2^7
	reg [6:0] hmove [0:1][0:SIZE+1];		
	reg [6:0] vmove [0:1][0:SIZE+1];
	
	
	//////////////////
	//// Multiplyer
	//////////////////

	reg [BIT+12:0] indataS1 = 0;
	reg [BIT+12:0] indataS2 = 0;
	reg [6:0] indataL1 = 0;
	reg [6:0] indataL2 = 0;
	wire [BIT+19:0] outdata1 = 0;
	wire [BIT+19:0] outdata2 = 0;

	DP_multi #(.SWIDTH(BIT+11),	.LWIDTH(7))
		multi1(.clk(clk),	 .indataS(indataS1),	 .indataL(indataL1),	 .outdataX(outdata1));	
	DP_multi #(.SWIDTH(BIT+11),	.LWIDTH(7))
		multi2(.clk(clk),	 .indataS(indataS2),	 .indataL(indataL2),	 .outdataX(outdata2));	
	
	//////////////////////
	//// 	Initialize
	//////////////////////	
	integer j;
	initial begin
		for (j=0;j<SIZE+2;j=j+1)
		begin
			len [0][j] <= 0;
			len [1][j] <= 0;
			scr [0][j] <= -1;
			scr [1][j] <= -1;
			hmove [0][j] <= 0;
			hmove [1][j] <= 0;
			vmove [0][j] <= 0;
			vmove [1][j] <= 0;
		end
		scr [0][0] <= 0;
	end

	//////////////////////////////	
	////	Registers for control
	//////////////////////////////		
	reg [3:0]process = 0;	//proccess
	reg [6:0]i = 0;			//index(frame) of template data   (1+100+1+1 < 2^7)
	reg dist_start = 0;		//when i updates (0<i<SIZE+1) , request distance calculation
	reg framedone = 0;		//when data of 1 frame is stored, dp score calculation starts
	reg ff = 0;					//index for t(now)
	wire ffnxt;					//index for t-1
	assign ffnxt = !ff;
	
//	reg [15:0]len_tmp = 0;			// (2^16)/length
//	reg [56:0]out_tmp = 0;			// score tmp
//	assign scr_o = out_tmp[56:16];	//tmp/(2^16)

	//////////////////////////////
	//// DP distance calculation
	//////////////////////////////
	wire dist_ready;					//distance calucate ready (input vectors stored)
	wire dist_dv;						//data valid of distance
	wire [BIT+6:0]dist;				//DIM*BIT

	reg dist_before_ready;			//distance calucate ready (t-1)
	reg dist_before_dv = 0;			//data valid of distance (t-1)
	
	DP_distance #(.SIZE(SIZE),	.BIT(BIT),	.NTYPE(0))
	DP_distance (.clk(clk),	.dv_in(dv_in),	.vec_in(vec_in),	.index(i),
					.start(dist_start),	.ready(dist_ready),	.dist_dv(dist_dv),	.dist(dist));
	
	//////////////////////
	//// DP function
	//////////////////////
	always@(posedge clk)// or negedge reset)
	begin
		dist_before_dv <= dist_dv;
		dist_before_ready <= dist_ready;
		
		if (dist_before_ready == 0 && dist_ready == 1)		//if input vectors are stored
		begin
			framedone <= 1;
		end

	if (framedone)
	begin

		//////////////////////////////	
		////	i=0, initialization
		//////////////////////////////		
		case (i)
		0:begin
			scr[ffnxt][i] <= scr[ff][i];
			hmove[ffnxt][i] <= 0;
			vmove[ffnxt][i] <= 0;
			len[ffnxt][i] <= 0;
			i <= i + 1;
		end
		
		
		///////////////////////////////////////////
		////	1 < i < SIZE, score update			
		///////////////////////////////////////////
		default:begin		

			case(process)
				////////////////////////////////////////////////////////	
				////	Process.0 ,wait for the distance updated	
				////////////////////////////////////////////////////////
			default:begin
			end
			
			0:begin
				dist_start <= 1;	//distance calculation starts				
				if (dist_dv == 1 && dist_before_dv == 0)	//when distance updated
				begin
					process <= process + 1;
				end
			end			
			
				////////////////////////////////////////////////////////	
				////	Process.1 ,horizontal move (initialize score)	
				////////////////////////////////////////////////////////
			1:begin
				dist_start <= 0;
				
				//hmove begin
				if (hmove[ff][i] < MAXHMOVE)
				begin
					if (scr[ff][i] == -1)
					begin
						scr[ffnxt][i] <= -1;
					end else	begin
						scr[ffnxt][i] <= scr[ff][i] + HPENALTY + dist;
					end
//					hmove[ffnxt][i] <= hmove[ff][i] + 1;
				end else	begin
					scr[ffnxt][i] <= -1;
//					hmove[ffnxt][i] <= hmove[ff][i] + 1;
				end
				hmove[ffnxt][i] <= hmove[ff][i]+1;
				vmove[ffnxt][i] <= vmove[ff][i];
				len[ffnxt][i] <= len[ff][i] + 1;
				//hmove end
				process <= process + 1;
				end
			
				////////////////////////////////////////////////////////	
				////	Process.2 ,diagonal move (update score)		
				////////////////////////////////////////////////////////
			2:begin
				if (scr[ff][i-1] != -1)			//step1 (t-1)(i-1) != FLT_MAX
				begin
					if (scr[ffnxt][i] == -1)	//step2 (t)(i) == FLT_MAX
					begin
						//update
						scr[ffnxt][i] <= scr[ff][i-1] + dist;
						len[ffnxt][i] <= len[ff][i-1] + 1;
						hmove[ffnxt][i] <= hmove[ff][i-1];
						vmove[ffnxt][i] <= vmove[ff][i-1];
					end else begin
						//dmove ?
						if ( ( (scr[ff][i-1]+dist) * len[ffnxt][i]) < (scr[ffnxt][i]*(len[ff][i-1]+1) ) )
						begin
							//update
							scr[ffnxt][i] <= scr[ff][i-1] + dist;
							len[ffnxt][i] <= len[ff][i-1] + 1;
							hmove[ffnxt][i] <= hmove[ff][i-1];
							vmove[ffnxt][i] <= vmove[ff][i-1];
						end
					end
					//step2 end
				end
				//step1 end
				process <= process + 1;
			end
			
				////////////////////////////////////////////////////////	
				////	Process.3 ,vertical move (update score)		
				////////////////////////////////////////////////////////
			3:begin
				if (vmove[ffnxt][i-1] < MAXVMOVE)//step1 counter is below the maxium of vertical movement
				begin
					if (scr[ffnxt][i-1] != -1)		//step2 (t)(i-1) != FLT_MAX
					begin
						if (scr[ffnxt][i] == -1)	//step3 (t)(i) == FLT_MAX
						begin
							//update
							scr[ffnxt][i] <= scr[ffnxt][i-1] + VPENALTY + dist;
							len[ffnxt][i] <= len[ffnxt][i-1] + 1;
							hmove[ffnxt][i] <= hmove[ffnxt][i-1];
							vmove[ffnxt][i] <= vmove[ffnxt][i-1] + 1;
						end else begin
							//vmove ?
							if ( ( (scr[ffnxt][i-1]+VPENALTY+dist) * len[ffnxt][i]) < (scr[ffnxt][i] * (len[ffnxt][i-1]+1) ) )
							begin
								//update
								scr[ffnxt][i] <= scr[ffnxt][i-1] + VPENALTY + dist;
								len[ffnxt][i] <= len[ffnxt][i-1] + 1;
								hmove[ffnxt][i] <= hmove[ffnxt][i-1];
								vmove[ffnxt][i] <= vmove[ffnxt][i-1] + 1;
							end
						end
						//step3 end
					end
					//step2 end
				end
				//step1 end
				process <= 0;
				i <= i+1;		//to the next index
			end			
				////////////////////////
				////	Finished	
				////////////////////////				
			endcase
			
		end
		
		
		
		///////////////////////////////////////////////////
		////	i = SIZE+1 , score update (without penalty)
		///////////////////////////////////////////////////
		SIZE+1:begin		
			case (process)
			////////////////////////////////////////////////////////////	
			////	Process.0 ,horizontal move (exempted from penalty)	
			////////////////////////////////////////////////////////////
			0:begin
				//hmove begin
				scr[ffnxt][i] <= -1;	//initialize
				len[ffnxt][i] <= len[ff][i];
				hmove[ffnxt][i] <= hmove[ff][i];
				vmove[ffnxt][i] <= vmove[ff][i];
				//hmove end
				process <= process + 1;
			end
			
			////////////////////////////////////////////////////////////	
			////	Process.1 ,vertical move (exempted from penalty)	
			////////////////////////////////////////////////////////////
			1:begin
				//vmove begin
//				if ( scr[ffnxt][i-1]*len[ffnxt][i] < scr[ffnxt][i]*len[ffnxt][i-1])
				if (scr[ffnxt][i-1] != -1)
				begin
					scr[ffnxt][i] <= scr[ffnxt][i-1];
					len[ffnxt][i] <= len[ffnxt][i-1];
					hmove[ffnxt][i] <= hmove[ffnxt][i-1];
					vmove[ffnxt][i] <= vmove[ffnxt][i-1];				
				end
				//vmove end
				process <= 0;
				i <= i + 1;
			end
			////////////////////////
			////	Finished	
			////////////////////////	
			default:begin
			end

			endcase			
		end
		//i=SIZE end

		//////////////////////////////
		////	i = SIZE+2 , output
		//////////////////////////////
		SIZE+2:begin	

			scr_o <= scr[ffnxt][SIZE+1];
			len_o <= len[ffnxt][SIZE+1];
//			hmv_o <= hmove[ffnxt][SIZE+1];
//			vmv_o <= vmove[ffnxt][SIZE+1];
/*					case(len[ffnxt][SIZE+1])
						`include "divide.dat"		
					endcase		
					out_tmp <= scr[ffnxt][SIZE+1] * len_tmp;	//output normalized score
*/
			dv_o <= 1;			
			ff <= ffnxt;		//reverse index of storage
			i <= 0;				//reset index of template
			framedone <= 0;	//frame reset
		end
		

		
		/////////////////////
		////	Finished
		/////////////////////
		endcase
		//score calculation end
		
	end else begin
		dv_o <= 0;
	end	//if (framedone) end
	
	end	
	//always end

endmodule
