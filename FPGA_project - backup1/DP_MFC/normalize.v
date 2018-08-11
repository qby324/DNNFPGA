`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:10:30 12/29/2014 
// Design Name: 
// Module Name:    normalize 
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
module normalize #(parameter IBIT=26,OBIT=13,INFRAME=5,IDIM=26)(clk,dv_i,vec_i,dv_o,vec_o,index_o
    );
	input clk;
	input dv_i;
	input signed[IBIT-1:0] vec_i;		//IBIT MFCC
	output dv_o;
	output signed[OBIT-1:0] vec_o;		//OBIT output
	output [IDIM*INFRAME-1:0]index_o;
	
	parameter DIVMUL = 630;				// 1/IDIM * 2^14
	
	reg dv_o;
	reg signed[OBIT-1:0] vec_o;
	reg [7:0]index_o;

	reg signed [IBIT-5:0] vec_std[0:INFRAME-1][0:IDIM-1];	// storage for normalized vectors 

	reg signed [IBIT-5:0] x_i[0:IDIM-1];						// x (14 bit fixed -> 10 bit fixed) / x - mean / x`std
	reg signed [IBIT:0] mean = 0;									// mean (2^5*x_i/2^5)	 5 +IBIT-4 -1
	reg [2*IBIT-14:0] var = 0;										// var (2^5*mean^2/2^10) 5 +IBIT-4+IBIT-4 -10 -1
	
	// multiplier
	reg signed [2*IBIT-14:0] mul_inA = 0;
	reg signed [IBIT-5:0] mul_inB = 0;
	wire signed [3*IBIT-18:0] mul_out;
	assign mul_out = mul_inA * mul_inB;

/*	SMULTI #(.BWITDH(2*IBIT-13))
	  SMULTI (.clk(clk),
		 .indataA(mul_inA),
		 .indataB(mul_inB),
		 .outdataX(mul_out));
*/
	
	//inverse square root
	reg isr_start = 0;
	reg [2*IBIT-19:0]isr_in = 0;
	wire isr_dv;
	wire [10:0]isr_out;

	inv_sqrt #(.IBIT(2*IBIT-18),	.OBIT(11))
		isr (
		.clk(clk), 
		.dv_i(isr_start), 
		.sq_i(isr_in), 
		.dv_o(isr_dv), 
		.isrt_o(isr_out)
	);
	
	
	reg bfrdv_i = 0;
	reg [3:0] process = 0;
	reg [4:0] dim_index = 0;		//0~31
	reg [2:0] frame_index = 0;		//0~7
	reg [2:0] frame_cnt = 0;		//0~7

	
	always@(posedge clk)
	begin
		bfrdv_i <= dv_i;
		
		case (process)
		//////////////////////////////////////////	
		////	Process.0 , input data detection
		//////////////////////////////////////////
		0:begin
			dv_o <= 0;
			if (bfrdv_i == 0 && dv_i == 1)			//if input valids
			begin
				x_i[0] <= vec_i[IBIT-1:4];				//4bit cutted
				mean <= mean + $signed(vec_i[IBIT-1:4]);
				dim_index <= 1;
				process <= process + 1;
			end
		end

		//////////////////////////////////////////	
		////	Process.1 , input data storage
		//////////////////////////////////////////		
		1:begin			
			if (dim_index == IDIM)						//if data of 1 frame were stored
			begin
				dim_index <= 0;
				mul_inA <= mean;								//10bit frac
				mul_inB <= DIVMUL;							//14bit frac only
				process <= process +1;
			end else begin
				dim_index <= dim_index + 1;
				x_i[dim_index] <= vec_i[IBIT-1:4];
				mean <= mean + $signed(vec_i[IBIT-1:4]);
			end
				
