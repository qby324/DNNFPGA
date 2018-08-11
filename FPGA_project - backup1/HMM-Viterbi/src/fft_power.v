/********************************
 Calclate Power Spectrum
 *********************************/
if(pow_index==WORDS111)begin
   /* reset calc param  */
   indata_re<=0;
   indata_im<=0;
   indata_po<=0;
   addr_re<=0;
   addr_im<=0;
   addr_po<=0;
   write_re<=0;
   write_im<=0;
   write_po<=0;
   pow_index<=0;
	pow_cnt<=0;
   indataA<=0;
   indataB<=0;

   //! to next process
   process_index<=process_index+1;
	pow_done <= 1;	///////////////////<<<<<<<<For VAD, Added by Annoyy

end else begin

	pow_done <= 0;	///////////////////<<<<<<<<For VAD, Added by Annoyy
   
   case(pow_cnt)
     0:begin
		addr_re<=0;
		addr_im<=0;
		indataA<=0;
		indataB<=0;
		pow_index<=0;
		pow_cnt<=pow_cnt+1;
     end
     1:begin
		addr_re<=1;
		addr_im<=1;
		indataA<=outdata_re;
		indataB<=outdata_re;
		indataA2<=outdata_im;
		indataB2<=outdata_im;				

		pow_cnt<=pow_cnt+1;
     end
     2:begin
		addr_re<=2;
		addr_im<=2;

		indataA<=outdata_re;
		indataB<=outdata_re;
		indataA2<=outdata_im;
		indataB2<=outdata_im;		

		pow_tmp<=outdataX+outdataX2;
		indata_po<=pow_tmp[79:30];

		pow_cnt<=pow_cnt+1;
     end
	  3:begin
		addr_re<=3;
		addr_im<=3;

		indataA<=outdata_re;
		indataB<=outdata_re;
		indataA2<=outdata_im;
		indataB2<=outdata_im;		

		write_po<=1;
		pow_tmp<=outdataX+outdataX2;
		indata_po<=pow_tmp[79:30];
		
		pow_cnt<=pow_cnt+1;		
	  end
     4:begin
		//!	calclation
		addr_re<=addr_re+1;
		addr_im<=addr_im+1;

		indataA<=outdata_re;
		indataB<=outdata_re;
		indataA2<=outdata_im;
		indataB2<=outdata_im;	

		pow_index<=pow_index+1;
		
		//!	store power spectrum
		pow_tmp<=outdataX+outdataX2;
		write_po<=1;
		addr_po<=pow_index;
		indata_po<=pow_tmp[79:30];
     end
   endcase
   
end
