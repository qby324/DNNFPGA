`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:18 07/26/2013 
// Design Name: 
// Module Name:    NN 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// 	入力ベクトルをニューラルネットに通して出力
// 	重み:W_aと,バイアス:W_b はnn.datに記述してinclude
// 	レイヤ数は自由だが、レイヤのサイズは layersize に追加する必要がある
//
//	//!<スパース用の改造
// 	スパースに対応させるため、インデックスを用意する
//	indexは"ユニットのサイズ"と同じサイズだが、1bit
//	
//	パラメータ配列は0を抜いてぎっしり詰め込む
//	パラメータ配列のサイズとインデックスの1の数の合計は同じになっている
//	インデックスが0の時は掛け算処理をせずにデータのアドレスを進める。パラメータのアドレスはそのままにする
//
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// 
//
//////////////////////////////////////////////////////////////////////////////////
module NNsp(clk,reset,start,write,x_i,x_o,done,dv,result);
	input clk;
	input reset;
	input start;
	input write;
	input signed [31:0] x_i;
	output signed [31:0] x_o;
	output dv;
	output done;
	output result;
	reg signed [31:0] x_o=0;
	reg dv=0;
	reg done=0;
	reg result=0;
///////////////////////////////////////////////////////////////////////////////
/// Parameter
///////////////////////////////////////////////////////////////////////////////
parameter NUMLAYER=3;			//!< LAYERの数。
parameter PARAMSIZE_LAYER1=400;	//!< 実際保持しているパラメータ数。0は含まない
parameter PARAMSIZE_LAYER2=100; //!< LAYERn-1からLAYERnを作るためのパラメータ数
parameter PARAMSIZE_LAYER3=100; 
parameter BIASSIZE_LAYER1=50;	//!< LAYER0からLAYER1を作るためのバイアス項の数
parameter BIASSIZE_LAYER2=50;	
parameter BIASSIZE_LAYER3=2;	
parameter UNITSIZE_LAYER0=420;	//!< 各レイヤーサイズ。LAYER0は入力ベクトル
parameter UNITSIZE_LAYER1=100;	
parameter UNITSIZE_LAYER2=100;	
parameter UNITSIZE_LAYER3=2;	//!< 出力レイヤー

///////////////////////////////////////////////////////////////////////////////
/// Register
///////////////////////////////////////////////////////////////////////////////
//! 各レイヤーの出力値[第○層][各ユニットの結果]
reg signed [31:0] n_a0 [0:UNITSIZE_LAYER0-1]; 
reg signed [31:0] n_a1 [0:UNITSIZE_LAYER1-1]; 
reg signed [31:0] n_a2 [0:UNITSIZE_LAYER2-1]; 
reg signed [31:0] n_a3 [0:UNITSIZE_LAYER3-1];
 
//! W_a 各ユニットのパラメータ [第○層][ユニット番号][次のユニット番号]
//! W_b 各ユニットのバイアス項[第○層][次のユニット番号]
reg signed [31:0] W_a ;
reg signed [31:0] W_b ; 

//! index配列
/* ニューラルネットの掛け算を行う時のパラメータの有無
 * パラメータが0なら0、値を持っているなら1を取る
 * (ex)index_1
 * 入力特徴量(0層)->隠れ層(1層)のネットでLayer1-Unit1を構成するには、
 * L0-U1からL0-U420それぞれに対して掛けるパラメータを持つ
 *
 * またバイアス項(b)の有無はindex_x[:][end]に入れるものとする
*/
reg index;
reg [2:0] layer_ad=0;
//! 	Other Register
reg load_cp=0;	//!< input data:load complete

reg [9:0] index_ad=0;	//!< インデックス
reg [9:0] unit_ad=0;	//!< 次のユニット作成時のアドレス
reg [9:0] param_ad=0;	//!< 乗算のパラメーターのアドレス
reg [3:0] process=0;	//!< プロセス
reg [3:0] result_process=0;
reg result_start=0;

//----------------------------------------------------------------------------
///init:ROM, unit param
//----------------------------------------------------------------------------
integer l,i,j,k;
initial begin
	for(l=0;l<UNITSIZE_LAYER0;l=l+1)begin
		n_a0[l]=0;
	end	
	for(i=0;i<UNITSIZE_LAYER1;i=i+1)begin
		n_a1[i]=0;
	end
	for(j=0;j<UNITSIZE_LAYER2;j=j+1)begin
		n_a2[j]=0;
	end
	for(k=0;k<UNITSIZE_LAYER3;k=k+1)begin
		n_a3[k]=0;
	end

end

///////////////////////////////////////////////////////////////////////////////
/// main
///////////////////////////////////////////////////////////////////////////////
always@(posedge clk)begin

	//!param
	`include "nn.dat";
	//!param index
	`include "index.dat"
	
	if(!reset)begin
		//!output port
		x_o<=0;
		dv<=0;
		done<=0;
		result<=0;
		
		//!other register
		
		
	end else if(start == 1)begin
		
		if(write==1)begin
		//!loading input feature
			n_a0[index_ad]<=x_i;
			if(index_ad == UNITSIZE_LAYER0-1)begin
				load_cp<=1;
				index_ad<=0;
			end else begin
				index_ad<=index_ad+1;
			end
		end else begin
			//!<input data complete
			if(load_cp == 1)begin
				//! calc each unit
				case(process)
				0:begin
					//!1layerの最終ユニットの計算が終わった
					if(unit_ad == UNITSIZE_LAYER1)begin 					//!<
						unit_ad<=0;
						param_ad<=0;
						layer_ad<=1;
						process<=1;
					end else begin
						//!1ユニットの計算が終わった
						if(param_ad == PARAMSIZE_LAYER1)begin 				//!<
							index_ad<=0;
							unit_ad<=unit_ad+1;
							//!ユニットのバイアスを足す
							if(index==1)begin					//!<
								n_a1[unit_ad]<=n_a1[unit_ad] + W_b;	//!<
							end
						end else begin
							index_ad<=index_ad+1;
							//!indexを参照してパラメータが0でなければ掛け算
							if(index_ad==0)begin
								if(index==1)begin					//!<
									param_ad <= param_ad+1;
									n_a1[unit_ad]<= n_a0[index_ad]*W_a;//!<
								end else begin
									n_a1[unit_ad]<=0;
								end
							end else begin
								if(index==1)begin					//!<
									param_ad <= param_ad+1;
									n_a1[unit_ad]<=n_a1[unit_ad] + n_a0[index_ad]*W_a;//!<
								end
							end
						end
					end
				end
				1:begin	//!< Layer1 -> Layer2
					//!1layerの最終ユニットの計算が終わった
					if(unit_ad == UNITSIZE_LAYER2)begin 					//!<
						unit_ad<=0;
						param_ad<=0;
						layer_ad<=2;
						process<=2;
					end else begin
						//!1ユニットの計算が終わった
						if(param_ad == PARAMSIZE_LAYER2)begin 				//!<
							index_ad<=0;
							unit_ad<=unit_ad+1;
							//!ユニットのバイアスを足す
							if(index==1)begin					//!<
								n_a2[unit_ad]<=n_a2[unit_ad] + W_b;	//!<
							end
						end else begin
							index_ad<=index_ad+1;
							//!indexを参照してパラメータが0でなければ掛け算
							if(index_ad==0)begin
								if(index==1)begin					//!<
									param_ad <= param_ad+1;
									n_a2[unit_ad]<= n_a1[index_ad]*W_a;//!<
								end else begin
									n_a2[unit_ad]<=0;
								end
							end else begin
								if(index==1)begin					//!<
									param_ad <= param_ad+1;
									n_a2[unit_ad]<=n_a2[unit_ad] + n_a1[index_ad]*W_a;//!<
								end
							end
						end
					end
				end
				2:begin
					//!1layerの最終ユニットの計算が終わった
					if(unit_ad == UNITSIZE_LAYER3)begin 					//!<
						unit_ad<=0;
						param_ad<=0;
						layer_ad<=0;
						process<=3;
					end else begin
						//!1ユニットの計算が終わった
						if(param_ad == PARAMSIZE_LAYER3)begin 				//!<
							index_ad<=0;
							unit_ad<=unit_ad+1;
							//!ユニットのバイアスを足す
							if(index==1)begin					//!<
								n_a3[unit_ad]<=n_a3[unit_ad] + W_b;	//!<
							end
						end else begin
							index_ad<=index_ad+1;
							//!indexを参照してパラメータが0でなければ掛け算
							if(index_ad==0)begin
								if(index==1)begin					//!<
									param_ad <= param_ad+1;
									n_a3[unit_ad]<= n_a2[index_ad]*W_a;//!<
								end else begin
									n_a3[unit_ad]<=0;
								end
							end else begin
								if(index==1)begin					//!<
									param_ad <= param_ad+1;
									n_a3[unit_ad]<=n_a3[unit_ad] + n_a2[index_ad]*W_a;//!<
								end
							end
						end
					end
				end
				3:begin
				//!		結果出力を起動
					result_start<=1;
					load_cp<=0;
					process<=0;
				end
				endcase

			end		//load cp==1
		
		end			// write==1
		
//------------------------------------------------------------------------
//!		結果出力
//------------------------------------------------------------------------	
		if(result_start==1)begin
			case(result_process)
				0:begin
					done<=0;
					dv<=1;
					if(n_a3[0] > n_a3[1])begin
						result<=1;
					end
					x_o<=n_a3[0];
					result_process<=1;
				end
				1:begin
					x_o<=n_a3[1];
					result_process<=2;
				end
				2:begin
					dv<=0;
					x_o<=0;
					result_process<=0;
					result_start<=0;
				end
			endcase
		end
		
	end else begin // start == 0

	end
end

endmodule
