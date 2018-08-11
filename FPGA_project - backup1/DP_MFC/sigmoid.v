`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         Chiba University
// Engineer:        H. Lee
// 
// Create Date:    17:49:05 12/18/2014 
// Design Name:      10 bit Sigmoid
// Module Name:    sigmoid 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:     Specified implement of a high-speed, low-cost approximate sigmoid calculation
//                      CLK costs: 13.5
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sigmoid #(parameter IBIT=32,OBIT=11,FBIT=10)(clk,dv_in,dv_out,sigin,sigout
    );
    input clk;
    input dv_in;
    output dv_out;
    input signed [IBIT-1:0] sigin;
    output signed [OBIT-1:0] sigout;
    
    reg dv_out = 0;
    reg signed [OBIT-1:0] sigout = 0;

    reg [IBIT:0]dividend = 0;
    reg [IBIT:0]divisor = 0;
    reg [11:0]divresult = 0;

    reg bfr_dv = 0;
    reg [2:0]process = 0;
    reg [3:0]divcnt = 0;
    
    always@ (posedge clk)
    begin
        bfr_dv <= dv_in;
        case (process)
            0:begin
                if (bfr_dv == 0 && dv_in == 1)
                begin
                    process <= process + 1;
                end
                sigout <= 0;
                dv_out <= 0;
                divresult <= 0;
            end
            
            1:begin                                 //
                if (sigin[IBIT-1])
                begin
                    dividend <= (~sigin + 1) << 1;
                    divisor <= ~sigin + 1025;
                end else begin
                    dividend <= sigin << 1;
                    divisor <= sigin + 1024;
                end
                process <= process + 1;
            end
            
            2:begin
                if (divcnt == FBIT)
                begin
                    divcnt <= 0;
                    process <= process + 1;
                    if (sigin[IBIT-1])
                    begin
                        divresult <= ~divresult + 1025;
                    end else begin
                        divresult <= divresult + 1024;
                    end
                end else begin
                    if (dividend > divisor)
                    begin
                        dividend <= (dividend - divisor) << 1;
                        divresult[FBIT - 1 - divcnt] <= 1;
                    end else begin
                        dividend <= dividend << 1;
                        divresult[FBIT - 1 - divcnt] <= 0;
                    end
                    divcnt <= divcnt + 1;
                end
            end
            
            3:begin
                sigout <= divresult[11:12-OBIT];
                dv_out <= 1;
                process <= 0;
                divresult <= 0;
            end
            
        endcase
    
    end

endmodule
