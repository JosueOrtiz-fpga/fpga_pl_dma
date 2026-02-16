#Exploring DMA implementation in FPGA fabric

## Setup
  Ensure python3 is installed then run:
  ```
  ./setup_env.sh
  ```
  Then activate python virtual environemtn:
  ```
  source .venv/bin/activate
  ```
## Simulation
  FuseSoc is used as the build flow tool.\
  To run a simulation use this template command:
  ```
  fusesoc run --target=sim $CORE_NAMAE
  ```
