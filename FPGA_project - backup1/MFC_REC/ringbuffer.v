
	// サンプリング周波数：write=1
	if(write==1)begin
		writeR<=1;
		addrR<=ringaddr;
		indataR<=x_i;

		shift_cnt<=shift_cnt+1;
		ringaddr<=ringaddr+1;

	end else begin
		writeR<=0;

	 	//シフト中の処理
		if(shift_start==1)begin
			//フレームを完成させた時
			if(shift_framecnt==WINDOWSIZE)begin
				process_index<=1;
				shift_start<=0;
				shift_addr<=0;
				shift_framecnt<=0;
				write1<=0;
			end else begin //フレーム作成中
				case(shift_in_cnt)
					0:begin
						addrR<=shift_addr;
						shift_addr<=shift_addr-1;
						shift_in_cnt<=shift_in_cnt+1;	
					end
					1:begin
						shift_in_cnt<=shift_in_cnt+1;						
					end
					2:begin
						shift_tmp<=outdataR;
						shift_in_cnt<=shift_in_cnt+1;
					end
					3:begin
						write1<=1;
						addr1<=(WINDOWSIZE-1)-shift_framecnt;
						indata1<=shift_tmp;
						shift_framecnt<=shift_framecnt+1;
						shift_in_cnt<=0;
					end
				endcase
			end

		end
		
	end

	//フレーム周期だけサンプルを格納した時、
	//シフト開始のフラグが立つ
	if(shift_cnt==SHIFTSIZE)begin
		shift_start<=1;
		shift_cnt<=0;
		shift_addr<=ringaddr-1;
	end
