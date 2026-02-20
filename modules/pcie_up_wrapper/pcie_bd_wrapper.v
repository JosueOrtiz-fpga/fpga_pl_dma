//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Thu Feb 19 19:33:24 2026
//Host        : DESKTOP-L2M9C3R running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target pcie_bd_wrapper.bd
//Design      : pcie_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module pcie_bd_wrapper
   (m_axis_cq_0_tdata,
    m_axis_cq_0_tkeep,
    m_axis_cq_0_tlast,
    m_axis_cq_0_tready,
    m_axis_cq_0_tuser,
    m_axis_cq_0_tvalid,
    m_axis_rc_0_tdata,
    m_axis_rc_0_tkeep,
    m_axis_rc_0_tlast,
    m_axis_rc_0_tready,
    m_axis_rc_0_tuser,
    m_axis_rc_0_tvalid,
    pci_express_x4_rxn,
    pci_express_x4_rxp,
    pci_express_x4_txn,
    pci_express_x4_txp,
    pcie4_cfg_control_0_bus_number,
    pcie4_cfg_control_0_config_space_enable,
    pcie4_cfg_control_0_ds_bus_number,
    pcie4_cfg_control_0_ds_device_number,
    pcie4_cfg_control_0_ds_port_number,
    pcie4_cfg_control_0_dsn,
    pcie4_cfg_control_0_err_cor_in,
    pcie4_cfg_control_0_err_uncor_in,
    pcie4_cfg_control_0_flr_done,
    pcie4_cfg_control_0_flr_in_process,
    pcie4_cfg_control_0_hot_reset_in,
    pcie4_cfg_control_0_hot_reset_out,
    pcie4_cfg_control_0_link_training_enable,
    pcie4_cfg_control_0_power_state_change_ack,
    pcie4_cfg_control_0_power_state_change_interrupt,
    pcie4_cfg_control_0_req_pm_transition_l23_ready,
    pcie4_cfg_control_0_vf_flr_done,
    pcie4_cfg_control_0_vf_flr_func_num,
    pcie4_cfg_control_0_vf_flr_in_process,
    pcie4_cfg_fc_0_cpld,
    pcie4_cfg_fc_0_cplh,
    pcie4_cfg_fc_0_npd,
    pcie4_cfg_fc_0_nph,
    pcie4_cfg_fc_0_pd,
    pcie4_cfg_fc_0_ph,
    pcie4_cfg_fc_0_sel,
    pcie4_cfg_interrupt_0_intx_vector,
    pcie4_cfg_interrupt_0_pending,
    pcie4_cfg_interrupt_0_sent,
    pcie4_cfg_mesg_rcvd_0_recd,
    pcie4_cfg_mesg_rcvd_0_recd_data,
    pcie4_cfg_mesg_rcvd_0_recd_type,
    pcie4_cfg_mesg_tx_0_transmit,
    pcie4_cfg_mesg_tx_0_transmit_data,
    pcie4_cfg_mesg_tx_0_transmit_done,
    pcie4_cfg_mesg_tx_0_transmit_type,
    pcie4_cfg_mgmt_0_addr,
    pcie4_cfg_mgmt_0_byte_en,
    pcie4_cfg_mgmt_0_debug_access,
    pcie4_cfg_mgmt_0_function_number,
    pcie4_cfg_mgmt_0_read_data,
    pcie4_cfg_mgmt_0_read_en,
    pcie4_cfg_mgmt_0_read_write_done,
    pcie4_cfg_mgmt_0_write_data,
    pcie4_cfg_mgmt_0_write_en,
    pcie4_cfg_pm_0_pm_aspm_l1entry_reject,
    pcie4_cfg_pm_0_pm_aspm_tx_l0s_entry_disable,
    pcie4_cfg_status_0_cq_np_req,
    pcie4_cfg_status_0_cq_np_req_count,
    pcie4_cfg_status_0_current_speed,
    pcie4_cfg_status_0_err_cor_out,
    pcie4_cfg_status_0_err_fatal_out,
    pcie4_cfg_status_0_err_nonfatal_out,
    pcie4_cfg_status_0_function_power_state,
    pcie4_cfg_status_0_function_status,
    pcie4_cfg_status_0_link_power_state,
    pcie4_cfg_status_0_local_error_out,
    pcie4_cfg_status_0_local_error_valid,
    pcie4_cfg_status_0_ltssm_state,
    pcie4_cfg_status_0_max_payload,
    pcie4_cfg_status_0_max_read_req,
    pcie4_cfg_status_0_negotiated_width,
    pcie4_cfg_status_0_obff_enable,
    pcie4_cfg_status_0_phy_link_down,
    pcie4_cfg_status_0_phy_link_status,
    pcie4_cfg_status_0_pl_status_change,
    pcie4_cfg_status_0_rcb_status,
    pcie4_cfg_status_0_rq_seq_num0,
    pcie4_cfg_status_0_rq_seq_num1,
    pcie4_cfg_status_0_rq_seq_num_vld0,
    pcie4_cfg_status_0_rq_seq_num_vld1,
    pcie4_cfg_status_0_rq_tag0,
    pcie4_cfg_status_0_rq_tag1,
    pcie4_cfg_status_0_rq_tag_av,
    pcie4_cfg_status_0_rq_tag_vld0,
    pcie4_cfg_status_0_rq_tag_vld1,
    pcie4_cfg_status_0_rx_pm_state,
    pcie4_cfg_status_0_tph_requester_enable,
    pcie4_cfg_status_0_tph_st_mode,
    pcie4_cfg_status_0_tx_pm_state,
    pcie4_cfg_status_0_vf_power_state,
    pcie4_cfg_status_0_vf_status,
    pcie4_cfg_status_0_vf_tph_requester_enable,
    pcie4_cfg_status_0_vf_tph_st_mode,
    pcie4_transmit_fc_0_npd_av,
    pcie4_transmit_fc_0_nph_av,
    pcie_perstn,
    pcie_refclk,
    phy_rdy_out_0,
    s_axis_cc_0_tdata,
    s_axis_cc_0_tkeep,
    s_axis_cc_0_tlast,
    s_axis_cc_0_tready,
    s_axis_cc_0_tuser,
    s_axis_cc_0_tvalid,
    s_axis_rq_0_tdata,
    s_axis_rq_0_tkeep,
    s_axis_rq_0_tlast,
    s_axis_rq_0_tready,
    s_axis_rq_0_tuser,
    s_axis_rq_0_tvalid,
    sys_clk,
    user_clk_0,
    user_lnk_up_0,
    user_reset_0);
  output [127:0]m_axis_cq_0_tdata;
  output [3:0]m_axis_cq_0_tkeep;
  output m_axis_cq_0_tlast;
  input m_axis_cq_0_tready;
  output [87:0]m_axis_cq_0_tuser;
  output m_axis_cq_0_tvalid;
  output [127:0]m_axis_rc_0_tdata;
  output [3:0]m_axis_rc_0_tkeep;
  output m_axis_rc_0_tlast;
  input m_axis_rc_0_tready;
  output [74:0]m_axis_rc_0_tuser;
  output m_axis_rc_0_tvalid;
  input [3:0]pci_express_x4_rxn;
  input [3:0]pci_express_x4_rxp;
  output [3:0]pci_express_x4_txn;
  output [3:0]pci_express_x4_txp;
  output [7:0]pcie4_cfg_control_0_bus_number;
  input pcie4_cfg_control_0_config_space_enable;
  input [7:0]pcie4_cfg_control_0_ds_bus_number;
  input [4:0]pcie4_cfg_control_0_ds_device_number;
  input [7:0]pcie4_cfg_control_0_ds_port_number;
  input [63:0]pcie4_cfg_control_0_dsn;
  input pcie4_cfg_control_0_err_cor_in;
  input pcie4_cfg_control_0_err_uncor_in;
  input [3:0]pcie4_cfg_control_0_flr_done;
  output [3:0]pcie4_cfg_control_0_flr_in_process;
  input pcie4_cfg_control_0_hot_reset_in;
  output pcie4_cfg_control_0_hot_reset_out;
  input pcie4_cfg_control_0_link_training_enable;
  input pcie4_cfg_control_0_power_state_change_ack;
  output pcie4_cfg_control_0_power_state_change_interrupt;
  input pcie4_cfg_control_0_req_pm_transition_l23_ready;
  input [0:0]pcie4_cfg_control_0_vf_flr_done;
  input [7:0]pcie4_cfg_control_0_vf_flr_func_num;
  output [251:0]pcie4_cfg_control_0_vf_flr_in_process;
  output [11:0]pcie4_cfg_fc_0_cpld;
  output [7:0]pcie4_cfg_fc_0_cplh;
  output [11:0]pcie4_cfg_fc_0_npd;
  output [7:0]pcie4_cfg_fc_0_nph;
  output [11:0]pcie4_cfg_fc_0_pd;
  output [7:0]pcie4_cfg_fc_0_ph;
  input [2:0]pcie4_cfg_fc_0_sel;
  input [3:0]pcie4_cfg_interrupt_0_intx_vector;
  input [3:0]pcie4_cfg_interrupt_0_pending;
  output pcie4_cfg_interrupt_0_sent;
  output pcie4_cfg_mesg_rcvd_0_recd;
  output [7:0]pcie4_cfg_mesg_rcvd_0_recd_data;
  output [4:0]pcie4_cfg_mesg_rcvd_0_recd_type;
  input pcie4_cfg_mesg_tx_0_transmit;
  input [31:0]pcie4_cfg_mesg_tx_0_transmit_data;
  output pcie4_cfg_mesg_tx_0_transmit_done;
  input [2:0]pcie4_cfg_mesg_tx_0_transmit_type;
  input [9:0]pcie4_cfg_mgmt_0_addr;
  input [3:0]pcie4_cfg_mgmt_0_byte_en;
  input pcie4_cfg_mgmt_0_debug_access;
  input [7:0]pcie4_cfg_mgmt_0_function_number;
  output [31:0]pcie4_cfg_mgmt_0_read_data;
  input pcie4_cfg_mgmt_0_read_en;
  output pcie4_cfg_mgmt_0_read_write_done;
  input [31:0]pcie4_cfg_mgmt_0_write_data;
  input pcie4_cfg_mgmt_0_write_en;
  input pcie4_cfg_pm_0_pm_aspm_l1entry_reject;
  input pcie4_cfg_pm_0_pm_aspm_tx_l0s_entry_disable;
  input [1:0]pcie4_cfg_status_0_cq_np_req;
  output [5:0]pcie4_cfg_status_0_cq_np_req_count;
  output [1:0]pcie4_cfg_status_0_current_speed;
  output pcie4_cfg_status_0_err_cor_out;
  output pcie4_cfg_status_0_err_fatal_out;
  output pcie4_cfg_status_0_err_nonfatal_out;
  output [11:0]pcie4_cfg_status_0_function_power_state;
  output [15:0]pcie4_cfg_status_0_function_status;
  output [1:0]pcie4_cfg_status_0_link_power_state;
  output [4:0]pcie4_cfg_status_0_local_error_out;
  output pcie4_cfg_status_0_local_error_valid;
  output [5:0]pcie4_cfg_status_0_ltssm_state;
  output [1:0]pcie4_cfg_status_0_max_payload;
  output [2:0]pcie4_cfg_status_0_max_read_req;
  output [2:0]pcie4_cfg_status_0_negotiated_width;
  output [1:0]pcie4_cfg_status_0_obff_enable;
  output pcie4_cfg_status_0_phy_link_down;
  output [1:0]pcie4_cfg_status_0_phy_link_status;
  output pcie4_cfg_status_0_pl_status_change;
  output [3:0]pcie4_cfg_status_0_rcb_status;
  output [5:0]pcie4_cfg_status_0_rq_seq_num0;
  output [5:0]pcie4_cfg_status_0_rq_seq_num1;
  output pcie4_cfg_status_0_rq_seq_num_vld0;
  output pcie4_cfg_status_0_rq_seq_num_vld1;
  output [7:0]pcie4_cfg_status_0_rq_tag0;
  output [7:0]pcie4_cfg_status_0_rq_tag1;
  output [3:0]pcie4_cfg_status_0_rq_tag_av;
  output pcie4_cfg_status_0_rq_tag_vld0;
  output pcie4_cfg_status_0_rq_tag_vld1;
  output [1:0]pcie4_cfg_status_0_rx_pm_state;
  output [3:0]pcie4_cfg_status_0_tph_requester_enable;
  output [11:0]pcie4_cfg_status_0_tph_st_mode;
  output [1:0]pcie4_cfg_status_0_tx_pm_state;
  output [755:0]pcie4_cfg_status_0_vf_power_state;
  output [503:0]pcie4_cfg_status_0_vf_status;
  output [251:0]pcie4_cfg_status_0_vf_tph_requester_enable;
  output [755:0]pcie4_cfg_status_0_vf_tph_st_mode;
  output [3:0]pcie4_transmit_fc_0_npd_av;
  output [3:0]pcie4_transmit_fc_0_nph_av;
  input pcie_perstn;
  input pcie_refclk;
  output phy_rdy_out_0;
  input [127:0]s_axis_cc_0_tdata;
  input [3:0]s_axis_cc_0_tkeep;
  input s_axis_cc_0_tlast;
  output [3:0]s_axis_cc_0_tready;
  input [32:0]s_axis_cc_0_tuser;
  input s_axis_cc_0_tvalid;
  input [127:0]s_axis_rq_0_tdata;
  input [3:0]s_axis_rq_0_tkeep;
  input s_axis_rq_0_tlast;
  output [3:0]s_axis_rq_0_tready;
  input [61:0]s_axis_rq_0_tuser;
  input s_axis_rq_0_tvalid;
  input sys_clk;
  output user_clk_0;
  output user_lnk_up_0;
  output user_reset_0;

  wire [127:0]m_axis_cq_0_tdata;
  wire [3:0]m_axis_cq_0_tkeep;
  wire m_axis_cq_0_tlast;
  wire m_axis_cq_0_tready;
  wire [87:0]m_axis_cq_0_tuser;
  wire m_axis_cq_0_tvalid;
  wire [127:0]m_axis_rc_0_tdata;
  wire [3:0]m_axis_rc_0_tkeep;
  wire m_axis_rc_0_tlast;
  wire m_axis_rc_0_tready;
  wire [74:0]m_axis_rc_0_tuser;
  wire m_axis_rc_0_tvalid;
  wire [3:0]pci_express_x4_rxn;
  wire [3:0]pci_express_x4_rxp;
  wire [3:0]pci_express_x4_txn;
  wire [3:0]pci_express_x4_txp;
  wire [7:0]pcie4_cfg_control_0_bus_number;
  wire pcie4_cfg_control_0_config_space_enable;
  wire [7:0]pcie4_cfg_control_0_ds_bus_number;
  wire [4:0]pcie4_cfg_control_0_ds_device_number;
  wire [7:0]pcie4_cfg_control_0_ds_port_number;
  wire [63:0]pcie4_cfg_control_0_dsn;
  wire pcie4_cfg_control_0_err_cor_in;
  wire pcie4_cfg_control_0_err_uncor_in;
  wire [3:0]pcie4_cfg_control_0_flr_done;
  wire [3:0]pcie4_cfg_control_0_flr_in_process;
  wire pcie4_cfg_control_0_hot_reset_in;
  wire pcie4_cfg_control_0_hot_reset_out;
  wire pcie4_cfg_control_0_link_training_enable;
  wire pcie4_cfg_control_0_power_state_change_ack;
  wire pcie4_cfg_control_0_power_state_change_interrupt;
  wire pcie4_cfg_control_0_req_pm_transition_l23_ready;
  wire [0:0]pcie4_cfg_control_0_vf_flr_done;
  wire [7:0]pcie4_cfg_control_0_vf_flr_func_num;
  wire [251:0]pcie4_cfg_control_0_vf_flr_in_process;
  wire [11:0]pcie4_cfg_fc_0_cpld;
  wire [7:0]pcie4_cfg_fc_0_cplh;
  wire [11:0]pcie4_cfg_fc_0_npd;
  wire [7:0]pcie4_cfg_fc_0_nph;
  wire [11:0]pcie4_cfg_fc_0_pd;
  wire [7:0]pcie4_cfg_fc_0_ph;
  wire [2:0]pcie4_cfg_fc_0_sel;
  wire [3:0]pcie4_cfg_interrupt_0_intx_vector;
  wire [3:0]pcie4_cfg_interrupt_0_pending;
  wire pcie4_cfg_interrupt_0_sent;
  wire pcie4_cfg_mesg_rcvd_0_recd;
  wire [7:0]pcie4_cfg_mesg_rcvd_0_recd_data;
  wire [4:0]pcie4_cfg_mesg_rcvd_0_recd_type;
  wire pcie4_cfg_mesg_tx_0_transmit;
  wire [31:0]pcie4_cfg_mesg_tx_0_transmit_data;
  wire pcie4_cfg_mesg_tx_0_transmit_done;
  wire [2:0]pcie4_cfg_mesg_tx_0_transmit_type;
  wire [9:0]pcie4_cfg_mgmt_0_addr;
  wire [3:0]pcie4_cfg_mgmt_0_byte_en;
  wire pcie4_cfg_mgmt_0_debug_access;
  wire [7:0]pcie4_cfg_mgmt_0_function_number;
  wire [31:0]pcie4_cfg_mgmt_0_read_data;
  wire pcie4_cfg_mgmt_0_read_en;
  wire pcie4_cfg_mgmt_0_read_write_done;
  wire [31:0]pcie4_cfg_mgmt_0_write_data;
  wire pcie4_cfg_mgmt_0_write_en;
  wire pcie4_cfg_pm_0_pm_aspm_l1entry_reject;
  wire pcie4_cfg_pm_0_pm_aspm_tx_l0s_entry_disable;
  wire [1:0]pcie4_cfg_status_0_cq_np_req;
  wire [5:0]pcie4_cfg_status_0_cq_np_req_count;
  wire [1:0]pcie4_cfg_status_0_current_speed;
  wire pcie4_cfg_status_0_err_cor_out;
  wire pcie4_cfg_status_0_err_fatal_out;
  wire pcie4_cfg_status_0_err_nonfatal_out;
  wire [11:0]pcie4_cfg_status_0_function_power_state;
  wire [15:0]pcie4_cfg_status_0_function_status;
  wire [1:0]pcie4_cfg_status_0_link_power_state;
  wire [4:0]pcie4_cfg_status_0_local_error_out;
  wire pcie4_cfg_status_0_local_error_valid;
  wire [5:0]pcie4_cfg_status_0_ltssm_state;
  wire [1:0]pcie4_cfg_status_0_max_payload;
  wire [2:0]pcie4_cfg_status_0_max_read_req;
  wire [2:0]pcie4_cfg_status_0_negotiated_width;
  wire [1:0]pcie4_cfg_status_0_obff_enable;
  wire pcie4_cfg_status_0_phy_link_down;
  wire [1:0]pcie4_cfg_status_0_phy_link_status;
  wire pcie4_cfg_status_0_pl_status_change;
  wire [3:0]pcie4_cfg_status_0_rcb_status;
  wire [5:0]pcie4_cfg_status_0_rq_seq_num0;
  wire [5:0]pcie4_cfg_status_0_rq_seq_num1;
  wire pcie4_cfg_status_0_rq_seq_num_vld0;
  wire pcie4_cfg_status_0_rq_seq_num_vld1;
  wire [7:0]pcie4_cfg_status_0_rq_tag0;
  wire [7:0]pcie4_cfg_status_0_rq_tag1;
  wire [3:0]pcie4_cfg_status_0_rq_tag_av;
  wire pcie4_cfg_status_0_rq_tag_vld0;
  wire pcie4_cfg_status_0_rq_tag_vld1;
  wire [1:0]pcie4_cfg_status_0_rx_pm_state;
  wire [3:0]pcie4_cfg_status_0_tph_requester_enable;
  wire [11:0]pcie4_cfg_status_0_tph_st_mode;
  wire [1:0]pcie4_cfg_status_0_tx_pm_state;
  wire [755:0]pcie4_cfg_status_0_vf_power_state;
  wire [503:0]pcie4_cfg_status_0_vf_status;
  wire [251:0]pcie4_cfg_status_0_vf_tph_requester_enable;
  wire [755:0]pcie4_cfg_status_0_vf_tph_st_mode;
  wire [3:0]pcie4_transmit_fc_0_npd_av;
  wire [3:0]pcie4_transmit_fc_0_nph_av;
  wire pcie_perstn;
  wire pcie_refclk;
  wire phy_rdy_out_0;
  wire [127:0]s_axis_cc_0_tdata;
  wire [3:0]s_axis_cc_0_tkeep;
  wire s_axis_cc_0_tlast;
  wire [3:0]s_axis_cc_0_tready;
  wire [32:0]s_axis_cc_0_tuser;
  wire s_axis_cc_0_tvalid;
  wire [127:0]s_axis_rq_0_tdata;
  wire [3:0]s_axis_rq_0_tkeep;
  wire s_axis_rq_0_tlast;
  wire [3:0]s_axis_rq_0_tready;
  wire [61:0]s_axis_rq_0_tuser;
  wire s_axis_rq_0_tvalid;
  wire sys_clk;
  wire user_clk_0;
  wire user_lnk_up_0;
  wire user_reset_0;

  pcie_bd pcie_bd_i
       (.m_axis_cq_0_tdata(m_axis_cq_0_tdata),
        .m_axis_cq_0_tkeep(m_axis_cq_0_tkeep),
        .m_axis_cq_0_tlast(m_axis_cq_0_tlast),
        .m_axis_cq_0_tready(m_axis_cq_0_tready),
        .m_axis_cq_0_tuser(m_axis_cq_0_tuser),
        .m_axis_cq_0_tvalid(m_axis_cq_0_tvalid),
        .m_axis_rc_0_tdata(m_axis_rc_0_tdata),
        .m_axis_rc_0_tkeep(m_axis_rc_0_tkeep),
        .m_axis_rc_0_tlast(m_axis_rc_0_tlast),
        .m_axis_rc_0_tready(m_axis_rc_0_tready),
        .m_axis_rc_0_tuser(m_axis_rc_0_tuser),
        .m_axis_rc_0_tvalid(m_axis_rc_0_tvalid),
        .pci_express_x4_rxn(pci_express_x4_rxn),
        .pci_express_x4_rxp(pci_express_x4_rxp),
        .pci_express_x4_txn(pci_express_x4_txn),
        .pci_express_x4_txp(pci_express_x4_txp),
        .pcie4_cfg_control_0_bus_number(pcie4_cfg_control_0_bus_number),
        .pcie4_cfg_control_0_config_space_enable(pcie4_cfg_control_0_config_space_enable),
        .pcie4_cfg_control_0_ds_bus_number(pcie4_cfg_control_0_ds_bus_number),
        .pcie4_cfg_control_0_ds_device_number(pcie4_cfg_control_0_ds_device_number),
        .pcie4_cfg_control_0_ds_port_number(pcie4_cfg_control_0_ds_port_number),
        .pcie4_cfg_control_0_dsn(pcie4_cfg_control_0_dsn),
        .pcie4_cfg_control_0_err_cor_in(pcie4_cfg_control_0_err_cor_in),
        .pcie4_cfg_control_0_err_uncor_in(pcie4_cfg_control_0_err_uncor_in),
        .pcie4_cfg_control_0_flr_done(pcie4_cfg_control_0_flr_done),
        .pcie4_cfg_control_0_flr_in_process(pcie4_cfg_control_0_flr_in_process),
        .pcie4_cfg_control_0_hot_reset_in(pcie4_cfg_control_0_hot_reset_in),
        .pcie4_cfg_control_0_hot_reset_out(pcie4_cfg_control_0_hot_reset_out),
        .pcie4_cfg_control_0_link_training_enable(pcie4_cfg_control_0_link_training_enable),
        .pcie4_cfg_control_0_power_state_change_ack(pcie4_cfg_control_0_power_state_change_ack),
        .pcie4_cfg_control_0_power_state_change_interrupt(pcie4_cfg_control_0_power_state_change_interrupt),
        .pcie4_cfg_control_0_req_pm_transition_l23_ready(pcie4_cfg_control_0_req_pm_transition_l23_ready),
        .pcie4_cfg_control_0_vf_flr_done(pcie4_cfg_control_0_vf_flr_done),
        .pcie4_cfg_control_0_vf_flr_func_num(pcie4_cfg_control_0_vf_flr_func_num),
        .pcie4_cfg_control_0_vf_flr_in_process(pcie4_cfg_control_0_vf_flr_in_process),
        .pcie4_cfg_fc_0_cpld(pcie4_cfg_fc_0_cpld),
        .pcie4_cfg_fc_0_cplh(pcie4_cfg_fc_0_cplh),
        .pcie4_cfg_fc_0_npd(pcie4_cfg_fc_0_npd),
        .pcie4_cfg_fc_0_nph(pcie4_cfg_fc_0_nph),
        .pcie4_cfg_fc_0_pd(pcie4_cfg_fc_0_pd),
        .pcie4_cfg_fc_0_ph(pcie4_cfg_fc_0_ph),
        .pcie4_cfg_fc_0_sel(pcie4_cfg_fc_0_sel),
        .pcie4_cfg_interrupt_0_intx_vector(pcie4_cfg_interrupt_0_intx_vector),
        .pcie4_cfg_interrupt_0_pending(pcie4_cfg_interrupt_0_pending),
        .pcie4_cfg_interrupt_0_sent(pcie4_cfg_interrupt_0_sent),
        .pcie4_cfg_mesg_rcvd_0_recd(pcie4_cfg_mesg_rcvd_0_recd),
        .pcie4_cfg_mesg_rcvd_0_recd_data(pcie4_cfg_mesg_rcvd_0_recd_data),
        .pcie4_cfg_mesg_rcvd_0_recd_type(pcie4_cfg_mesg_rcvd_0_recd_type),
        .pcie4_cfg_mesg_tx_0_transmit(pcie4_cfg_mesg_tx_0_transmit),
        .pcie4_cfg_mesg_tx_0_transmit_data(pcie4_cfg_mesg_tx_0_transmit_data),
        .pcie4_cfg_mesg_tx_0_transmit_done(pcie4_cfg_mesg_tx_0_transmit_done),
        .pcie4_cfg_mesg_tx_0_transmit_type(pcie4_cfg_mesg_tx_0_transmit_type),
        .pcie4_cfg_mgmt_0_addr(pcie4_cfg_mgmt_0_addr),
        .pcie4_cfg_mgmt_0_byte_en(pcie4_cfg_mgmt_0_byte_en),
        .pcie4_cfg_mgmt_0_debug_access(pcie4_cfg_mgmt_0_debug_access),
        .pcie4_cfg_mgmt_0_function_number(pcie4_cfg_mgmt_0_function_number),
        .pcie4_cfg_mgmt_0_read_data(pcie4_cfg_mgmt_0_read_data),
        .pcie4_cfg_mgmt_0_read_en(pcie4_cfg_mgmt_0_read_en),
        .pcie4_cfg_mgmt_0_read_write_done(pcie4_cfg_mgmt_0_read_write_done),
        .pcie4_cfg_mgmt_0_write_data(pcie4_cfg_mgmt_0_write_data),
        .pcie4_cfg_mgmt_0_write_en(pcie4_cfg_mgmt_0_write_en),
        .pcie4_cfg_pm_0_pm_aspm_l1entry_reject(pcie4_cfg_pm_0_pm_aspm_l1entry_reject),
        .pcie4_cfg_pm_0_pm_aspm_tx_l0s_entry_disable(pcie4_cfg_pm_0_pm_aspm_tx_l0s_entry_disable),
        .pcie4_cfg_status_0_cq_np_req(pcie4_cfg_status_0_cq_np_req),
        .pcie4_cfg_status_0_cq_np_req_count(pcie4_cfg_status_0_cq_np_req_count),
        .pcie4_cfg_status_0_current_speed(pcie4_cfg_status_0_current_speed),
        .pcie4_cfg_status_0_err_cor_out(pcie4_cfg_status_0_err_cor_out),
        .pcie4_cfg_status_0_err_fatal_out(pcie4_cfg_status_0_err_fatal_out),
        .pcie4_cfg_status_0_err_nonfatal_out(pcie4_cfg_status_0_err_nonfatal_out),
        .pcie4_cfg_status_0_function_power_state(pcie4_cfg_status_0_function_power_state),
        .pcie4_cfg_status_0_function_status(pcie4_cfg_status_0_function_status),
        .pcie4_cfg_status_0_link_power_state(pcie4_cfg_status_0_link_power_state),
        .pcie4_cfg_status_0_local_error_out(pcie4_cfg_status_0_local_error_out),
        .pcie4_cfg_status_0_local_error_valid(pcie4_cfg_status_0_local_error_valid),
        .pcie4_cfg_status_0_ltssm_state(pcie4_cfg_status_0_ltssm_state),
        .pcie4_cfg_status_0_max_payload(pcie4_cfg_status_0_max_payload),
        .pcie4_cfg_status_0_max_read_req(pcie4_cfg_status_0_max_read_req),
        .pcie4_cfg_status_0_negotiated_width(pcie4_cfg_status_0_negotiated_width),
        .pcie4_cfg_status_0_obff_enable(pcie4_cfg_status_0_obff_enable),
        .pcie4_cfg_status_0_phy_link_down(pcie4_cfg_status_0_phy_link_down),
        .pcie4_cfg_status_0_phy_link_status(pcie4_cfg_status_0_phy_link_status),
        .pcie4_cfg_status_0_pl_status_change(pcie4_cfg_status_0_pl_status_change),
        .pcie4_cfg_status_0_rcb_status(pcie4_cfg_status_0_rcb_status),
        .pcie4_cfg_status_0_rq_seq_num0(pcie4_cfg_status_0_rq_seq_num0),
        .pcie4_cfg_status_0_rq_seq_num1(pcie4_cfg_status_0_rq_seq_num1),
        .pcie4_cfg_status_0_rq_seq_num_vld0(pcie4_cfg_status_0_rq_seq_num_vld0),
        .pcie4_cfg_status_0_rq_seq_num_vld1(pcie4_cfg_status_0_rq_seq_num_vld1),
        .pcie4_cfg_status_0_rq_tag0(pcie4_cfg_status_0_rq_tag0),
        .pcie4_cfg_status_0_rq_tag1(pcie4_cfg_status_0_rq_tag1),
        .pcie4_cfg_status_0_rq_tag_av(pcie4_cfg_status_0_rq_tag_av),
        .pcie4_cfg_status_0_rq_tag_vld0(pcie4_cfg_status_0_rq_tag_vld0),
        .pcie4_cfg_status_0_rq_tag_vld1(pcie4_cfg_status_0_rq_tag_vld1),
        .pcie4_cfg_status_0_rx_pm_state(pcie4_cfg_status_0_rx_pm_state),
        .pcie4_cfg_status_0_tph_requester_enable(pcie4_cfg_status_0_tph_requester_enable),
        .pcie4_cfg_status_0_tph_st_mode(pcie4_cfg_status_0_tph_st_mode),
        .pcie4_cfg_status_0_tx_pm_state(pcie4_cfg_status_0_tx_pm_state),
        .pcie4_cfg_status_0_vf_power_state(pcie4_cfg_status_0_vf_power_state),
        .pcie4_cfg_status_0_vf_status(pcie4_cfg_status_0_vf_status),
        .pcie4_cfg_status_0_vf_tph_requester_enable(pcie4_cfg_status_0_vf_tph_requester_enable),
        .pcie4_cfg_status_0_vf_tph_st_mode(pcie4_cfg_status_0_vf_tph_st_mode),
        .pcie4_transmit_fc_0_npd_av(pcie4_transmit_fc_0_npd_av),
        .pcie4_transmit_fc_0_nph_av(pcie4_transmit_fc_0_nph_av),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk(pcie_refclk),
        .phy_rdy_out_0(phy_rdy_out_0),
        .s_axis_cc_0_tdata(s_axis_cc_0_tdata),
        .s_axis_cc_0_tkeep(s_axis_cc_0_tkeep),
        .s_axis_cc_0_tlast(s_axis_cc_0_tlast),
        .s_axis_cc_0_tready(s_axis_cc_0_tready),
        .s_axis_cc_0_tuser(s_axis_cc_0_tuser),
        .s_axis_cc_0_tvalid(s_axis_cc_0_tvalid),
        .s_axis_rq_0_tdata(s_axis_rq_0_tdata),
        .s_axis_rq_0_tkeep(s_axis_rq_0_tkeep),
        .s_axis_rq_0_tlast(s_axis_rq_0_tlast),
        .s_axis_rq_0_tready(s_axis_rq_0_tready),
        .s_axis_rq_0_tuser(s_axis_rq_0_tuser),
        .s_axis_rq_0_tvalid(s_axis_rq_0_tvalid),
        .sys_clk(sys_clk),
        .user_clk_0(user_clk_0),
        .user_lnk_up_0(user_lnk_up_0),
        .user_reset_0(user_reset_0));
endmodule
