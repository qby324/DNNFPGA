`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:57:28 01/04/2015
// Design Name:   FFT_16kHz
// Module Name:   C:/.Xilinx/HMM-Viterbi/test_fft.v
// Project Name:  WordDetect
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FFT_16kHz
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fft;

	// Inputs
	reg clk;
	reg sclr;
	reg start;
	reg fwd_inv;
	reg fwd_inv_we;
	reg [29:0] xn_re;
	reg [29:0] xn_im;

	// Outputs
	wire rfd;
	wire busy;
	wire edone;
	wire done;
	wire dv;
	wire [8:0] xn_index;
	wire [8:0] xk_index;
	wire signed [39:0] xk_re;
	wire signed [39:0] xk_im;

	// Instantiate the Unit Under Test (UUT)
	FFT_16kHz uut (
		.clk(clk), 
		.sclr(sclr), 
		.start(start), 
		.fwd_inv(fwd_inv), 
		.fwd_inv_we(fwd_inv_we), 
		.rfd(rfd), 
		.busy(busy), 
		.edone(edone), 
		.done(done), 
		.dv(dv), 
		.xn_re(xn_re), 
		.xn_im(xn_im), 
		.xn_index(xn_index), 
		.xk_index(xk_index), 
		.xk_re(xk_re), 
		.xk_im(xk_im)
	);
	parameter STEP = 20;
	parameter STEP_half=10;
	always begin
		#STEP_half;
		clk<=~clk;
	end
	
	reg [29:0]indata[0:511];
	reg [39:0]outdata_re[0:511];
	reg [39:0]outdata_im[0:511];
	reg [63:0]abs[0:511];
	wire [93:0]tmp_abs;
	assign tmp_abs = xk_re*xk_re + xk_im*xk_im;
	
	
	integer i;
	reg fftok=0;
	
	always@(posedge clk) begin
	if (fftok)begin
		if (rfd == 1)begin
			xn_re <= indata[i];
			if (i < 512)begin
				i <= i+1;
			end else begin
				i <= 0;
			end
		end else begin
			xn_re <= 0;
		end
	end
	
	if (dv)begin
		fftok <= 0;
		outdata_re[xk_index] <=xk_re;
		outdata_im[xk_index] <=xk_im;
		abs[xk_index] <= tmp_abs[93:30];
	end
	
	
	end
	
	
	
	initial begin
		// Initialize Inputs
		clk = 0;
		sclr = 0;
		start = 0;
		fwd_inv = 0;
		fwd_inv_we = 0;
		xn_re = 0;
		xn_im = 0;
indata[0] = -6630;
indata[1] = -6630;
indata[2] = -6646;
indata[3] = -6671;
indata[4] = -6704;
indata[5] = -6746;
indata[6] = -6795;
indata[7] = -6853;
indata[8] = -6928;
indata[9] = -7011;
indata[10] = -7094;
indata[11] = -7193;
indata[12] = -7301;
indata[13] = -7425;
indata[14] = -7549;
indata[15] = -7682;
indata[16] = -7831;
indata[17] = -7980;
indata[18] = -8146;
indata[19] = -8320;
indata[20] = -8502;
indata[21] = -8693;
indata[22] = -8892;
indata[23] = -9099;
indata[24] = -9315;
indata[25] = -9538;
indata[26] = -9779;
indata[27] = -10019;
indata[28] = -10268;
indata[29] = -10533;
indata[30] = -10798;
indata[31] = -11080;
indata[32] = -11362;
indata[33] = -11660;
indata[34] = -11958;
indata[35] = -12273;
indata[36] = -12588;
indata[37] = -12911;
indata[38] = -13251;
indata[39] = -13591;
indata[40] = -13939;
indata[41] = -14295;
indata[42] = -14660;
indata[43] = -15033;
indata[44] = -15414;
indata[45] = -15804;
indata[46] = -16202;
indata[47] = -16599;
indata[48] = -17005;
indata[49] = -17420;
indata[50] = -17842;
indata[51] = -18273;
indata[52] = -18704;
indata[53] = -19152;
indata[54] = -19599;
indata[55] = -20055;
indata[56] = -20511;
indata[57] = -20975;
indata[58] = -21448;
indata[59] = -21928;
indata[60] = -22409;
indata[61] = -22906;
indata[62] = -23395;
indata[63] = -23901;
indata[64] = -24398;
indata[65] = -24912;
indata[66] = -25426;
indata[67] = -25948;
indata[68] = -26470;
indata[69] = -27000;
indata[70] = -27531;
indata[71] = -28069;
indata[72] = -28616;
indata[73] = -29163;
indata[74] = -29710;
indata[75] = -30265;
indata[76] = -30821;
indata[77] = -31384;
indata[78] = -31948;
indata[79] = -32511;
indata[80] = -33083;
indata[81] = -33655;
indata[82] = -34227;
indata[83] = -34807;
indata[84] = -35387;
indata[85] = -35976;
indata[86] = -36556;
indata[87] = -37144;
indata[88] = -37732;
indata[89] = -38329;
indata[90] = -38918;
indata[91] = -39514;
indata[92] = -40111;
indata[93] = -40699;
indata[94] = -41304;
indata[95] = -41901;
indata[96] = -1474;
indata[97] = 40105;
indata[98] = 51214;
indata[99] = -1536;
indata[100] = -17811;
indata[101] = -18048;
indata[102] = 54020;
indata[103] = -29795;
indata[104] = 38308;
indata[105] = 27233;
indata[106] = 15873;
indata[107] = -7627;
indata[108] = -1723;
indata[109] = 22523;
indata[110] = 4374;
indata[111] = 23054;
indata[112] = -20648;
indata[113] = -8178;
indata[114] = 23845;
indata[115] = -21349;
indata[116] = 24368;
indata[117] = 17994;
indata[118] = 11478;
indata[119] = -8720;
indata[120] = -43019;
indata[121] = -36536;
indata[122] = -2006;
indata[123] = 54342;
indata[124] = -23387;
indata[125] = -59512;
indata[126] = 5163;
indata[127] = 41775;
indata[128] = -31637;
indata[129] = -17028;
indata[130] = 12859;
indata[131] = 50833;
indata[132] = -32739;
indata[133] = 43980;
indata[134] = 44340;
indata[135] = -25721;
indata[136] = 37158;
indata[137] = 108959;
indata[138] = 37728;
indata[139] = 78331;
indata[140] = 46408;
indata[141] = 63103;
indata[142] = 38826;
indata[143] = -18977;
indata[144] = -2401;
indata[145] = -27638;
indata[146] = 48333;
indata[147] = -27993;
indata[148] = 74648;
indata[149] = -11098;
indata[150] = 23520;
indata[151] = 6214;
indata[152] = 32566;
indata[153] = 32744;
indata[154] = 6318;
indata[155] = 122260;
indata[156] = 6385;
indata[157] = 69466;
indata[158] = 78865;
indata[159] = 79240;
indata[160] = 116166;
indata[161] = 61620;
indata[162] = 61889;
indata[163] = 80677;
indata[164] = 90316;
indata[165] = 53337;
indata[166] = 62922;
indata[167] = 25524;
indata[168] = 53954;
indata[169] = 120501;
indata[170] = 16289;
indata[171] = 6800;
indata[172] = 25972;
indata[173] = 26053;
indata[174] = -12403;
indata[175] = 161459;
indata[176] = -2785;
indata[177] = 113775;
indata[178] = 84842;
indata[179] = 114337;
indata[180] = 104811;
indata[181] = 154076;
indata[182] = 46305;
indata[183] = 36549;
indata[184] = 36616;
indata[185] = 36679;
indata[186] = -52325;
indata[187] = 145815;
indata[188] = -32625;
indata[189] = 17017;
indata[190] = 56827;
indata[191] = 106675;
indata[192] = 37002;
indata[193] = 27057;
indata[194] = 96950;
indata[195] = 17104;
indata[196] = 57085;
indata[197] = 57102;
indata[198] = 17121;
indata[199] = 77117;
indata[200] = 67118;
indata[201] = -2874;
indata[202] = 67098;
indata[203] = 107050;
indata[204] = 57056;
indata[205] = 126896;
indata[206] = 7107;
indata[207] = 86837;
indata[208] = -12820;
indata[209] = 116515;
indata[210] = 36891;
indata[211] = 86462;
indata[212] = 46705;
indata[213] = 36738;
indata[214] = 46559;
indata[215] = 16890;
indata[216] = 85774;
indata[217] = 36479;
indata[218] = 36404;
indata[219] = -22380;
indata[220] = -41854;
indata[221] = 65366;
indata[222] = -22220;
indata[223] = 16590;
indata[224] = -60743;
indata[225] = 55034;
indata[226] = -21971;
indata[227] = 45122;
indata[228] = -2743;
indata[229] = -12246;
indata[230] = 92064;
indata[231] = -2715;
indata[232] = -2705;
indata[233] = 25426;
indata[234] = 6652;
indata[235] = -77065;
indata[236] = 15857;
indata[237] = -11870;
indata[238] = -39359;
indata[239] = -11765;
indata[240] = 79240;
indata[241] = 24553;
indata[242] = 141522;
indata[243] = -2576;
indata[244] = 166840;
indata[245] = 50658;
indata[246] = 32744;
indata[247] = 129058;
indata[248] = 49824;
indata[249] = 110230;
indata[250] = 126821;
indata[251] = 74648;
indata[252] = 125276;
indata[253] = 116021;
indata[254] = 31210;
indata[255] = 39358;
indata[256] = 14206;
indata[257] = 55304;
indata[258] = 104013;
indata[259] = 95152;
indata[260] = 54136;
indata[261] = 5704;
indata[262] = 93067;
indata[263] = 68698;
indata[264] = 60342;
indata[265] = 52102;
indata[266] = 20883;
indata[267] = 66528;
indata[268] = 20541;
indata[269] = 35386;
indata[270] = 5303;
indata[271] = 86426;
indata[272] = 56401;
indata[273] = 12410;
indata[274] = 12297;
indata[275] = 47752;
indata[276] = 40250;
indata[277] = 11949;
indata[278] = 18743;
indata[279] = 52768;
indata[280] = 25144;
indata[281] = 24884;
indata[282] = -15175;
indata[283] = 11240;
indata[284] = 11120;
indata[285] = 36691;
indata[286] = 36285;
indata[287] = 17037;
indata[288] = 66524;
indata[289] = -26320;
indata[290] = 4322;
indata[291] = 58226;
indata[292] = 27916;
indata[293] = 27577;
indata[294] = 33012;
indata[295] = 4066;
indata[296] = 32189;
indata[297] = 37334;
indata[298] = 69791;
indata[299] = 41786;
indata[300] = 25188;
indata[301] = 24849;
indata[302] = 24505;
indata[303] = 34421;
indata[304] = 23826;
indata[305] = 33455;
indata[306] = 32965;
indata[307] = -15911;
indata[308] = -10906;
indata[309] = 31521;
indata[310] = 3295;
indata[311] = 3244;
indata[312] = 34567;
indata[313] = 3142;
indata[314] = -1248;
indata[315] = 11582;
indata[316] = 32392;
indata[317] = 15332;
indata[318] = 23198;
indata[319] = 30788;
indata[320] = 10641;
indata[321] = 25876;
indata[322] = -1088;
indata[323] = 17525;
indata[324] = 13558;
indata[325] = -1030;
indata[326] = 13064;
indata[327] = 40443;
indata[328] = 12574;
indata[329] = 28942;
indata[330] = -4194;
indata[331] = -26470;
indata[332] = -900;
indata[333] = 2185;
indata[334] = -3870;
indata[335] = -3790;
indata[336] = -6597;
indata[337] = -811;
indata[338] = -14614;
indata[339] = -8889;
indata[340] = 33637;
indata[341] = -11096;
indata[342] = -18444;
indata[343] = -15561;
indata[344] = -15215;
indata[345] = -3044;
indata[346] = -5286;
indata[347] = 1608;
indata[348] = -11658;
indata[349] = -13536;
indata[350] = -19522;
indata[351] = -12901;
indata[352] = -6584;
indata[353] = 3347;
indata[354] = 1358;
indata[355] = -4254;
indata[356] = 12176;
indata[357] = -5815;
indata[358] = -2220;
indata[359] = -5529;
indata[360] = -7031;
indata[361] = 2738;
indata[362] = -447;
indata[363] = -6512;
indata[364] = -425;
indata[365] = -11958;
indata[366] = -7439;
indata[367] = -4507;
indata[368] = -4395;
indata[369] = 10049;
indata[370] = -2907;
indata[371] = 4599;
indata[372] = -12437;
indata[373] = -13319;
indata[374] = -10689;
indata[375] = -9315;
indata[376] = -4707;
indata[377] = -8892;
indata[378] = -8693;
indata[379] = -11580;
indata[380] = -8320;
indata[381] = -12078;
indata[382] = -7980;
indata[383] = -271;
indata[384] = -3974;
indata[385] = -6638;
indata[386] = -4737;
indata[387] = 1508;
indata[388] = -2853;
indata[389] = 6601;
indata[390] = 602;
indata[391] = 2267;
indata[392] = -6026;
indata[393] = -235;
indata[394] = 579;
indata[395] = 3003;
indata[396] = 5403;
indata[397] = 4581;
indata[398] = 570;
indata[399] = -3430;
indata[400] = 0;
indata[401] = 0;
indata[402] = 0;
indata[403] = 0;
indata[404] = 0;
indata[405] = 0;
indata[406] = 0;
indata[407] = 0;
indata[408] = 0;
indata[409] = 0;
indata[410] = 0;
indata[411] = 0;
indata[412] = 0;
indata[413] = 0;
indata[414] = 0;
indata[415] = 0;
indata[416] = 0;
indata[417] = 0;
indata[418] = 0;
indata[419] = 0;
indata[420] = 0;
indata[421] = 0;
indata[422] = 0;
indata[423] = 0;
indata[424] = 0;
indata[425] = 0;
indata[426] = 0;
indata[427] = 0;
indata[428] = 0;
indata[429] = 0;
indata[430] = 0;
indata[431] = 0;
indata[432] = 0;
indata[433] = 0;
indata[434] = 0;
indata[435] = 0;
indata[436] = 0;
indata[437] = 0;
indata[438] = 0;
indata[439] = 0;
indata[440] = 0;
indata[441] = 0;
indata[442] = 0;
indata[443] = 0;
indata[444] = 0;
indata[445] = 0;
indata[446] = 0;
indata[447] = 0;
indata[448] = 0;
indata[449] = 0;
indata[450] = 0;
indata[451] = 0;
indata[452] = 0;
indata[453] = 0;
indata[454] = 0;
indata[455] = 0;
indata[456] = 0;
indata[457] = 0;
indata[458] = 0;
indata[459] = 0;
indata[460] = 0;
indata[461] = 0;
indata[462] = 0;
indata[463] = 0;
indata[464] = 0;
indata[465] = 0;
indata[466] = 0;
indata[467] = 0;
indata[468] = 0;
indata[469] = 0;
indata[470] = 0;
indata[471] = 0;
indata[472] = 0;
indata[473] = 0;
indata[474] = 0;
indata[475] = 0;
indata[476] = 0;
indata[477] = 0;
indata[478] = 0;
indata[479] = 0;
indata[480] = 0;
indata[481] = 0;
indata[482] = 0;
indata[483] = 0;
indata[484] = 0;
indata[485] = 0;
indata[486] = 0;
indata[487] = 0;
indata[488] = 0;
indata[489] = 0;
indata[490] = 0;
indata[491] = 0;
indata[492] = 0;
indata[493] = 0;
indata[494] = 0;
indata[495] = 0;
indata[496] = 0;
indata[497] = 0;
indata[498] = 0;
indata[499] = 0;
indata[500] = 0;
indata[501] = 0;
indata[502] = 0;
indata[503] = 0;
indata[504] = 0;
indata[505] = 0;
indata[506] = 0;
indata[507] = 0;
indata[508] = 0;
indata[509] = 0;
indata[510] = 0;
indata[511] = 0;
indata[512] = 0;

		// Wait 100 ns for global reset to finish
		#100;
      fftok = 1;
		start = 1;
		// Add stimulus here
		
	end
      
endmodule

