`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:44 01/07/2015 
// Design Name: 
// Module Name:    DNN_norm 
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
module DNN_norm #(parameter IBIT=26,OBIT=13,INFRAME=5,IDIM=12)(clk,dv_i,vec_i,dv_o,vec_o,index_o
    );
	input clk;
	input dv_i;
	input signed[IBIT-1:0] vec_i;		//IBIT MFCC
	output dv_o;
	output signed[OBIT-1:0] vec_o;		//OBIT output
	output [7:0]index_o;
	
	parameter DIVMUL = 1365;				// 1/IDIM * 2^14
	
	reg dv_o;
	reg signed[OBIT-1:0] vec_o;
	reg [7:0]index_o;

	reg signed [IBIT-5:0] vec_std[0:INFRAME-1][0:IDIM-1];	// storage for normalized vectors 

	reg signed [IBIT-1:0] x_i[0:IDIM-1];						// x 14 bit fixed
//	reg signed [13:0] mean[12:IDIM-1];							// mean 14bit fixed
	reg signed [13:0] std = 0;										// 1/sqrt(var) 14bit
	
	// multiplier
	reg signed [IBIT-1:0] std_in = 0;
	wire signed [IBIT+13:0] std_out;
	assign std_out = std_in * std;

	reg bfrdv_i = 0;
	reg [3:0] process = 0;
	reg [4:0] dim_index = 0;		//0~31
	reg [2:0] frame_index = 0;		//0~7
	reg [2:0] frame_cnt = 0;		//0~7

	parameter MEAN0 = 98930;
	parameter MEAN1 = 29265;
	parameter MEAN2 = 75310;
	parameter MEAN3 = -42316;
	parameter MEAN4 = -67904;
	parameter MEAN5 = -44153;
	parameter MEAN6 = -53857;
	parameter MEAN7 = -26039;
	parameter MEAN8 = -23282;
	parameter MEAN9 = -17633;
	parameter MEAN10 = 4716;
	parameter MEAN11 = -73414;
	
	always@(posedge clk)
	begin
		bfrdv_i <= dv_i;
		
		case (process)
		//////////////////////////////////////////	
		////	Process.0 , input data detection
		//////////////////////////////////////////
		0:begin
			dv_o <= 0;
			std <= 0;
			std_in <= 0;
			
			if (bfrdv_i == 0 && dv_i == 1)			//if input valids
			begin
				x_i[0] <= vec_i;				//4bit cutted
				dim_index <= 1;
				process <= process + 1;
			end
		end

		//////////////////////////////////////////	
		////	Process.1 , input data storage
		//////////////////////////////////////////		
		1:begin		
			x_i[dim_index] <= vec_i;

			if (dim_index == IDIM-1)						//if data of 1 frame were stored
			begin
				dim_index <= 0;
				process <= process +1;
			end else begin
				dim_index <= dim_index + 1;
			end
		end
		
		//////////////////////////////////////
		////	Process.2 , x_i = vec - mean
		//////////////////////////////////////	
		2:begin
			x_i [0] <= x_i[0] - MEAN0;
			x_i [1] <= x_i[1] - MEAN1;
			x_i [2] <= x_i[2] - MEAN2;
			x_i [3] <= x_i[3] - MEAN3;
			x_i [4] <= x_i[4] - MEAN4;
			x_i [5] <= x_i[5] - MEAN5;
			x_i [6] <= x_i[6] - MEAN6;
			x_i [7] <= x_i[7] - MEAN7;
			x_i [8] <= x_i[8] - MEAN8;
			x_i [9] <= x_i[9] - MEAN9;
			x_i [10] <= x_i[10] - MEAN10;
			x_i [11] <= x_i[11] - MEAN11;
			
			process <= process + 1;
			
		end

		//////////////////////////////////////	
		////	Process.3 , normalize % store 
		//////////////////////////////////////		
		3:begin
			
			case (dim_index)
			0:std <= 2304;
			1:std <= 2601;
			2:std <= 2270;
			3:std <= 2171;
			4:std <= 2056;
			5:std <= 2180;
			6:std <= 2213;
			7:std <= 2219;
			8:std <= 2373;
			9:std <= 2590;
			10:std <= 2712;
			11:std <= 2669;
			default:std <= 0;
			endcase			
		
			if (dim_index != 0)vec_std[frame_index][dim_index-1] <= $signed(std_out[IBIT+13:18]);
			if (dim_index == IDIM)
			begin
				if (frame_index == INFRAME-1)
				begin
					frame_index <= 0;
				end else begin
					frame_index <= frame_index + 1;
				end
				
				dim_index <= 0;
				process <= process + 1;
			end else begin
				std_in <= x_i[dim_index];
				dim_index <= dim_index + 1;
			end

		end
		
		4:begin
			vec_o <= vec_std[frame_index][dim_index];
			dv_o <= 1;
			index_o <= index_o + 1;
			
			if (dim_index == IDIM-1)
			begin
				dim_index <= 0;

				if (frame_index == INFRAME-1)
				begin
					frame_index <= 0;
				end else begin
					frame_index <= frame_index + 1;
				end
				
				if (frame_cnt == INFRAME-1)
				begin
					frame_cnt <= 0;
					index_o <= 0;
					process <= 0;
				end else begin
					frame_cnt <= frame_cnt + 1;
				end
				
			end else begin
				dim_index <= dim_index + 1;
			end
		end
		
		endcase
		
		
	end
	
	
	
endmodule
