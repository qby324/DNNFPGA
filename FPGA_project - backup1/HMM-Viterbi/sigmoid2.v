`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:49 01/27/2015 
// Design Name: 
// Module Name:    sigmoid2 
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
module sigmoid2#(parameter IBIT=32,OBIT=11,FBIT=10)(clk,dv_in,dv_out,sigin,sigout
    );
	input clk;
	input dv_in;
	output dv_out;
	input signed [IBIT-1:0] sigin;
	output signed [OBIT-1:0] sigout;
	
	reg dv_out = 0;
	reg signed [OBIT-1:0] sigout = 0;

	reg bfr_dv = 0;
	reg [2:0]process = 0;
	reg ceA = 0;
	reg ceC = 0;
	wire signed [25:0] moutA;
	wire signed [43:0] moutB;
	wire signed [39:0] moutC;

	sig_mulA mulA (
	  .clk(clk), // input clk
	  .a(sigin), // input [26 : 0] a
	  .ce(ceA), // input ce
	  .p(moutA) // output [25 : 0] p
	);
	sig_mulB mulB (
	  .clk(clk), // input clk
	  .a(sigin), // input [26 : 0] a
	  .b(sigin), // input [26 : 0] b
	  .ce(ceA), // input ce
	  .p(moutB) // output [43 : 0] p
	);	
	sig_mulC mulC (
	  .clk(clk), // input clk
	  .a(moutB), // input [43 : 0] a
	  .ce(ceC), // input ce
	  .p(moutC) // output [39 : 0] p
	);	
	always@ (posedge clk)
	begin
		case (process)
			0:begin
				if (bfr_dv == 0 && dv_in == 1)
				begin
					if (sigin > 5120)begin
						sigout <= 1023;
					end else if (sigin < -5120)begin
						sigout <= 0;
					end else begin
						ceA <= 1;
					end
					process <= process + 1;
				end
				sigout <= 0;
				dv_out <= 0;
			end
			
			1:begin
				
			end

		endcase
	end
endmodule
