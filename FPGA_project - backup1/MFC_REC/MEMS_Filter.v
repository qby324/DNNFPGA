`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:31 06/26/2012 
// Design Name: 
// Module Name:    BPF 
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
//	少なくとも サンプリング周波数*足し合わせの回数 のクロックで動いてくれないと間に合わない
//
// mems mic 用のデータ
//
// 8kHz * 14bit
//
///////////////////////////////////////////////////////////////////////////////
module MEMS_Filter(clk,sclk,reset, x_i, dv,x_o);

parameter BWIDTH=16;					//!< データ用レジスタのビット幅
parameter TAP_SIZE=512;					//!< Filterのtapサイズ
parameter TAP_SIZE_o=16;				//!< 32で割った値（同時進行させる）

input clk;										//!< clock
input sclk;										//!< sampling frequency
input reset;									//!< not used...
input x_i;										//!< Input Data
output signed [BWIDTH-1:0] x_o;			//!< Output Data
output dv;										//!< Data Valid

reg signed [BWIDTH-1:0] x_o=0;			//!< 
reg dv=0;

reg signed [15:0]OFFSET=13000;


//*		その他		*//
(* KEEP = "TRUE" *) reg [TAP_SIZE-1:0] data=0;		//!< Data Delay
reg signed [BWIDTH-1:0] sum0=0;	//!< 合計値
reg signed [BWIDTH-1:0] sum1=0;
reg signed [BWIDTH-1:0] sum2=0;
reg signed [BWIDTH-1:0] sum3=0;
reg signed [BWIDTH-1:0] sum4=0;
reg signed [BWIDTH-1:0] sum5=0;
reg signed [BWIDTH-1:0] sum6=0;
reg signed [BWIDTH-1:0] sum7=0;
reg signed [BWIDTH-1:0] sum8=0;
reg signed [BWIDTH-1:0] sum9=0;
reg signed [BWIDTH-1:0] sum10=0;
reg signed [BWIDTH-1:0] sum11=0;
reg signed [BWIDTH-1:0] sum12=0;
reg signed [BWIDTH-1:0] sum13=0;
reg signed [BWIDTH-1:0] sum14=0;
reg signed [BWIDTH-1:0] sum15=0;
reg signed [BWIDTH-1:0] sum16=0;
reg signed [BWIDTH-1:0] sum17=0;
reg signed [BWIDTH-1:0] sum18=0;
reg signed [BWIDTH-1:0] sum19=0;
reg signed [BWIDTH-1:0] sum20=0;
reg signed [BWIDTH-1:0] sum21=0;
reg signed [BWIDTH-1:0] sum22=0;
reg signed [BWIDTH-1:0] sum23=0;
reg signed [BWIDTH-1:0] sum24=0;
reg signed [BWIDTH-1:0] sum25=0;
reg signed [BWIDTH-1:0] sum26=0;
reg signed [BWIDTH-1:0] sum27=0;
reg signed [BWIDTH-1:0] sum28=0;
reg signed [BWIDTH-1:0] sum29=0;
reg signed [BWIDTH-1:0] sum30=0;
reg signed [BWIDTH-1:0] sum31=0;

//reg signed [BWIDTH-1:0] tmp[0:15];			//!< 
reg signed [BWIDTH-1:0] tmp0=0;
reg signed [BWIDTH-1:0] tmp1=0;
reg signed [BWIDTH-1:0] tmp2=0;
reg signed [BWIDTH-1:0] tmp3=0;
reg signed [BWIDTH-1:0] tmp4=0;
reg signed [BWIDTH-1:0] tmp5=0;
reg signed [BWIDTH-1:0] tmp6=0;
reg signed [BWIDTH-1:0] tmp7=0;
reg signed [BWIDTH-1:0] tmp8=0;
reg signed [BWIDTH-1:0] tmp9=0;
reg signed [BWIDTH-1:0] tmp10=0;
reg signed [BWIDTH-1:0] tmp11=0;
reg signed [BWIDTH-1:0] tmp12=0;
reg signed [BWIDTH-1:0] tmp13=0;
reg signed [BWIDTH-1:0] tmp14=0;
reg signed [BWIDTH-1:0] tmp15=0;


reg [4:0] process=0;							//!< 
//(* KEEP = "TRUE" *) reg signed [BWIDTH-1:0] weight [0:31];	//!< 重み
reg signed [BWIDTH-1:0] weight0;	//!< 合計値
reg signed [BWIDTH-1:0] weight1;
reg signed [BWIDTH-1:0] weight2;
reg signed [BWIDTH-1:0] weight3;
reg signed [BWIDTH-1:0] weight4;
reg signed [BWIDTH-1:0] weight5;
reg signed [BWIDTH-1:0] weight6;
reg signed [BWIDTH-1:0] weight7;
reg signed [BWIDTH-1:0] weight8;
reg signed [BWIDTH-1:0] weight9;
reg signed [BWIDTH-1:0] weight10;
reg signed [BWIDTH-1:0] weight11;
reg signed [BWIDTH-1:0] weight12;
reg signed [BWIDTH-1:0] weight13;
reg signed [BWIDTH-1:0] weight14;
reg signed [BWIDTH-1:0] weight15;
reg signed [BWIDTH-1:0] weight16;
reg signed [BWIDTH-1:0] weight17;
reg signed [BWIDTH-1:0] weight18;
reg signed [BWIDTH-1:0] weight19;
reg signed [BWIDTH-1:0] weight20;
reg signed [BWIDTH-1:0] weight21;
reg signed [BWIDTH-1:0] weight22;
reg signed [BWIDTH-1:0] weight23;
reg signed [BWIDTH-1:0] weight24;
reg signed [BWIDTH-1:0] weight25;
reg signed [BWIDTH-1:0] weight26;
reg signed [BWIDTH-1:0] weight27;
reg signed [BWIDTH-1:0] weight28;
reg signed [BWIDTH-1:0] weight29;
reg signed [BWIDTH-1:0] weight30;
reg signed [BWIDTH-1:0] weight31;

//* 	制御変数	*//
reg [6:0] i=0;									//!< ループ回数
reg _beforesclk=0;

//-------------------------------------------------------------------
// Data input
// 1 data per 1 clock
always@(posedge clk)begin
	`include "mic_coef.dat"
