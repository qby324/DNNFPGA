
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name MFC_REC -dir "C:/Users/tslab-802-2/Desktop/work1/FPGA_project - backup1/MFC_REC/planAhead_run_3" -part xc6slx45csg324-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "main_REC.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/BROM.ngc}]
set hdlfile [add_files [list {vad.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {SMULTI.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {MEMS_Filter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {log2_10bit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/BROM.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {FFT_16kHz.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {FFT_16kHz.ngc}]
set hdlfile [add_files [list {BRAM.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../HMM-Viterbi/sigmoid.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../HMM-Viterbi/ipcore_dir/multiplier.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../HMM-Viterbi/ipcore_dir/MultAccum.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../HMM-Viterbi/ipcore_dir/BRAM_node.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../HMM-Viterbi/ipcore_dir/BRAM_input.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {SPM0405HD4H.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rec_dim.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {MFCC.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {clock_divide.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../HMM-Viterbi/DNN_0117.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {REC_NN.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {../HMM-Viterbi/ipcore_dir/BRAM_input.ngc}]
add_files [list {../HMM-Viterbi/ipcore_dir/BRAM_node.ngc}]
add_files [list {../HMM-Viterbi/ipcore_dir/MultAccum.ngc}]
add_files [list {../HMM-Viterbi/ipcore_dir/multiplier.ngc}]
set_property top REC_NN $srcset
add_files [list {main_REC.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/BROM.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/FFT_16kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/BRAM_input.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/BRAM_node.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/div_gen_v4_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/FFT_16kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/FFT_8kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/MultAccum.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/multiplier.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx45csg324-2
