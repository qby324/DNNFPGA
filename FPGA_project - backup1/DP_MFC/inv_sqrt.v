`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		Chiba University
// Engineer: 		Haolin Lee
// 
// Create Date:    21:26:19 01/06/2015 
// Design Name: 	 Specified Fast Inverse Square Root for DNN
// Module Name:    inv_sqrt 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 	For 10bit-fixed-pointed fraction (Using Fast Inv_sqrt from Quake 3)
//						Only works when input > 1 ,and considerd log2(input) is always < 20
// Dependencies: 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:		平方根の逆数を計算する高速な方法です。信号処理の実装に是非お試しください。
//									本実装では行6の計算なしで、誤差率1.5%程度の結果を得ることができます。
//	ORIGINAL CODE:
//1		float InvSqrt (float x){
//2    		float xhalf = 0.5f*x;
//3    		int i = *(int*)&x;
//4    		i = 0x5f3759df - (i>>1);
//5 		   y = *(float*)&i;
//6 		   y = y*(1.5f - xhalf*x*x);
//7    		return y;
//8		}
//////////////////////////////////////////////////////////////////////////////////
module inv_sqrt#(parameter IBIT = 32 ,OBIT = 11)(clk,dv_i,sq_i,dv_o,isrt_o
    );
	input clk;
	input dv_i;
	input [IBIT-1:0] sq_i;
	output dv_o;
	output [OBIT-1:0] isrt_o;
	
	parameter MAGIC = 195002;	// first 18bit of 0x5f3759df
	
	reg dv_o;
	reg [OBIT-1:0] isrt_o;
	
	reg [9:0] frac;				// 10bit sig of float
	reg signed [7:0] exp;		// exp of float
	reg [17:0] float;				// specified float with 10bit sig but no +/- (8 + 10)
	
	reg [3:0] process = 0;
	
	
	always@ (posedge clk)begin
		case (process)
		0:begin
			dv_o <= 0;
			if (dv_i)begin
				if (sq_i[29:20]==0)begin		//if IBIT-1~20 bit is 0
					if (sq_i[19:10]==0)begin		// and if 19~10 bit is 0
						exp <= 9;
					end else begin
						exp <= 19;
					end
				end else begin
					exp <= IBIT-1;
				end

				
				process <= process + 1;
			end
		end
		
		1:begin
			if(sq_i[exp]==1)begin		//exp = (exp_float) + 10 -127
				process <= process + 1;
				frac <= {sq_i[exp-1],sq_i[exp-2],sq_i[exp-3],sq_i[exp-4],sq_i[exp-5],sq_i[exp-6],sq_i[exp-7],sq_i[exp-8],sq_i[exp-9],sq_i[exp-10]};
				//10 bit sig of float
				//since input(variance of mfcc*13 or 26) will never below 1 , case "exponent under 10" is removed
			end else begin
				exp <= exp - 1;
			end
		end
		
		2:begin
			float <= {1'b0,exp+117,frac[9:1]};	//turn fixed into float(1+[8+10]+13 of 32) (line 3) ,and ">> 1"(line 4)
			process <= process + 1;
		end
	
		3:begin
			float <= MAGIC - float;			//line 4
			process <= process + 1;
		end
		
		4:begin									//step4~6  line5
			exp <= float[17:10]-127;
			frac <= float[9:0];
			process <= process + 1;
		end
		
		5:begin
			float <= 1024+frac;
			process <= process + 1;
		end
		
		6:begin
			case (exp)
			0:float <= float;
			-1:float <= float >> 1;
			-2:float <= float >> 2;
			-3:float <= float >> 3;
			-4:float <= float >> 4;
			-5:float <= float >> 5;
			-6:float <= float >> 6;
			-7:float <= float >> 7;
			-8:float <= float >> 8;
			-9:float <= float >> 9;
			-10:float <= float >> 10;
			default:float <= 0;
			endcase
			process <= process + 1;
		end
		
		7:begin
			isrt_o <= float;
			dv_o <= 1;
			process <= 0;
		end
		endcase
	end

endmodule