end

always@(posedge clk or negedge reset)begin		
	if(!reset)begin
		dv<=0;
		process<=0;
		data<=0;
		i<=0;
		x_o<=0;
		
		sum0<=0;
		sum1<=0;
		sum2<=0;
		sum3<=0;
		sum4<=0;
		sum5<=0;
		sum6<=0;
		sum7<=0;
		sum8<=0;
		sum9<=0;
		sum10<=0;
		sum11<=0;
		sum12<=0;
		sum13<=0;
		sum14<=0;
		sum15<=0;
		sum16<=0;
		sum17<=0;
		sum18<=0;
		sum19<=0;
		sum20<=0;
		sum21<=0;
		sum22<=0;
		sum23<=0;
		sum24<=0;
		sum25<=0;
		sum26<=0;
		sum27<=0;
		sum28<=0;
		sum29<=0;
		sum30<=0;
		sum31<=0;
	end else begin

		_beforesclk<=sclk;
		if(_beforesclk==0 && sclk==1)begin
			process<=1;
		end
		case(process)
			0:begin		//!< 待ち状態
				dv<=0;
				i<=0;
			end
			1:begin		//!< 新たに入って来たサンプルを格納
				data<={data[TAP_SIZE-2:0],x_i};
				//data[0]<=x_i;
				sum0<=0;
				sum1<=0;
				sum2<=0;
				sum3<=0;
				sum4<=0;
				sum5<=0;
				sum6<=0;
				sum7<=0;
				sum8<=0;
				sum9<=0;
				sum10<=0;
				sum11<=0;
				sum12<=0;
				sum13<=0;
				sum14<=0;
				sum15<=0;
				sum16<=0;
				sum17<=0;
				sum18<=0;
				sum19<=0;
				sum20<=0;
				sum21<=0;
				sum22<=0;
				sum23<=0;
				sum24<=0;
				sum25<=0;
				sum26<=0;
				sum27<=0;
				sum28<=0;
				sum29<=0;
				sum30<=0;
				sum31<=0;
				tmp0<=0;
				tmp1<=0;
				tmp2<=0;
				tmp3<=0;
				tmp4<=0;
				tmp5<=0;
				tmp6<=0;
				tmp7<=0;
				tmp8<=0;
				tmp9<=0;
				tmp10<=0;
				tmp11<=0;
				tmp12<=0;
				tmp13<=0;
				tmp14<=0;
				tmp15<=0;
				i<=i+1;
				process<=2;
			end
			2:begin		//!< サンプルに対して重みをかけて加算する(4分割)
				if(i==TAP_SIZE_o)begin
					process<=3;
					i<=0;
				end else begin
					i<=i+1;
				end					
				if(data[i-1]==1)sum0<=sum0+weight0;
				if(data[i-1+TAP_SIZE_o*1]==1)sum1<=sum1+weight1;
				if(data[i-1+TAP_SIZE_o*2]==1)sum2<=sum2+weight2;
				if(data[i-1+TAP_SIZE_o*3]==1)sum3<=sum3+weight3;
				if(data[i-1+TAP_SIZE_o*4]==1)sum4<=sum4+weight4;
				if(data[i-1+TAP_SIZE_o*5]==1)sum5<=sum5+weight5;
				if(data[i-1+TAP_SIZE_o*6]==1)sum6<=sum6+weight6;
				if(data[i-1+TAP_SIZE_o*7]==1)sum7<=sum7+weight7;
				if(data[i-1+TAP_SIZE_o*8]==1)sum8<=sum8+weight8;
				if(data[i-1+TAP_SIZE_o*9]==1)sum9<=sum9+weight9;
				if(data[i-1+TAP_SIZE_o*10]==1)sum10<=sum10+weight10;
				if(data[i-1+TAP_SIZE_o*11]==1)sum11<=sum11+weight11;
				if(data[i-1+TAP_SIZE_o*12]==1)sum12<=sum12+weight12;
				if(data[i-1+TAP_SIZE_o*13]==1)sum13<=sum13+weight13;
				if(data[i-1+TAP_SIZE_o*14]==1)sum14<=sum14+weight14;
				if(data[i-1+TAP_SIZE_o*15]==1)sum15<=sum15+weight15;
				if(data[i-1+TAP_SIZE_o*16]==1)sum16<=sum16+weight16;
				if(data[i-1+TAP_SIZE_o*17]==1)sum17<=sum17+weight17;
				if(data[i-1+TAP_SIZE_o*18]==1)sum18<=sum18+weight18;
				if(data[i-1+TAP_SIZE_o*19]==1)sum19<=sum19+weight19;
				if(data[i-1+TAP_SIZE_o*20]==1)sum20<=sum20+weight20;
				if(data[i-1+TAP_SIZE_o*21]==1)sum21<=sum21+weight21;
				if(data[i-1+TAP_SIZE_o*22]==1)sum22<=sum22+weight22;
				if(data[i-1+TAP_SIZE_o*23]==1)sum23<=sum23+weight23;
				if(data[i-1+TAP_SIZE_o*24]==1)sum24<=sum24+weight24;
				if(data[i-1+TAP_SIZE_o*25]==1)sum25<=sum25+weight25;
				if(data[i-1+TAP_SIZE_o*26]==1)sum26<=sum26+weight26;
				if(data[i-1+TAP_SIZE_o*27]==1)sum27<=sum27+weight27;
				if(data[i-1+TAP_SIZE_o*28]==1)sum28<=sum28+weight28;
				if(data[i-1+TAP_SIZE_o*29]==1)sum29<=sum29+weight29;
				if(data[i-1+TAP_SIZE_o*30]==1)sum30<=sum30+weight30;
				if(data[i-1+TAP_SIZE_o*31]==1)sum31<=sum31+weight31;

			end
			3:begin	//BPFをかけたサンプルを出力
				i<=0;
				tmp0<=sum0+sum1;
				tmp1<=sum2+sum3;
				tmp2<=sum4+sum5;
				tmp3<=sum6+sum7;
				tmp4<=sum8+sum9;
				tmp5<=sum10+sum11;
				tmp6<=sum12+sum13;
				tmp7<=sum14+sum15;
				tmp8<=sum16+sum17;
				tmp9<=sum18+sum19;
				tmp10<=sum20+sum21;
				tmp11<=sum22+sum23;
				tmp12<=sum24+sum25;
				tmp13<=sum26+sum27;
				tmp14<=sum28+sum29;
				tmp15<=sum30+sum31;
				process<=4;
			end
			4:begin
				tmp0<=tmp0+tmp1;
				tmp2<=tmp2+tmp3;
				tmp4<=tmp4+tmp5;
				tmp6<=tmp6+tmp7;
				tmp8<=tmp8+tmp9;
				tmp10<=tmp10+tmp11;
				tmp12<=tmp12+tmp13;
				tmp14<=tmp14+tmp15;			
				process<=5;
			end
			5:begin
				tmp0<=tmp0+tmp2;
				tmp4<=tmp4+tmp6;
				tmp8<=tmp8+tmp10;
				tmp12<=tmp12+tmp14;
				process<=6;
			end
			6:begin
				tmp0<=tmp0+tmp4;
				tmp8<=tmp8+tmp12;
				process<=7;
			end
			7:begin
				tmp0<=tmp0+tmp8;
				process<=8;
			end
			8:begin
				process<=0;
				dv<=1;
				x_o<=tmp0-OFFSET;
			end
		endcase
	end
end

endmodule
