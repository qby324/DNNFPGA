`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:38 06/12/2014 
// Design Name: 
// Module Name:    power 
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
module vad(clk,dv,data,reset,ready,result);
	input clk;		//global clock
	input dv;		//input valid
	input signed [49:0]data;		//input data
//	output ready;			//input recieved
//	output done;			//power calculated (for test)
	input reset;			//when MFCC outputed, result resets in next clk
	input ready;			//when power index == WORDS111, output result
	output result;			//result
	

//	reg ready=0;
	reg result=0;
	
//	reg done=0;// for test

//calculate

/*
	reg [8:0] multicnt=0;
	reg comp_start =0;
//	reg [5:0]comp_i = 16;
	
	wire signed [31:0]data_sqr;
//	assign data_sqr = data * data;
	reg signed [40:0]data_tmp = 0;
	reg signed [40:0]data_pwr = 0;  
	SMULTI #(.BWIDTH(16)) smulti (.clk(clk), .indataA(data), .indataB(data), .outdataX(data_sqr) );


	//for test
	reg [5:0] j= 0;
*/	
	reg before_dv=0;
	reg before_ready=0;
	reg before_reset=0;
	reg comp_start=0;
	reg [58:0]data_tmp=0;
	reg [42:0]data_pwr=0;
	always @(posedge clk)
	begin
		before_dv<=dv;
		before_ready<=ready;
		before_reset<=reset;

/*		
		if (reset == 0 && before_reset == 11)
		begin
			result <= 0;
		end
*/		
		if (ready == 1 && before_ready == 0)
		begin
			data_tmp <= 0;
			data_pwr	<= data_tmp[58:16];
			comp_start <= 1;
		end 
		
		if (dv == 1 && before_dv == 0)
		begin
			data_tmp <= data_tmp + data;
		end
		
		
		if(comp_start)
		begin
			if (data_pwr > 12)//49152)
			begin
				result <= 1;
			end else begin
				result <= 0;
			end
			comp_start <= 0;
		end
		
	
	
	
/*
	
		// power calculate (every 400 clk)
		
			if (beforedv== 0 && dv ==1 ) //data inputed
			begin
//				ready <= 0;
				case (multicnt)
					399:begin
//						data_sqr <= data * data;
//						data_tmp <= data_tmp + data_sqr;
						multicnt <= 0;
						data_pwr <= data_tmp;
						comp_start <= 1;
					end
					0:begin
//						data_sqr <= data * data;
						data_tmp <= data_sqr;
						multicnt <= multicnt + 1;
					end
					default:begin
//						data_sqr <= data * data;
						data_tmp <= data_tmp + data_sqr;
						multicnt <= multicnt + 1;
					end
				endcase
			end
			
		done <= !comp_start;
//		result <= 0;
		
		ready<=data_pwr[j];
		
		if(j==40)begin
			j<=0;
		end else begin
			j<=j+1;
		end			
		
		//compare (costs 27 clk)
		if (comp_start)
		begin
			if (data_pwr > 2097152)//524288
			begin
				result <= 1;
				comp_start <= 0;
			end
			else begin
				result <= 0;
				comp_start <= 0;
			end
			
		end


*/

/*

		result<= test_pwr[j];
	if(j==12799)begin
			j<=0;
	end else begin
			j<=j+1;
	end			
		
		beforetest <= test;
		if (beforetest==0 && test == 1)
		begin
			test_pwr[i+31]<=data_pwr[31];
			test_pwr[i+30]<=data_pwr[30];
			test_pwr[i+29]<=data_pwr[29];
			test_pwr[i+28]<=data_pwr[28];
			test_pwr[i+27]<=data_pwr[27];
			test_pwr[i+26]<=data_pwr[26];
			test_pwr[i+25]<=data_pwr[25];
			test_pwr[i+24]<=data_pwr[24];
			test_pwr[i+23]<=data_pwr[23];
			test_pwr[i+22]<=data_pwr[22];
			test_pwr[i+21]<=data_pwr[21];
			test_pwr[i+20]<=data_pwr[20];
			test_pwr[i+19]<=data_pwr[19];
			test_pwr[i+18]<=data_pwr[18];
			test_pwr[i+17]<=data_pwr[17];
			test_pwr[i+16]<=data_pwr[16];
			test_pwr[i+15]<=data_pwr[15];
			test_pwr[i+14]<=data_pwr[14];
			test_pwr[i+13]<=data_pwr[13];
			test_pwr[i+12]<=data_pwr[12];
			test_pwr[i+11]<=data_pwr[11];
			test_pwr[i+10]<=data_pwr[10];
			test_pwr[i+9]<=data_pwr[9];
			test_pwr[i+8]<=data_pwr[8];
			test_pwr[i+7]<=data_pwr[7];
			test_pwr[i+6]<=data_pwr[6];
			test_pwr[i+5]<=data_pwr[5];
			test_pwr[i+4]<=data_pwr[4];
			test_pwr[i+3]<=data_pwr[3];
			test_pwr[i+2]<=data_pwr[2];
			test_pwr[i+1]<=data_pwr[1];
			test_pwr[i+0]<=data_pwr[0];
		
			if(i==12768)begin
				i<=0;
			end else begin
				i<=i+32;
			end
		end
*/

		
		/*
		if (comp_i == 41) //65536 = 2 ^ 16 .   when pwr < 65536 (digit=0 until 39-comp_i<16) then result = 0
			begin
				result <= 0;
				comp_i <= 16;
				comp_start <= 0;
				//result_dv <= 1;
			end
			else begin			//compare until the 13th digit
				if (data_pwr[comp_i]) //pwr> 16834
				begin
					result <= 1;
					comp_i <= 16;
					comp_start <= 0;
					//result_dv <= 1;
				end
				else begin
					comp_i <= comp_i + 1;
				end
			end	
		end
		*/
	end
endmodule
