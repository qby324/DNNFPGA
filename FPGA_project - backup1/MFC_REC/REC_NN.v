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
module REC_NN(clk,dat_i,sclk,led1,led2,led3,beep
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
	//wire isout;
	
   reg 	  reset=1;
	parameter MFCBIT = 32;
	
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

	wire signed [21:0] dnn_out;
	wire dnn_dv;

	DNN_0117 nnmain (
		 .clk(clk), 
		 .reset(reset), 
		 .vec_in(x_o), 
		 .dv_in(dv), 
		 .vec_out(dnn_out), 
		 .dv_out(dnn_dv)
		 );
	
	wire vad_o;
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
				.vad_out(vad_o),	.max(max),	.dim0(dim0),	.dim1(dim1),	.dim2(dim2),	.dim3(dim3),	.dim4(dim4),
				.dim5(dim5),	.dim6(dim6),	.dim7(dim7),	.dim8(dim8),	.dim9(dim9),	.dim10(dim10),	.dim11(dim11)
    );
	 
	 
	parameter OWIDTH = 660;		//11*40
	parameter VECBIT = 11;
		
	reg [11:0]j = 0;
	reg [2:0]k = 0;
	reg [4:0]l = 0;

	reg before_dv = 0;
	reg [OWIDTH-1:0]dat_o2 = 0; 
	reg [OWIDTH-1:0]dat_o3 = 0;
	reg max2 = 0;
	reg max3 = 0;

	reg vad_out=0;
	reg [21:0]vad_cnt = 0;
	
	reg [9:0]i = 0;
	
	always@ (posedge clk)
	begin
		sclk <= clk_2MHz;
//		led1 <= x_o[j]+max2;//for 384bit output
		led1 <= dim0[l]+dim1[l]+dim2[l]+dim3[l]+dim4[l]+dim5[l]+dim6[l]+dim7[l]+dim8[l]+dim9[l]+dim10[l]+dim11[l]+max+max2;
		led2 <= dv+x_index[k]+dat_o3[j]+max3;
		led3 <= vad_out;
		beep <= 0;
	
		if (j == OWIDTH-1)
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
		
		before_dv <= dnn_dv;
		
		if(dnn_dv==1)begin
/*			dat_o2[i+21]<=dnn_out[21];
			dat_o2[i+20]<=dnn_out[20];			
			dat_o2[i+19]<=dnn_out[19];
			dat_o2[i+18]<=dnn_out[18];
			dat_o2[i+17]<=dnn_out[17];
			dat_o2[i+16]<=dnn_out[16];
			dat_o2[i+15]<=dnn_out[15];
			dat_o2[i+14]<=dnn_out[14];
			dat_o2[i+13]<=dnn_out[13];
			dat_o2[i+12]<=dnn_out[12];
			dat_o2[i+11]<=dnn_out[11];
*/			dat_o2[i+10]<=dnn_out[10];
			dat_o2[i+9]<=dnn_out[9];
			dat_o2[i+8]<=dnn_out[8];
			dat_o2[i+7]<=dnn_out[7];
			dat_o2[i+6]<=dnn_out[6];
			dat_o2[i+5]<=dnn_out[5];
			dat_o2[i+4]<=dnn_out[4];
			dat_o2[i+3]<=dnn_out[3];
			dat_o2[i+2]<=dnn_out[2];
			dat_o2[i+1]<=dnn_out[1];
			dat_o2[i]<=dnn_out[0];			
			if(i==OWIDTH - VECBIT)begin
				i<=0;
				dat_o3 <= dat_o2 ;
				max2 <= 1;
			end else begin
				max2 <= 0;
				i<=i+VECBIT;
			end
//			if (i == 128)begin
//				max3 <=1;
//			end
		end else begin
			max2 <= 0;
//			max3 <= 0;
		end
		
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
		
	end//always


endmodule
