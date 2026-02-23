# build.tcl

# 1. Grab the environment variable exported by Make
set PROJ_HOME $::env(PROJ_HOME)

# 2. Setup in-memory project
set_part xcau15p-ffvb676-2-e

# 3. Source the BD using the absolute path
# (Assuming your BD script is in the src/ directory)
source $PROJ_HOME/src/pcie_bd.tcl

# 4. Generate the targets in memory
generate_target all [get_files *.bd]

# 5. Read your Verilog wrapper using the absolute path
#read_verilog $PROJ_HOME/src/pcie_bd_wrapper.v

# 6. Export Simulation Files back to the main project directory
# export_simulation -of_objects [get_files *.bd] -directory $PROJ_HOME/sim -simulator xsim -force

# Generate example design for importing of example sim Files
open_example_project -force -dir ./ [get_ips]

# Even if we run this multiple times, this dir should still be there
set ex_dir "pcie4c_uscale_plus_0_ex/"

# add example sim Files
puts "INFO: \[open_example_project\] Adding simulation HDL files ..."
if { [catch {current_fileset -simset} exc] } { create_fileset -simset sim_1 }
add_files -fileset [current_fileset -simset] \
[list [file join $ex_dir imports/pci_exp_expect_tasks.vh]] \
[list [file join $ex_dir imports/pci_exp_usrapp_cfg.v]] \
[list [file join $ex_dir imports/pci_exp_usrapp_com.v]] \
[list [file join $ex_dir imports/pci_exp_usrapp_rx.v]] \
[list [file join $ex_dir imports/pci_exp_usrapp_tx.v]] \
[list [file join $ex_dir imports/xilinx_pcie_uscale_rp.v]] \
[list [file join $ex_dir imports/pcie_4_c_rp.v]] \
[list [file join $ex_dir imports/xp4_usp_smsw_model_core_top.v]] \
[list [file join $ex_dir imports/sample_tests.vh]] \
[list [file join $ex_dir imports/tests.vh]] \
[list [file join $ex_dir imports/sys_clk_gen_ds.v]] \
[list [file join $ex_dir imports/sys_clk_gen.v]] \
[list [file join $ex_dir imports/board_common.vh]] \
[list [file join $ex_dir imports/board.v]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/pci_exp_expect_tasks.vh]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/pci_exp_usrapp_cfg.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/pci_exp_usrapp_com.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/pci_exp_usrapp_rx.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/pci_exp_usrapp_tx.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/xilinx_pcie_uscale_rp.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/pcie_4_c_rp.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/xp4_usp_smsw_model_core_top.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/sample_tests.vh]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/tests.vh]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/sys_clk_gen_ds.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/sys_clk_gen.v]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/board_common.vh]]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $ex_dir imports/board.v]]]


update_compile_order -fileset [current_fileset -simset]
puts [get_files]
puts "--- In-Memory Compilation Complete ---"