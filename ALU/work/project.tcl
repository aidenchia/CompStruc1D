set projDir "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/planAhead"
set projName "ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/mojo_top_0.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/reset_conditioner_1.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/button_conditioner_2.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/edge_detector_3.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/button_conditioner_2.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/edge_detector_3.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/button_conditioner_2.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/edge_detector_3.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/button_conditioner_2.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/edge_detector_3.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/ALU_controller_10.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/pipeline_11.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/pipeline_11.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/pipeline_11.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/pipeline_11.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/multi_seven_seg_15.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/simple_ram_16.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/simple_ram_17.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/simple_ram_17.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/simple_ram_17.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/alu_unit_20.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/counter_21.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/seven_seg_22.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/decoder_23.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/compare_unit_24.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/shifter_unit_25.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/adder_unit_26.v" "C:/Users/wooge/OneDrive/Desktop/CompStruc1D/ALU/work/verilog/boolean_unit_27.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
