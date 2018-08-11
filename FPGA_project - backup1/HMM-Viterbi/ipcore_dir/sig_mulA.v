////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: sig_mulA.v
// /___/   /\     Timestamp: TUE 27 JAN 18:49:15 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/.Xilinx/HMM-Viterbi/ipcore_dir/tmp/_cg/sig_mulA.ngc C:/.Xilinx/HMM-Viterbi/ipcore_dir/tmp/_cg/sig_mulA.v 
// Device	: 6slx45csg324-2
// Input file	: C:/.Xilinx/HMM-Viterbi/ipcore_dir/tmp/_cg/sig_mulA.ngc
// Output file	: C:/.Xilinx/HMM-Viterbi/ipcore_dir/tmp/_cg/sig_mulA.v
// # of Modules	: 1
// Design Name	: sig_mulA
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module sig_mulA (
a, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input [26 : 0] a;
  output [25 : 0] p;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000000fb ;
  wire \blk00000001/sig000000fa ;
  wire \blk00000001/sig000000f9 ;
  wire \blk00000001/sig000000f8 ;
  wire \blk00000001/sig000000f7 ;
  wire \blk00000001/sig000000f6 ;
  wire \blk00000001/sig000000f5 ;
  wire \blk00000001/sig000000f4 ;
  wire \blk00000001/sig000000f3 ;
  wire \blk00000001/sig000000f2 ;
  wire \blk00000001/sig000000f1 ;
  wire \blk00000001/sig000000f0 ;
  wire \blk00000001/sig000000ef ;
  wire \blk00000001/sig000000ee ;
  wire \blk00000001/sig000000ed ;
  wire \blk00000001/sig000000ec ;
  wire \blk00000001/sig000000eb ;
  wire \blk00000001/sig000000ea ;
  wire \blk00000001/sig000000e9 ;
  wire \blk00000001/sig000000e8 ;
  wire \blk00000001/sig000000e7 ;
  wire \blk00000001/sig000000e6 ;
  wire \blk00000001/sig000000e5 ;
  wire \blk00000001/sig000000e4 ;
  wire \blk00000001/sig000000e3 ;
  wire \blk00000001/sig000000e2 ;
  wire \blk00000001/sig000000e1 ;
  wire \blk00000001/sig000000e0 ;
  wire \blk00000001/sig000000df ;
  wire \blk00000001/sig000000de ;
  wire \blk00000001/sig000000dd ;
  wire \blk00000001/sig000000dc ;
  wire \blk00000001/sig000000db ;
  wire \blk00000001/sig000000da ;
  wire \blk00000001/sig000000d9 ;
  wire \blk00000001/sig000000d8 ;
  wire \blk00000001/sig000000d7 ;
  wire \blk00000001/sig000000d6 ;
  wire \blk00000001/sig000000d5 ;
  wire \blk00000001/sig000000d4 ;
  wire \blk00000001/sig000000d3 ;
  wire \blk00000001/sig000000d2 ;
  wire \blk00000001/sig000000d1 ;
  wire \blk00000001/sig000000d0 ;
  wire \blk00000001/sig000000cf ;
  wire \blk00000001/sig000000ce ;
  wire \blk00000001/sig000000cd ;
  wire \blk00000001/sig000000cc ;
  wire \blk00000001/sig000000cb ;
  wire \blk00000001/sig000000ca ;
  wire \blk00000001/sig000000c9 ;
  wire \blk00000001/sig000000c8 ;
  wire \blk00000001/sig000000c7 ;
  wire \blk00000001/sig000000c6 ;
  wire \blk00000001/sig000000c5 ;
  wire \blk00000001/sig000000c4 ;
  wire \blk00000001/sig000000c3 ;
  wire \blk00000001/sig000000c2 ;
  wire \blk00000001/sig000000c1 ;
  wire \blk00000001/sig000000c0 ;
  wire \blk00000001/sig000000bf ;
  wire \blk00000001/sig000000be ;
  wire \blk00000001/sig000000bd ;
  wire \blk00000001/sig000000bc ;
  wire \blk00000001/sig000000bb ;
  wire \blk00000001/sig000000ba ;
  wire \blk00000001/sig000000b9 ;
  wire \blk00000001/sig000000b8 ;
  wire \blk00000001/sig000000b7 ;
  wire \blk00000001/sig000000b6 ;
  wire \blk00000001/sig000000b5 ;
  wire \blk00000001/sig000000b4 ;
  wire \blk00000001/sig000000b3 ;
  wire \blk00000001/sig000000b2 ;
  wire \blk00000001/sig000000b1 ;
  wire \blk00000001/sig000000b0 ;
  wire \blk00000001/sig000000af ;
  wire \blk00000001/sig000000ae ;
  wire \blk00000001/sig000000ad ;
  wire \blk00000001/sig000000ac ;
  wire \blk00000001/sig000000ab ;
  wire \blk00000001/sig000000aa ;
  wire \blk00000001/sig000000a9 ;
  wire \blk00000001/sig000000a8 ;
  wire \blk00000001/sig000000a7 ;
  wire \blk00000001/sig000000a6 ;
  wire \blk00000001/sig000000a5 ;
  wire \blk00000001/sig000000a4 ;
  wire \blk00000001/sig000000a3 ;
  wire \blk00000001/sig000000a2 ;
  wire \blk00000001/sig000000a1 ;
  wire \blk00000001/sig000000a0 ;
  wire \blk00000001/sig0000009f ;
  wire \blk00000001/sig0000009e ;
  wire \blk00000001/sig0000009d ;
  wire \blk00000001/sig0000009c ;
  wire \blk00000001/sig0000009b ;
  wire \blk00000001/sig0000009a ;
  wire \blk00000001/sig00000099 ;
  wire \blk00000001/sig00000098 ;
  wire \blk00000001/sig00000097 ;
  wire \blk00000001/sig00000096 ;
  wire \blk00000001/sig00000095 ;
  wire \blk00000001/sig00000094 ;
  wire \blk00000001/sig00000093 ;
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
  wire \blk00000001/sig0000008b ;
  wire \blk00000001/sig0000008a ;
  wire \blk00000001/sig00000089 ;
  wire \blk00000001/sig00000088 ;
  wire \blk00000001/sig00000087 ;
  wire \blk00000001/sig00000086 ;
  wire \blk00000001/sig00000085 ;
  wire \blk00000001/sig00000084 ;
  wire \blk00000001/sig00000083 ;
  wire \blk00000001/sig00000082 ;
  wire \blk00000001/sig00000081 ;
  wire \blk00000001/sig00000080 ;
  wire \blk00000001/sig0000007f ;
  wire \blk00000001/sig0000007e ;
  wire \blk00000001/sig0000007d ;
  wire \blk00000001/sig0000007c ;
  wire \blk00000001/sig0000007b ;
  wire \blk00000001/sig0000007a ;
  wire \blk00000001/sig00000079 ;
  wire \blk00000001/sig00000078 ;
  wire \blk00000001/sig00000077 ;
  wire \blk00000001/sig00000076 ;
  wire \blk00000001/sig00000075 ;
  wire \blk00000001/sig00000074 ;
  wire \blk00000001/sig00000073 ;
  wire \blk00000001/sig00000072 ;
  wire \blk00000001/sig00000071 ;
  wire \blk00000001/sig00000070 ;
  wire \blk00000001/sig0000006f ;
  wire \blk00000001/sig0000006e ;
  wire \blk00000001/sig0000006d ;
  wire \blk00000001/sig0000006c ;
  wire \blk00000001/sig0000006b ;
  wire \blk00000001/sig0000006a ;
  wire \blk00000001/sig00000069 ;
  wire \blk00000001/sig00000068 ;
  wire \blk00000001/sig00000067 ;
  wire \blk00000001/sig00000066 ;
  wire \blk00000001/sig00000065 ;
  wire \blk00000001/sig00000064 ;
  wire \blk00000001/sig00000063 ;
  wire \blk00000001/sig00000062 ;
  wire \blk00000001/sig00000061 ;
  wire \blk00000001/sig00000060 ;
  wire \blk00000001/sig0000005f ;
  wire \blk00000001/sig0000005e ;
  wire \blk00000001/sig0000005d ;
  wire \blk00000001/sig0000005c ;
  wire \blk00000001/sig0000005b ;
  wire \blk00000001/sig0000005a ;
  wire \blk00000001/sig00000059 ;
  wire \blk00000001/sig00000058 ;
  wire \blk00000001/sig00000057 ;
  wire \blk00000001/sig00000056 ;
  wire \blk00000001/sig00000055 ;
  wire \blk00000001/sig00000054 ;
  wire \blk00000001/sig00000053 ;
  wire \blk00000001/sig00000052 ;
  wire \blk00000001/sig00000051 ;
  wire \blk00000001/sig00000050 ;
  wire \blk00000001/sig0000004f ;
  wire \blk00000001/sig0000004e ;
  wire \blk00000001/sig0000004d ;
  wire \blk00000001/sig0000004c ;
  wire \blk00000001/sig0000004b ;
  wire \blk00000001/sig0000004a ;
  wire \blk00000001/sig00000049 ;
  wire \blk00000001/sig00000048 ;
  wire \blk00000001/sig00000047 ;
  wire \blk00000001/sig00000046 ;
  wire \blk00000001/sig00000045 ;
  wire \blk00000001/sig00000044 ;
  wire \blk00000001/sig00000043 ;
  wire \blk00000001/sig00000042 ;
  wire \blk00000001/sig00000041 ;
  wire \blk00000001/sig00000040 ;
  wire \blk00000001/sig0000003f ;
  wire \blk00000001/sig0000003e ;
  wire \blk00000001/sig0000003d ;
  wire \blk00000001/sig0000003c ;
  wire \blk00000001/sig0000003b ;
  wire \blk00000001/sig0000003a ;
  wire \blk00000001/sig00000039 ;
  wire \blk00000001/sig00000038 ;
  wire \blk00000001/sig00000037 ;
  wire \blk00000001/sig0000001c ;
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk000000e1  (
    .I0(a[24]),
    .I1(a[26]),
    .O(\blk00000001/sig00000041 )
  );
  LUT3 #(
    .INIT ( 8'h56 ))
  \blk00000001/blk000000e0  (
    .I0(a[25]),
    .I1(a[26]),
    .I2(a[24]),
    .O(\blk00000001/sig00000042 )
  );
  LUT3 #(
    .INIT ( 8'h98 ))
  \blk00000001/blk000000df  (
    .I0(a[24]),
    .I1(a[26]),
    .I2(a[25]),
    .O(\blk00000001/sig00000043 )
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \blk00000001/blk000000de  (
    .I0(a[25]),
    .I1(a[26]),
    .I2(a[24]),
    .O(\blk00000001/sig00000044 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk000000dd  (
    .I0(a[18]),
    .I1(a[20]),
    .O(\blk00000001/sig00000061 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000001/blk000000dc  (
    .I0(a[19]),
    .I1(a[21]),
    .I2(a[18]),
    .I3(a[20]),
    .O(\blk00000001/sig00000062 )
  );
  LUT5 #(
    .INIT ( 32'hA6699A66 ))
  \blk00000001/blk000000db  (
    .I0(a[22]),
    .I1(a[20]),
    .I2(a[21]),
    .I3(a[18]),
    .I4(a[19]),
    .O(\blk00000001/sig00000063 )
  );
  LUT6 #(
    .INIT ( 64'h9A99A69A66A66966 ))
  \blk00000001/blk000000da  (
    .I0(a[23]),
    .I1(a[21]),
    .I2(a[18]),
    .I3(a[20]),
    .I4(a[22]),
    .I5(a[19]),
    .O(\blk00000001/sig00000064 )
  );
  LUT6 #(
    .INIT ( 64'h9692924924969692 ))
  \blk00000001/blk000000d9  (
    .I0(a[18]),
    .I1(a[20]),
    .I2(a[22]),
    .I3(a[23]),
    .I4(a[19]),
    .I5(a[21]),
    .O(\blk00000001/sig00000065 )
  );
  LUT6 #(
    .INIT ( 64'h4969924992499692 ))
  \blk00000001/blk000000d8  (
    .I0(a[19]),
    .I1(a[21]),
    .I2(a[23]),
    .I3(a[20]),
    .I4(a[22]),
    .I5(a[18]),
    .O(\blk00000001/sig00000066 )
  );
  LUT6 #(
    .INIT ( 64'h6949246924699624 ))
  \blk00000001/blk000000d7  (
    .I0(a[18]),
    .I1(a[20]),
    .I2(a[22]),
    .I3(a[21]),
    .I4(a[23]),
    .I5(a[19]),
    .O(\blk00000001/sig00000067 )
  );
  LUT6 #(
    .INIT ( 64'h9624246992969624 ))
  \blk00000001/blk000000d6  (
    .I0(a[19]),
    .I1(a[21]),
    .I2(a[23]),
    .I3(a[22]),
    .I4(a[18]),
    .I5(a[20]),
    .O(\blk00000001/sig00000068 )
  );
  LUT6 #(
    .INIT ( 64'h66B664266D664964 ))
  \blk00000001/blk000000d5  (
    .I0(a[20]),
    .I1(a[22]),
    .I2(a[23]),
    .I3(a[21]),
    .I4(a[18]),
    .I5(a[19]),
    .O(\blk00000001/sig00000069 )
  );
  LUT5 #(
    .INIT ( 32'h6466D964 ))
  \blk00000001/blk000000d4  (
    .I0(a[21]),
    .I1(a[23]),
    .I2(a[19]),
    .I3(a[22]),
    .I4(a[20]),
    .O(\blk00000001/sig0000006a )
  );
  LUT4 #(
    .INIT ( 16'hA264 ))
  \blk00000001/blk000000d3  (
    .I0(a[22]),
    .I1(a[23]),
    .I2(a[20]),
    .I3(a[21]),
    .O(\blk00000001/sig0000006b )
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \blk00000001/blk000000d2  (
    .I0(a[23]),
    .I1(a[22]),
    .I2(a[21]),
    .O(\blk00000001/sig0000006c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk000000d1  (
    .I0(a[12]),
    .I1(a[14]),
    .O(\blk00000001/sig00000045 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000001/blk000000d0  (
    .I0(a[13]),
    .I1(a[15]),
    .I2(a[12]),
    .I3(a[14]),
    .O(\blk00000001/sig00000046 )
  );
  LUT5 #(
    .INIT ( 32'hA6699A66 ))
  \blk00000001/blk000000cf  (
    .I0(a[16]),
    .I1(a[14]),
    .I2(a[15]),
    .I3(a[12]),
    .I4(a[13]),
    .O(\blk00000001/sig00000047 )
  );
  LUT6 #(
    .INIT ( 64'h9A99A69A66A66966 ))
  \blk00000001/blk000000ce  (
    .I0(a[17]),
    .I1(a[15]),
    .I2(a[12]),
    .I3(a[14]),
    .I4(a[16]),
    .I5(a[13]),
    .O(\blk00000001/sig00000048 )
  );
  LUT6 #(
    .INIT ( 64'h9692924924969692 ))
  \blk00000001/blk000000cd  (
    .I0(a[12]),
    .I1(a[14]),
    .I2(a[16]),
    .I3(a[17]),
    .I4(a[13]),
    .I5(a[15]),
    .O(\blk00000001/sig0000006d )
  );
  LUT6 #(
    .INIT ( 64'h4969924992499692 ))
  \blk00000001/blk000000cc  (
    .I0(a[13]),
    .I1(a[15]),
    .I2(a[17]),
    .I3(a[14]),
    .I4(a[16]),
    .I5(a[12]),
    .O(\blk00000001/sig0000006e )
  );
  LUT6 #(
    .INIT ( 64'h6949246924699624 ))
  \blk00000001/blk000000cb  (
    .I0(a[12]),
    .I1(a[14]),
    .I2(a[16]),
    .I3(a[15]),
    .I4(a[17]),
    .I5(a[13]),
    .O(\blk00000001/sig0000006f )
  );
  LUT6 #(
    .INIT ( 64'h9624246992969624 ))
  \blk00000001/blk000000ca  (
    .I0(a[13]),
    .I1(a[15]),
    .I2(a[17]),
    .I3(a[16]),
    .I4(a[12]),
    .I5(a[14]),
    .O(\blk00000001/sig00000070 )
  );
  LUT6 #(
    .INIT ( 64'h66B664266D664964 ))
  \blk00000001/blk000000c9  (
    .I0(a[14]),
    .I1(a[16]),
    .I2(a[17]),
    .I3(a[15]),
    .I4(a[12]),
    .I5(a[13]),
    .O(\blk00000001/sig00000071 )
  );
  LUT5 #(
    .INIT ( 32'h6466D964 ))
  \blk00000001/blk000000c8  (
    .I0(a[15]),
    .I1(a[17]),
    .I2(a[13]),
    .I3(a[16]),
    .I4(a[14]),
    .O(\blk00000001/sig00000072 )
  );
  LUT4 #(
    .INIT ( 16'hA264 ))
  \blk00000001/blk000000c7  (
    .I0(a[16]),
    .I1(a[17]),
    .I2(a[14]),
    .I3(a[15]),
    .O(\blk00000001/sig00000073 )
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \blk00000001/blk000000c6  (
    .I0(a[17]),
    .I1(a[16]),
    .I2(a[15]),
    .O(\blk00000001/sig00000074 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk000000c5  (
    .I0(a[6]),
    .I1(a[8]),
    .O(\blk00000001/sig00000075 )
  );
  LUT4 #(
    .INIT ( 16'h6696 ))
  \blk00000001/blk000000c4  (
    .I0(a[7]),
    .I1(a[9]),
    .I2(a[6]),
    .I3(a[8]),
    .O(\blk00000001/sig00000076 )
  );
  LUT5 #(
    .INIT ( 32'hA6699A66 ))
  \blk00000001/blk000000c3  (
    .I0(a[10]),
    .I1(a[8]),
    .I2(a[9]),
    .I3(a[6]),
    .I4(a[7]),
    .O(\blk00000001/sig00000077 )
  );
  LUT6 #(
    .INIT ( 64'h9A99A69A66A66966 ))
  \blk00000001/blk000000c2  (
    .I0(a[11]),
    .I1(a[9]),
    .I2(a[6]),
    .I3(a[8]),
    .I4(a[10]),
    .I5(a[7]),
    .O(\blk00000001/sig00000078 )
  );
  LUT6 #(
    .INIT ( 64'h9692924924969692 ))
  \blk00000001/blk000000c1  (
    .I0(a[6]),
    .I1(a[8]),
    .I2(a[10]),
    .I3(a[11]),
    .I4(a[7]),
    .I5(a[9]),
    .O(\blk00000001/sig00000079 )
  );
  LUT6 #(
    .INIT ( 64'h4969924992499692 ))
  \blk00000001/blk000000c0  (
    .I0(a[7]),
    .I1(a[9]),
    .I2(a[11]),
    .I3(a[8]),
    .I4(a[10]),
    .I5(a[6]),
    .O(\blk00000001/sig0000007a )
  );
  LUT6 #(
    .INIT ( 64'h6949246924699624 ))
  \blk00000001/blk000000bf  (
    .I0(a[6]),
    .I1(a[8]),
    .I2(a[10]),
    .I3(a[9]),
    .I4(a[11]),
    .I5(a[7]),
    .O(\blk00000001/sig0000007b )
  );
  LUT6 #(
    .INIT ( 64'h9624246992969624 ))
  \blk00000001/blk000000be  (
    .I0(a[7]),
    .I1(a[9]),
    .I2(a[11]),
    .I3(a[10]),
    .I4(a[6]),
    .I5(a[8]),
    .O(\blk00000001/sig0000007c )
  );
  LUT6 #(
    .INIT ( 64'h66B664266D664964 ))
  \blk00000001/blk000000bd  (
    .I0(a[8]),
    .I1(a[10]),
    .I2(a[11]),
    .I3(a[9]),
    .I4(a[6]),
    .I5(a[7]),
    .O(\blk00000001/sig0000007d )
  );
  LUT5 #(
    .INIT ( 32'h6466D964 ))
  \blk00000001/blk000000bc  (
    .I0(a[9]),
    .I1(a[11]),
    .I2(a[7]),
    .I3(a[10]),
    .I4(a[8]),
    .O(\blk00000001/sig0000007e )
  );
  LUT4 #(
    .INIT ( 16'hA264 ))
  \blk00000001/blk000000bb  (
    .I0(a[10]),
    .I1(a[11]),
    .I2(a[8]),
    .I3(a[9]),
    .O(\blk00000001/sig0000007f )
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \blk00000001/blk000000ba  (
    .I0(a[11]),
    .I1(a[10]),
    .I2(a[9]),
    .O(\blk00000001/sig00000080 )
  );
  LUT6 #(
    .INIT ( 64'h9692924924969692 ))
  \blk00000001/blk000000b9  (
    .I0(a[0]),
    .I1(a[2]),
    .I2(a[4]),
    .I3(a[5]),
    .I4(a[1]),
    .I5(a[3]),
    .O(\blk00000001/sig00000081 )
  );
  LUT6 #(
    .INIT ( 64'h4969924992499692 ))
  \blk00000001/blk000000b8  (
    .I0(a[1]),
    .I1(a[3]),
    .I2(a[5]),
    .I3(a[2]),
    .I4(a[4]),
    .I5(a[0]),
    .O(\blk00000001/sig00000082 )
  );
  LUT6 #(
    .INIT ( 64'h6949246924699624 ))
  \blk00000001/blk000000b7  (
    .I0(a[0]),
    .I1(a[2]),
    .I2(a[4]),
    .I3(a[3]),
    .I4(a[5]),
    .I5(a[1]),
    .O(\blk00000001/sig00000083 )
  );
  LUT6 #(
    .INIT ( 64'h9624246992969624 ))
  \blk00000001/blk000000b6  (
    .I0(a[1]),
    .I1(a[3]),
    .I2(a[5]),
    .I3(a[4]),
    .I4(a[0]),
    .I5(a[2]),
    .O(\blk00000001/sig00000084 )
  );
  LUT6 #(
    .INIT ( 64'h66B664266D664964 ))
  \blk00000001/blk000000b5  (
    .I0(a[2]),
    .I1(a[4]),
    .I2(a[5]),
    .I3(a[3]),
    .I4(a[0]),
    .I5(a[1]),
    .O(\blk00000001/sig00000085 )
  );
  LUT5 #(
    .INIT ( 32'h6466D964 ))
  \blk00000001/blk000000b4  (
    .I0(a[3]),
    .I1(a[5]),
    .I2(a[1]),
    .I3(a[4]),
    .I4(a[2]),
    .O(\blk00000001/sig00000086 )
  );
  LUT4 #(
    .INIT ( 16'hA264 ))
  \blk00000001/blk000000b3  (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[2]),
    .I3(a[3]),
    .O(\blk00000001/sig00000087 )
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \blk00000001/blk000000b2  (
    .I0(a[5]),
    .I1(a[4]),
    .I2(a[3]),
    .O(\blk00000001/sig00000088 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000b1  (
    .I0(\blk00000001/sig0000004c ),
    .O(\blk00000001/sig000000fb )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000b0  (
    .I0(\blk00000001/sig0000004d ),
    .O(\blk00000001/sig000000fa )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000af  (
    .I0(\blk00000001/sig0000004e ),
    .O(\blk00000001/sig000000f9 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000ae  (
    .I0(\blk00000001/sig0000004f ),
    .O(\blk00000001/sig000000f8 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000ad  (
    .I0(\blk00000001/sig00000050 ),
    .O(\blk00000001/sig000000f7 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000ac  (
    .I0(\blk00000001/sig00000051 ),
    .O(\blk00000001/sig000000f6 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000ab  (
    .I0(\blk00000001/sig00000052 ),
    .O(\blk00000001/sig000000f5 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000aa  (
    .I0(\blk00000001/sig00000053 ),
    .O(\blk00000001/sig000000f4 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a9  (
    .I0(\blk00000001/sig00000054 ),
    .O(\blk00000001/sig000000f3 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a8  (
    .I0(\blk00000001/sig00000055 ),
    .O(\blk00000001/sig000000f2 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a7  (
    .I0(\blk00000001/sig00000056 ),
    .O(\blk00000001/sig000000f1 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a6  (
    .I0(\blk00000001/sig00000057 ),
    .O(\blk00000001/sig000000f0 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a5  (
    .I0(\blk00000001/sig0000007b ),
    .O(\blk00000001/sig000000ef )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a4  (
    .I0(\blk00000001/sig0000007c ),
    .O(\blk00000001/sig000000ee )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a3  (
    .I0(\blk00000001/sig0000007d ),
    .O(\blk00000001/sig000000ed )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a2  (
    .I0(\blk00000001/sig0000007e ),
    .O(\blk00000001/sig000000ec )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a1  (
    .I0(\blk00000001/sig0000007f ),
    .O(\blk00000001/sig000000eb )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000000a0  (
    .I0(\blk00000001/sig00000080 ),
    .O(\blk00000001/sig000000ea )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009f  (
    .I0(\blk00000001/sig00000067 ),
    .O(\blk00000001/sig000000e9 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009e  (
    .I0(\blk00000001/sig00000068 ),
    .O(\blk00000001/sig000000e8 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009d  (
    .I0(\blk00000001/sig00000069 ),
    .O(\blk00000001/sig000000e7 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009c  (
    .I0(\blk00000001/sig0000006a ),
    .O(\blk00000001/sig000000e6 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009b  (
    .I0(\blk00000001/sig0000006b ),
    .O(\blk00000001/sig000000e5 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000009a  (
    .I0(\blk00000001/sig0000006c ),
    .O(\blk00000001/sig000000e4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000099  (
    .I0(\blk00000001/sig00000037 ),
    .I1(a[24]),
    .O(\blk00000001/sig000000e3 )
  );
  MUXCY   \blk00000001/blk00000098  (
    .CI(\blk00000001/sig0000001c ),
    .DI(\blk00000001/sig00000037 ),
    .S(\blk00000001/sig000000e3 ),
    .O(\blk00000001/sig000000e2 )
  );
  XORCY   \blk00000001/blk00000097  (
    .CI(\blk00000001/sig0000001c ),
    .LI(\blk00000001/sig000000e3 ),
    .O(p[15])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000096  (
    .I0(\blk00000001/sig00000038 ),
    .I1(a[25]),
    .O(\blk00000001/sig000000e1 )
  );
  MUXCY   \blk00000001/blk00000095  (
    .CI(\blk00000001/sig000000e2 ),
    .DI(\blk00000001/sig00000038 ),
    .S(\blk00000001/sig000000e1 ),
    .O(\blk00000001/sig000000e0 )
  );
  XORCY   \blk00000001/blk00000094  (
    .CI(\blk00000001/sig000000e2 ),
    .LI(\blk00000001/sig000000e1 ),
    .O(p[16])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000093  (
    .I0(\blk00000001/sig00000039 ),
    .I1(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig000000df )
  );
  MUXCY   \blk00000001/blk00000092  (
    .CI(\blk00000001/sig000000e0 ),
    .DI(\blk00000001/sig00000039 ),
    .S(\blk00000001/sig000000df ),
    .O(\blk00000001/sig000000de )
  );
  XORCY   \blk00000001/blk00000091  (
    .CI(\blk00000001/sig000000e0 ),
    .LI(\blk00000001/sig000000df ),
    .O(p[17])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000090  (
    .I0(\blk00000001/sig0000003a ),
    .I1(\blk00000001/sig00000042 ),
    .O(\blk00000001/sig000000dd )
  );
  MUXCY   \blk00000001/blk0000008f  (
    .CI(\blk00000001/sig000000de ),
    .DI(\blk00000001/sig0000003a ),
    .S(\blk00000001/sig000000dd ),
    .O(\blk00000001/sig000000dc )
  );
  XORCY   \blk00000001/blk0000008e  (
    .CI(\blk00000001/sig000000de ),
    .LI(\blk00000001/sig000000dd ),
    .O(p[18])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000008d  (
    .I0(\blk00000001/sig0000003b ),
    .I1(\blk00000001/sig00000043 ),
    .O(\blk00000001/sig000000db )
  );
  MUXCY   \blk00000001/blk0000008c  (
    .CI(\blk00000001/sig000000dc ),
    .DI(\blk00000001/sig0000003b ),
    .S(\blk00000001/sig000000db ),
    .O(\blk00000001/sig000000da )
  );
  XORCY   \blk00000001/blk0000008b  (
    .CI(\blk00000001/sig000000dc ),
    .LI(\blk00000001/sig000000db ),
    .O(p[19])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000008a  (
    .I0(\blk00000001/sig0000003c ),
    .I1(\blk00000001/sig00000044 ),
    .O(\blk00000001/sig000000d9 )
  );
  MUXCY   \blk00000001/blk00000089  (
    .CI(\blk00000001/sig000000da ),
    .DI(\blk00000001/sig0000003c ),
    .S(\blk00000001/sig000000d9 ),
    .O(\blk00000001/sig000000d8 )
  );
  XORCY   \blk00000001/blk00000088  (
    .CI(\blk00000001/sig000000da ),
    .LI(\blk00000001/sig000000d9 ),
    .O(p[20])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000087  (
    .I0(\blk00000001/sig0000003d ),
    .I1(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig000000d7 )
  );
  MUXCY   \blk00000001/blk00000086  (
    .CI(\blk00000001/sig000000d8 ),
    .DI(\blk00000001/sig0000003d ),
    .S(\blk00000001/sig000000d7 ),
    .O(\blk00000001/sig000000d6 )
  );
  XORCY   \blk00000001/blk00000085  (
    .CI(\blk00000001/sig000000d8 ),
    .LI(\blk00000001/sig000000d7 ),
    .O(p[21])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000084  (
    .I0(\blk00000001/sig0000003e ),
    .I1(\blk00000001/sig00000042 ),
    .O(\blk00000001/sig000000d5 )
  );
  MUXCY   \blk00000001/blk00000083  (
    .CI(\blk00000001/sig000000d6 ),
    .DI(\blk00000001/sig0000003e ),
    .S(\blk00000001/sig000000d5 ),
    .O(\blk00000001/sig000000d4 )
  );
  XORCY   \blk00000001/blk00000082  (
    .CI(\blk00000001/sig000000d6 ),
    .LI(\blk00000001/sig000000d5 ),
    .O(p[22])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000081  (
    .I0(\blk00000001/sig0000003f ),
    .I1(\blk00000001/sig00000043 ),
    .O(\blk00000001/sig000000d3 )
  );
  MUXCY   \blk00000001/blk00000080  (
    .CI(\blk00000001/sig000000d4 ),
    .DI(\blk00000001/sig0000003f ),
    .S(\blk00000001/sig000000d3 ),
    .O(\blk00000001/sig000000d2 )
  );
  XORCY   \blk00000001/blk0000007f  (
    .CI(\blk00000001/sig000000d4 ),
    .LI(\blk00000001/sig000000d3 ),
    .O(p[23])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000007e  (
    .I0(\blk00000001/sig00000040 ),
    .I1(\blk00000001/sig00000044 ),
    .O(\blk00000001/sig000000d1 )
  );
  MUXCY   \blk00000001/blk0000007d  (
    .CI(\blk00000001/sig000000d2 ),
    .DI(\blk00000001/sig00000040 ),
    .S(\blk00000001/sig000000d1 ),
    .O(\blk00000001/sig000000d0 )
  );
  XORCY   \blk00000001/blk0000007c  (
    .CI(\blk00000001/sig000000d2 ),
    .LI(\blk00000001/sig000000d1 ),
    .O(p[24])
  );
  XORCY   \blk00000001/blk0000007b  (
    .CI(\blk00000001/sig000000d0 ),
    .LI(a[26]),
    .O(p[25])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000007a  (
    .I0(\blk00000001/sig00000058 ),
    .I1(a[12]),
    .O(\blk00000001/sig000000cf )
  );
  MUXCY   \blk00000001/blk00000079  (
    .CI(\blk00000001/sig0000001c ),
    .DI(\blk00000001/sig00000058 ),
    .S(\blk00000001/sig000000cf ),
    .O(\blk00000001/sig000000ce )
  );
  XORCY   \blk00000001/blk00000078  (
    .CI(\blk00000001/sig0000001c ),
    .LI(\blk00000001/sig000000cf ),
    .O(p[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000077  (
    .I0(\blk00000001/sig00000059 ),
    .I1(a[13]),
    .O(\blk00000001/sig000000cd )
  );
  MUXCY   \blk00000001/blk00000076  (
    .CI(\blk00000001/sig000000ce ),
    .DI(\blk00000001/sig00000059 ),
    .S(\blk00000001/sig000000cd ),
    .O(\blk00000001/sig000000cc )
  );
  XORCY   \blk00000001/blk00000075  (
    .CI(\blk00000001/sig000000ce ),
    .LI(\blk00000001/sig000000cd ),
    .O(p[4])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000074  (
    .I0(\blk00000001/sig0000005a ),
    .I1(\blk00000001/sig00000045 ),
    .O(\blk00000001/sig000000cb )
  );
  MUXCY   \blk00000001/blk00000073  (
    .CI(\blk00000001/sig000000cc ),
    .DI(\blk00000001/sig0000005a ),
    .S(\blk00000001/sig000000cb ),
    .O(\blk00000001/sig000000ca )
  );
  XORCY   \blk00000001/blk00000072  (
    .CI(\blk00000001/sig000000cc ),
    .LI(\blk00000001/sig000000cb ),
    .O(p[5])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000071  (
    .I0(\blk00000001/sig0000005b ),
    .I1(\blk00000001/sig00000046 ),
    .O(\blk00000001/sig000000c9 )
  );
  MUXCY   \blk00000001/blk00000070  (
    .CI(\blk00000001/sig000000ca ),
    .DI(\blk00000001/sig0000005b ),
    .S(\blk00000001/sig000000c9 ),
    .O(\blk00000001/sig000000c8 )
  );
  XORCY   \blk00000001/blk0000006f  (
    .CI(\blk00000001/sig000000ca ),
    .LI(\blk00000001/sig000000c9 ),
    .O(p[6])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000006e  (
    .I0(\blk00000001/sig0000005c ),
    .I1(\blk00000001/sig00000047 ),
    .O(\blk00000001/sig000000c7 )
  );
  MUXCY   \blk00000001/blk0000006d  (
    .CI(\blk00000001/sig000000c8 ),
    .DI(\blk00000001/sig0000005c ),
    .S(\blk00000001/sig000000c7 ),
    .O(\blk00000001/sig000000c6 )
  );
  XORCY   \blk00000001/blk0000006c  (
    .CI(\blk00000001/sig000000c8 ),
    .LI(\blk00000001/sig000000c7 ),
    .O(p[7])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000006b  (
    .I0(\blk00000001/sig0000005d ),
    .I1(\blk00000001/sig00000048 ),
    .O(\blk00000001/sig000000c5 )
  );
  MUXCY   \blk00000001/blk0000006a  (
    .CI(\blk00000001/sig000000c6 ),
    .DI(\blk00000001/sig0000005d ),
    .S(\blk00000001/sig000000c5 ),
    .O(\blk00000001/sig000000c4 )
  );
  XORCY   \blk00000001/blk00000069  (
    .CI(\blk00000001/sig000000c6 ),
    .LI(\blk00000001/sig000000c5 ),
    .O(p[8])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000068  (
    .I0(\blk00000001/sig0000005e ),
    .I1(\blk00000001/sig00000049 ),
    .O(\blk00000001/sig000000c3 )
  );
  MUXCY   \blk00000001/blk00000067  (
    .CI(\blk00000001/sig000000c4 ),
    .DI(\blk00000001/sig0000005e ),
    .S(\blk00000001/sig000000c3 ),
    .O(\blk00000001/sig000000c2 )
  );
  XORCY   \blk00000001/blk00000066  (
    .CI(\blk00000001/sig000000c4 ),
    .LI(\blk00000001/sig000000c3 ),
    .O(p[9])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000065  (
    .I0(\blk00000001/sig0000005f ),
    .I1(\blk00000001/sig0000004a ),
    .O(\blk00000001/sig000000c1 )
  );
  MUXCY   \blk00000001/blk00000064  (
    .CI(\blk00000001/sig000000c2 ),
    .DI(\blk00000001/sig0000005f ),
    .S(\blk00000001/sig000000c1 ),
    .O(\blk00000001/sig000000c0 )
  );
  XORCY   \blk00000001/blk00000063  (
    .CI(\blk00000001/sig000000c2 ),
    .LI(\blk00000001/sig000000c1 ),
    .O(p[10])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000062  (
    .I0(\blk00000001/sig00000060 ),
    .I1(\blk00000001/sig0000004b ),
    .O(\blk00000001/sig000000bf )
  );
  MUXCY   \blk00000001/blk00000061  (
    .CI(\blk00000001/sig000000c0 ),
    .DI(\blk00000001/sig00000060 ),
    .S(\blk00000001/sig000000bf ),
    .O(\blk00000001/sig000000be )
  );
  XORCY   \blk00000001/blk00000060  (
    .CI(\blk00000001/sig000000c0 ),
    .LI(\blk00000001/sig000000bf ),
    .O(p[11])
  );
  MUXCY   \blk00000001/blk0000005f  (
    .CI(\blk00000001/sig000000be ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000fb ),
    .O(\blk00000001/sig000000bd )
  );
  XORCY   \blk00000001/blk0000005e  (
    .CI(\blk00000001/sig000000be ),
    .LI(\blk00000001/sig000000fb ),
    .O(p[12])
  );
  MUXCY   \blk00000001/blk0000005d  (
    .CI(\blk00000001/sig000000bd ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000fa ),
    .O(\blk00000001/sig000000bc )
  );
  XORCY   \blk00000001/blk0000005c  (
    .CI(\blk00000001/sig000000bd ),
    .LI(\blk00000001/sig000000fa ),
    .O(p[13])
  );
  MUXCY   \blk00000001/blk0000005b  (
    .CI(\blk00000001/sig000000bc ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f9 ),
    .O(\blk00000001/sig000000bb )
  );
  XORCY   \blk00000001/blk0000005a  (
    .CI(\blk00000001/sig000000bc ),
    .LI(\blk00000001/sig000000f9 ),
    .O(p[14])
  );
  MUXCY   \blk00000001/blk00000059  (
    .CI(\blk00000001/sig000000bb ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f8 ),
    .O(\blk00000001/sig000000ba )
  );
  XORCY   \blk00000001/blk00000058  (
    .CI(\blk00000001/sig000000bb ),
    .LI(\blk00000001/sig000000f8 ),
    .O(\blk00000001/sig00000037 )
  );
  MUXCY   \blk00000001/blk00000057  (
    .CI(\blk00000001/sig000000ba ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f7 ),
    .O(\blk00000001/sig000000b9 )
  );
  XORCY   \blk00000001/blk00000056  (
    .CI(\blk00000001/sig000000ba ),
    .LI(\blk00000001/sig000000f7 ),
    .O(\blk00000001/sig00000038 )
  );
  MUXCY   \blk00000001/blk00000055  (
    .CI(\blk00000001/sig000000b9 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f6 ),
    .O(\blk00000001/sig000000b8 )
  );
  XORCY   \blk00000001/blk00000054  (
    .CI(\blk00000001/sig000000b9 ),
    .LI(\blk00000001/sig000000f6 ),
    .O(\blk00000001/sig00000039 )
  );
  MUXCY   \blk00000001/blk00000053  (
    .CI(\blk00000001/sig000000b8 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f5 ),
    .O(\blk00000001/sig000000b7 )
  );
  XORCY   \blk00000001/blk00000052  (
    .CI(\blk00000001/sig000000b8 ),
    .LI(\blk00000001/sig000000f5 ),
    .O(\blk00000001/sig0000003a )
  );
  MUXCY   \blk00000001/blk00000051  (
    .CI(\blk00000001/sig000000b7 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f4 ),
    .O(\blk00000001/sig000000b6 )
  );
  XORCY   \blk00000001/blk00000050  (
    .CI(\blk00000001/sig000000b7 ),
    .LI(\blk00000001/sig000000f4 ),
    .O(\blk00000001/sig0000003b )
  );
  MUXCY   \blk00000001/blk0000004f  (
    .CI(\blk00000001/sig000000b6 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f3 ),
    .O(\blk00000001/sig000000b5 )
  );
  XORCY   \blk00000001/blk0000004e  (
    .CI(\blk00000001/sig000000b6 ),
    .LI(\blk00000001/sig000000f3 ),
    .O(\blk00000001/sig0000003c )
  );
  MUXCY   \blk00000001/blk0000004d  (
    .CI(\blk00000001/sig000000b5 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f2 ),
    .O(\blk00000001/sig000000b4 )
  );
  XORCY   \blk00000001/blk0000004c  (
    .CI(\blk00000001/sig000000b5 ),
    .LI(\blk00000001/sig000000f2 ),
    .O(\blk00000001/sig0000003d )
  );
  MUXCY   \blk00000001/blk0000004b  (
    .CI(\blk00000001/sig000000b4 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f1 ),
    .O(\blk00000001/sig000000b3 )
  );
  XORCY   \blk00000001/blk0000004a  (
    .CI(\blk00000001/sig000000b4 ),
    .LI(\blk00000001/sig000000f1 ),
    .O(\blk00000001/sig0000003e )
  );
  MUXCY   \blk00000001/blk00000049  (
    .CI(\blk00000001/sig000000b3 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000f0 ),
    .O(\blk00000001/sig00000040 )
  );
  XORCY   \blk00000001/blk00000048  (
    .CI(\blk00000001/sig000000b3 ),
    .LI(\blk00000001/sig000000f0 ),
    .O(\blk00000001/sig0000003f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000047  (
    .I0(\blk00000001/sig00000081 ),
    .I1(a[6]),
    .O(\blk00000001/sig000000b2 )
  );
  MUXCY   \blk00000001/blk00000046  (
    .CI(\blk00000001/sig0000001c ),
    .DI(\blk00000001/sig00000081 ),
    .S(\blk00000001/sig000000b2 ),
    .O(\blk00000001/sig000000b1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000045  (
    .I0(\blk00000001/sig00000082 ),
    .I1(a[7]),
    .O(\blk00000001/sig000000b0 )
  );
  MUXCY   \blk00000001/blk00000044  (
    .CI(\blk00000001/sig000000b1 ),
    .DI(\blk00000001/sig00000082 ),
    .S(\blk00000001/sig000000b0 ),
    .O(\blk00000001/sig000000af )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000043  (
    .I0(\blk00000001/sig00000083 ),
    .I1(\blk00000001/sig00000075 ),
    .O(\blk00000001/sig000000ae )
  );
  MUXCY   \blk00000001/blk00000042  (
    .CI(\blk00000001/sig000000af ),
    .DI(\blk00000001/sig00000083 ),
    .S(\blk00000001/sig000000ae ),
    .O(\blk00000001/sig000000ad )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000041  (
    .I0(\blk00000001/sig00000084 ),
    .I1(\blk00000001/sig00000076 ),
    .O(\blk00000001/sig000000ac )
  );
  MUXCY   \blk00000001/blk00000040  (
    .CI(\blk00000001/sig000000ad ),
    .DI(\blk00000001/sig00000084 ),
    .S(\blk00000001/sig000000ac ),
    .O(\blk00000001/sig000000ab )
  );
  XORCY   \blk00000001/blk0000003f  (
    .CI(\blk00000001/sig000000ad ),
    .LI(\blk00000001/sig000000ac ),
    .O(p[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000003e  (
    .I0(\blk00000001/sig00000085 ),
    .I1(\blk00000001/sig00000077 ),
    .O(\blk00000001/sig000000aa )
  );
  MUXCY   \blk00000001/blk0000003d  (
    .CI(\blk00000001/sig000000ab ),
    .DI(\blk00000001/sig00000085 ),
    .S(\blk00000001/sig000000aa ),
    .O(\blk00000001/sig000000a9 )
  );
  XORCY   \blk00000001/blk0000003c  (
    .CI(\blk00000001/sig000000ab ),
    .LI(\blk00000001/sig000000aa ),
    .O(p[1])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000003b  (
    .I0(\blk00000001/sig00000086 ),
    .I1(\blk00000001/sig00000078 ),
    .O(\blk00000001/sig000000a8 )
  );
  MUXCY   \blk00000001/blk0000003a  (
    .CI(\blk00000001/sig000000a9 ),
    .DI(\blk00000001/sig00000086 ),
    .S(\blk00000001/sig000000a8 ),
    .O(\blk00000001/sig000000a7 )
  );
  XORCY   \blk00000001/blk00000039  (
    .CI(\blk00000001/sig000000a9 ),
    .LI(\blk00000001/sig000000a8 ),
    .O(p[2])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000038  (
    .I0(\blk00000001/sig00000087 ),
    .I1(\blk00000001/sig00000079 ),
    .O(\blk00000001/sig000000a6 )
  );
  MUXCY   \blk00000001/blk00000037  (
    .CI(\blk00000001/sig000000a7 ),
    .DI(\blk00000001/sig00000087 ),
    .S(\blk00000001/sig000000a6 ),
    .O(\blk00000001/sig000000a5 )
  );
  XORCY   \blk00000001/blk00000036  (
    .CI(\blk00000001/sig000000a7 ),
    .LI(\blk00000001/sig000000a6 ),
    .O(\blk00000001/sig00000058 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000035  (
    .I0(\blk00000001/sig00000088 ),
    .I1(\blk00000001/sig0000007a ),
    .O(\blk00000001/sig000000a4 )
  );
  MUXCY   \blk00000001/blk00000034  (
    .CI(\blk00000001/sig000000a5 ),
    .DI(\blk00000001/sig00000088 ),
    .S(\blk00000001/sig000000a4 ),
    .O(\blk00000001/sig000000a3 )
  );
  XORCY   \blk00000001/blk00000033  (
    .CI(\blk00000001/sig000000a5 ),
    .LI(\blk00000001/sig000000a4 ),
    .O(\blk00000001/sig00000059 )
  );
  MUXCY   \blk00000001/blk00000032  (
    .CI(\blk00000001/sig000000a3 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000ef ),
    .O(\blk00000001/sig000000a2 )
  );
  XORCY   \blk00000001/blk00000031  (
    .CI(\blk00000001/sig000000a3 ),
    .LI(\blk00000001/sig000000ef ),
    .O(\blk00000001/sig0000005a )
  );
  MUXCY   \blk00000001/blk00000030  (
    .CI(\blk00000001/sig000000a2 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000ee ),
    .O(\blk00000001/sig000000a1 )
  );
  XORCY   \blk00000001/blk0000002f  (
    .CI(\blk00000001/sig000000a2 ),
    .LI(\blk00000001/sig000000ee ),
    .O(\blk00000001/sig0000005b )
  );
  MUXCY   \blk00000001/blk0000002e  (
    .CI(\blk00000001/sig000000a1 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000ed ),
    .O(\blk00000001/sig000000a0 )
  );
  XORCY   \blk00000001/blk0000002d  (
    .CI(\blk00000001/sig000000a1 ),
    .LI(\blk00000001/sig000000ed ),
    .O(\blk00000001/sig0000005c )
  );
  MUXCY   \blk00000001/blk0000002c  (
    .CI(\blk00000001/sig000000a0 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000ec ),
    .O(\blk00000001/sig0000009f )
  );
  XORCY   \blk00000001/blk0000002b  (
    .CI(\blk00000001/sig000000a0 ),
    .LI(\blk00000001/sig000000ec ),
    .O(\blk00000001/sig0000005d )
  );
  MUXCY   \blk00000001/blk0000002a  (
    .CI(\blk00000001/sig0000009f ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000eb ),
    .O(\blk00000001/sig0000009e )
  );
  XORCY   \blk00000001/blk00000029  (
    .CI(\blk00000001/sig0000009f ),
    .LI(\blk00000001/sig000000eb ),
    .O(\blk00000001/sig0000005e )
  );
  MUXCY   \blk00000001/blk00000028  (
    .CI(\blk00000001/sig0000009e ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000ea ),
    .O(\blk00000001/sig00000060 )
  );
  XORCY   \blk00000001/blk00000027  (
    .CI(\blk00000001/sig0000009e ),
    .LI(\blk00000001/sig000000ea ),
    .O(\blk00000001/sig0000005f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000026  (
    .I0(\blk00000001/sig0000006d ),
    .I1(a[18]),
    .O(\blk00000001/sig0000009d )
  );
  MUXCY   \blk00000001/blk00000025  (
    .CI(\blk00000001/sig0000001c ),
    .DI(\blk00000001/sig0000006d ),
    .S(\blk00000001/sig0000009d ),
    .O(\blk00000001/sig0000009c )
  );
  XORCY   \blk00000001/blk00000024  (
    .CI(\blk00000001/sig0000001c ),
    .LI(\blk00000001/sig0000009d ),
    .O(\blk00000001/sig00000049 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000023  (
    .I0(\blk00000001/sig0000006e ),
    .I1(a[19]),
    .O(\blk00000001/sig0000009b )
  );
  MUXCY   \blk00000001/blk00000022  (
    .CI(\blk00000001/sig0000009c ),
    .DI(\blk00000001/sig0000006e ),
    .S(\blk00000001/sig0000009b ),
    .O(\blk00000001/sig0000009a )
  );
  XORCY   \blk00000001/blk00000021  (
    .CI(\blk00000001/sig0000009c ),
    .LI(\blk00000001/sig0000009b ),
    .O(\blk00000001/sig0000004a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000020  (
    .I0(\blk00000001/sig0000006f ),
    .I1(\blk00000001/sig00000061 ),
    .O(\blk00000001/sig00000099 )
  );
  MUXCY   \blk00000001/blk0000001f  (
    .CI(\blk00000001/sig0000009a ),
    .DI(\blk00000001/sig0000006f ),
    .S(\blk00000001/sig00000099 ),
    .O(\blk00000001/sig00000098 )
  );
  XORCY   \blk00000001/blk0000001e  (
    .CI(\blk00000001/sig0000009a ),
    .LI(\blk00000001/sig00000099 ),
    .O(\blk00000001/sig0000004b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001d  (
    .I0(\blk00000001/sig00000070 ),
    .I1(\blk00000001/sig00000062 ),
    .O(\blk00000001/sig00000097 )
  );
  MUXCY   \blk00000001/blk0000001c  (
    .CI(\blk00000001/sig00000098 ),
    .DI(\blk00000001/sig00000070 ),
    .S(\blk00000001/sig00000097 ),
    .O(\blk00000001/sig00000096 )
  );
  XORCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig00000098 ),
    .LI(\blk00000001/sig00000097 ),
    .O(\blk00000001/sig0000004c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001a  (
    .I0(\blk00000001/sig00000071 ),
    .I1(\blk00000001/sig00000063 ),
    .O(\blk00000001/sig00000095 )
  );
  MUXCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig00000096 ),
    .DI(\blk00000001/sig00000071 ),
    .S(\blk00000001/sig00000095 ),
    .O(\blk00000001/sig00000094 )
  );
  XORCY   \blk00000001/blk00000018  (
    .CI(\blk00000001/sig00000096 ),
    .LI(\blk00000001/sig00000095 ),
    .O(\blk00000001/sig0000004d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000017  (
    .I0(\blk00000001/sig00000072 ),
    .I1(\blk00000001/sig00000064 ),
    .O(\blk00000001/sig00000093 )
  );
  MUXCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig00000094 ),
    .DI(\blk00000001/sig00000072 ),
    .S(\blk00000001/sig00000093 ),
    .O(\blk00000001/sig00000092 )
  );
  XORCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig00000094 ),
    .LI(\blk00000001/sig00000093 ),
    .O(\blk00000001/sig0000004e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000014  (
    .I0(\blk00000001/sig00000073 ),
    .I1(\blk00000001/sig00000065 ),
    .O(\blk00000001/sig00000091 )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig00000092 ),
    .DI(\blk00000001/sig00000073 ),
    .S(\blk00000001/sig00000091 ),
    .O(\blk00000001/sig00000090 )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig00000092 ),
    .LI(\blk00000001/sig00000091 ),
    .O(\blk00000001/sig0000004f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000011  (
    .I0(\blk00000001/sig00000074 ),
    .I1(\blk00000001/sig00000066 ),
    .O(\blk00000001/sig0000008f )
  );
  MUXCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig00000090 ),
    .DI(\blk00000001/sig00000074 ),
    .S(\blk00000001/sig0000008f ),
    .O(\blk00000001/sig0000008e )
  );
  XORCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig00000090 ),
    .LI(\blk00000001/sig0000008f ),
    .O(\blk00000001/sig00000050 )
  );
  MUXCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig0000008e ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000e9 ),
    .O(\blk00000001/sig0000008d )
  );
  XORCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig0000008e ),
    .LI(\blk00000001/sig000000e9 ),
    .O(\blk00000001/sig00000051 )
  );
  MUXCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig0000008d ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000e8 ),
    .O(\blk00000001/sig0000008c )
  );
  XORCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig0000008d ),
    .LI(\blk00000001/sig000000e8 ),
    .O(\blk00000001/sig00000052 )
  );
  MUXCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig0000008c ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000e7 ),
    .O(\blk00000001/sig0000008b )
  );
  XORCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig0000008c ),
    .LI(\blk00000001/sig000000e7 ),
    .O(\blk00000001/sig00000053 )
  );
  MUXCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig0000008b ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000e6 ),
    .O(\blk00000001/sig0000008a )
  );
  XORCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig0000008b ),
    .LI(\blk00000001/sig000000e6 ),
    .O(\blk00000001/sig00000054 )
  );
  MUXCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig0000008a ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000e5 ),
    .O(\blk00000001/sig00000089 )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig0000008a ),
    .LI(\blk00000001/sig000000e5 ),
    .O(\blk00000001/sig00000055 )
  );
  MUXCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000089 ),
    .DI(\blk00000001/sig0000001c ),
    .S(\blk00000001/sig000000e4 ),
    .O(\blk00000001/sig00000057 )
  );
  XORCY   \blk00000001/blk00000003  (
    .CI(\blk00000001/sig00000089 ),
    .LI(\blk00000001/sig000000e4 ),
    .O(\blk00000001/sig00000056 )
  );
  GND   \blk00000001/blk00000002  (
    .G(\blk00000001/sig0000001c )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
