
################################################################
# This is a generated script based on design: pcie_bd
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2024.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source pcie_bd_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcau15p-ffvb676-2-e
   set_property BOARD_PART avnet-tria:auboard_15p:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name pcie_bd

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:pcie4c_uscale_plus:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set pci_express_x4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x4 ]

  set m_axis_cq_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_cq_0 ]

  set m_axis_rc_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_rc_0 ]

  set pcie4_cfg_control_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_pcie4:pcie4_cfg_control_rtl:1.0 pcie4_cfg_control_0 ]

  set pcie4_cfg_fc_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_cfg_fc_rtl:1.0 pcie4_cfg_fc_0 ]

  set pcie4_cfg_interrupt_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:pcie3_cfg_interrupt_rtl:1.0 pcie4_cfg_interrupt_0 ]

  set pcie4_cfg_mesg_rcvd_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie3_cfg_msg_received_rtl:1.0 pcie4_cfg_mesg_rcvd_0 ]

  set pcie4_cfg_mesg_tx_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie3_cfg_mesg_tx_rtl:1.0 pcie4_cfg_mesg_tx_0 ]

  set pcie4_cfg_mgmt_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_pcie4:pcie4_cfg_mgmt_rtl:1.0 pcie4_cfg_mgmt_0 ]

  set pcie4_cfg_pm_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_pcie4:pcie4_cfg_pm_rtl:1.0 pcie4_cfg_pm_0 ]

  set pcie4_cfg_status_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_pcie4:pcie4_cfg_status_rtl:1.0 pcie4_cfg_status_0 ]

  set pcie4_transmit_fc_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie3_transmit_fc_rtl:1.0 pcie4_transmit_fc_0 ]

  set s_axis_cc_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_cc_0 ]
  set_property -dict [ list \
   CONFIG.HAS_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {16} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {33} \
   ] $s_axis_cc_0

  set s_axis_rq_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_rq_0 ]
  set_property -dict [ list \
   CONFIG.HAS_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {16} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {62} \
   ] $s_axis_rq_0


  # Create ports
  set pcie_refclk [ create_bd_port -dir I -type clk -freq_hz 100000000 pcie_refclk ]
  set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_perstn
  set sys_clk [ create_bd_port -dir I -type clk -freq_hz 100000000 sys_clk ]
  set phy_rdy_out_0 [ create_bd_port -dir O phy_rdy_out_0 ]
  set user_clk_0 [ create_bd_port -dir O -type clk user_clk_0 ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {m_axis_cq_0:m_axis_rc_0:s_axis_cc_0:s_axis_rq_0} \
 ] $user_clk_0
  set_property CONFIG.ASSOCIATED_BUSIF.VALUE_SRC DEFAULT $user_clk_0

  set user_lnk_up_0 [ create_bd_port -dir O user_lnk_up_0 ]
  set user_reset_0 [ create_bd_port -dir O -type rst user_reset_0 ]

  # Create instance: pcie4c_uscale_plus_0, and set properties
  set pcie4c_uscale_plus_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:pcie4c_uscale_plus:1.0 pcie4c_uscale_plus_0 ]
  set_property -dict [list \
    CONFIG.PCIE_BOARD_INTERFACE {pci_express_x4} \
    CONFIG.PF0_Use_Class_Code_Lookup_Assistant {false} \
    CONFIG.PL_LINK_CAP_MAX_LINK_SPEED {16.0_GT/s} \
    CONFIG.SYS_RST_N_BOARD_INTERFACE {pcie_perstn} \
    CONFIG.TL_PF_ENABLE_REG {1} \
    CONFIG.axisten_if_width {128_bit} \
    CONFIG.extended_tag_field {true} \
    CONFIG.mode_selection {Basic} \
    CONFIG.pf0_bar0_scale {Kilobytes} \
    CONFIG.pf0_bar0_size {4} \
    CONFIG.pf0_bar1_enabled {true} \
    CONFIG.pf0_bar1_scale {Megabytes} \
    CONFIG.pf0_bar1_size {512} \
    CONFIG.pf0_bar2_enabled {false} \
    CONFIG.pf0_msi_enabled {false} \
    CONFIG.pf0_sub_class_interface_menu {Other_memory_controller} \
  ] $pcie4c_uscale_plus_0


  # Create interface connections
  connect_bd_intf_net -intf_net pcie4_cfg_control_0_1 [get_bd_intf_ports pcie4_cfg_control_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_cfg_control]
  connect_bd_intf_net -intf_net pcie4_cfg_interrupt_0_1 [get_bd_intf_ports pcie4_cfg_interrupt_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_cfg_interrupt]
  connect_bd_intf_net -intf_net pcie4_cfg_mgmt_0_1 [get_bd_intf_ports pcie4_cfg_mgmt_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_cfg_mgmt]
  connect_bd_intf_net -intf_net pcie4_cfg_pm_0_1 [get_bd_intf_ports pcie4_cfg_pm_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_cfg_pm]
  connect_bd_intf_net -intf_net pcie4c_uscale_plus_0_m_axis_cq [get_bd_intf_ports m_axis_cq_0] [get_bd_intf_pins pcie4c_uscale_plus_0/m_axis_cq]
  connect_bd_intf_net -intf_net pcie4c_uscale_plus_0_m_axis_rc [get_bd_intf_ports m_axis_rc_0] [get_bd_intf_pins pcie4c_uscale_plus_0/m_axis_rc]
  connect_bd_intf_net -intf_net pcie4c_uscale_plus_0_pcie4_cfg_fc [get_bd_intf_ports pcie4_cfg_fc_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_cfg_fc]
  connect_bd_intf_net -intf_net pcie4c_uscale_plus_0_pcie4_cfg_mesg_rcvd [get_bd_intf_ports pcie4_cfg_mesg_rcvd_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_cfg_mesg_rcvd]
  connect_bd_intf_net -intf_net pcie4c_uscale_plus_0_pcie4_cfg_mesg_tx [get_bd_intf_ports pcie4_cfg_mesg_tx_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_cfg_mesg_tx]
  connect_bd_intf_net -intf_net pcie4c_uscale_plus_0_pcie4_cfg_status [get_bd_intf_ports pcie4_cfg_status_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_cfg_status]
  connect_bd_intf_net -intf_net pcie4c_uscale_plus_0_pcie4_mgt [get_bd_intf_ports pci_express_x4] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_mgt]
  connect_bd_intf_net -intf_net pcie4c_uscale_plus_0_pcie4_transmit_fc [get_bd_intf_ports pcie4_transmit_fc_0] [get_bd_intf_pins pcie4c_uscale_plus_0/pcie4_transmit_fc]
  connect_bd_intf_net -intf_net s_axis_cc_0_1 [get_bd_intf_ports s_axis_cc_0] [get_bd_intf_pins pcie4c_uscale_plus_0/s_axis_cc]
  connect_bd_intf_net -intf_net s_axis_rq_0_1 [get_bd_intf_ports s_axis_rq_0] [get_bd_intf_pins pcie4c_uscale_plus_0/s_axis_rq]

  # Create port connections
  connect_bd_net -net clk_100MHz_1 [get_bd_ports pcie_refclk] [get_bd_pins pcie4c_uscale_plus_0/sys_clk_gt]
  connect_bd_net -net clk_100MHz_1_1 [get_bd_ports sys_clk] [get_bd_pins pcie4c_uscale_plus_0/sys_clk]
  connect_bd_net -net pcie4c_uscale_plus_0_phy_rdy_out [get_bd_pins pcie4c_uscale_plus_0/phy_rdy_out] [get_bd_ports phy_rdy_out_0]
  connect_bd_net -net pcie4c_uscale_plus_0_user_clk [get_bd_pins pcie4c_uscale_plus_0/user_clk] [get_bd_ports user_clk_0]
  connect_bd_net -net pcie4c_uscale_plus_0_user_lnk_up [get_bd_pins pcie4c_uscale_plus_0/user_lnk_up] [get_bd_ports user_lnk_up_0]
  connect_bd_net -net pcie4c_uscale_plus_0_user_reset [get_bd_pins pcie4c_uscale_plus_0/user_reset] [get_bd_ports user_reset_0]
  connect_bd_net -net pcie_perstn_1 [get_bd_ports pcie_perstn] [get_bd_pins pcie4c_uscale_plus_0/sys_reset]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