/*				if (frame_index == INFRAME-1)				//storage index of (INFRAME) frames
				begin
					index_now <= 0;
					frame_index <= 0;
				end else begin
					index_now <= x_index + 1;				//index_now is from the first frame in store
					frame_index <= frame_index + 1;
				end
*/	
		end
		
		//////////////////////////	
		////	Process.2 , mean
		//////////////////////////		
		2:begin	
			mean <= $signed(mul_out[IBIT-5+14:14]);				//bit (mean) = bit (x_i)  (14bit cutted)
			mul_inA <= 0;
			mul_inB <= 0;
			process <= process + 1;
		end
		
		//////////////////////////////////////	
		////	Process.3 , x_i = vec - mean
		//////////////////////////////////////	
		3:begin
			x_i [0] <= x_i[0] - mean;
			x_i [1] <= x_i[1] - mean;
			x_i [2] <= x_i[2] - mean;
			x_i [3] <= x_i[3] - mean;
			x_i [4] <= x_i[4] - mean;
			x_i [5] <= x_i[5] - mean;
			x_i [6] <= x_i[6] - mean;
			x_i [7] <= x_i[7] - mean;
			x_i [8] <= x_i[8] - mean;
			x_i [9] <= x_i[9] - mean;
			x_i [10] <= x_i[10] - mean;
			x_i [11] <= x_i[11] - mean;
			x_i [12] <= x_i[12] - mean;
			x_i [13] <= x_i[13] - mean;
			x_i [14] <= x_i[14] - mean;
			x_i [15] <= x_i[15] - mean;
			x_i [16] <= x_i[16] - mean;
			x_i [17] <= x_i[17] - mean;
			x_i [18] <= x_i[18] - mean;
			x_i [19] <= x_i[19] - mean;
			x_i [20] <= x_i[20] - mean;
			x_i [21] <= x_i[21] - mean;
			x_i [22] <= x_i[22] - mean;
			x_i [23] <= x_i[23] - mean;
			x_i [24] <= x_i[24] - mean;
			x_i [25] <= x_i[25] - mean;
			
			mul_inA <= x_i[0];	//10bit frac
			mul_inB <= x_i[0];	//10bit frac
			dim_index <= 1;
			var <= 0;
			process <= process + 1;
			
		end
		//////////////////////////////////	
		////	Process.4 , sum of sqr
		//////////////////////////////////	
		4:begin	
			var <= var + mul_out[2*IBIT-9:10];		//bit (sqr) = bit (x - mean)^2 (10bit cutted)  

			if (dim_index == IDIM)
			begin
				process <= process + 1;
				dim_index <= 0;
			end else begin
				dim_index <= dim_index + 1;
				mul_inA <= x_i[dim_index];
				mul_inB <= x_i[dim_index];
			end
		end
		
		//////////////////////////////	
		////	Process.5 , var / IDIM
		//////////////////////////////		
		5:begin
			mul_inA <= var;		//2*IBIT-14 bit with 10bit frac
			mul_inB <= DIVMUL;	//14bit frac only
			process <= process + 1;
		end

		//////////////////////////////	
		////	Process.6 , inv_sqrt 
		//////////////////////////////		
		6:begin
			isr_in <= mul_out[2*IBIT-5:14];	//bit (var) = 2*BIT-19+14bit (14bit cutted)
			isr_start <= 1;
			process <= process + 1;
		end
		
		//////////////////////////////////////	
		////	Process.7&8 , normalize % store 
		//////////////////////////////////////		
		7:begin
			isr_start <= 0;
			if (isr_dv)
			begin
				mul_inA <= isr_out;		//10bit frac
				mul_inB <= x_i[0];		//IBIT-4bit with 10bit frac
				dim_index <= 1;
				process <= process + 1;
			end
		end
		
		8:begin
			vec_std[frame_index][dim_index-1] <= $signed(mul_out[OBIT+9:10]);	//-3~+3 (10bit cutted)
	
			if (dim_index == IDIM)
			begin
				process <= process + 1;
				dim_index <= 0;

				if (frame_index == INFRAME-1)
				begin
					frame_index <= 0;
				end else begin
					frame_index <= frame_index + 1;
				end
			end else begin
				dim_index <= dim_index + 1;
				mul_inB <= x_i[dim_index];
			end
		end
		
		9:begin
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
					mean <= 0;
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
//	reg signed [IBIT+2:0] dividend_mean = 0;					// summary
//	reg signed [IBIT+2:0] divisor_mean = {8'b01100010,21'b0};	// divisor = (signed)98
//	reg signed [2*IBIT-19:0] dividend_var = 0;				// sqr_sum
//	reg signed [2*IBIT-19:0] divisor_var = {8'b01100010,26'b0};
