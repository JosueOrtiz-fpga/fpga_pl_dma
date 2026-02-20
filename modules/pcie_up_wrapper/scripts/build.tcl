# build.tcl

# 1. Grab the environment variable exported by Make
set PROJ_HOME $::env(PROJ_HOME)

# 2. Setup in-memory project
set_part xcau15p-ffvb676-2-e

# 3. Source the BD using the absolute path
# (Assuming your BD script is in the scripts/ directory)
source $PROJ_HOME/src/pcie_bd.tcl

# 4. Generate the targets in memory
generate_target all [get_files *.bd]

# 5. Read your Verilog wrapper using the absolute path
read_verilog $PROJ_HOME/src/pcie_bd_wrapper.v

# 6. Export Simulation Files back to the main project directory
export_simulation -of_objects [get_files *.bd] -directory $PROJ_HOME/sim -simulator xsim -force

puts "--- In-Memory Compilation Complete ---"