-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Mon Sep 26 13:49:03 2022
-- Host        : atlas running 64-bit Ubuntu 20.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Accumulator_MultiDMA_bd_Accumulator_MultiDMA_0_0_stub.vhdl
-- Design      : Accumulator_MultiDMA_bd_Accumulator_MultiDMA_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    sys_clk : in STD_LOGIC;
    sys_rst_n : in STD_LOGIC;
    accu_en : in STD_LOGIC;
    accu_finished : out STD_LOGIC;
    sum_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    step_debug : out STD_LOGIC_VECTOR ( 7 downto 0 );
    accu_length_0_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    accu_length_1_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    accu_length_2_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    accu_length_3_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_0_aresetn : in STD_LOGIC;
    s_axis_0_aclk : in STD_LOGIC;
    s_axis_tvalid_0 : in STD_LOGIC;
    s_axis_tready_0 : out STD_LOGIC;
    s_axis_tdata_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tkeep_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast_0 : in STD_LOGIC;
    s_axis_1_aresetn : in STD_LOGIC;
    s_axis_1_aclk : in STD_LOGIC;
    s_axis_tvalid_1 : in STD_LOGIC;
    s_axis_tready_1 : out STD_LOGIC;
    s_axis_tdata_1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tkeep_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast_1 : in STD_LOGIC;
    s_axis_2_aresetn : in STD_LOGIC;
    s_axis_2_aclk : in STD_LOGIC;
    s_axis_tvalid_2 : in STD_LOGIC;
    s_axis_tready_2 : out STD_LOGIC;
    s_axis_tdata_2 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tkeep_2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast_2 : in STD_LOGIC;
    s_axis_3_aresetn : in STD_LOGIC;
    s_axis_3_aclk : in STD_LOGIC;
    s_axis_tvalid_3 : in STD_LOGIC;
    s_axis_tready_3 : out STD_LOGIC;
    s_axis_tdata_3 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tkeep_3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast_3 : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sys_clk,sys_rst_n,accu_en,accu_finished,sum_debug[31:0],step_debug[7:0],accu_length_0_debug[31:0],accu_length_1_debug[31:0],accu_length_2_debug[31:0],accu_length_3_debug[31:0],s_axis_0_aresetn,s_axis_0_aclk,s_axis_tvalid_0,s_axis_tready_0,s_axis_tdata_0[63:0],s_axis_tkeep_0[7:0],s_axis_tlast_0,s_axis_1_aresetn,s_axis_1_aclk,s_axis_tvalid_1,s_axis_tready_1,s_axis_tdata_1[63:0],s_axis_tkeep_1[7:0],s_axis_tlast_1,s_axis_2_aresetn,s_axis_2_aclk,s_axis_tvalid_2,s_axis_tready_2,s_axis_tdata_2[63:0],s_axis_tkeep_2[7:0],s_axis_tlast_2,s_axis_3_aresetn,s_axis_3_aclk,s_axis_tvalid_3,s_axis_tready_3,s_axis_tdata_3[63:0],s_axis_tkeep_3[7:0],s_axis_tlast_3,m_axis_aresetn,m_axis_aclk,m_axis_tvalid,m_axis_tready,m_axis_tdata[63:0],m_axis_tkeep[7:0],m_axis_tlast";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Accumulator_MultiDMA,Vivado 2020.2";
begin
end;
