/*
   Adopt Hamming Window
 */


`include "src/ham16khz.dat"
//`include "src/ham16384.dat"
case(ham_cnt)
  0:begin //!< data init
     ham_index<=0;
     addr1<=0;
     addr_ham<=0;

     ham_cnt<=ham_cnt+1;
  end
  1:begin //!< calc 1st data
     addr1<=addr1+1;
	  indataA<=outdata1;

     ham_cnt<=ham_cnt+1;
  end
  2:begin //!< calc 2nd data
     ham_index<=ham_index+1;
     addr1<=addr1+1;
	  indataA<=outdata1;

	  indata_ham<=outdataX;
     ham_cnt<=ham_cnt+1;
  end
  3:begin
     ham_index<=ham_index+1;
     addr1<=addr1+1;
	  indataA<=outdata1;
     write_ham<=1;
	  indata_ham<=outdataX;
     ham_cnt<=ham_cnt+1;
  end
  4:begin //!< calc all data

		if(ham_index==WINDOWSIZE+1)begin
			//! to next process
			process_index<=process_index+1;

			//! reset register
			ham_index<=0;
			indataA<=0;
			indataB<=0;
			write1<=0;
			addr1<=0;
			indata1<=0;
			write_ham<=0;
			addr_ham<=0;
			indata_ham<=0;
			ham_cnt<=0;
		end else begin

			ham_index<=ham_index+1;
			addr1<=addr1+1;
			write_ham<=1;
			addr_ham<=addr_ham+1;
		  indataA<=outdata1;
		  indata_ham<=outdataX;

		end
	end

endcase
