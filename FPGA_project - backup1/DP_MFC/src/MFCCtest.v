`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Chiba University
// Engineer: Haruka NAGATANI
// 
// Create Date:    13:50:24 03/10/2014
// Target Devices: Spartan6 
// Description: 
//					Extract MFCC
// 
// Memo:
//				
//
//////////////////////////////////////////////////////////////////////////////////
module MFCCtest(clk,sclk,x_i,write,x_o,out_index,dv_out,vad);
   input clk;                      	//!< Global Clock
   input sclk;				//!< sclk
   input write;				//!< Data write
   input signed [15:0] x_i; 		//!< speech data
   output signed [25:0] x_o;		//!< MFCC
   output [4:0] 	out_index;	//!< index of MFCC
   output 		dv_out;		//!< output during 1
	output vad;
   reg signed [31:0] 	x_o=0;		//!<  
   reg [4:0] 		out_index=0;	//!< 
   reg 			dv_out=0;	//!<  
   	
//***********************************************************
//!			MFCC module
//!			Register instance
//***********************************************************
parameter WINDOWSIZE = 400;	//!< 8kHz:25ms:200 16kHz:400
parameter SHIFTSIZE  = 160;	//!< 8kHz:10ms:80  16kHz:160

parameter WINDOWSIZE_AWIDTH=9;                        //!< WINDOWSIZE < 2^n

//parameter DWIDTHR =16, AWIDTHR	=9, WORDSR = 512;     //!< RingBuffer
parameter DWIDTH1 =30, AWIDTH1 = WINDOWSIZE_AWIDTH, WORDS1 = WINDOWSIZE;//!< 1 frame	
parameter DWIDTH_ham =30, AWIDTH_ham=WINDOWSIZE_AWIDTH,WORDS_ham=WINDOWSIZE;//!< Hamming Window	
parameter DWIDTH_F = 40, AWIDTH_F = 9,WORDS_F = 512;  //!< FFT real,imaginary
parameter DWIDTH111 = 50, AWIDTH111 = 8, WORDS111 = 256; //!< FFTpower(halfsize of realpart)
parameter DWIDTH2 = 21, AWIDTH2	= 5, WORDS2 = 24;     //!< MelFilterBank
parameter DWIDTH3 = 26, AWIDTH3 = 4, WORDS3 = 13;     //!< DCT...MFCC

//*************************
//! 	1 frame
//*************************
reg write1=0;
reg [AWIDTH1-1:0] addr1=0;
reg signed [DWIDTH1-1:0] indata1=0;
wire signed [DWIDTH1-1:0] outdata1;

//*************************
//!	Hamming Window
//*************************
reg write_ham=0;
reg [AWIDTH_ham-1:0] addr_ham=0;
reg signed[DWIDTH_ham-1:0] indata_ham=0;
wire signed[DWIDTH_ham-1:0] outdata_ham;
reg signed [15:0] hamweight=0;
reg [3:0] ham_cnt=0;
reg  [WINDOWSIZE_AWIDTH:0]	ham_index=0;

//*************************
//! 	FFT real part
//*************************
reg write_re=0;
reg [AWIDTH_F-1:0] addr_re=0;
reg signed[DWIDTH_F-1:0] indata_re=0;
wire signed[DWIDTH_F-1:0] outdata_re;
//*************************
//!	FFT imaginary part
//*************************
reg write_im=0;
reg [AWIDTH_F-1:0] addr_im=0;
reg signed[DWIDTH_F-1:0] indata_im=0;
wire signed[DWIDTH_F-1:0] outdata_im;	
//*************************
//!	FFT power spectrum
//*************************	
reg write_po=0;
reg [AWIDTH111-1:0] addr_po=0;
reg signed[DWIDTH111-1:0] indata_po=0;
wire signed[DWIDTH111-1:0] outdata_po;
//*************************
//!	MelFilterBank
//*************************
reg write_mfb=0;
reg [AWIDTH2-1:0] addr_mfb=0;
reg signed[DWIDTH2-1:0] indata_mfb=0;
wire signed[DWIDTH2-1:0] outdata_mfb;
//*************************
//! 	DCT...lifter...MFCC
//*************************
reg write3=0;
reg [AWIDTH3-1:0] addr3=0;
reg signed[DWIDTH3-1:0] indata3=0;
wire signed[DWIDTH3-1:0] outdata3;

//************************************
//!		Other Register
//************************************


//*************************
//!	MelFilterBank
//*************************
reg [4:0] fil_index_in=0;          //!< FilterBank Num
wire signed [20:0] MFBtmp_out;     //!< MFB data (logarithm)
wire fil_dv;                       //!< data valid
reg signed [63:0] MFB_tmp=0;       //!< MFC data (calc tmp)
reg signed [63:0] MFBtmp_in=0;     //!< MFB data (not logarithm)
reg [5:0] fil_calc_index=0;        //!< MFB index
reg [9:0] fil_index_num=0;         //!< param index
reg log_en=0;                      //!< log start
reg [2:0] fil_calc_cnt=0;          //!< MFC calc processing
reg [8:0]addr_now=0;               //!< Filterbank Spectrum start address

//*************************
//!	 DCT 24dim
//*************************
reg [3:0]dct_cnt1=0;               //!< DCT calc processing
reg dct_cnt2=0;                    //!< DCT calc processing
reg [AWIDTH2-1:0] dct_index_in=0;  //!< DCT param index row
reg [4:0] dct_calc_index=0;        //!< DCT param index col
reg signed [35:0] dct_tmp1=0;      //!< DCT calc tmp
reg signed [35:0] dct_tmp2=0;
reg signed [21:0] dct_tmp3=0;

//*************************
//! 	Liftering
//*************************
reg signed [39:0] Lifter_tmp=0;    //!<  
reg signed [25:0] Lif_tmp=0;       //!< 
reg  [3:0] lif_index_in=0;         //!< Liftering Index (0-12)
reg  [2:0] lif_cnt=0;              //!< Calc processing

//*************************
//! 	Pick
//*************************
reg [1:0]pick_cnt=0;
reg [4:0] pick_calc_index=0;
reg signed [24:0] pick_tmp=0;
reg [25:0] C0 = 0;

//*************************
//! 	FFT_INPUT_PORT
//*************************
reg [14:0] xk_index_cnt=0;         //!< 0-255
reg [14:0] pow_index=0;            //!< ***********
reg [3:0]  pow_cnt=0;
reg signed[79:0]pow_tmp=0;
reg start = 0;			   //!< start FFT module
reg sclr=0;			   //!< data clear
reg signed [29:0]	xn_re = 0; //!< Real part input
reg signed [29:0]	xn_im = 0; //!< Imaginary part input (usually "0...0")
reg fwd_inv = 1;		   //!< 1:FFT, 0:IFFT
reg fwd_inv_we = 1;		   //!< Write Enable:Active High

//*************************
//!	FFT_OUTPUTS_PORT
//*************************
wire edone;                       //!< edone=1;done=0; -> edone=0;done=1;
wire done;                        //!< calculate done
wire rfd;                         //!< Ready for Data
wire	busy;                     //!< calculating
wire	dv;                       //!< Data Valid: Active High
wire	[8:0]	xn_index;         //!< index inputData
wire	[8:0]	xk_index;         //!< index outputData
wire	signed [39:0]	xk_re;    //!< Real part Output
wire	signed [39:0]	xk_im;    //!< Imaginary part Output

//*******************************************************
//!                    Module instance
//*******************************************************
//!	1 frame
BRAM_annoyy #(.DWIDTH(DWIDTH1),.AWIDTH(AWIDTH1),.WORDS(WORDS1))
BRAM_FRAME(.clk(clk),.write(write1),.addr(addr1),.indata(indata1),.outdata(outdata1));

//!	Hamming Window
BRAM #(.DWIDTH(DWIDTH_ham),.AWIDTH(AWIDTH_ham),.WORDS(WORDS_ham))
BRAM_HAM(.clk(clk),.write(write_ham),.addr(addr_ham),.indata(indata_ham),.outdata(outdata_ham));

//!	FFT Real part
BRAM #(.DWIDTH(DWIDTH_F),.AWIDTH(AWIDTH_F),.WORDS(WORDS_F)) 
BRAM_FFT_RE(.clk(clk),.write(write_re),.addr(addr_re),.indata(indata_re),.outdata(outdata_re));

//!	FFT Imaginary part
BRAM #(.DWIDTH(DWIDTH_F),.AWIDTH(AWIDTH_F),.WORDS(WORDS_F)) 
BRAM_FFT_IM(.clk(clk),.write(write_im),.addr(addr_im),.indata(indata_im),.outdata(outdata_im));

//!	FFT Power spectrum
BRAM #(.DWIDTH(DWIDTH111),.AWIDTH(AWIDTH111),.WORDS(WORDS111)) 
BRAM_FFT_PO(.clk(clk),.write(write_po),.addr(addr_po),.indata(indata_po),.outdata(outdata_po));

//!	MelFilterBank
BRAM_test5 #(.DWIDTH(DWIDTH2),.AWIDTH(AWIDTH2),.WORDS(WORDS2)) 
BRAM_FB(.clk(clk),.write(write_mfb),.addr(addr_mfb),.indata(indata_mfb),.outdata(outdata_mfb));

//!	DCT...Liftering...MFCC
BRAM #(.DWIDTH(DWIDTH3),.AWIDTH(AWIDTH3),.WORDS(WORDS3)) 
BRAM_MFCC(.clk(clk),.write(write3),.addr(addr3),.indata(indata3),.outdata(outdata3));


FFT_16kHz FFT_16kHz (
		     .clk(sclk),			// input clk
		     .sclr(sclr),                  // input sclr
		     .start(start), 		// input start
		     .xn_re(xn_re), 		// input [31 : 0] xn_re
		     .xn_im(xn_im), 		// input [31 : 0] xn_im
		     .fwd_inv(fwd_inv), 		// input fwd_inv
		     .fwd_inv_we(fwd_inv_we),      // input fwd_inv_we
		     .rfd(rfd), 			// output rfd
		     .xn_index(xn_index), 		// output [8 : 0] xn_index
		     .busy(busy), 			// output busy
		     .edone(edone), 		// output edone
		     .done(done), 			// output done
		     .dv(dv), 			// output dv
		     .xk_index(xk_index), 		// output [8 : 0] xk_index
		     .xk_re(xk_re), 		// output [31 : 0] xk_re
		     .xk_im(xk_im) 		// output [31 : 0] xk_im
		     );

log2_10bit log2(
		.clk(sclk),
		.start(log_en),
		.indata(MFBtmp_in),
		.outdata(MFBtmp_out),
		.dv(fil_dv)
		);


//!	Multiply
reg signed[63:0]indataA=0;
reg signed[63:0]indataB=0;
wire signed[127:0]outdataX;
reg signed[63:0]indataA2=0;
reg signed[63:0]indataB2=0;
wire signed[127:0]outdataX2;
SMULTI 
  SMULTI(.clk(clk),
	 .indataA(indataA),
	 .indataB(indataB),
	 .outdataX(outdataX));

SMULTI 
  SMULTI2(.clk(clk),
	  .indataA(indataA2),
	  .indataB(indataB2),
	  .outdataX(outdataX2));


	///////////////////<<<<<<<<Added by Annoyy
	///////////////////START
	wire vad = 0;
	reg pow_done = 0;
	vad usevad(.clk(clk),	.dv(write_po),	.data(indata_po),	.reset(dv_out),	.ready(pow_done),	.result(vad));
	
	reg teststart;
		
	///////////////////<<<<<<<<END (by Annoyy)	
   //!	Processing
   reg [4:0] 		process_index=0;

   //!	Estimate MFCC
   always@(posedge sclk) begin
	teststart <= write;
	if (teststart == 0 && write == 1)begin
		process_index <= 1;
	end
      case(process_index)
	//!	Hamming Window
	1:begin
`include "hamwin.v"
	end
	//!	Use FFT Module
	2:begin
