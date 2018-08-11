`timescale 10ns / 10ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:39 11/12/2014 
// Design Name: 
// Module Name:    rec 
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
module rec(clk,dv,x_o,vad_in,vad_out,max,dat_out
    );
	input clk;
	input dv;
	input vad_in;
	input [MFCBIT-1:0] x_o;
	output vad_out;
	output max;
	output [OWIDTH-1:0] dat_out;

	parameter OWIDTH = 384;		//1+12*32
	parameter MFCBIT = 32;

	reg [OWIDTH-1:0] dat_out;
	reg max = 0;
	reg [9:0]i = 0;
	reg before_dv = 0;
	
	reg vad_out=0;
	reg [21:0]vad_cnt = 0;
	
	reg [1:0]rec_process = 0;
	reg [3:0]idx_cnt = 0;
	reg [3:0]index = 0;
	reg [MFCBIT-1:0]mfc_tmp[11:0];
	
	
	always@ (posedge clk)
	begin
		before_dv <= dv;
		
		case (rec_process)
		
		0:begin
			max <= 0;
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
			dat_out[i+31] <= mfc_tmp[index][31];
			dat_out[i+30] <= mfc_tmp[index][30];
			dat_out[i+29] <= mfc_tmp[index][29];
			dat_out[i+28] <= mfc_tmp[index][28];
			dat_out[i+27] <= mfc_tmp[index][27];
			dat_out[i+26] <= mfc_tmp[index][26];
			dat_out[i+25] <= mfc_tmp[index][25];
			dat_out[i+24] <= mfc_tmp[index][24];
			dat_out[i+23] <= mfc_tmp[index][23];
			dat_out[i+22] <= mfc_tmp[index][22];
			dat_out[i+21] <= mfc_tmp[index][21];
			dat_out[i+20] <= mfc_tmp[index][20];
			dat_out[i+19] <= mfc_tmp[index][19];
			dat_out[i+18] <= mfc_tmp[index][18];
			dat_out[i+17] <= mfc_tmp[index][17];
			dat_out[i+16] <= mfc_tmp[index][16];
			dat_out[i+15] <= mfc_tmp[index][15];
			dat_out[i+14] <= mfc_tmp[index][14];
			dat_out[i+13] <= mfc_tmp[index][13];
			dat_out[i+12] <= mfc_tmp[index][12];
			dat_out[i+11] <= mfc_tmp[index][11];
			dat_out[i+10] <= mfc_tmp[index][10];
			dat_out[i+9] <= mfc_tmp[index][9];
			dat_out[i+8] <= mfc_tmp[index][8];
			dat_out[i+7] <= mfc_tmp[index][7];
			dat_out[i+6] <= mfc_tmp[index][6];
			dat_out[i+5] <= mfc_tmp[index][5];
			dat_out[i+4] <= mfc_tmp[index][4];
			dat_out[i+3] <= mfc_tmp[index][3];
			dat_out[i+2] <= mfc_tmp[index][2];
			dat_out[i+1] <= mfc_tmp[index][1];
			dat_out[i] <= mfc_tmp[index][0];

			if (index == 11)
			begin
				i <= 0;
				index <= 0;
				rec_process <= rec_process + 1;
			end else begin
				i <= i + MFCBIT;
				index <= index + 1;
			end
			
		end
		
		3:begin
			max <= 1;
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
