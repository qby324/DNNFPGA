module sqrt(
    input [31:0] in,
    output reg [15:0] result,
    output [15:0] checker,
    input clock);

    assign checker = {r[11:0], r4};
    reg [45:0] s;
    wire [45:0] s4;
    reg [15:0] t, r;
    wire [15:0] t4;
    wire [3:0] r4;
    sq4 u1 (.s(s), .t(t), .ss(s4), .tt(t4), .r4(r4));
    reg [1:0] state;

    always@(posedge clock) begin
        state <= state + 2'h1;
        case(state)
        2'h0: begin
            s <= {14'h0, in};
            t <= 16'h0;
            result <= {r[11:0], r4};
        end
        default: begin
            s <= s4;
            t <= t4;
            r <= {r[11:0], r4};
        end
        endcase
    end
endmodule

module sq4 (
    input [45:0] s,
    input [15:0] t,
    output [45:0] ss,
    output [15:0] tt,
    output [3:0] r4);

    wire [45:0] ws;
    wire [15:0] wt;

    sq2 u1(.s(s), .t(t), .ss(ws), .tt(wt), .r2(r4[3:2]));
    sq2 u2(.s(ws), .t(wt), .ss(ss), .tt(tt), .r2(r4[1:0]));
endmodule

module sq2 (
    input [45:0] s,
    input [15:0] t,
    output [45:0] ss,
    output [15:0] tt,
    output [1:0] r2);

    wire [45:0] ws;
    wire [15:0] wt;

    sq1 u1(.s(s), .t(t), .ss(ws), .tt(wt), .r1(r2[1]));
    sq1 u2(.s(ws), .t(wt), .ss(ss), .tt(tt), .r1(r2[0]));
endmodule

module sq1 (
    input [45:0] s,
    input [15:0] t,
    output [45:0] ss,
    output [15:0] tt,
    output r1);

    wire [16:0] d = s[45:30] - {t[14:0], 1'b1};

    assign ss = d[16] ? {s[43:0], 2'b0} : {d[13:0], s[29:0], 2'b0};
    assign tt = d[16] ? {t[14:0], 1'b0} : {t[14:0], 1'b1} + 16'h1;
    assign r1 = ~d[16]; 
endmodule