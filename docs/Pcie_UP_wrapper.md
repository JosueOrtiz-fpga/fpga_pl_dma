# PCIe UltraScale+ Wrapper

## 1.0 System Overview
This block is a wrapper around the AMD UltraScale+ PCIe Integrated Block IP. It is intended for use in hardware accelerator designs that require high-bandwidth data movement between a host CPU and the FPGA over a PCIe Gen4 x4 link.

## 2.0 Design Decisions
### IP Selection
The design will use the AMD UltraScale+ PCIe Integrated Block, configured as a Gen4 x4 Endpoint. This provides the core functionality for the PCIe interface.

### Simulation Strategy
A trade study was conducted to select the most effective verification strategy. The following options were considered:
1.  **Pure `cocotb`:** Using Python-based testbenches with the `cocotbext-pcie` library.
2.  **Vendor Example:** Using the AMD-provided Verilog example design.
3.  **Hybrid:** Combining `cocotb` with the Verilog models from the vendor example.

The initial vendor example was found to be specific to an XDMA configuration, making it unsuitable for direct use. Therefore, a **pure `cocotb` approach was selected**. This strategy offers the most flexibility and avoids the overhead of modifying an unrelated example design. It will leverage the `cocotbext-pcie` library to provide models for the Root Complex and other bus functional models (BFMs).

## 3.0 Theory of Operation
_Outline the major functions or walkthrough the typical use case of the design_
This design is a minimal wrapper around the UltraScale+™ Device Integrated Block for PCI Express. The two typical types of operatios are a PCIe Memory Write and a PCIe Memory Read Request.
### 3.1 PCIe Memory Write
A PCIe memory write is done as a Posted transaction: no respone (completion data) is expected to be sent by the recipient of the memory write. The transaction goes as follows:
- The initiator (requestor) generates PCIe header contained of 3 double-words (DW) or 4 if using 64-bit addressing.
- This header signals that it is a memory write, contains the destination address, the size of the payload, and other important information.
- The requestor sends this header along with the payload over the link to the recepient (completor)
- The memory write transaction may be split into multiple posted transactions if it exceeds the Max Payload Size (MPS) negotiated during link initialization. Address increments are used.

It is important to note that both the Root Complex and the End-Point (the FPGA this block is used in), take on the role of the Requestor or Completor depending on who is initiating the transaction.\
This transaction is generally safe when the Root Complex initiates it, as the End-Point addresses (Base Address Registers: BARs) are discovered by the Root Complex at initialization. For this to be safe in the inverse scenario, the HOST containing the Root Complex would need a pre-allocated buffer the End-Point could write to, and the End-Point would have to know ahead of time the address to write to and the buffer size to avoid overflow.

### 3.1 PCIe Memory Read Request
A PCIe memory read request is done as a Non-Posted transaction: read data(completion data) is expected to be sent by the recipient of the read request. The transaction goes as follows:
- The initiator (requestor) generates PCIe header contained of 3 double-words (DW) or 4 if using 64-bit addressing.
- This header signals that it is a memory read request, contains the read address, read size being requested, and a tag.
- The requestor sends this data over the link to the recepient (completor)
- The completor processes the read request and sends a completion header (containing its completor ID, the requestor ID, and the read tag issued by the requstor) and the read data.
- The completion may be split into multiple transactions if it exceeds the Max Payload Size (MPS) negotiated during link initialization. The header in each completion will contain the same tag.

It is important to note that both the Root Complex and the End-Point (the FPGA this block is used in), take on the role of the Requestor or Completor depending on who is initiating the transaction.
## 4.0 Architectural Design
_Design is described from a functional perspective. A subsection for each block should be created if multiple block will be designed. Template sections for Clocks, Resets, and Interrupts should be kept and filled out._

A snip of the IP core and its interfaces is shown below:

<img src="./tutorial/ip_core_walkthrough/snips/bd_7_all_ports_external.PNG" alt="Alt text" width="1000">

### 4.x AXI4-Stream Core Interfaces
#### 4.x.x Completor Request Interface
Port descriptions leveraged from AMD PG213 and modified for brevity AXI4-Stream standard details have also been removed for conciceness.

DW (Double Word, 32-bits)

