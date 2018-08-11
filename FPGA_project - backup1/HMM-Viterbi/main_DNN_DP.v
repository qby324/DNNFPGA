`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:27 12/17/2014 
// Design Name: 	Annoyy
// Module Name:    main_DNN_DP 
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
module main_DNN_DP(clk,dat_i,switch,sclk,led1,led2,led3,beep);
   input clk;		//!< Global Clock(50MHz)
   input dat_i;		//!< MEMS mic : data
	input switch;
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

   //-----------------------------------------
   //			Clock
   //-----------------------------------------   
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
   wire   clk_1Hz;
   clock_divide #(.DIVCOUNT(100)) 
   clock_devide_1(
		  .clk(clk_100Hz), 
		  .clk_div(clk_1Hz)
		  );
   //------------------------------------------


   //*  Decimaion Filter (PDM->PCM)  *//
   wire   SPM0405HD4H_dv;
   wire signed [15:0] dat_o;
   SPM0405HD4H SPM0405HD4H (
			    .clk(clk),
			    .reset(reset),
			    .sclk(clk_2MHz),
			    .dat_i(dat_i),
			    .dv(SPM0405HD4H_dv),
			    .dat_o(dat_o));


	///////////////////////////////////
	///////		MFCC
	///////////////////////////////////
   wire signed [25:0]x_o; // Output MFCC
   wire mfc_dv;
   wire [4:0]x_index;
	wire mfc_vad;
   MFCC MFCC(.clk(clk),
	     .sclk(clk),
	     .x_i(dat_o), 
	     .write(SPM0405HD4H_dv),
	     .dv_out(mfc_dv), 
	     .out_index(x_index), 
	     .x_o(x_o),
		  .vad(mfc_vad));


	///////////////////////////////////
	///////		DNN
	///////////////////////////////////

	wire signed [10:0] dnn_o;
	wire dnn_dv;

	// Instantiate the Unit Under Test (UUT)
	DNN_0117 DNN_0117 (
		.clk(clk), 
		.reset(reset), 
		.vec_in(x_o), 
		.dv_in(mfc_dv), 
		.vec_out(dnn_o), 
		.dv_out(dnn_dv)
	);	

   //*  Word Detect  *//
	parameter SCRPRVDNN = 6500;
	parameter SCRPUBDNN = 4000;
	parameter TMPSIZE = 39;
	
	reg [15:0]scr_dnn = SCRPRVDNN;
	
   wire dv;
	wire vad;
	wire active_frame;
	
	reg [7:0]j = 0;
	reg [7:0]k = 0;
	wire [23:0]scr_o;
	wire [6:0]len_o;
	
	DP_main #(.BIT(11),	.HPENALTY(10),	.VPENALTY(10),	.TMPSIZE(TMPSIZE) )
		DP_main(
			.clk(clk),
			.reset(reset), 
			.vec_in(dnn_o),
			.dv_in(dnn_dv),
			.vad_in(mfc_vad),
			.detected_scr(scr_dnn),
			.result_dv(dv), 
			.result(active_frame),
			.vad_out(vad),
			.scr_o(scr_o),
			.len_o(len_o)
			);
/*			
   wire dv2;
	wire vad2;
	wire active_frame2;
	
		DP_main_mfc #(.BIT(26),	.HPENALTY(10),	.VPENALTY(10),	.TMPSIZE(TMPSIZE) )
			DP_main_mfc(
			.clk(clk),
			.reset(reset), 
			.vec_in(x_o),
			.dv_in(mfc_dv),
			.vad_in(mfc_vad),
			.detected_scr(scr_mfc),
			.result_dv(dv2), 
			.result(active_frame2),
			.vad_out(vad2)
			);
*/				
   //*   LED,beep   *//
   reg 		      beep_start=0;
   reg 		      _beforedv=0;
   reg [20:0] 	      _beforei=0;
   reg 		      active_frame_bfr=0;
   reg [31:0] 	      beep_cnt=0;
	
	
   always@(posedge clk)
	begin
      sclk<=clk_2MHz;  //!< mic
/*      if(clk_2MHz)begin
			led1<=active_frame;
			led2<=clk_1Hz;
      end
*/      


	if (switch)begin
		scr_dnn <= SCRPRVDNN;
		led2 <= clk_1Hz + len_o[j];
	end else begin
		scr_dnn <= SCRPUBDNN;
		led2 <= 0;
	end
		if (k == 23)
		begin
			k <= 0;
		end else begin
			k <= k + 1;
		end
		
		if (j == 6)
		begin
			j <= 0;
		end else begin
			j <= j + 1;
		end
		
		//active_frame_bfr <= active_frame;
		led3 <= active_frame;	//mfcc detected
		led1 <= vad + scr_o[k];

      //! Sound Beep
      //! if "active_frame=1" is succession,  active beep
      if(beep_start==1)		//dnn detected
		begin
			beep<=clk_4000Hz;
      end else begin
			beep<=0;
      end
      
		if(beep_start==1)
		begin
			if(beep_cnt==50000000)
			begin
				beep_start<=0;
				beep_cnt<=0;
			end else begin
				beep_cnt<=beep_cnt+1;
			end
      end else begin
				if( active_frame_bfr==1 && active_frame==1)
				begin
					beep_start<=1;
				end
			active_frame_bfr<=active_frame;
      end	
   end // always@ (posedge clk)
   
endmodule
