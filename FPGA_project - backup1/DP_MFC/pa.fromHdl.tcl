
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name WordDetect -dir "C:/Users/tslab-802-2/Desktop/newtest/FPGA_project - backup1/DP_MFC/planAhead_run_2" -part xc6slx45csg324-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "main_DNN_DP.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/FFT_16kHz.ngc}]
add_files [list {../MFC_REC/ipcore_dir/BROM.ngc}]
set hdlfile [add_files [list {src/DP_distance.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {DP_multi.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../MFC_REC/ipcore_dir/BROM.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/vad.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/SMULTI.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/MEMS_Filter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/log2_10bit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/DP_matching.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {sigmoid.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/multiplier.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/MultAccum.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/FFT_16kHz.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/BRAM_node.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/BRAM_input.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {BRAM.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/SPM0405HD4H.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/MFCC.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/DP_main.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {src/clock_divide.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {DNN_0117.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {main_DNN_DP.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files [list {ipcore_dir/BRAM_input.ngc}]
add_files [list {ipcore_dir/BRAM_node.ngc}]
add_files [list {ipcore_dir/MultAccum.ngc}]
add_files [list {ipcore_dir/multiplier.ngc}]
set_property top main_DNN_DP $srcset
add_files [list {main_DNN_DP.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/BRAM_input.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/BRAM_node.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/div_gen_v4_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/FFT_16kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/FFT_8kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/MultAccum.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/multiplier.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../MFC_REC/ipcore_dir/BROM.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../MFC_REC/ipcore_dir/FFT_16kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../MFC_REC/ipcore_dir/voice.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx45csg324-2
