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
	#cp -R $(VIVADO_SIM_DIR) $(MY_SIM_DIR)

clean:
	rm -rf $(PROJ_HOME)/sim/xsim
	rm -rf $(PROJ_HOME)/vivado

# Note: The exact path inside the .sim directory may vary.
# This target assumes the standard 'sim_1' name for the simulation set.


sim:
	@echo "--- Launching XDMA Simulation ---"
	cd $(MY_SIM_DIR)/xsim && ./*.sh
