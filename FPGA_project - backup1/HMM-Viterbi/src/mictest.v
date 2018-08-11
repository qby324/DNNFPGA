`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:22 08/26/2013 
// Design Name: 
// Module Name:    mictest 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//					マイクのデータを出力する
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mictest(clk,dat_i,sclk,led1,led2,led3,beep);
	input clk;		//!< Global Clock(50MHz?)
	input dat_i;	//!< Audio data
	output sclk;	//!< Audio Sampling rate
	output led1;
	output led2;
	output led3;
	output beep;
	reg led1=0;
	reg led2=0;
	reg led3=0;
	reg beep=0;
	reg sclk=0;
	reg reset=1;

	wire clk_2MHz;
	clock_divide #(.DIVCOUNT(25))
		_2MHz(.clk(clk), .clk_div(clk_2MHz));

	wire clk_100Hz;
	clock_divide #(.DIVCOUNT(500000)) 
	_100Hz(
		.clk(clk), 
		.clk_div(clk_100Hz)
	);
	
	wire clk_1Hz;
	clock_divide #(.DIVCOUNT(100)) 
	_1Hz(
		.clk(clk_100Hz), 
		.clk_div(clk_1Hz)
	);

	wire clk_02Hz;
	clock_divide #(.DIVCOUNT(5)) 
	_02Hz(
		.clk(clk_1Hz), 
		.clk_div(clk_02Hz)
	);

	wire dv;
	wire signed [15:0] dat_o;
	//reg [15:0] dat_o=0;
	//wire signed [15:0] dat_z;
	SPM0405HD4H SPM0405HD4H(.clk(clk),.reset(reset),.sclk(clk_2MHz),.dat_i(dat_i),.dv(dv),.dat_o(dat_o));

//*		LEDの点灯		*//
//*		アクティブがオンならスピーカーを鳴らす				*//
//*		一回鳴ったら1秒鳴り続けて、その後強制的に0にする	*//
//*		次のクロック以降は普通にactive次第					*//

parameter DATWIDTH=512;
parameter BWIDTH=256;
parameter QBIT=16;
reg [DATWIDTH-1:0] PDM=0;
reg [DATWIDTH-1:0] PDM_o=0;
reg [BWIDTH-1:0] dat_o2=0;
reg [BWIDTH-1:0] dat_o3=0;
reg [20:0] i=0;
reg [20:0] j=0;
reg max=0;
reg _beforedv=0;
reg [20:0]_beforei=0;
reg _before2MHz=0;
always@(posedge clk)begin
		sclk<=clk_2MHz;
		beep<=clk_02Hz;
		led1<=clk_1Hz;
		led2<=clk_100Hz+dat_o3[0]+dat_o3[j]+max;
		led3<=dv+dat_o2[i];
		if(j==BWIDTH-1)begin
			j<=0;
		end else begin
			j<=j+1;
		end
		
		_beforedv<=dv;
		if(_beforedv==0 && dv==1)begin
			dat_o2[i+15]<=dat_o[15];
			dat_o2[i+14]<=dat_o[14];
			dat_o2[i+13]<=dat_o[13];
			dat_o2[i+12]<=dat_o[12];
			dat_o2[i+11]<=dat_o[11];
			dat_o2[i+10]<=dat_o[10];
			dat_o2[i+9]<=dat_o[9];
			dat_o2[i+8]<=dat_o[8];
			dat_o2[i+7]<=dat_o[7];
			dat_o2[i+6]<=dat_o[6];
			dat_o2[i+5]<=dat_o[5];
			dat_o2[i+4]<=dat_o[4];
			dat_o2[i+3]<=dat_o[3];
			dat_o2[i+2]<=dat_o[2];
			dat_o2[i+1]<=dat_o[1];
			dat_o2[i]<=dat_o[0];			
			if(i==BWIDTH - QBIT)begin
				i<=0;
			end else begin
				i<=i+QBIT;
			end
		end

		if(i==0 && _beforedv==1 && dv==0)begin
			dat_o3<=dat_o2;
		end
		
		_beforei<=i;
		if(_beforei == 80 && i==96)begin
			max<=1;
		end else begin
			max<=0;
		end
		
		/**********************************
		* PDM保存用
		**********************************/
		/*
		_before2MHz<=clk_2MHz;
		if(_before2MHz==0 && clk_2MHz==1)begin
			PDM[i]<=dat_i;
			if(i==DATWIDTH-1)begin
				i<=0;
			end else begin
				i<=i+1;
			end
		end
		if(i==0)begin
			PDM_o<=PDM;
		end
		if(i==100)begin
			max<=1;
		end else begin
			max<=0;
		end
		*/
		/*********************************/
end

endmodule
