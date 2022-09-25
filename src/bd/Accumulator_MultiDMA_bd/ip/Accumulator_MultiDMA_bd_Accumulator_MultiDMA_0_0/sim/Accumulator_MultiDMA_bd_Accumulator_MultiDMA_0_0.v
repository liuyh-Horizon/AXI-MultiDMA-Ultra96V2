// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:Accumulator_MultiDMA:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Accumulator_MultiDMA_bd_Accumulator_MultiDMA_0_0 (
  sys_clk,
  sys_rst_n,
  accu_en,
  accu_finished,
  sum_debug,
  step_debug,
  s_axis_0_aresetn,
  s_axis_0_aclk,
  s_axis_tvalid_0,
  s_axis_tready_0,
  s_axis_tdata_0,
  s_axis_tkeep_0,
  s_axis_tlast_0,
  s_axis_1_aresetn,
  s_axis_1_aclk,
  s_axis_tvalid_1,
  s_axis_tready_1,
  s_axis_tdata_1,
  s_axis_tkeep_1,
  s_axis_tlast_1,
  s_axis_2_aresetn,
  s_axis_2_aclk,
  s_axis_tvalid_2,
  s_axis_tready_2,
  s_axis_tdata_2,
  s_axis_tkeep_2,
  s_axis_tlast_2,
  s_axis_3_aresetn,
  s_axis_3_aclk,
  s_axis_tvalid_3,
  s_axis_tready_3,
  s_axis_tdata_3,
  s_axis_tkeep_3,
  s_axis_tlast_3,
  m_axis_aresetn,
  m_axis_aclk,
  m_axis_tvalid,
  m_axis_tready,
  m_axis_tdata,
  m_axis_tkeep,
  m_axis_tlast
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sys_clk, ASSOCIATED_RESET sys_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 sys_clk CLK" *)
input wire sys_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sys_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sys_rst_n RST" *)
input wire sys_rst_n;
input wire accu_en;
output wire accu_finished;
output wire [31 : 0] sum_debug;
output wire [7 : 0] step_debug;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_0_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axis_0_aresetn RST" *)
input wire s_axis_0_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_0_aclk, ASSOCIATED_BUSIF s_axis_0, ASSOCIATED_RESET s_axis_0_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_0_aclk CLK" *)
input wire s_axis_0_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TVALID" *)
input wire s_axis_tvalid_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TREADY" *)
output wire s_axis_tready_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TDATA" *)
input wire [63 : 0] s_axis_tdata_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TKEEP" *)
input wire [7 : 0] s_axis_tkeep_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TLAST" *)
input wire s_axis_tlast_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_1_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axis_1_aresetn RST" *)
input wire s_axis_1_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_1_aclk, ASSOCIATED_BUSIF s_axis_1, ASSOCIATED_RESET s_axis_1_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_1_aclk CLK" *)
input wire s_axis_1_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TVALID" *)
input wire s_axis_tvalid_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TREADY" *)
output wire s_axis_tready_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TDATA" *)
input wire [63 : 0] s_axis_tdata_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TKEEP" *)
input wire [7 : 0] s_axis_tkeep_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_1, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TLAST" *)
input wire s_axis_tlast_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_2_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axis_2_aresetn RST" *)
input wire s_axis_2_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_2_aclk, ASSOCIATED_BUSIF s_axis_2, ASSOCIATED_RESET s_axis_2_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_2_aclk CLK" *)
input wire s_axis_2_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TVALID" *)
input wire s_axis_tvalid_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TREADY" *)
output wire s_axis_tready_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TDATA" *)
input wire [63 : 0] s_axis_tdata_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TKEEP" *)
input wire [7 : 0] s_axis_tkeep_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_2, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TLAST" *)
input wire s_axis_tlast_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_3_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axis_3_aresetn RST" *)
input wire s_axis_3_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_3_aclk, ASSOCIATED_BUSIF s_axis_3, ASSOCIATED_RESET s_axis_3_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_3_aclk CLK" *)
input wire s_axis_3_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TVALID" *)
input wire s_axis_tvalid_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TREADY" *)
output wire s_axis_tready_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TDATA" *)
input wire [63 : 0] s_axis_tdata_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TKEEP" *)
input wire [7 : 0] s_axis_tkeep_3;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_3, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TLAST" *)
input wire s_axis_tlast_3;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_axis_aresetn RST" *)
input wire m_axis_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_aclk, ASSOCIATED_BUSIF m_axis, ASSOCIATED_RESET m_axis_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axis_aclk CLK" *)
input wire m_axis_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *)
output wire m_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *)
input wire m_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *)
output wire [63 : 0] m_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TKEEP" *)
output wire [7 : 0] m_axis_tkeep;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN Accumulator_MultiDMA_bd_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *)
output wire m_axis_tlast;

  Accumulator_MultiDMA inst (
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .accu_en(accu_en),
    .accu_finished(accu_finished),
    .sum_debug(sum_debug),
    .step_debug(step_debug),
    .s_axis_0_aresetn(s_axis_0_aresetn),
    .s_axis_0_aclk(s_axis_0_aclk),
    .s_axis_tvalid_0(s_axis_tvalid_0),
    .s_axis_tready_0(s_axis_tready_0),
    .s_axis_tdata_0(s_axis_tdata_0),
    .s_axis_tkeep_0(s_axis_tkeep_0),
    .s_axis_tlast_0(s_axis_tlast_0),
    .s_axis_1_aresetn(s_axis_1_aresetn),
    .s_axis_1_aclk(s_axis_1_aclk),
    .s_axis_tvalid_1(s_axis_tvalid_1),
    .s_axis_tready_1(s_axis_tready_1),
    .s_axis_tdata_1(s_axis_tdata_1),
    .s_axis_tkeep_1(s_axis_tkeep_1),
    .s_axis_tlast_1(s_axis_tlast_1),
    .s_axis_2_aresetn(s_axis_2_aresetn),
    .s_axis_2_aclk(s_axis_2_aclk),
    .s_axis_tvalid_2(s_axis_tvalid_2),
    .s_axis_tready_2(s_axis_tready_2),
    .s_axis_tdata_2(s_axis_tdata_2),
    .s_axis_tkeep_2(s_axis_tkeep_2),
    .s_axis_tlast_2(s_axis_tlast_2),
    .s_axis_3_aresetn(s_axis_3_aresetn),
    .s_axis_3_aclk(s_axis_3_aclk),
    .s_axis_tvalid_3(s_axis_tvalid_3),
    .s_axis_tready_3(s_axis_tready_3),
    .s_axis_tdata_3(s_axis_tdata_3),
    .s_axis_tkeep_3(s_axis_tkeep_3),
    .s_axis_tlast_3(s_axis_tlast_3),
    .m_axis_aresetn(m_axis_aresetn),
    .m_axis_aclk(m_axis_aclk),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tready(m_axis_tready),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tkeep(m_axis_tkeep),
    .m_axis_tlast(m_axis_tlast)
  );
endmodule
