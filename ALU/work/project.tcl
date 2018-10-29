set projDir "D:/yilong/ALU/work/planAhead"
set projName "ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/yilong/ALU/work/verilog/mojo_top_0.v" "D:/yilong/ALU/work/verilog/reset_conditioner_1.v" "D:/yilong/ALU/work/verilog/button_conditioner_2.v" "D:/yilong/ALU/work/verilog/edge_detector_3.v" "D:/yilong/ALU/work/verilog/ALU_controller_4.v" "D:/yilong/ALU/work/verilog/pipeline_5.v" "D:/yilong/ALU/work/verilog/simple_ram_6.v" "D:/yilong/ALU/work/verilog/simple_ram_7.v" "D:/yilong/ALU/work/verilog/simple_ram_7.v" "D:/yilong/ALU/work/verilog/alu_unit_9.v" "D:/yilong/ALU/work/verilog/seven_seg_10.v" "D:/yilong/ALU/work/verilog/compare_unit_11.v" "D:/yilong/ALU/work/verilog/shifter_unit_12.v" "D:/yilong/ALU/work/verilog/adder_unit_13.v" "D:/yilong/ALU/work/verilog/boolean_unit_14.v"]
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
