
/***********************************低次項の取り出し******************************/

case(pick_cnt)
	//データの読み込み
	2:begin
		pick_tmp<=outdata3;
		pick_cnt<=pick_cnt+1;
	end
	
	//データの書き込み
	3:begin
		//先頭(パワー)をC0として一旦確保する
		if(pick_calc_index==0)begin
			write3<=0;
			C0<=outdata3;
			pick_calc_index<=pick_calc_index+1;
			
		//一番最後（12番目）になったら、おしまい
		end else if(pick_calc_index==13) begin
			write3<=1;
			addr3<=pick_calc_index-1;
			indata3<=C0;
			
			pick_tmp<=0;
			pick_calc_index<=0;
			process_index<=process_index+1;

		//それ以外の時は、一つ前のアドレスにデータを入れる
		end else begin
			write3<=1;
			addr3<=pick_calc_index-1;
			indata3<=pick_tmp;
			pick_calc_index<=pick_calc_index+1;
		end
		pick_cnt<=0;
	end
	
	//アドレスを更新
	default:begin
		addr3<=pick_calc_index;		//前のプロセスでアドレスが初期化されていなくてもここで0からスタート出来る
		write3<=0;
		pick_cnt<=pick_cnt+1;	
	end
endcase
