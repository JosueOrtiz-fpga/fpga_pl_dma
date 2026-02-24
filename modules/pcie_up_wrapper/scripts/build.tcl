# build.tcl
# This script sources a user-defined IP configuration and then
# generates the corresponding XDMA Example Project.

set PROJ_HOME $::env(PROJ_HOME)
set MY_SIM_DIR $::env(MY_SIM_DIR)

# some settings of the pcie bd are transferred to the XDMA example
puts "--- Generating my PCIe block design ---"
source $PROJ_HOME/src/pcie4c_uscale_plus_ep.tcl

# a handle to the PCIe core is needed for generating XDMA example
set pcie_ip [get_ips pcie4c_uscale_plus*]
if { [llength $pcie_ip] == 0 } {
    puts "ERROR: Could not find the PCIe IP."
    puts "Available IPs: [get_ips]"
    error "Stopping script due to missing IP."
}

puts "--- Generating XDMA example project from core IP ---"
open_example_project -force -dir ./ [lindex $pcie_ip 0]

puts "--- Exporting simulation to my directory ---"
set XPR [lindex [glob -nocomplain -directory . "**/*pcie*ex*.xpr"] 0]
puts "Opening xdma example project $XPR"
open_project $XPR
export_simulation -directory $MY_SIM_DIR -simulator xsim -force

puts "INFO: Main build script finished. The example project has been generated."