|Name|Direction|Width|Description|
|---|---|---|---|
|m_axis_cq_tdata|O|256|Tx Data from the CQ Interface.|
|m_axis_cq_tuser|O|88|Sideband information for the transaction layer packets (TLP) being transferred. See CQ Sideband section below|
|m_axis_cq_tlast|O|1|End of the packet indication, asserted on last beat of transfer|
|m_axis_cq_tkeep|O|8|The assertion of bit i of this bus during a transfer indicates that DW i of the m_axis_cq_tdata bus contains valid data. The core sets this bit to 1 contiguously for all DWs starting from the first DW of the descriptor to the last Dword of the payload. Thus, it is set to all 1s, except in the final beat when the end of the payload doesn't fill the whole TDATA bus width|
|m_axis_cq_tvalid|O|1| TVALID|
|m_axis_cq_tready|I|1| TREADY|
|pcie_cq_np_req|I|2| Non-Posted request backpressure. The core implements a credit-based flow control mechanism for the delivery of Non-Posted requests across the interface, without blocking Posted TLPs. This input to the core controls an internal credit count. The credit count is updated in each clock cycle based on the setting of pcie_cq_np_req[1:0] as follows: 00: No change 01: Increment by 1 11: Flow-Control unused. The credit count is decremented on the delivery of each Non-Posted request across the interface. The core temporarily stops delivering Non-Posted requests to the user logic when the credit count is zero. See PG213 "Receive Transaction Ordering"|
|pcie_cq_np_req_count|O|6|Current value of the credit count for delivery of Non-Posted requests. There are several cycles of internal pipeline delays between the user providing credit on pcie_cq_np_req[1:0] inputs and pcie_cq_np_req_count output in response. This count resets on user_reset and de-assertion of user_lnk_up.|


### 4.x Clocks
Port descriptions taken from UltraScale+ Devices Integrated Block for PCI Express Product Guide (PG213).
|Name |Direction |Description |
|-|:-:|-|
| user_clk |O |User clock output (62.5, 125, or 250 MHz) This clock has a fixed frequency and is configured in the AMD Vivado™ Integrated Design Environment (IDE).|
| sys_clk |I |Reference clock This clock has a selectable frequency of 100 MHz.|
|sys_clk_gt |I  |PCIe reference clock for GT. This clock must be driven directly from IBUFDS_GTE (same definition and frequency as sys_clk). This clock has a selectable frequency of 100 MHz, which is the same as in sys_clk.|

### 4.x Resets
Port descriptions taken from UltraScale+ Devices Integrated Block for PCI Express Product Guide (PG213).
|Name |Direction |Description |
|-|:-:|-|
|user_reset |O |This signal is deasserted synchronously with respect to user_clk. It is deasserted and asserted asynchronously with sys_reset assertion. It is asserted for core in-band reset events such as Hot Reset or Link Disable.|
|sys_reset |I |Fundamental reset input to the core (asynchronous) This input is active-Low by default to match the PCIe edge connector reset polarity.|
|phy_rdy_out |O | The phy ready signal indicates that the GT Wizard is ready. This signal is driven by phy_rst FSM on receiving the phy status from the GT Wizard core.|
### 4.x Interrupts
## 5.0 Detailed Design
_More detailed description of the design found in Section 4.0 as the design is underway and in prep for a Critical Design Review_
## 6.0 Simulation

### Simulation Approach
The testbench is built using the `cocotb` framework. This allows for test case development in Python, providing flexibility and power for creating complex stimulus and checking routines. The environment leverages the `cocotbext-pcie` library, which provides the necessary Bus Functional Models (BFMs) to simulate a complete end-to-end PCIe link.

### Testbench Architecture
The testbench is composed of two primary parts: a Python test script and a top-level Verilog file. The Python script is responsible for high-level test flow, acting as both the simulated Root Complex (originating requests) and the simulated User Logic (responding to requests). The Verilog top-level instantiates the DUT and the necessary Verilog BFMs that interface between the Python environment and the DUT.

```text
+-------------------------------------------------------------------------------------------------+
| COCOTB TESTBENCH ENVIRONMENT                                                                    |
|                                                                                                 |
| +---------------------------------+ +---------------------------------------------------------+ |
| | Python Test Script              | | Verilog Top-Level (tb_pcie_up_wrapper.v)                | |
| | (test_pcie.py)                  | |                                                         | |
| |                                 | |    +-----------------+         +----------------------+ | |
| | [Simulated Root Complex]        | |    | Root Complex    |         |                      | | |
| |  - Generates TLPs               | |    | BFM (Verilog    |<------->|       PCIe x4 Link   | | |
| |  - Consumes TLPs                |<---->| part of         |         |       (Sim Model)    | | |
| |                                 | |    | cocotbext-pcie) |         |                      | | |
| |                                 | |    +-----------------+         |                      | | |
| | [Simulated User Logic]          | |                                | pcie_bd_wrapper      | | |
| |  - Consumes AXI-Stream data     |<---->|    +-----------------+    | (DUT)                | | |
| |  - Generates AXI-Stream data    | |    | User Logic BFM  |         |                      | | |
| |                                 | |    | (AXI-Stream     |<------->| AXI-Stream Interface | | |
| |                                 | |    |  Drivers)       |         |                      | | |
| +---------------------------------+ |    +-----------------+         +----------------------+ | |
|                                     +---------------------------------------------------------+ |
|                                                                                                 |
+-------------------------------------------------------------------------------------------------+
```
## 7.0 HW Design Verification Test
_Should contain, explanation of the approach taken, hardware setup, test-cases with explanation on how to setup and run them, and test results.
## 8.0 Configuration Management
_Design configuration options/methods (i.e. generics, configuration files)_
## 9.0 Requirements
_Can be captured in a separate markdown file if extensive_