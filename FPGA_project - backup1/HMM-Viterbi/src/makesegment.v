`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:26 07/11/2012 
// Design Name: 
// Module Name:    MakeFrame
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
//	入力データをフレーム化する
//	シフト幅の分だけ入力が入ると、一フレーム分だけ出力する
//	load==1の時に出力されているx_oの値を取得するようにして使う
//
//	出力中に入力が起こった場合、一旦load==0になって中断することになる
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// コピペ用
//
//makeSeg #(.BWIDTH(16),.AWIDTH(9),.WORDS(400),.SHIFTSIZE(160))
//	makeSeg(.clk(clk), .reset(reset), .x_i(x_i), .write(write), .load(load), .shift_start(shift_start), .x_o(x_o), .done(done));
//
// BWIDTH     : Input Data bit width
// AWIDTH     : Data Address width
// WORDS      : ロム全体のサイズ。
//	        出力するセグメントのサイズ＋出力中に入ってくるかもしれないデータのサイズ。
//	        余裕があるなら出力と同じでおｋ
// SEG_SIZE   : 出力するセグメントのサイズ
// SHIFT_SIZE : 何個データを入れたら出力を開始するか 
//
//////////////////////////////////////////////////////////////////////////////////
module makeSegment #(parameter BWIDTH=16,AWIDTH=9,WORDS=512,SEG_SIZE=420,SHIFT_SIZE=12)
   (clk, reset, x_i, write, load, shift_start, x_o, done);
   input clk;                     //!< Global Clock
   input reset;                   //!< Reset 0:reset 1:active
   input [BWIDTH-1:0] x_i;         //!< Input Data
   input 	      write;                   //!< Data Write
   output 	      load;                   //!< During Data output
   output 	      shift_start;            //!< Output Start
   output [BWIDTH-1:0] x_o;       //!< Output Data
   output 	       done;                   //!< Output Done
   reg 		       load=0;
   reg 		       shift_start=0;
   reg [BWIDTH-1:0]    x_o=0;
   reg 		       done=0;
   
   /*   Ringbuffer Regiter  */
   reg [BWIDTH-1:0]    indataR=0;               //!< RingBuf InputData
   reg 		       writeR=0;                //!< to RingBuf write
   reg [AWIDTH-1:0]    addrR=0;                 //!< RingBuf address
   wire [BWIDTH-1:0]   outdataR;                //!< RingBuf OutputData
   BRAM #(.DWIDTH(BWIDTH),.AWIDTH(AWIDTH),.WORDS(WORDS)) 
   RINGBUF(.clk(clk),.write(writeR),.indata(indataR),.addr(addrR),.outdata(outdataR));
   
   /*  ShiftOutput Register        */
   reg [AWIDTH-1:0]    shift_cnt=0;             //!< シフトのために今何個データを入れたか
   reg [AWIDTH-1:0]    ringaddr=0;              //!< 次に書き込むリングバッファ上のアドレス
   reg [1:0] 	       shift_process=0;         //!< 出力プロセス
   reg [AWIDTH-1:0]    shift_addr=0;            //!< シフト中のアドレス
   reg [AWIDTH-1:0]    shift_start_cnt=0;       //!< 今何個データを出力したか
   reg 		       done_cnt=0;              //!< フレーム完成時に一瞬待つ奴
   
   //!	データの入力
   always@(posedge clk or negedge reset)begin
      if(!reset)begin
	 indataR<=0;
	 writeR<=0;
	 addrR<=0;
	 
	 shift_cnt<=0;
	 ringaddr<=0;
	 shift_process<=0;
	 shift_addr<=0;
	 shift_start_cnt<=0;
	 done_cnt<=0;
	 
	 load<=0;
	 shift_start<=0;
	 x_o<=0;
	 done<=0;
      end else begin
	 if(write==1)begin
	    writeR<=1;					
	    addrR<=ringaddr;			
	    indataR<=x_i;				//!< 書き込み
	    shift_cnt<=shift_cnt+1;		//!< 取得サンプル数を更新
	    ringaddr<=ringaddr+1;		//!< リングバッファ自体のアドレスを更新
	    
	    load<=0;					
	    if(shift_start==1)begin		
	       shift_process<=2;		
	    end							
	 end else begin					
	    writeR<=0;					
	    
	    //!	シフト中の処理
	    if(shift_start==1)begin
	       
	       if(shift_start_cnt==SEG_SIZE)begin
		  //!-------frame Complete------
		  case(done_cnt)
		    0:begin
		       done<=1;
		       done_cnt<=1;
		       load<=0;
		    end
		    1:begin
		       shift_start<=0;
		       shift_start_cnt<=0;
		       done<=0;
		       done_cnt<=0;
		    end
		  endcase
	       end else begin 
		  //------------------------------------
		  //! Segment Outputting
		  //------------------------------------
		  case(shift_process)
		    0:begin
		       load<=0;
		       addrR<=shift_addr;
		       shift_addr<=shift_addr-1;
		       shift_process<=1;	
		    end
		    1:begin
		       load<=1;
		       shift_start_cnt<=shift_start_cnt+1;
		       addrR<=shift_addr;
		       shift_addr<=shift_addr-1;
		       x_o<=outdataR;
		       
		    end
		    2:begin //!< データ出力中に入力データが来たとこから帰ってきたとこ
		       addrR<=shift_addr;
		       shift_process<=1;
		    end
		  endcase
		  
	       end	//shift_start_cnt
	    end	//shift_start
	    
	 end // else: !if(write==1)
	 
	 /*
	   input data num = SHIFTSIZE
	   data_output start
	  */
	 if(shift_cnt==SHIFT_SIZE)begin
	    shift_start<=1;
	    shift_cnt<=0;
	    shift_addr<=ringaddr-1;
	 end
      end
   end

endmodule
