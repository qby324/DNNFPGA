`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:49 11/14/2016 
// Design Name: 
// Module Name:    Transform 
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
module Transform #(parameter VOICESIZE=8192,parameter DOWNRATE=125)(
    clk,
    reset,
    dv,
    dat_o,
	 isout
    );
	input clk;					//!< Global Clock
	input reset;
	output signed [15:0] dat_o;	//!< 
	output dv;					//!< Data Valid
	output isout;
	reg signed [15:0] dat_o=0;	//!<
	reg dv=0;
	reg isout=0;
// reg [15:0]index=0;
//	reg [5:0] index2=0;
//	reg [5:0] index3=0;
	//*	other register	*//
	reg [7:0] cnt =0;
	reg [13:0] tmp = 0;
//	reg [15:0] dat_temp[0:15];
	reg start=0;
	wire bpf_dv;
//	wire signed [15:0] x_o;
	reg _delayStart=0;
	reg [2:0] _delayTime=0;
	reg beforeSclk=0;
	reg beforedv=0;
	//storage reg//
	reg writeN=0;
	reg[13:0] addrN=0;
	reg [15:0] dinN=0;
	wire [15:0] doutN;
	voice vstore(
	  .clka(clk), // input clka
	  .wea(writeN), // input [0 : 0] wea
	  .addra(addrN), // input [7 : 0] addra
	  .dina(dinN), // input [10 : 0] dina
	  .douta(doutN) // output [10 : 0] douta
	);
	
	
	always@(posedge clk)begin
		//if(index2==7)begin
			if(cnt==DOWNRATE-1)begin
				cnt<=0;
			//	`include "src/tpl/taka5.dat"	
				dat_o<=doutN;
				dv<=1;
				if(addrN==VOICESIZE)begin
						addrN<=0;
						isout<=1;
				end	else begin
						addrN<=addrN+1;
						isout<=0;
				end
			end else begin
				cnt<=cnt+1;
				dv<=0;
			end
	//	end else begin
	//		index2<=index2+1;
	//	end

end

endmodule
