`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:17:55 11/17/2014 
// Design Name: 
// Module Name:    rec_dim 
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
module rec_dim(clk,dv,x_o,vad_in,vad_out,max,dim0,dim1,dim2,dim3,dim4,dim5,dim6,dim7,dim8,dim9,dim10,dim11
    );
	input clk;
	input dv;
	input vad_in;
	input signed [MFCBIT-1:0] x_o;
	output vad_out;
	output max;
	output signed [MFCBIT-1:0] dim0;
	output signed [MFCBIT-1:0] dim1;
	output signed [MFCBIT-1:0] dim2;
	output signed [MFCBIT-1:0] dim3;
	output signed [MFCBIT-1:0] dim4;
	output signed [MFCBIT-1:0] dim5;
	output signed [MFCBIT-1:0] dim6;
	output signed [MFCBIT-1:0] dim7;
	output signed [MFCBIT-1:0] dim8;
	output signed [MFCBIT-1:0] dim9;
	output signed [MFCBIT-1:0] dim10;
	output signed [MFCBIT-1:0] dim11;

	parameter MFCBIT = 32;

	reg signed [MFCBIT-1:0] dim0;
	reg signed [MFCBIT-1:0] dim1;
	reg signed [MFCBIT-1:0] dim2;
	reg signed [MFCBIT-1:0] dim3;
	reg signed [MFCBIT-1:0] dim4;
	reg signed [MFCBIT-1:0] dim5;
	reg signed [MFCBIT-1:0] dim6;
	reg signed [MFCBIT-1:0] dim7;
	reg signed [MFCBIT-1:0] dim8;
	reg signed [MFCBIT-1:0] dim9;
	reg signed [MFCBIT-1:0] dim10;
	reg signed [MFCBIT-1:0] dim11;

	reg max = 0;
	reg before_dv = 0;
	
	reg vad_out=0;
	reg [21:0]vad_cnt = 0;
	
	reg [2:0]rec_process = 0;
	reg [3:0]idx_cnt = 0;
	reg [3:0]index = 0;
	reg signed [MFCBIT+9:0]mfc_tmp[0:11];
	
	
	always@ (posedge clk)
	begin
		before_dv <= dv;
		
		case (rec_process)
		
		0:begin
			if (before_dv == 0 && dv == 1)
			begin
				mfc_tmp[idx_cnt] <= x_o;
				idx_cnt <= idx_cnt + 1;
				rec_process <= rec_process + 1;
			end
		end
		
		1:begin
			mfc_tmp[idx_cnt] <= x_o;
			if (idx_cnt == 11)
			begin
				idx_cnt <= 0;
				rec_process <= rec_process + 1;
			end else begin
				idx_cnt <= idx_cnt + 1;
			end
		end
		
		2:begin
			dim0 <= mfc_tmp[0];
			dim1 <= mfc_tmp[1];
			dim2 <= mfc_tmp[2];
			dim3 <= mfc_tmp[3];
			dim4 <= mfc_tmp[4];
			dim5 <= mfc_tmp[5];
			dim6 <= mfc_tmp[6];
			dim7 <= mfc_tmp[7];
			dim8 <= mfc_tmp[8];
			dim9 <= mfc_tmp[9];
			dim10 <= mfc_tmp[10];
			dim11 <= mfc_tmp[11];

			max <= 1;
			rec_process <= rec_process + 1;
		end
		
		3:begin
			max <= 0;
			rec_process <= 0;
		end
		endcase
		
		//vad lag (30ms)
		if (vad_out == 0)
		begin
			if (vad_in == 1)
			begin
				vad_out <= 1;
			end
		end else begin
			if (vad_in == 1)
			begin
				vad_cnt <= 0;
			end else begin
				if (vad_cnt == 3000000)		//10ms = 500000 clk
				begin
					vad_cnt <= 0;
					vad_out <= 0;
				end else begin
					vad_cnt <= vad_cnt + 1;
				end
			end
		end
	end
endmodule
