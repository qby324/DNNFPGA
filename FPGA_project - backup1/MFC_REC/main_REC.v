`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:05 10/31/2014 
// Design Name: 
// Module Name:    main_REC 
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
module main_REC(clk,dat_i,sclk,led1,led2,led3,beep
    );
   input clk;		//!< Global Clock(50MHz)
   input dat_i;		//!< MEMS mic : data
   output sclk;		//!< Mic clock
   output led1;    	//!< led on FPGA
   output led2;		//!< led on FPGA
   output led3;		//!< led on board
   output beep;		//!< piezo Speaker
   reg 	  sclk=0;
   reg 	  led1=0;
   reg 	  led2=0;
   reg 	  led3=0;
   reg 	  beep=0;
	
   reg 	  reset=1;
	
   wire   clk_10MHz;
   clock_divide #(.DIVCOUNT(5))
   clock_devide_10M(
		    .clk(clk), 
		    .clk_div(clk_10MHz)
		    );
   
   wire   clk_2MHz;
   clock_divide #(.DIVCOUNT(25))
   clock_devide_2M(
		   .clk(clk), 
		   .clk_div(clk_2MHz)
		   );
   wire   clk_4000Hz;
   clock_divide #(.DIVCOUNT(12500)) 
   clock_devide_4000(
		     .clk(clk), 
		     .clk_div(clk_4000Hz)
		     );	
   wire   clk_100Hz;
   clock_divide #(.DIVCOUNT(500000)) 
   clock_devide_100(
		    .clk(clk), 
		    .clk_div(clk_100Hz)
		    );	
   wire   clk_5Hz;
   clock_divide #(.DIVCOUNT(20)) 
   clock_devide_5(
		  .clk(clk_100Hz), 
		  .clk_div(clk_5Hz)
		  );
   wire   clk_1Hz;
   clock_divide #(.DIVCOUNT(100)) 
   clock_devide_1(
		  .clk(clk_100Hz), 
		  .clk_div(clk_1Hz)
		  );
		  
   wire   SPM0405HD4H_dv;
   wire signed [15:0] dat_o;
   SPM0405HD4H SPM0405HD4H (
			    .clk(clk),
			    .reset(reset),
			    .sclk(clk_2MHz),
			    .dat_i(dat_i),
			    .dv(SPM0405HD4H_dv),
			    .dat_o(dat_o));	
				 
   wire signed [25:0]  x_o; // Output MFCC
   wire 	       dv;
	wire vad_in;
   wire [4:0] 	       x_index;
   MFCC MFCC(.clk(clk),
	     .sclk(clk),
	     .x_i(dat_o), 
	     .write(SPM0405HD4H_dv),
	     .dv_out(dv), 
	     .out_index(x_index), 
	     .x_o(x_o),
		  .vad(vad_in));

/*	//using 384 bit recorder		  
	wire vad_out;
	wire max;
	wire [383:0] dat_out;
	rec rec(.clk(clk),	.dv(dv),	.x_o(x_o),	.vad_in(vad),
				.vad_out(vad_out),	.max(max),	.dat_out(dat_out)
    );
*/
	//using 32*12 bit recorder
	wire vad_out;
	wire max;
	wire signed [MFCBIT-1:0] dim0;
	wire signed [MFCBIT-1:0] dim1;
	wire signed [MFCBIT-1:0] dim2;
	wire signed [MFCBIT-1:0] dim3;
	wire signed [MFCBIT-1:0] dim4;
	wire signed [MFCBIT-1:0] dim5;
	wire signed [MFCBIT-1:0] dim6;
	wire signed [MFCBIT-1:0] dim7;
	wire signed [MFCBIT-1:0] dim8;
	wire signed [MFCBIT-1:0] dim9;
	wire signed [MFCBIT-1:0] dim10;
	wire signed [MFCBIT-1:0] dim11;

	rec_dim rec_dim(.clk(clk),	.dv(dv),	.x_o(x_o),	.vad_in(vad_in),
				.vad_out(vad_out),	.max(max),	.dim0(dim0),	.dim1(dim1),	.dim2(dim2),	.dim3(dim3),	.dim4(dim4),
				.dim5(dim5),	.dim6(dim6),	.dim7(dim7),	.dim8(dim8),	.dim9(dim9),	.dim10(dim10),	.dim11(dim11)
    );

	
	parameter OWIDTH = 384;		//12*32
	parameter MFCBIT = 32;
	parameter BWIDTH=256;
	parameter QBIT=16;
		
	reg [11:0]j = 0;
	reg [2:0]k = 0;
	reg [4:0]l = 0;

/*	reg [OWIDTH-1:0] dat_tmp;
	reg [OWIDTH-1:0] dat_out;
	reg max = 0;
	reg start = 0;
	reg [9:0]i = 0;	
	reg before_dv = 0;
	reg [9:0]before_i = 0;
	
	reg vad_out=0;
	reg [21:0]vad_cnt = 0;
	
	reg [1:0]rec_process = 0;
	reg idx_cnt = 0;
	reg index = 0;
	reg [MFCBIT-1:0]mfc_tmp[0:11];
	
*/
	reg before_dv = 0;
	reg [BWIDTH-1:0]dat_o2 = 0; 
	reg [BWIDTH-1:0]dat_o3 = 0;
	reg max2 = 0;
	reg max3 = 0;
	
	reg [7:0]i = 0;
	
	always@ (posedge clk)
	begin
		sclk <= clk_2MHz;
//		led1 <= dat_out[j]+max;//for 384bit output
		led1 <= dim0[l]+dim1[l]+dim2[l]+dim3[l]+dim4[l]+dim5[l]+dim6[l]+dim7[l]+dim8[l]+dim9[l]+dim10[l]+dim11[l]+max+max2;
		led2 <= dv+x_index[k]+dat_o3[j]+max3;
		led3 <= vad_out;
		beep <= 0;
	
		if (j == BWIDTH-1)
		begin
			j <= 0;
		end else begin
			j <= j + 1;
		end
		
		if (k == 5)
		begin
			k <= 0;
		end else begin
			k <= k + 1;
		end
		
		if (l == MFCBIT-1)
		begin
			l <= 0;
		end else begin
			l <= l + 1;
		end
		
		before_dv <= SPM0405HD4H_dv;
		
		if(before_dv==0 && SPM0405HD4H_dv==1)begin
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
				dat_o3 <= dat_o2 ;
				max2 <= 1;
			end else begin
				i<=i+QBIT;
			end
			if (i == 128)begin
				max3 <=1;
			end
		end else begin
			max2 <= 0;
			max3 <= 0;
		end
		
/*		case (rec_process)
		
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
			if (vad == 1)
			begin
				vad_out <= 1;
			end
		end else begin
			if (vad == 1)
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

*/
		
		
		
		
		
/*		//for test

		
		
		if (mfc_dv == 1)
		begin
			case (process_mfc)
			0:begin
				process_mfc <= 1;
				mfc_output <= 0;
				if (mfc_index == 11)
				begin
					process_mfc <= 2;
				end
			end
			
			1:begin
				process_mfc <= 0;
				mfc_output <= 1;
				mfc_index <= mfc_index + 1;
				mfc_out <= mfc_tmp[mfc_index];
			end
			
			2:begin
				process_mfc <= 0;
				mfc_dv <= 0;
				mfc_index <= 0;
				mfc_out <= 0;
			end
			
			endcase						
		end
*/		
		//
		
/*		if (dv == 1 && before_dv == 0)// && before_index != x_index[0])
		begin
			dat_tmp[i+31] <= x_o[31];
			dat_tmp[i+30] <= x_o[30];
			dat_tmp[i+29] <= x_o[29];
			dat_tmp[i+28] <= x_o[28];
			dat_tmp[i+27] <= x_o[27];
			dat_tmp[i+26] <= x_o[26];
			dat_tmp[i+25] <= x_o[25];
			dat_tmp[i+24] <= x_o[24];
			dat_tmp[i+23] <= x_o[23];
			dat_tmp[i+22] <= x_o[22];
			dat_tmp[i+21] <= x_o[21];
			dat_tmp[i+20] <= x_o[20];
			dat_tmp[i+19] <= x_o[19];
			dat_tmp[i+18] <= x_o[18];
			dat_tmp[i+17] <= x_o[17];
			dat_tmp[i+16] <= x_o[16];
			dat_tmp[i+15] <= x_o[15];
			dat_tmp[i+14] <= x_o[14];
			dat_tmp[i+13] <= x_o[13];
			dat_tmp[i+12] <= x_o[12];
			dat_tmp[i+11] <= x_o[11];
			dat_tmp[i+10] <= x_o[10];
			dat_tmp[i+9] <= x_o[9];
			dat_tmp[i+8] <= x_o[8];
			dat_tmp[i+7] <= x_o[7];
			dat_tmp[i+6] <= x_o[6];
			dat_tmp[i+5] <= x_o[5];
			dat_tmp[i+4] <= x_o[4];
			dat_tmp[i+3] <= x_o[3];
			dat_tmp[i+2] <= x_o[2];
			dat_tmp[i+1] <= x_o[1];
			dat_tmp[i] <= x_o[0];
			
			if (i == OWIDTH-MFCBIT)
			begin
				i <= 0;
			end else begin
				i <= i + MFCBIT;
			end
			
		end


		
		before_i <= i;
		if (before_i == 160 && i == 192)
		begin
			max <= 1;
//			dat_out <= dat_tmp;
//			dat_tmp <= 0;
		end else begin
			max <= 0;
		end
		
		if (i == 0 && before_dv == 1 && dv == 0)
		begin
			dat_out <= dat_tmp;
			dat_tmp <= 0;
		end
*/				
		
	end//always


endmodule
