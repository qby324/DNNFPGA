/*    MelFilterBank       */
/*    257*24              */


/*  each filterbank start address */
case(fil_index_in)
  0:addr_now<=1;
  1:addr_now<=3;
  2:addr_now<=6;
  3:addr_now<=8;
  4:addr_now<=12;
  5:addr_now<=15;
  6:addr_now<=19;
  7:addr_now<=23;
  8:addr_now<=28;
  9:addr_now<=34;
  10:addr_now<=39;
  11:addr_now<=46;
  12:addr_now<=53;
  13:addr_now<=61;
  14:addr_now<=70;
  15:addr_now<=80;
  16:addr_now<=90;
  17:addr_now<=102;
  18:addr_now<=116;
  19:addr_now<=130;
  20:addr_now<=146;
  21:addr_now<=164;
  22:addr_now<=184;
  23:addr_now<=206;
  default:addr_now<=0;
endcase // case (fil_index_in)

/* each filter bank size  */
case(fil_index_in)
  0:fil_index_num=5;
  1:fil_index_num=5;
  2:fil_index_num=6;
  3:fil_index_num=7;
  4:fil_index_num=7;
  5:fil_index_num=8;
  6:fil_index_num=9;
  7:fil_index_num=11;
  8:fil_index_num=11;
  9:fil_index_num=12;
  10:fil_index_num=14;
  11:fil_index_num=15;
  12:fil_index_num=17;
  13:fil_index_num=19;
  14:fil_index_num=20;
  15:fil_index_num=22;
  16:fil_index_num=26;
  17:fil_index_num=28;
  18:fil_index_num=30;
  19:fil_index_num=34;
  20:fil_index_num=38;
  21:fil_index_num=42;
  22:fil_index_num=46;
  23:fil_index_num=50;
  24:fil_index_num=0;
endcase // case (fil_index_in)

