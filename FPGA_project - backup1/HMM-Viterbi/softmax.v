`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		 Chiba University
// Engineer: 		 H. Lee
// 
// Create Date:    17:24:28 12/19/2014 
// Design Name: 	 10 bit Softmax
// Module Name:    softmax 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 	Specified implement of softmax calculation for 13 inputs
//						CLK costs: 222.5 (17.1 per input)
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module softmax #(parameter IBIT=20,OBIT=11,FBIT=10,IDIM=42)(clk,dv_in,dv_out,sofin,sofout
    );
	input clk;
	input dv_in;
	output dv_out;
	input signed [IBIT-1:0] sofin;
	output signed [OBIT-1:0] sofout;
	
	reg dv_out = 0;
	reg signed [OBIT-1:0] sofout = 0;
	
	reg [IBIT-1:0]x_i[0:IDIM-1];				//softmax input{x_int_frac1(5bit)_frac2(5bit)}
	reg [IBIT-1:0]x_max = 0;					//maxium input
	reg signed [IBIT-FBIT-1:0]x_int = 0;	//x_int
	reg [4:0]x_frac[0:1];						//x_frac1 & x_frac2

	reg [FBIT:0]expint = 0;						//exp(x_int)	1+10 bit
	reg [FBIT:0]expfrac1 = 0;					//exp(x_frac1)	1+10 bit
	reg [FBIT+1:0]expfrac2 = 0;				//exp(x_frac2)	1+11 bit

	reg [IBIT:0]dividend = 0;
	reg [IBIT:0]divisor = 0;
	reg [OBIT:0]divresult = 0;
	
	reg [OBIT-1:0] softmax[0:IDIM-1];

	reg bfr_dv = 0;
	reg [3:0]process = 0;
	reg [3:0]divcnt = 0;
	reg [7:0]x_index = 0;
	
	//Multipliers
	wire [2*FBIT+2:0]expfrac;						//expfrac 11+12 bit (23-11=12)
	assign expfrac = expfrac1 * expfrac2;		//calc of fraction
	wire [2*FBIT+2:0]exponent;						//exponent 12+11 bit (23-10=13)
	assign exponent = expfrac[22:11] * expint;			//calc of exponent
	
	always@ (posedge clk)
	begin
		bfr_dv <= dv_in;
		case (process)

		//////////////////////////////////////////	
		////	Process.0 , input data detection
		//////////////////////////////////////////		
		0:begin
			if (bfr_dv == 0 && dv_in == 1)
			begin
				x_i[x_index] <= sofin;
				x_max <= sofin;
				x_index <= x_index + 1;
				process <= process + 1;
			end
			dv_out <= 0;
			sofout <= 0;
			divisor <= 0;
		end
		
		//////////////////////////////////////////	
		////	Process.1 , Max data & storage
		//////////////////////////////////////////		
		1:begin
			x_i[x_index] <= sofin;
			if (sofin > x_max)
			begin
				x_max <= sofin;
			end
			if (x_index == IDIM - 1)
			begin
				x_index <= 0;
				process <= process + 1;
			end else begin
				x_index <= x_index + 1;
			end
		end
		
		//////////////////////////////////////////	
		////	Process.2 , Data simplified
		//////////////////////////////////////////		
		2:begin
			x_i[0] <= x_i[0] - x_max;
			x_i[1] <= x_i[1] - x_max;
			x_i[2] <= x_i[2] - x_max;
			x_i[3] <= x_i[3] - x_max;
			x_i[4] <= x_i[4] - x_max;
			x_i[5] <= x_i[5] - x_max;
			x_i[6] <= x_i[6] - x_max;
			x_i[7] <= x_i[7] - x_max;
			x_i[8] <= x_i[8] - x_max;
			x_i[9] <= x_i[9] - x_max;
			x_i[10] <= x_i[10] - x_max;
			x_i[11] <= x_i[11] - x_max;
			x_i[12] <= x_i[12] - x_max;
			x_i[13] <= x_i[13] - x_max;
			x_i[14] <= x_i[14] - x_max;
			x_i[15] <= x_i[15] - x_max;
			x_i[16] <= x_i[16] - x_max;
			x_i[17] <= x_i[17] - x_max;
			x_i[18] <= x_i[18] - x_max;
			x_i[19] <= x_i[19] - x_max;
			x_i[20] <= x_i[20] - x_max;
			x_i[21] <= x_i[21] - x_max;
			x_i[22] <= x_i[22] - x_max;
			x_i[23] <= x_i[23] - x_max;
			x_i[24] <= x_i[24] - x_max;
			x_i[25] <= x_i[25] - x_max;
			x_i[26] <= x_i[26] - x_max;
			x_i[27] <= x_i[27] - x_max;
			x_i[28] <= x_i[28] - x_max;
			x_i[29] <= x_i[29] - x_max;
			x_i[30] <= x_i[30] - x_max;
			x_i[31] <= x_i[31] - x_max;
			x_i[32] <= x_i[32] - x_max;
			x_i[33] <= x_i[33] - x_max;
			x_i[34] <= x_i[34] - x_max;
			x_i[35] <= x_i[35] - x_max;
			x_i[36] <= x_i[36] - x_max;
			x_i[37] <= x_i[37] - x_max;
			x_i[38] <= x_i[38] - x_max;
			x_i[39] <= x_i[39] - x_max;
			x_i[40] <= x_i[40] - x_max;
			x_i[41] <= x_i[41] - x_max;
			process <= process + 1;
		end

		//////////////////////////////////////////	
		////	Process.3 , Integer & fraction
		//////////////////////////////////////////		
		3:begin
			x_int <= x_i[x_index][IBIT-1:10];
			x_frac[0] <= x_i[x_index][9:5];
			x_frac[1] <= x_i[x_index][4:0];
			process <= process + 1;
		end
		
		//////////////////////////////////////////	
		////	Process.4 , Exponent calculation
		//////////////////////////////////////////		
		4:begin
			case (x_int)
			0:expint <= 1024;
			-1:expint <= 512;
			-2:expint <= 256;
			-3:expint <= 128;
			-4:expint <= 64;
			-5:expint <= 32;
			-6:expint <= 16;
			-7:expint <= 8;
			-8:expint <= 4;
			-9:expint <= 2;
			default:expint <= 1;
			endcase
			
			case (x_frac[0])
			0:expfrac1 <= 1024;
			1:expfrac1 <= 1046;
			2:expfrac1 <= 1069;
			3:expfrac1 <= 1092;
			4:expfrac1 <= 1116;
			5:expfrac1 <= 1141;
			6:expfrac1 <= 1166;
			7:expfrac1 <= 1191;
			8:expfrac1 <= 1217;
			9:expfrac1 <= 1244;
			10:expfrac1 <= 1271;
			11:expfrac1 <= 1299;
			12:expfrac1 <= 1327;
			13:expfrac1 <= 1357;
			14:expfrac1 <= 1386;
			15:expfrac1 <= 1417;
			16:expfrac1 <= 1448;
			17:expfrac1 <= 1479;
			18:expfrac1 <= 1512;
			19:expfrac1 <= 1545;
			20:expfrac1 <= 1579;
			21:expfrac1 <= 1613;
			22:expfrac1 <= 1649;
			23:expfrac1 <= 1685;
			24:expfrac1 <= 1722;
			25:expfrac1 <= 1759;
			26:expfrac1 <= 1798;
			27:expfrac1 <= 1837;
			28:expfrac1 <= 1878;
			29:expfrac1 <= 1919;
			30:expfrac1 <= 1961;
			31:expfrac1 <= 2004;
			endcase

			case (x_frac[1])
			0:expfrac2 <= 2048;
			1:expfrac2 <= 2049;
			2:expfrac2 <= 2050;
			3:expfrac2 <= 2052;
			4:expfrac2 <= 2053;
			5:expfrac2 <= 2054;
			6:expfrac2 <= 2056;
			7:expfrac2 <= 2057;
			8:expfrac2 <= 2059;
			9:expfrac2 <= 2060;
			10:expfrac2 <= 2061;
			11:expfrac2 <= 2063;
			12:expfrac2 <= 2064;
			13:expfrac2 <= 2066;
			14:expfrac2 <= 2067;
			15:expfrac2 <= 2068;
			16:expfrac2 <= 2070;
			17:expfrac2 <= 2071;
			18:expfrac2 <= 2073;
			19:expfrac2 <= 2074;
			20:expfrac2 <= 2075;
			21:expfrac2 <= 2077;
			22:expfrac2 <= 2078;
			23:expfrac2 <= 2080;
			24:expfrac2 <= 2081;
			25:expfrac2 <= 2082;
			26:expfrac2 <= 2084;
			27:expfrac2 <= 2085;
			28:expfrac2 <= 2087;
			29:expfrac2 <= 2088;
			30:expfrac2 <= 2090;
			31:expfrac2 <= 2091;
			endcase

			process <= process + 1;
		end

		//////////////////////////////////////////	
		////	Process.5 ~ 7 , Normalization
		//////////////////////////////////////////		
		5:begin
			x_i[x_index] <= exponent[22:10];
			divisor <= divisor + exponent[22:10];
			if (x_index == IDIM - 1)
			begin
				x_index <= 0;
				process <= process + 1;
			end else begin
				x_index <= x_index + 1;
				process <= 3;			
			end
		end
		
		6:begin
			 dividend <= x_i[x_index] << 1;
			 divcnt <= 0;
			 process <= process + 1;
		end
		
		7:begin
			if (divcnt == FBIT)
			begin
				divcnt <= 0;
				process <= process + 1;
			end else begin
				if (dividend > divisor)
				begin
					dividend <= (dividend - divisor) << 1;
					divresult[FBIT - 1 - divcnt] <= 1;
				end else begin
					dividend <= dividend << 1;
					divresult[FBIT - 1 - divcnt] <= 0;
				end
				divcnt <= divcnt + 1;
			end
		end

		//////////////////////////////////////////	
		////	Process.8 & 9 , Output
		//////////////////////////////////////////		
		8:begin
			softmax[x_index] <= divresult;
			divresult <= 0;
			if (x_index == IDIM-1)
			begin
				process <= process + 1;
				x_index <= 0;
			end else begin
				process <= 6;
				x_index <= x_index + 1;
			end
		end
		
		9:begin
			sofout <= softmax[x_index];
			dv_out <= 1;
			if (x_index == IDIM - 1)
			begin
				process <= 0;
				x_index <= 0;
			end else begin
				x_index <= x_index + 1;
			end
		end
		
		endcase
	end
endmodule
