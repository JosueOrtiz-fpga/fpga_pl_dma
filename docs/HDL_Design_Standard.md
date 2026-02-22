# HDL Design Standards
## Language
Preference is to use System Verilog
## Interfaces
For internal signal buses, always use standard protocols where appropriate. Preference is to use:
- AXI4-Stream for data paths
- AXI4-Lite for control pahts
- AXI4 for memory mapped data paths

### Port names
When naming module ports, follow this pattern:
- s_axis (AXI-Stream slave interface)
- m_axil (AXI-Lite master interface)
- s_axi (AXI slave interface)

When naming module ports not contained in signal buses as mentioned above:
- `i_` prefix for inputs
- `o_` prefix for outpus
 
## Resets
Synchronous reset, except for FPGA outputs which should use an asycnhronously asserted / synchronously de-asserted reset.