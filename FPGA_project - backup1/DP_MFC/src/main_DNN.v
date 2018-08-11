`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:07 07/13/2012 
// Design Name: 
// Module Name:    main 
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
module main_HMM(clk,dat_i,sclk,led1,led2,led3,beep);
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

   //-----------------------------------------
   //			Clock
   //-----------------------------------------
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

   //*  Word Detect  *//
   reg [15:0] 	      counter=0;
   wire 	      dv;
   wire [1:0] 	      active_frame;	
   detect_NN detect_NN(
			   .clk(clk_10MHz),
			   .reset(reset),
			   .write(SPM0405HD4H_dv),
			   .x_i(dat_o),
			   .result_dv(dv),
			   .result(active_frame)
			   );

   //*   LED,beep   *//
   reg 		      beep_start=0;
   reg 		      _beforedv=0;
   reg [20:0] 	      _beforei=0;
   reg 		      active_frame_bfr=0;
   reg [31:0] 	      beep_cnt=0;
   always@(posedge clk)begin
      sclk<=clk_2MHz;  //!< mic
      if(clk_2MHz)begin
	 led1<=active_frame[1];
	 led2<=active_frame[0];
      end
      led3<=clk_1Hz;

      //! Sound Beep
      //! if "active_frame=1" is succession,  active beep
      if(beep_start==1)begin
	 beep<=clk_4000Hz;
      end else begin
	 beep<=0;
      end
      if(beep_start==1)begin
	 if(beep_cnt==50000000)begin
	    beep_start<=0;
	    beep_cnt<=0;
	 end else begin
	    beep_cnt<=beep_cnt+1;
	 end
      end else begin
	 if(dv)begin
	    if( active_frame_bfr==1 && active_frame==1)begin
	       beep_start<=1;
	    end
	    active_frame_bfr<=active_frame;
	 end
      end	
   end // always@ (posedge clk)
   
endmodule
