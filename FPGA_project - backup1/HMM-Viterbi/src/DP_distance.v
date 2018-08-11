`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:16 10/24/2014 
// Design Name: 
// Module Name:    DP_distance 
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
module DP_distance#(parameter SIZE=100,DIM=60,BIT=32,NTYPE=1)(clk,dv_in,vec_in,index,start,ready,dist_dv,dist);
	input clk;
	input dv_in;
	input signed [BIT-1:0] vec_in;	//input vector
	input [6:0]index;						//SIZE=100, 128=2^7
	input start;
	output ready;
	output dist_dv;
	output [BIT+6:0] dist;				//for L1 norm DIM*BIT < 2^4 * 2^32
//	output [BIT*2+2:0] dist;			//(unsigned BIT-1 bit)tmp*12(4bit)
	
	//////////////////////
	//// I/O & Storage
	//////////////////////	
	reg [BIT+6:0] dist = 0;
	reg dist_dv = 0;
	reg ready = 0;
	
	reg signed [BIT-1:0] vec1[0:DIM-1];	//inputed vectors
	reg signed [BIT-1:0] vec2[0:DIM-1];	//template vectors
	reg signed [BIT-1:0] tmp = 0;					//for L1 norm
//	reg signed [BIT*2-1:0] tmp = 0;		//for L2 norm
	reg signed [BIT+6:0] dist_tmp = 0;			//for L1 norm
//	reg [BIT*2+2:0] dist_tmp = 0;			//for L2 norm
	
	//////////////////////////////	
	////	Registers for control
	//////////////////////////////	
	reg before_dv = 0;
	reg input_process = 0;
	reg [7:0] input_dim = 0;
	
	reg start_before = 0;
	reg calc_start = 0;
	reg [2:0] process = 0;
	reg [7:0] dim_cnt = 0;


	always@ (posedge clk)begin
		before_dv <= dv_in;
				
		//////////////////////////////	
		////	Input vectors storage
		//////////////////////////////		
		if (before_dv == 0 && dv_in == 1)	//when input vectors valid
		begin
			vec1[input_dim] <= vec_in;
			input_dim <= input_dim + 1;
			input_process <= 1;
		end
		
		if (input_process)						//store vectors
		begin
			vec1[input_dim] <= vec_in;
			if (input_dim == DIM-1)
			begin
				input_dim <= 0;
				input_process <= 0;
				ready <= 1;							//distance calculation is ready
			end else begin
				input_dim <= input_dim + 1;
			end
		end else begin
			ready <= 0;
		end

		//////////////////////////////	
		//// Update template vectors
		//////////////////////////////	
		start_before <= start;
		if (start_before == 0 && start == 1)	//when i updated
		begin
			if (index > 0 && index< SIZE+1)		//only works between i = 1 ~ SIZE
			begin
				calc_start <= 1;
				`include "tpl/z_midori_39.dnn"
			end
		end
		
		
		//////////////////////////////	
		//// 	Calculate distance
		//////////////////////////////			
		if (calc_start == 1)
		begin
			case (process)
				0:begin
					if (dim_cnt == DIM)
					begin
						dist_dv <= 1;
						dist <= dist_tmp;
						calc_start <= 0;
					end else begin
						tmp <= vec1[dim_cnt] - vec2[dim_cnt];
						dim_cnt <= dim_cnt + 1;
					end
					process <= 1;
				end
				
				1:begin
					if (NTYPE == 0)
					begin
						//L1 norm
						if (tmp[BIT-1] == 0)
						begin
							dist_tmp <= dist_tmp + tmp;
						end else begin
							dist_tmp <= dist_tmp + (~tmp + 1);
						end

					end else begin
					//L2 norm
						dist_tmp <= dist_tmp + $unsigned(tmp * tmp);
					end
					
					process <= 0;
				end
				endcase
		end else begin
			dist_dv <= 0;
			process <= 0;
			dist_tmp <= 0;
			dim_cnt <= 0;
		end
	
	
	
	end


endmodule
