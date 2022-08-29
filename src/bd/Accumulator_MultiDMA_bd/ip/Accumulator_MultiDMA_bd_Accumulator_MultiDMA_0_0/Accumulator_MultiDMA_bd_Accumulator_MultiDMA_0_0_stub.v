// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon Aug 29 03:56:16 2022
// Host        : Yuhao running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/yuhao_liu/Projects/Hardware/FPGA/Ultra96V2/AXI-MultiDMA/src/bd/Accumulator_MultiDMA_bd/ip/Accumulator_MultiDMA_bd_Accumulator_MultiDMA_0_0/Accumulator_MultiDMA_bd_Accumulator_MultiDMA_0_0_stub.v
// Design      : Accumulator_MultiDMA_bd_Accumulator_MultiDMA_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Accumulator_MultiDMA,Vivado 2020.2" *)
module Accumulator_MultiDMA_bd_Accumulator_MultiDMA_0_0(sys_clk, sys_rst_n, accu_en, accu_finished, 
  s_axis_0_aresetn, s_axis_0_aclk, s_axis_tvalid_0, s_axis_tready_0, s_axis_tdata_0, 
  s_axis_tkeep_0, s_axis_tlast_0, s_axis_1_aresetn, s_axis_1_aclk, s_axis_tvalid_1, 
  s_axis_tready_1, s_axis_tdata_1, s_axis_tkeep_1, s_axis_tlast_1, s_axis_2_aresetn, 
  s_axis_2_aclk, s_axis_tvalid_2, s_axis_tready_2, s_axis_tdata_2, s_axis_tkeep_2, 
  s_axis_tlast_2, s_axis_3_aresetn, s_axis_3_aclk, s_axis_tvalid_3, s_axis_tready_3, 
  s_axis_tdata_3, s_axis_tkeep_3, s_axis_tlast_3, m_axis_aresetn, m_axis_aclk, m_axis_tvalid, 
  m_axis_tready, m_axis_tdata, m_axis_tkeep, m_axis_tlast)
/* synthesis syn_black_box black_box_pad_pin="sys_clk,sys_rst_n,accu_en,accu_finished,s_axis_0_aresetn,s_axis_0_aclk,s_axis_tvalid_0,s_axis_tready_0,s_axis_tdata_0[63:0],s_axis_tkeep_0[7:0],s_axis_tlast_0,s_axis_1_aresetn,s_axis_1_aclk,s_axis_tvalid_1,s_axis_tready_1,s_axis_tdata_1[63:0],s_axis_tkeep_1[7:0],s_axis_tlast_1,s_axis_2_aresetn,s_axis_2_aclk,s_axis_tvalid_2,s_axis_tready_2,s_axis_tdata_2[63:0],s_axis_tkeep_2[7:0],s_axis_tlast_2,s_axis_3_aresetn,s_axis_3_aclk,s_axis_tvalid_3,s_axis_tready_3,s_axis_tdata_3[63:0],s_axis_tkeep_3[7:0],s_axis_tlast_3,m_axis_aresetn,m_axis_aclk,m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tkeep[7:0],m_axis_tlast" */;
  input sys_clk;
  input sys_rst_n;
  input accu_en;
  output accu_finished;
  input s_axis_0_aresetn;
  input s_axis_0_aclk;
  input s_axis_tvalid_0;
  output s_axis_tready_0;
  input [63:0]s_axis_tdata_0;
  input [7:0]s_axis_tkeep_0;
  input s_axis_tlast_0;
  input s_axis_1_aresetn;
  input s_axis_1_aclk;
  input s_axis_tvalid_1;
  output s_axis_tready_1;
  input [63:0]s_axis_tdata_1;
  input [7:0]s_axis_tkeep_1;
  input s_axis_tlast_1;
  input s_axis_2_aresetn;
  input s_axis_2_aclk;
  input s_axis_tvalid_2;
  output s_axis_tready_2;
  input [63:0]s_axis_tdata_2;
  input [7:0]s_axis_tkeep_2;
  input s_axis_tlast_2;
  input s_axis_3_aresetn;
  input s_axis_3_aclk;
  input s_axis_tvalid_3;
  output s_axis_tready_3;
  input [63:0]s_axis_tdata_3;
  input [7:0]s_axis_tkeep_3;
  input s_axis_tlast_3;
  input m_axis_aresetn;
  input m_axis_aclk;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tkeep;
  output m_axis_tlast;
endmodule
