# Makefile

# Default to the directory where the Makefile is located, but allow CLI overrides
PROJ_HOME ?= $(CURDIR)

# Export it so the shell executing Vivado (and therefore TCL) can see it
export PROJ_HOME

VIVADO = vivado -mode batch -notrace
BUILD_SCRIPT = $(PROJ_HOME)/scripts/build.tcl
#VIVADO_SIM_DIR = $(PROJ_HOME)/vivado/pcie4c_uscale_plus_0_ex/pcie4c_uscale_plus_0_ex.ip_user_files/sim_scripts/xsim
MY_SIM_DIR = $(PROJ_HOME)/sim
SIM_SCRIPT_NAME = pcie4c_uscale_plus_0.sh 

export MY_SIM_DIR

.PHONY: all clean compile sim

all: compile

compile: clean
	@echo "---- Building Example ----"
	mkdir $(PROJ_HOME)/vivado
	cd $(PROJ_HOME)/vivado && $(VIVADO) -source $(BUILD_SCRIPT)

clean:
	rm -rf $(PROJ_HOME)/sim/xsim
	rm -rf $(PROJ_HOME)/vivado

# Note: The exact path inside the .sim directory may vary.
# This target assumes the standard 'sim_1' name for the simulation set.

TESTNAME ?= sample_smoke_test0

sim:
	@echo "--- Launching Simulation: $(TESTNAME) ---"
	# Run compile and elaborate steps from the generated script
	cd $(MY_SIM_DIR)/xsim && ./board.sh -step compile && ./board.sh -step elaborate
	# Override the auto-generated cmd.tcl with our persistent asset
	#cp $(MY_SIM_DIR)/assets/cmd.tcl $(MY_SIM_DIR)/xsim/cmd.tcl
	# Run simulation with the selected TESTNAME
	cd $(MY_SIM_DIR)/xsim && xsim board -tclbatch "../cmd.tcl" -testplusarg TESTNAME=$(TESTNAME) -log simulate.log
