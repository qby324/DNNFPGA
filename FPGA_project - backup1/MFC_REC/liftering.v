/*
 Liftering
 */

case(lif_index_in)// synopsys parallel_case
  5'b00000 : indataB<=29144;
  5'b00001 : indataB<=46628;
  5'b00010 : indataB<=63508;
  5'b00011 : indataB<=79495;
  5'b00100 : indataB<=94317;
  5'b00101 : indataB<=107720;
  5'b00110 : indataB<=119473;
  5'b00111 : indataB<=129377;
  5'b01000 : indataB<=137261;
  5'b01001 : indataB<=142991;
  5'b01010 : indataB<=146469;
  5'b01011 : indataB<=147635;
/*
  5'b00000 : indataB<=42033;
  5'b00001 : indataB<=67159;
  5'b00010 : indataB<=91252;
  5'b00011 : indataB<=113820;
  5'b00100 : indataB<=134406;
  5'b00101 : indataB<=152588;
  5'b00110 : indataB<=167998;
  5'b00111 : indataB<=180322;
  5'b01000 : indataB<=189308;
  5'b01001 : indataB<=194774;
  5'b01010 : indataB<=196608;
  5'b01011 : indataB<=194774;
  //5'b01100 : indataB<=16384;	//!< POWER
*/
  default  : indataB<=0;
endcase


if(lif_index_in==12)begin
   //! reset register
   lif_index_in<=0;
   lif_cnt<=0;
   write3<=0;
   indata3<=0;
   addr3<=0;

   //! to next process
   process_index<=process_index+1;
end else begin
   //! Processing Liftering 
   case(lif_cnt)
     2:begin
	Lif_tmp<=outdata3;
	lif_cnt<=lif_cnt+1;
     end
     3:begin
	indataA<=Lif_tmp;
	lif_cnt<=lif_cnt+1;
     end
     4:begin
	write3<=1;
	indata3<=outdataX[39:14];
	lif_index_in<=lif_index_in+1;
	lif_cnt<=0;
     end
     default:begin
	write3<=0;
	addr3<=lif_index_in;
	lif_cnt<=lif_cnt+1;
     end
   endcase
end