/*  Filter bank Param  */
case(fil_index_in)
  0:begin
     case(fil_calc_index)
       0:indataB<=7099;
       1:indataB<=13901;
       2:indataB<=12339;
       3:indataB<=6062;
       4:indataB<=19;
     endcase
  end
  1:begin
     case(fil_calc_index)
       0:indataB<=4045;
       1:indataB<=10322;
       2:indataB<=16365;
       3:indataB<=10577;
       4:indataB<=4952;
     endcase
  end
  2:begin
     case(fil_calc_index)
       0:indataB<=5807;
       1:indataB<=11432;
       2:indataB<=15899;
       3:indataB<=10639;
       4:indataB<=5543;
       5:indataB<=602;
     endcase
  end
  3:begin
     case(fil_calc_index)
       0:indataB<=485;
       1:indataB<=5745;
       2:indataB<=10841;
       3:indataB<=15782;
       4:indataB<=12191;
       5:indataB<=7534;
       6:indataB<=3006;
     endcase
  end
  4:begin
     case(fil_calc_index)
       0:indataB<=4193;
       1:indataB<=8850;
       2:indataB<=13378;
       3:indataB<=14985;
       4:indataB<=10696;
       5:indataB<=6517;
       6:indataB<=2443;
     endcase
  end
  5:begin
     case(fil_calc_index)
       0:indataB<=1399;
       1:indataB<=5688;
       2:indataB<=9867;
       3:indataB<=13941;
       4:indataB<=14853;
       5:indataB<=10973;
       6:indataB<=7184;
       7:indataB<=3482;
     endcase
  end
  6:begin
     case(fil_calc_index)
       0:indataB<=1531;
       1:indataB<=5411;
       2:indataB<=9200;
       3:indataB<=12902;
       4:indataB<=16246;
       5:indataB<=12704;
       6:indataB<=9238;
       7:indataB<=5845;
       8:indataB<=2521;
     endcase
  end
  7:begin
     case(fil_calc_index)
       0:indataB<=138;
       1:indataB<=3680;
       2:indataB<=7146;
       3:indataB<=10539;
       4:indataB<=13863;
       5:indataB<=15648;
       6:indataB<=12454;
       7:indataB<=9322;
       8:indataB<=6250;
       9:indataB<=3234;
       10:indataB<=273;
     endcase
  end
  8:begin
     case(fil_calc_index)
       0:indataB<=736;
       1:indataB<=3930;
       2:indataB<=7062;
       3:indataB<=10134;
       4:indataB<=13150;
       5:indataB<=16111;
       6:indataB<=13749;
       7:indataB<=10893;
       8:indataB<=8085;
       9:indataB<=5326;
       10:indataB<=2612;
     endcase
  end
  9:begin
     case(fil_calc_index)
       0:indataB<=2635;
       1:indataB<=5491;
       2:indataB<=8299;
       3:indataB<=11058;
       4:indataB<=13772;
       5:indataB<=16327;
       6:indataB<=13701;
       7:indataB<=11117;
       8:indataB<=8573;
       9:indataB<=6069;
       10:indataB<=3602;
       11:indataB<=1173;
     endcase
  end
  10:begin
     case(fil_calc_index)
       0:indataB<=57;
       1:indataB<=2683;
       2:indataB<=5267;
       3:indataB<=7811;
       4:indataB<=10315;
       5:indataB<=12782;
       6:indataB<=15211;
       7:indataB<=15163;
       8:indataB<=12804;
       9:indataB<=10478;
       10:indataB<=8186;
       11:indataB<=5925;
       12:indataB<=3696;
       13:indataB<=1496;
     endcase
  end
  11:begin
     case(fil_calc_index)
       0:indataB<=1221;
       1:indataB<=3580;
       2:indataB<=5906;
       3:indataB<=8198;
       4:indataB<=10459;
       5:indataB<=12688;
       6:indataB<=14888;
       7:indataB<=15710;
       8:indataB<=13568;
       9:indataB<=11455;
       10:indataB<=9368;
       11:indataB<=7308;
       12:indataB<=5274;
       13:indataB<=3265;
       14:indataB<=1280;
     endcase
  end
  12:begin
     case(fil_calc_index)
       0:indataB<=674;
       1:indataB<=2816;
       2:indataB<=4929;
       3:indataB<=7016;
       4:indataB<=9076;
       5:indataB<=11110;
       6:indataB<=13119;
       7:indataB<=15104;
       8:indataB<=15703;
       9:indataB<=13766;
       10:indataB<=11851;
       11:indataB<=9959;
       12:indataB<=8089;
       13:indataB<=6240;
       14:indataB<=4411;
       15:indataB<=2603;
       16:indataB<=815;
     endcase
  end
  13:begin
     case(fil_calc_index)
       0:indataB<=681;
       1:indataB<=2618;
       2:indataB<=4533;
       3:indataB<=6425;
       4:indataB<=8295;
       5:indataB<=10144;
       6:indataB<=11973;
       7:indataB<=13781;
       8:indataB<=15569;
       9:indataB<=15430;
       10:indataB<=13681;
       11:indataB<=11950;
       12:indataB<=10237;
       13:indataB<=8542;
       14:indataB<=6865;
       15:indataB<=5204;
       16:indataB<=3561;
       17:indataB<=1934;
       18:indataB<=323;
     endcase
  end
  14:begin
     case(fil_calc_index)
       0:indataB<=954;
       1:indataB<=2703;
       2:indataB<=4434;
       3:indataB<=6147;
       4:indataB<=7842;
       5:indataB<=9519;
       6:indataB<=11180;
       7:indataB<=12823;
       8:indataB<=14450;
       9:indataB<=16061;
       10:indataB<=15112;
       11:indataB<=13532;
       12:indataB<=11968;
       13:indataB<=10418;
       14:indataB<=8883;
       15:indataB<=7363;
       16:indataB<=5857;
       17:indataB<=4364;
       18:indataB<=2885;
       19:indataB<=1419;
     endcase
  end
  15:begin
     case(fil_calc_index)
       0:indataB<=1272;
       1:indataB<=2852;
       2:indataB<=4416;
       3:indataB<=5966;
       4:indataB<=7501;
       5:indataB<=9021;
       6:indataB<=10527;
       7:indataB<=12020;
       8:indataB<=13499;
       9:indataB<=14965;
       10:indataB<=16351;
       11:indataB<=14911;
       12:indataB<=13484;
       13:indataB<=12069;
       14:indataB<=10667;
       15:indataB<=9277;
       16:indataB<=7898;
       17:indataB<=6531;
       18:indataB<=5175;
       19:indataB<=3831;
       20:indataB<=2497;
       21:indataB<=1175;
     endcase
  end
  16:begin
     case(fil_calc_index)
       0:indataB<=33;
       1:indataB<=1473;
       2:indataB<=2900;
       3:indataB<=4315;
       4:indataB<=5717;
       5:indataB<=7107;
       6:indataB<=8486;
       7:indataB<=9853;
       8:indataB<=11209;
       9:indataB<=12553;
       10:indataB<=13887;
       11:indataB<=15209;
       12:indataB<=16247;
       13:indataB<=14946;
       14:indataB<=13655;
       15:indataB<=12374;
       16:indataB<=11103;
       17:indataB<=9842;
       18:indataB<=8591;
       19:indataB<=7349;
       20:indataB<=6117;
       21:indataB<=4894;
       22:indataB<=3680;
       23:indataB<=2475;
       24:indataB<=1279;
       25:indataB<=92;
     endcase
  end
  17:begin
     case(fil_calc_index)
       0:indataB<=137;
       1:indataB<=1438;
       2:indataB<=2729;
       3:indataB<=4010;
       4:indataB<=5281;
       5:indataB<=6542;
       6:indataB<=7793;
       7:indataB<=9035;
       8:indataB<=10267;
       9:indataB<=11490;
       10:indataB<=12704;
       11:indataB<=13909;
       12:indataB<=15105;
       13:indataB<=16292;
       14:indataB<=15297;
       15:indataB<=14127;
       16:indataB<=12965;
       17:indataB<=11811;
       18:indataB<=10666;
       19:indataB<=9528;
       20:indataB<=8399;
       21:indataB<=7277;
       22:indataB<=6163;
       23:indataB<=5057;
       24:indataB<=3958;
       25:indataB<=2866;
       26:indataB<=1782;
       27:indataB<=704;
     endcase
  end
  18:begin
     case(fil_calc_index)
       0:indataB<=1087;
       1:indataB<=2257;
       2:indataB<=3419;
       3:indataB<=4573;
       4:indataB<=5718;
       5:indataB<=6856;
       6:indataB<=7985;
       7:indataB<=9107;
       8:indataB<=10221;
       9:indataB<=11327;
       10:indataB<=12426;
       11:indataB<=13518;
       12:indataB<=14602;
       13:indataB<=15680;
       14:indataB<=16018;
       15:indataB<=14955;
       16:indataB<=13899;
       17:indataB<=12850;
       18:indataB<=11807;
       19:indataB<=10771;
       20:indataB<=9742;
       21:indataB<=8719;
       22:indataB<=7703;
       23:indataB<=6692;
       24:indataB<=5688;
       25:indataB<=4691;
       26:indataB<=3699;
       27:indataB<=2713;
       28:indataB<=1733;
       29:indataB<=760;
     endcase
  end
  19:begin
     case(fil_calc_index)
       0:indataB<=366;
       1:indataB<=1429;
       2:indataB<=2485;
       3:indataB<=3534;
       4:indataB<=4577;
       5:indataB<=5613;
       6:indataB<=6642;
       7:indataB<=7665;
       8:indataB<=8681;
       9:indataB<=9692;
       10:indataB<=10696;
       11:indataB<=11693;
       12:indataB<=12685;
       13:indataB<=13671;
       14:indataB<=14651;
       15:indataB<=15624;
       16:indataB<=16175;
       17:indataB<=15213;
       18:indataB<=14256;
       19:indataB<=13305;
       20:indataB<=12360;
       21:indataB<=11420;
       22:indataB<=10485;
       23:indataB<=9556;
       24:indataB<=8632;
       25:indataB<=7713;
       26:indataB<=6799;
       27:indataB<=5891;
       28:indataB<=4987;
       29:indataB<=4089;
       30:indataB<=3195;
       31:indataB<=2306;
       32:indataB<=1423;
       33:indataB<=543;
     endcase
  end
  20:begin
     case(fil_calc_index)
       0:indataB<=209;
       1:indataB<=1171;
       2:indataB<=2128;
       3:indataB<=3079;
       4:indataB<=4024;
       5:indataB<=4964;
       6:indataB<=5899;
       7:indataB<=6828;
       8:indataB<=7752;
       9:indataB<=8671;
       10:indataB<=9585;
       11:indataB<=10493;
       12:indataB<=11397;
       13:indataB<=12295;
       14:indataB<=13189;
       15:indataB<=14078;
       16:indataB<=14961;
       17:indataB<=15841;
       18:indataB<=16053;
       19:indataB<=15183;
       20:indataB<=14318;
       21:indataB<=13458;
       22:indataB<=12602;
       23:indataB<=11751;
       24:indataB<=10904;
       25:indataB<=10061;
       26:indataB<=9223;
       27:indataB<=8389;
       28:indataB<=7559;
       29:indataB<=6734;
       30:indataB<=5912;
       31:indataB<=5095;
       32:indataB<=4282;
       33:indataB<=3473;
       34:indataB<=2668;
       35:indataB<=1867;
       36:indataB<=1070;
       37:indataB<=276;
     endcase
  end
  21:begin
     case(fil_calc_index)
       0:indataB<=331;
       1:indataB<=1201;
       2:indataB<=2066;
       3:indataB<=2926;
       4:indataB<=3782;
       5:indataB<=4633;
       6:indataB<=5480;
       7:indataB<=6323;
       8:indataB<=7161;
       9:indataB<=7995;
       10:indataB<=8825;
       11:indataB<=9650;
       12:indataB<=10472;
       13:indataB<=11289;
       14:indataB<=12102;
       15:indataB<=12911;
       16:indataB<=13716;
       17:indataB<=14517;
       18:indataB<=15314;
       19:indataB<=16108;
       20:indataB<=15871;
       21:indataB<=15085;
       22:indataB<=14303;
       23:indataB<=13525;
       24:indataB<=12751;
       25:indataB<=11980;
       26:indataB<=11213;
       27:indataB<=10450;
       28:indataB<=9690;
       29:indataB<=8934;
       30:indataB<=8181;
       31:indataB<=7431;
       32:indataB<=6685;
       33:indataB<=5943;
       34:indataB<=5204;
       35:indataB<=4468;
       36:indataB<=3735;
       37:indataB<=3006;
       38:indataB<=2280;
       39:indataB<=1558;
       40:indataB<=838;
       41:indataB<=122;
     endcase
  end
  22:begin
     case(fil_calc_index)
       0:indataB<=513;
       1:indataB<=1299;
       2:indataB<=2081;
       3:indataB<=2859;
       4:indataB<=3633;
       5:indataB<=4404;
       6:indataB<=5171;
       7:indataB<=5934;
       8:indataB<=6694;
       9:indataB<=7450;
       10:indataB<=8203;
       11:indataB<=8953;
       12:indataB<=9699;
       13:indataB<=10441;
       14:indataB<=11180;
       15:indataB<=11916;
       16:indataB<=12649;
       17:indataB<=13378;
       18:indataB<=14104;
       19:indataB<=14826;
       20:indataB<=15546;
       21:indataB<=16262;
       22:indataB<=15792;
       23:indataB<=15082;
       24:indataB<=14375;
       25:indataB<=13671;
       26:indataB<=12971;
       27:indataB<=12273;
       28:indataB<=11578;
       29:indataB<=10886;
       30:indataB<=10197;
       31:indataB<=9511;
       32:indataB<=8827;
       33:indataB<=8147;
       34:indataB<=7469;
       35:indataB<=6795;
       36:indataB<=6123;
       37:indataB<=5454;
       38:indataB<=4787;
       39:indataB<=4124;
       40:indataB<=3463;
       41:indataB<=2804;
       42:indataB<=2149;
       43:indataB<=1496;
       44:indataB<=845;
       45:indataB<=197;
     endcase
  end
  23:begin
     case(fil_calc_index)
       0:indataB<=592;
       1:indataB<=1302;
       2:indataB<=2009;
       3:indataB<=2713;
       4:indataB<=3413;
       5:indataB<=4111;
       6:indataB<=4806;
       7:indataB<=5498;
       8:indataB<=6187;
       9:indataB<=6873;
       10:indataB<=7557;
       11:indataB<=8237;
       12:indataB<=8915;
       13:indataB<=9589;
       14:indataB<=10261;
       15:indataB<=10930;
       16:indataB<=11597;
       17:indataB<=12260;
       18:indataB<=12921;
       19:indataB<=13580;
       20:indataB<=14235;
       21:indataB<=14888;
       22:indataB<=15539;
       23:indataB<=16187;
       24:indataB<=15936;
       25:indataB<=15293;
       26:indataB<=14653;
       27:indataB<=14015;
       28:indataB<=13380;
       29:indataB<=12748;
       30:indataB<=12117;
       31:indataB<=11490;
       32:indataB<=10864;
       33:indataB<=10241;
       34:indataB<=9621;
       35:indataB<=9002;
       36:indataB<=8386;
       37:indataB<=7773;
       38:indataB<=7162;
       39:indataB<=6553;
       40:indataB<=5946;
       41:indataB<=5341;
       42:indataB<=4739;
       43:indataB<=4139;
       44:indataB<=3541;
       45:indataB<=2946;
       46:indataB<=2352;
       47:indataB<=1761;
       48:indataB<=1172;
       49:indataB<=585;
     endcase
  end
