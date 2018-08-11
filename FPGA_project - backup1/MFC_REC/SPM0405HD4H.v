`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:49 08/26/2013 
// Design Name: 
// Module Name:    SPM0405HD4H 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//		MEMSマイクのサンプル(1bit)を入力したら16kHz,16bitで返してくれる
//		サンプルの入力タイミングは2MHz
//		DOWNRATEは入力サンプリングレートに対してどれくらい間引くか
//		(2MHzを125で間引くと16kHzになる)
// Dependencies:
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SPM0405HD4H #(parameter DOWNRATE=125)(clk,reset,sclk,dat_i,dv,dat_o);
	input clk;					//!< Global Clock
	input reset;
	input sclk;					//!< Sampling Rate
	input dat_i;				//!< Data sample
	output signed [15:0] dat_o;	//!< 
	output dv;					//!< Data Valid
	reg signed [15:0] dat_o=0;	//!<
	reg dv=0;
	//*	other register	*//
	reg [7:0] cnt =0;
	reg [13:0] tmp = 0;
	
	reg start=0;
	wire bpf_dv;
	wire signed [15:0] x_o;
	MEMS_Filter MEMS_Filter(.clk(clk),.sclk(sclk),.reset(reset),.x_i(dat_i),.dv(bpf_dv),.x_o(x_o));
	
	
	reg _delayStart=0;
	reg [2:0] _delayTime=0;
	reg beforeSclk=0;
	reg beforedv=0;
	always@(posedge clk)begin

		/*
		beforeSclk<=sclk;
		
		if( ~beforeSclk && sclk)begin
			_delayTime<=5;
			_delayStart<=1;
		end else begin
			if(_delayStart && ~_delayTime)begin
				start<=1;
				_delayStart<=0;
			end else begin
				_delayTime<=_delayTime-1;
				start<=0;
			end
		end
		*/
		beforedv<=bpf_dv;
		if(beforedv==0 && bpf_dv==1)begin
			if(cnt==DOWNRATE-1)begin
				cnt<=0;
				dat_o<=x_o;
				dv<=1;
			end else begin
				cnt<=cnt+1;
				dv<=0;
			end
		end else begin
			dv<=0;
		end
		
	end

endmodule
