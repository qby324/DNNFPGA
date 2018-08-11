
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name WordDetect -dir "C:/Users/tslab-802-2/Desktop/newtest/FPGA_project - backup1/DP_MFC/planAhead_run_1" -part xc6slx45csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/tslab-802-2/Desktop/newtest/FPGA_project - backup1/DP_MFC/main_DNN_DP.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/tslab-802-2/Desktop/newtest/FPGA_project - backup1/DP_MFC} {ipcore_dir} {../MFC_REC/ipcore_dir} }
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
set_param project.pinAheadLayout  yes
set_property target_constrs_file "main_DNN_DP.ucf" [current_fileset -constrset]
add_files [list {main_DNN_DP.ucf}] -fileset [get_property constrset [current_run]]
link_design
