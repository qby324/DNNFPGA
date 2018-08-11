`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:21 10/23/2014 
// Design Name: 
// Module Name:    DP_main 
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
module DP_main #(parameter BIT=32,HPENALTY=0,VPENALTY=0,DETECTED=3000,TMPSIZE=100)(
	clk,reset,vec_in,dv_in,vad_in,detected_scr,result_dv, result,vad_out,scr_o,len_o );
	input clk;
	input reset;
	input signed [BIT-1:0] vec_in;
	input dv_in;
	input vad_in;
	input [BIT+5:0]detected_scr;
	output result_dv;
	output result;
	output vad_out;
	
	output [BIT+12:0]scr_o;
	output [6:0]len_o;
	
	reg result_dv = 0;
	reg result = 0;
	reg vad_out;
	
	
	///////////////////////////////////
	///////		DP Matching
	///////////////////////////////////
	reg switch = 0;
	wire [BIT+12:0] scr_o;
	wire [6:0] len_o;
	wire dp_dv;
	
	reg before_dv;
	
	wire dp_reset;
	assign dp_reset = reset || result;

	DP_matching #(.HPENALTY(HPENALTY),	.VPENALTY(VPENALTY),	.MAXHMOVE(4),	.MAXVMOVE(4),	.SIZE(TMPSIZE),	.BIT(BIT))
	DP_matching (.clk(clk),	.reset(dp_reset),	.switch(switch),	.dv_in(dv_in),	.vec_in(vec_in),
	.dv_o(dp_dv),	.scr_o(scr_o),	.len_o(len_o));
	

	//////////////////////////////	
	////	Registers for control
	//////////////////////////////		
	reg [21:0]vad_cnt = 0;
	//reg [BIT+5:0]detected_scr = DETECTED;		//2^(BIT+10) / 2^7 = 2(BIT+3)
	
	reg [7:0]j = 0;
	reg [7:0]k = 0;

	
	always@ (posedge clk)
	begin
		before_dv <= dp_dv;
		
		//for test
/*		
		if (k == BIT+11)
		begin
			k <= 0;
		end else begin
			k <= k + 1;
		end
		
		if (j == 5)
		begin
			j <= 0;
		end else begin
			j <= j + 1;
		end
		result_dv <= vad_cnt + scr_o[k];
		result <= dp_dv + len_o[j];
*/		
		//////////////////////////	
		////		score/length 
		//////////////////////////				
//		if (dp_dv == 1 && before_dv == 0)
		if (dp_dv)
		begin
//			result_dv <= 1;
			
			if (scr_o == -1 || len_o == 0)		//when socre values
			begin
				result <= 0;
			end else begin
				if ( scr_o <len_o*detected_scr)
				begin
					result <= 1;
				end else begin
					result <= 0;
				end
			end

		end else begin
//			result_dv <= 0;
		end
		
		//////////////////////////	
		////	vad lag (30ms)
		//////////////////////////
		if (vad_out == 0)
		begin
			if (vad_in == 1)
			begin
				vad_out <= 1;
			end
		end else begin
			if (vad_in == 1)
			begin
				vad_cnt <= 0;
			end else begin
				if (vad_cnt == 3000000)		//10ms = 500000 clk
				begin
					vad_cnt <= 0;
					vad_out <= 0;
				end else begin
					vad_cnt <= vad_cnt + 1;
				end
			end
		end
	
	end

endmodule