endcase
if(fil_index_in==24) begin
   //! Done all Filterbank Calc
   write_po<=0; 
   addr_po<=0;
   indata_po<=0;
   write_mfb<=0;
   addr_mfb<=0;
   indata_mfb<=0;
   log_en<=0;
   fil_index_in<=0;

   //! to next process
   process_index<=process_index+1;
end else begin

   if(fil_calc_index==fil_index_num+1)begin

      if(fil_dv==1) begin

	 write_mfb<=1;
	 indata_mfb<=MFBtmp_out/2;
	 addr_mfb<=fil_index_in;

	 fil_index_in<=fil_index_in+1;
	 fil_calc_index<=0;
	 MFBtmp_in<=0;
	 MFB_tmp<=0;
	 indataA<=0;
	 log_en<=0;
	 fil_calc_cnt<=0;
      end else begin // if (fil_dv==1)
	 //! 
	 log_en<=1;
      end

   end else begin
      case(fil_calc_cnt)
	0:begin
	   fil_calc_cnt<=fil_calc_cnt+1;
	end
	1:begin
	   //! start point
	   addr_po<=addr_now;
	   fil_calc_cnt<=fil_calc_cnt+1;
	end
	2:begin
	   //! start point
	   addr_po<=addr_po+1;
	   fil_calc_cnt<=fil_calc_cnt+1;
	end
	3:begin
	   //! Multiply
	   addr_po<=addr_po+1;
	   indataA<=outdata_po;
	   fil_calc_index<=fil_calc_index+1;
	   fil_calc_cnt<=fil_calc_cnt+1;
	end
	4:begin

	   indataA<=outdata_po;
	   addr_po<=addr_po+1;
	   fil_calc_index<=fil_calc_index+1; //!< (FilterbankParam into indataB)
	   fil_calc_cnt<=fil_calc_cnt+1;

	   MFBtmp_in<=outdataX;
	end
	5:begin

	   indataA<=outdata_po;
	   addr_po<=addr_po+1;
	   fil_calc_index<=fil_calc_index+1;

	   MFBtmp_in<=MFBtmp_in+outdataX;
		indata_mfb<=MFBtmp_out/2;
	end
      endcase

   end



end//fil_index_in