`include "fft_use.v"
	end
	//!	Estimate Power Spectrum
	3:begin
`include "fft_power.v"
	end
	//!	MelFilterBank
	4:begin
`include "MFB.v"
	end
	//! 	Discrete Cosine Transform
	5:begin
`include "DCT.v"
	end
	//! 	pick low dimension
	6:begin
`include "pick.v" 
	end
	//!	Liftering
	7:begin
`include "liftering.v"
	end
	//!	 Ready MFCC Output


	8:begin
	   dv_out<=0;
	   addr3<=0;
	   out_index<=0;
	   process_index<=process_index+1;
	end
/*	
	9:begin
	   if(addr3==11)begin
	      process_index<=process_index+1;
	      addr3<=0;
	   end else begin
	      addr3<=addr3+1;
	      dv_out<=1;
	   end
	   //x_o<=outdata3+CS_max+CS_dat_o2[CS_j]+CS_dat_o2[0];			
	   x_o<=outdata3;
	   out_index<=addr3-1;
	end
	
	10:begin
	   dv_out<=0;
	end
		
*/
	// by annoyy
	
	9:begin
		x_o <= outdata3;
		out_index <= addr3-1;
		case (addr3)
		0:begin
			addr3 <= addr3 + 1;
			dv_out <= 0;
		end
		13:begin
			process_index <= process_index + 1;
			addr3 <= 0;
			dv_out <= 0;
			out_index <= 0;
			x_o <= 0;
		end
		default:begin
			addr3 <= addr3 + 1;
			dv_out <= 1;
		end
		endcase
	end
	

	//////////////////
	default:begin
	end
      endcase

   end

endmodule
