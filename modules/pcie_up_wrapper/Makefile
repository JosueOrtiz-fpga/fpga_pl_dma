# Makefile

# Default to the directory where the Makefile is located, but allow CLI overrides
PROJ_HOME ?= $(CURDIR)

# Export it so the shell executing Vivado (and therefore TCL) can see it
export PROJ_HOME

VIVADO = vivado -mode batch -notrace
BUILD_SCRIPT = $(PROJ_HOME)/scripts/build.tcl

.PHONY: all clean compile

all: compile

compile:
	@echo "--- Running Non-Project Compilation ---"
	mkdir -p $(PROJ_HOME)/vivado
	cd $(PROJ_HOME)/vivado && $(VIVADO) -source $(BUILD_SCRIPT)

clean:
	rm -rf $(PROJ_HOME)/vivado $(PROJ_HOME)/sim_workspace