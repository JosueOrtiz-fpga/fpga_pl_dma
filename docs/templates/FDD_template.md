# FPGA Design Document Template (replace with name of FPGA or Block)
_High-level guidance for this template: This document should have 3 major milestones: Concept (System level information), Preliminary (Design and Test high-level information), Critical (Detailed Design information and Test results)
## 1. System Overview
_Describe the higher level system the FPGA will be used in. If the document is for an FPGA block, describe the type of application this block will be used for_
## 2. Design Decisions
_Capture important design decisions such as (but not limited to): FPGA part target, throughput analysis, IP selection, design re-use, design level (model, HLS, HDL)_
## 3. Theory of Operation
_Outline the major functions or walkthrough the typical use case of the design_
## 4. Architectural Design
_Design is described from a functional perspective. A subsection for each block should be created if multiple block will be designed. Template sections for Clocks, Resets, and Interrupts should be kept and filled out._
### 4.x Clocks
### 4.x Resets
### 4.x Interrupts
## 5. Detailed Design
_More detailed description of the design found in Section 4.0 as the design is underway and in prep for a Critical Design Review_
## 6. Simulation
_Should contain, explanation of the approach taken, testbench architecture diagram, table of simulation test-cases, and any setup and/or commands required to run the simulation, and test results._
## 7. HW Design Verification Test
_Should contain, explanation of the approach taken, hardware setup, test-cases with explanation on how to setup and run them, and test results.
## 8. Configuration Management
_Design configuration options/methods (i.e. generics, configuration files)_
## 9. Requirements
_Can be captured in a separate markdown file if extensive_