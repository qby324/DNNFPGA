
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name MFC_REC -dir "C:/.Xilinx/MFC_REC/planAhead_run_1" -part xc6slx45csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/.Xilinx/MFC_REC/main_REC_cs.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/.Xilinx/MFC_REC} {ipcore_dir} {../HMM-Viterbi/ipcore_dir} }
add_files [list {ipcore_dir/BROM.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/FFT_16kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/BRAM_input.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/BRAM_node.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/div_gen_v4_0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/FFT_16kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/FFT_8kHz.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/MultAccum.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../HMM-Viterbi/ipcore_dir/multiplier.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "main_REC.ucf" [current_fileset -constrset]
add_files [list {main_REC.ucf}] -fileset [get_property constrset [current_run]]
link_design
