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

	parameter OWIDTH = 384;		//12*32
	parameter MFCBIT = 32;
	
   wire signed [MFCBIT-1:0]  x_o; // Output MFCC
   wire 	       dv;
	wire vad;
   wire [4:0] 	       x_index;
   MFCC MFCC(.clk(clk),
	     .sclk(clk),
	     .x_i(dat_o), 
	     .write(SPM0405HD4H_dv),
	     .dv_out(dv), 
	     .out_index(x_index), 
	     .x_o(x_o),
		  .vad(vad));
	

	reg [OWIDTH-1:0] dat_tmp;
	reg [OWIDTH-1:0] dat_out;
	reg max = 0;
	reg before_dv = 0;
	reg [9:0]i = 0;
	reg [9:0]j = 0;
	reg [4:0]before_index = 0;	
		
	always@ (posedge clk)
	begin
		sclk <= clk_2MHz;
		led1 <= dat_out[j]+max;
		led2 <= dat_tmp[i]+dv;
		led3 <= clk_1Hz;
		
		if (j == 383)
		begin
			j <= 0;
		end else begin
			j <= j + 1;
		end
		
		before_dv <= dv;
		
		if (before_dv == 0 && dv == 1)
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
				max <= 1;
			end else begin
				i <= i + MFCBIT;
				max <= 0;
			end
			
		end
		
		if (i == 0 && before_dv == 1 && dv == 0)
		begin
			dat_out <= dat_tmp;
		end
/*		
		before_index <= x_index;
		
		if (before_index == 11 && x_index == 0)
		begin
			
		end
		
*/		
	end


endmodule
