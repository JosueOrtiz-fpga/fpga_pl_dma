# build.tcl

set PROJ_HOME $::env(PROJ_HOME)
set_part xcau15p-ffvb676-2-e
source $PROJ_HOME/src/pcie4c_uscale_plus_0.tcl
generate_target all [get_files *.bd]
read_verilog $PROJ_HOME/src/xilinx_pcie4_uscale_ep.v

# In non-project mode, IPs get a hierarchical name. We must use it to find the correct IP.
set pcie_ip [get_ips pcie4c_uscale_plus_0_pcie4c_uscale_plus_0_0]

# create the AMD PCIe XDMA, to copy sim files from it
open_example_project -force -dir ./ $pcie_ip

# Even if we run this multiple times, this dir should still be there
set ex_dir "pcie4c_uscale_plus_0_ex"
set import_dir [file join $ex_dir "imports"]

# add example sim Files
puts "INFO: \[get_example_sim_files\] Adding simulation HDL files from generated example project..."
if { [catch {current_fileset -simset} exc] } { create_fileset -simset sim_1 }
add_files -fileset [current_fileset -simset] \
[list [file join $import_dir pci_exp_expect_tasks.vh]] \
[list [file join $import_dir pci_exp_usrapp_cfg.v]] \
[list [file join $import_dir pci_exp_usrapp_com.v]] \
[list [file join $import_dir pci_exp_usrapp_rx.v]] \
[list [file join $import_dir pci_exp_usrapp_tx.v]] \
[list [file join $import_dir xilinx_pcie_uscale_rp.v]] \
[list [file join $import_dir pcie_4_c_rp.v]] \
[list [file join $import_dir xp4_usp_smsw_model_core_top.v]] \
[list [file join $import_dir sample_tests.vh]] \
[list [file join $import_dir tests.vh]] \
[list [file join $import_dir sys_clk_gen_ds.v]] \
[list [file join $import_dir sys_clk_gen.v]] \
[list [file join $import_dir board_common.vh]] \
[list [file join $import_dir board.v]]

update_compile_order -fileset [current_fileset -simset]
puts "INFO:Exporting Simulation to user folder"
export_simulation -directory $PROJ_HOME/sim -simulator xsim -force
puts "--- In-Memory Compilation Complete ---"
