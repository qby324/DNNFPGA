/***********************************************
     Use Fast Fourier Transform Module
 **********************************************/


if(xk_index_cnt==WORDS_F) begin //!< all FFT data gets
   //! Stop FFT module
   start<=0;
   sclr<=1;

   //! reset register
   xk_index_cnt<=0;
   write1<=0;
   indata1<=0;
   addr1<=0;
   write_re<=0;
   addr_re<=0;
   indata_re<=0;
   write_im<=0;
   addr_im<=0;
   indata_im<=0;

   //! to next process
   process_index<=process_index+1;
end else begin									//
   if(dv==1)begin
      xk_index_cnt<=1+xk_index_cnt;

      //!< Convert abs
      write_re<=1;
      addr_re<=xk_index;
      if(xk_re[38]==1)begin
	 indata_re<=(~xk_re)+1;
      end else begin
	 indata_re<=xk_re;
      end
      write_im<=1;
      addr_im<=xk_index;
      if(xk_im[38]==1)begin
	 indata_im<=(~xk_im)+1;
      end else begin
	 indata_im<=xk_im;
      end
   end
end

//Ready for Data==1 and input data
if(rfd==1) begin
   if(xn_index<=WINDOWSIZE)begin
      write_ham<=0;
      xn_re<=outdata_ham;
      addr_ham<=xn_index;
   end else begin
      // zero fill
      addr_ham<=0;
      xn_re<=0;
   end
end
//end //dv==0

if(xk_index_cnt==0)begin
   start<=1;
   sclr<=0;
end
