#!/bin/bash
# setup_env.sh

VENV_DIR="venv"

# 1. Check if venv exists, if not, create it
if [ ! -d "$VENV_DIR" ]; then
	    echo "Creating Python virtual environment in $VENV_DIR..."
	        python3 -m venv $VENV_DIR
	else
		    echo "Virtual environment already exists."
fi

# 2. Activate and install/update tools
echo "Updating pip and installing FuseSoC..."
source $VENV_DIR/bin/activate
#pip install --upgrade pip
pip install fusesoc

# 3. Install Simulator (System-wide dependency)
if ! command -v iverilog &> /dev/null; then
	    echo "Installing Icarus Verilog..."
	        sudo apt update && sudo apt install -y iverilog
fi

echo "------------------------------------------------"
echo "Setup Complete!"
echo "To start working, run: source $VENV_DIR/bin/activate"
