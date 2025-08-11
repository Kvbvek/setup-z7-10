-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Mon Aug 11 14:49:04 2025
-- Host        : jakub-B365-HD3 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/jakub/proj-zybo/setup-z7-10/hw/vivado/counter/counter.gen/sources_1/bd/design_1/ip/design_1_ip_counter_0_0/design_1_ip_counter_0_0_sim_netlist.vhdl
-- Design      : design_1_ip_counter_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ip_counter_0_0_ip_counter_v1_0_S00_AXI is
  port (
    s00_axi_wready : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_rvalid_reg_0 : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_ip_counter_0_0_ip_counter_v1_0_S00_AXI : entity is "ip_counter_v1_0_S00_AXI";
end design_1_ip_counter_0_0_ip_counter_v1_0_S00_AXI;

architecture STRUCTURE of design_1_ip_counter_0_0_ip_counter_v1_0_S00_AXI is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal \axi_awready0__0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^axi_rvalid_reg_0\ : STD_LOGIC;
  signal \axi_wready0__0\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal counter : STD_LOGIC;
  signal \counter[0]_i_3_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \counter_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal slow_down_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slow_down_counter0_carry__0_n_0\ : STD_LOGIC;
  signal \slow_down_counter0_carry__0_n_1\ : STD_LOGIC;
  signal \slow_down_counter0_carry__0_n_2\ : STD_LOGIC;
  signal \slow_down_counter0_carry__0_n_3\ : STD_LOGIC;
  signal \slow_down_counter0_carry__1_n_0\ : STD_LOGIC;
  signal \slow_down_counter0_carry__1_n_1\ : STD_LOGIC;
  signal \slow_down_counter0_carry__1_n_2\ : STD_LOGIC;
  signal \slow_down_counter0_carry__1_n_3\ : STD_LOGIC;
  signal \slow_down_counter0_carry__2_n_0\ : STD_LOGIC;
  signal \slow_down_counter0_carry__2_n_1\ : STD_LOGIC;
  signal \slow_down_counter0_carry__2_n_2\ : STD_LOGIC;
  signal \slow_down_counter0_carry__2_n_3\ : STD_LOGIC;
  signal \slow_down_counter0_carry__3_n_0\ : STD_LOGIC;
  signal \slow_down_counter0_carry__3_n_1\ : STD_LOGIC;
  signal \slow_down_counter0_carry__3_n_2\ : STD_LOGIC;
  signal \slow_down_counter0_carry__3_n_3\ : STD_LOGIC;
  signal \slow_down_counter0_carry__4_n_0\ : STD_LOGIC;
  signal \slow_down_counter0_carry__4_n_1\ : STD_LOGIC;
  signal \slow_down_counter0_carry__4_n_2\ : STD_LOGIC;
  signal \slow_down_counter0_carry__4_n_3\ : STD_LOGIC;
  signal \slow_down_counter0_carry__5_n_0\ : STD_LOGIC;
  signal \slow_down_counter0_carry__5_n_1\ : STD_LOGIC;
  signal \slow_down_counter0_carry__5_n_2\ : STD_LOGIC;
  signal \slow_down_counter0_carry__5_n_3\ : STD_LOGIC;
  signal \slow_down_counter0_carry__6_n_2\ : STD_LOGIC;
  signal \slow_down_counter0_carry__6_n_3\ : STD_LOGIC;
  signal slow_down_counter0_carry_n_0 : STD_LOGIC;
  signal slow_down_counter0_carry_n_1 : STD_LOGIC;
  signal slow_down_counter0_carry_n_2 : STD_LOGIC;
  signal slow_down_counter0_carry_n_3 : STD_LOGIC;
  signal \slow_down_counter[31]_i_2_n_0\ : STD_LOGIC;
  signal \slow_down_counter[31]_i_3_n_0\ : STD_LOGIC;
  signal \slow_down_counter[31]_i_4_n_0\ : STD_LOGIC;
  signal \slow_down_counter[31]_i_5_n_0\ : STD_LOGIC;
  signal \slow_down_counter[31]_i_6_n_0\ : STD_LOGIC;
  signal \slow_down_counter[31]_i_7_n_0\ : STD_LOGIC;
  signal \slow_down_counter[31]_i_8_n_0\ : STD_LOGIC;
  signal \slow_down_counter[31]_i_9_n_0\ : STD_LOGIC;
  signal slow_down_counter_0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg_rden : STD_LOGIC;
  signal \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_slow_down_counter0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_slow_down_counter0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \axi_araddr[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_awready0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of axi_wready0 : label is "soft_lutpair1";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of slow_down_counter0_carry : label is 35;
  attribute ADDER_THRESHOLD of \slow_down_counter0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \slow_down_counter0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \slow_down_counter0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \slow_down_counter0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \slow_down_counter0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \slow_down_counter0_carry__5\ : label is 35;
  attribute ADDER_THRESHOLD of \slow_down_counter0_carry__6\ : label is 35;
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  axi_rvalid_reg_0 <= \^axi_rvalid_reg_0\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFF700F700F700"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => aw_en_reg_n_0,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => clear
    );
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => p_0_in(0),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => p_0_in(1),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => p_0_in(0),
      R => clear
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => p_0_in(1),
      R => clear
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => clear
    );
axi_awready0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => aw_en_reg_n_0,
      I1 => \^s_axi_awready\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      O => \axi_awready0__0\
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => clear
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awready0__0\,
      Q => \^s_axi_awready\,
      R => clear
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => \^s00_axi_wready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => clear
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000E000FFFFFFFF"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => \^s_axi_arready\,
      I3 => s00_axi_arvalid,
      I4 => \^axi_rvalid_reg_0\,
      I5 => s00_axi_aresetn,
      O => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^axi_rvalid_reg_0\,
      O => slv_reg_rden
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(0),
      Q => s00_axi_rdata(0),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(10),
      Q => s00_axi_rdata(10),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(11),
      Q => s00_axi_rdata(11),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(12),
      Q => s00_axi_rdata(12),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(13),
      Q => s00_axi_rdata(13),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(14),
      Q => s00_axi_rdata(14),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(15),
      Q => s00_axi_rdata(15),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(16),
      Q => s00_axi_rdata(16),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(17),
      Q => s00_axi_rdata(17),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(18),
      Q => s00_axi_rdata(18),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(19),
      Q => s00_axi_rdata(19),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(1),
      Q => s00_axi_rdata(1),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(20),
      Q => s00_axi_rdata(20),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(21),
      Q => s00_axi_rdata(21),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(22),
      Q => s00_axi_rdata(22),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(23),
      Q => s00_axi_rdata(23),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(24),
      Q => s00_axi_rdata(24),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(25),
      Q => s00_axi_rdata(25),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(26),
      Q => s00_axi_rdata(26),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(27),
      Q => s00_axi_rdata(27),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(28),
      Q => s00_axi_rdata(28),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(29),
      Q => s00_axi_rdata(29),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(2),
      Q => s00_axi_rdata(2),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(30),
      Q => s00_axi_rdata(30),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(31),
      Q => s00_axi_rdata(31),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(3),
      Q => s00_axi_rdata(3),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(4),
      Q => s00_axi_rdata(4),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(5),
      Q => s00_axi_rdata(5),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(6),
      Q => s00_axi_rdata(6),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(7),
      Q => s00_axi_rdata(7),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(8),
      Q => s00_axi_rdata(8),
      R => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg_rden,
      D => counter_reg(9),
      Q => s00_axi_rdata(9),
      R => \axi_rdata[31]_i_1_n_0\
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7444"
    )
        port map (
      I0 => s00_axi_rready,
      I1 => \^axi_rvalid_reg_0\,
      I2 => s00_axi_arvalid,
      I3 => \^s_axi_arready\,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^axi_rvalid_reg_0\,
      R => clear
    );
axi_wready0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => aw_en_reg_n_0,
      I1 => \^s00_axi_wready\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      O => \axi_wready0__0\
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_wready0__0\,
      Q => \^s00_axi_wready\,
      R => clear
    );
\counter[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      O => counter
    );
\counter[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter_reg(0),
      O => \counter[0]_i_3_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[0]_i_2_n_7\,
      Q => counter_reg(0),
      R => clear
    );
\counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_2_n_0\,
      CO(2) => \counter_reg[0]_i_2_n_1\,
      CO(1) => \counter_reg[0]_i_2_n_2\,
      CO(0) => \counter_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_2_n_4\,
      O(2) => \counter_reg[0]_i_2_n_5\,
      O(1) => \counter_reg[0]_i_2_n_6\,
      O(0) => \counter_reg[0]_i_2_n_7\,
      S(3 downto 1) => counter_reg(3 downto 1),
      S(0) => \counter[0]_i_3_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10),
      R => clear
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11),
      R => clear
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12),
      R => clear
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3) => \counter_reg[12]_i_1_n_0\,
      CO(2) => \counter_reg[12]_i_1_n_1\,
      CO(1) => \counter_reg[12]_i_1_n_2\,
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[12]_i_1_n_4\,
      O(2) => \counter_reg[12]_i_1_n_5\,
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => counter_reg(15 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13),
      R => clear
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[12]_i_1_n_5\,
      Q => counter_reg(14),
      R => clear
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[12]_i_1_n_4\,
      Q => counter_reg(15),
      R => clear
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[16]_i_1_n_7\,
      Q => counter_reg(16),
      R => clear
    );
\counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[12]_i_1_n_0\,
      CO(3) => \counter_reg[16]_i_1_n_0\,
      CO(2) => \counter_reg[16]_i_1_n_1\,
      CO(1) => \counter_reg[16]_i_1_n_2\,
      CO(0) => \counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[16]_i_1_n_4\,
      O(2) => \counter_reg[16]_i_1_n_5\,
      O(1) => \counter_reg[16]_i_1_n_6\,
      O(0) => \counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => counter_reg(19 downto 16)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[16]_i_1_n_6\,
      Q => counter_reg(17),
      R => clear
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[16]_i_1_n_5\,
      Q => counter_reg(18),
      R => clear
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[16]_i_1_n_4\,
      Q => counter_reg(19),
      R => clear
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[0]_i_2_n_6\,
      Q => counter_reg(1),
      R => clear
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[20]_i_1_n_7\,
      Q => counter_reg(20),
      R => clear
    );
\counter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[16]_i_1_n_0\,
      CO(3) => \counter_reg[20]_i_1_n_0\,
      CO(2) => \counter_reg[20]_i_1_n_1\,
      CO(1) => \counter_reg[20]_i_1_n_2\,
      CO(0) => \counter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[20]_i_1_n_4\,
      O(2) => \counter_reg[20]_i_1_n_5\,
      O(1) => \counter_reg[20]_i_1_n_6\,
      O(0) => \counter_reg[20]_i_1_n_7\,
      S(3 downto 0) => counter_reg(23 downto 20)
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[20]_i_1_n_6\,
      Q => counter_reg(21),
      R => clear
    );
\counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[20]_i_1_n_5\,
      Q => counter_reg(22),
      R => clear
    );
\counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[20]_i_1_n_4\,
      Q => counter_reg(23),
      R => clear
    );
\counter_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[24]_i_1_n_7\,
      Q => counter_reg(24),
      R => clear
    );
\counter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[20]_i_1_n_0\,
      CO(3) => \counter_reg[24]_i_1_n_0\,
      CO(2) => \counter_reg[24]_i_1_n_1\,
      CO(1) => \counter_reg[24]_i_1_n_2\,
      CO(0) => \counter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[24]_i_1_n_4\,
      O(2) => \counter_reg[24]_i_1_n_5\,
      O(1) => \counter_reg[24]_i_1_n_6\,
      O(0) => \counter_reg[24]_i_1_n_7\,
      S(3 downto 0) => counter_reg(27 downto 24)
    );
\counter_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[24]_i_1_n_6\,
      Q => counter_reg(25),
      R => clear
    );
\counter_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[24]_i_1_n_5\,
      Q => counter_reg(26),
      R => clear
    );
\counter_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[24]_i_1_n_4\,
      Q => counter_reg(27),
      R => clear
    );
\counter_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[28]_i_1_n_7\,
      Q => counter_reg(28),
      R => clear
    );
\counter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_counter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[28]_i_1_n_1\,
      CO(1) => \counter_reg[28]_i_1_n_2\,
      CO(0) => \counter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[28]_i_1_n_4\,
      O(2) => \counter_reg[28]_i_1_n_5\,
      O(1) => \counter_reg[28]_i_1_n_6\,
      O(0) => \counter_reg[28]_i_1_n_7\,
      S(3 downto 0) => counter_reg(31 downto 28)
    );
\counter_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[28]_i_1_n_6\,
      Q => counter_reg(29),
      R => clear
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[0]_i_2_n_5\,
      Q => counter_reg(2),
      R => clear
    );
\counter_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[28]_i_1_n_5\,
      Q => counter_reg(30),
      R => clear
    );
\counter_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[28]_i_1_n_4\,
      Q => counter_reg(31),
      R => clear
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[0]_i_2_n_4\,
      Q => counter_reg(3),
      R => clear
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[4]_i_1_n_7\,
      Q => counter_reg(4),
      R => clear
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_2_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3 downto 0) => counter_reg(7 downto 4)
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[4]_i_1_n_6\,
      Q => counter_reg(5),
      R => clear
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[4]_i_1_n_5\,
      Q => counter_reg(6),
      R => clear
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7),
      R => clear
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8),
      R => clear
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => counter,
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9),
      R => clear
    );
slow_down_counter0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => slow_down_counter0_carry_n_0,
      CO(2) => slow_down_counter0_carry_n_1,
      CO(1) => slow_down_counter0_carry_n_2,
      CO(0) => slow_down_counter0_carry_n_3,
      CYINIT => slow_down_counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => slow_down_counter(4 downto 1)
    );
\slow_down_counter0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => slow_down_counter0_carry_n_0,
      CO(3) => \slow_down_counter0_carry__0_n_0\,
      CO(2) => \slow_down_counter0_carry__0_n_1\,
      CO(1) => \slow_down_counter0_carry__0_n_2\,
      CO(0) => \slow_down_counter0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => slow_down_counter(8 downto 5)
    );
\slow_down_counter0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \slow_down_counter0_carry__0_n_0\,
      CO(3) => \slow_down_counter0_carry__1_n_0\,
      CO(2) => \slow_down_counter0_carry__1_n_1\,
      CO(1) => \slow_down_counter0_carry__1_n_2\,
      CO(0) => \slow_down_counter0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => slow_down_counter(12 downto 9)
    );
\slow_down_counter0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \slow_down_counter0_carry__1_n_0\,
      CO(3) => \slow_down_counter0_carry__2_n_0\,
      CO(2) => \slow_down_counter0_carry__2_n_1\,
      CO(1) => \slow_down_counter0_carry__2_n_2\,
      CO(0) => \slow_down_counter0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => slow_down_counter(16 downto 13)
    );
\slow_down_counter0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \slow_down_counter0_carry__2_n_0\,
      CO(3) => \slow_down_counter0_carry__3_n_0\,
      CO(2) => \slow_down_counter0_carry__3_n_1\,
      CO(1) => \slow_down_counter0_carry__3_n_2\,
      CO(0) => \slow_down_counter0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => slow_down_counter(20 downto 17)
    );
\slow_down_counter0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \slow_down_counter0_carry__3_n_0\,
      CO(3) => \slow_down_counter0_carry__4_n_0\,
      CO(2) => \slow_down_counter0_carry__4_n_1\,
      CO(1) => \slow_down_counter0_carry__4_n_2\,
      CO(0) => \slow_down_counter0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => slow_down_counter(24 downto 21)
    );
\slow_down_counter0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \slow_down_counter0_carry__4_n_0\,
      CO(3) => \slow_down_counter0_carry__5_n_0\,
      CO(2) => \slow_down_counter0_carry__5_n_1\,
      CO(1) => \slow_down_counter0_carry__5_n_2\,
      CO(0) => \slow_down_counter0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3 downto 0) => slow_down_counter(28 downto 25)
    );
\slow_down_counter0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \slow_down_counter0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_slow_down_counter0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \slow_down_counter0_carry__6_n_2\,
      CO(0) => \slow_down_counter0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_slow_down_counter0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => slow_down_counter(31 downto 29)
    );
\slow_down_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => slow_down_counter(0),
      O => slow_down_counter_0(0)
    );
\slow_down_counter[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(10),
      O => slow_down_counter_0(10)
    );
\slow_down_counter[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(11),
      O => slow_down_counter_0(11)
    );
\slow_down_counter[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(12),
      O => slow_down_counter_0(12)
    );
\slow_down_counter[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(13),
      O => slow_down_counter_0(13)
    );
\slow_down_counter[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(14),
      O => slow_down_counter_0(14)
    );
\slow_down_counter[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(15),
      O => slow_down_counter_0(15)
    );
\slow_down_counter[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(16),
      O => slow_down_counter_0(16)
    );
\slow_down_counter[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(17),
      O => slow_down_counter_0(17)
    );
\slow_down_counter[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(18),
      O => slow_down_counter_0(18)
    );
\slow_down_counter[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(19),
      O => slow_down_counter_0(19)
    );
\slow_down_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(1),
      O => slow_down_counter_0(1)
    );
\slow_down_counter[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(20),
      O => slow_down_counter_0(20)
    );
\slow_down_counter[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(21),
      O => slow_down_counter_0(21)
    );
\slow_down_counter[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(22),
      O => slow_down_counter_0(22)
    );
\slow_down_counter[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(23),
      O => slow_down_counter_0(23)
    );
\slow_down_counter[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(24),
      O => slow_down_counter_0(24)
    );
\slow_down_counter[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(25),
      O => slow_down_counter_0(25)
    );
\slow_down_counter[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(26),
      O => slow_down_counter_0(26)
    );
\slow_down_counter[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(27),
      O => slow_down_counter_0(27)
    );
\slow_down_counter[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(28),
      O => slow_down_counter_0(28)
    );
\slow_down_counter[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(29),
      O => slow_down_counter_0(29)
    );
\slow_down_counter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(2),
      O => slow_down_counter_0(2)
    );
\slow_down_counter[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(30),
      O => slow_down_counter_0(30)
    );
\slow_down_counter[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(31),
      O => slow_down_counter_0(31)
    );
\slow_down_counter[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF7FF"
    )
        port map (
      I0 => slow_down_counter(18),
      I1 => slow_down_counter(19),
      I2 => slow_down_counter(17),
      I3 => slow_down_counter(16),
      I4 => \slow_down_counter[31]_i_6_n_0\,
      O => \slow_down_counter[31]_i_2_n_0\
    );
\slow_down_counter[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => slow_down_counter(26),
      I1 => slow_down_counter(27),
      I2 => slow_down_counter(25),
      I3 => slow_down_counter(24),
      I4 => \slow_down_counter[31]_i_7_n_0\,
      O => \slow_down_counter[31]_i_3_n_0\
    );
\slow_down_counter[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => slow_down_counter(2),
      I1 => slow_down_counter(3),
      I2 => slow_down_counter(0),
      I3 => slow_down_counter(1),
      I4 => \slow_down_counter[31]_i_8_n_0\,
      O => \slow_down_counter[31]_i_4_n_0\
    );
\slow_down_counter[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => slow_down_counter(10),
      I1 => slow_down_counter(11),
      I2 => slow_down_counter(8),
      I3 => slow_down_counter(9),
      I4 => \slow_down_counter[31]_i_9_n_0\,
      O => \slow_down_counter[31]_i_5_n_0\
    );
\slow_down_counter[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => slow_down_counter(21),
      I1 => slow_down_counter(20),
      I2 => slow_down_counter(22),
      I3 => slow_down_counter(23),
      O => \slow_down_counter[31]_i_6_n_0\
    );
\slow_down_counter[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => slow_down_counter(29),
      I1 => slow_down_counter(28),
      I2 => slow_down_counter(31),
      I3 => slow_down_counter(30),
      O => \slow_down_counter[31]_i_7_n_0\
    );
\slow_down_counter[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => slow_down_counter(5),
      I1 => slow_down_counter(4),
      I2 => slow_down_counter(7),
      I3 => slow_down_counter(6),
      O => \slow_down_counter[31]_i_8_n_0\
    );
\slow_down_counter[31]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => slow_down_counter(13),
      I1 => slow_down_counter(12),
      I2 => slow_down_counter(14),
      I3 => slow_down_counter(15),
      O => \slow_down_counter[31]_i_9_n_0\
    );
\slow_down_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(3),
      O => slow_down_counter_0(3)
    );
\slow_down_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(4),
      O => slow_down_counter_0(4)
    );
\slow_down_counter[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(5),
      O => slow_down_counter_0(5)
    );
\slow_down_counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(6),
      O => slow_down_counter_0(6)
    );
\slow_down_counter[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(7),
      O => slow_down_counter_0(7)
    );
\slow_down_counter[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(8),
      O => slow_down_counter_0(8)
    );
\slow_down_counter[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => \slow_down_counter[31]_i_2_n_0\,
      I1 => \slow_down_counter[31]_i_3_n_0\,
      I2 => \slow_down_counter[31]_i_4_n_0\,
      I3 => \slow_down_counter[31]_i_5_n_0\,
      I4 => data0(9),
      O => slow_down_counter_0(9)
    );
\slow_down_counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(0),
      Q => slow_down_counter(0),
      R => clear
    );
\slow_down_counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(10),
      Q => slow_down_counter(10),
      R => clear
    );
\slow_down_counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(11),
      Q => slow_down_counter(11),
      R => clear
    );
\slow_down_counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(12),
      Q => slow_down_counter(12),
      R => clear
    );
\slow_down_counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(13),
      Q => slow_down_counter(13),
      R => clear
    );
\slow_down_counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(14),
      Q => slow_down_counter(14),
      R => clear
    );
\slow_down_counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(15),
      Q => slow_down_counter(15),
      R => clear
    );
\slow_down_counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(16),
      Q => slow_down_counter(16),
      R => clear
    );
\slow_down_counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(17),
      Q => slow_down_counter(17),
      R => clear
    );
\slow_down_counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(18),
      Q => slow_down_counter(18),
      R => clear
    );
\slow_down_counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(19),
      Q => slow_down_counter(19),
      R => clear
    );
\slow_down_counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(1),
      Q => slow_down_counter(1),
      R => clear
    );
\slow_down_counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(20),
      Q => slow_down_counter(20),
      R => clear
    );
\slow_down_counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(21),
      Q => slow_down_counter(21),
      R => clear
    );
\slow_down_counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(22),
      Q => slow_down_counter(22),
      R => clear
    );
\slow_down_counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(23),
      Q => slow_down_counter(23),
      R => clear
    );
\slow_down_counter_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(24),
      Q => slow_down_counter(24),
      R => clear
    );
\slow_down_counter_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(25),
      Q => slow_down_counter(25),
      R => clear
    );
\slow_down_counter_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(26),
      Q => slow_down_counter(26),
      R => clear
    );
\slow_down_counter_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(27),
      Q => slow_down_counter(27),
      R => clear
    );
\slow_down_counter_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(28),
      Q => slow_down_counter(28),
      R => clear
    );
\slow_down_counter_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(29),
      Q => slow_down_counter(29),
      R => clear
    );
\slow_down_counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(2),
      Q => slow_down_counter(2),
      R => clear
    );
\slow_down_counter_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(30),
      Q => slow_down_counter(30),
      R => clear
    );
\slow_down_counter_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(31),
      Q => slow_down_counter(31),
      R => clear
    );
\slow_down_counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(3),
      Q => slow_down_counter(3),
      R => clear
    );
\slow_down_counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(4),
      Q => slow_down_counter(4),
      R => clear
    );
\slow_down_counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(5),
      Q => slow_down_counter(5),
      R => clear
    );
\slow_down_counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(6),
      Q => slow_down_counter(6),
      R => clear
    );
\slow_down_counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(7),
      Q => slow_down_counter(7),
      R => clear
    );
\slow_down_counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(8),
      Q => slow_down_counter(8),
      R => clear
    );
\slow_down_counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slow_down_counter_0(9),
      Q => slow_down_counter(9),
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ip_counter_0_0_ip_counter_v1_0 is
  port (
    s00_axi_wready : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_rvalid_reg : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_ip_counter_0_0_ip_counter_v1_0 : entity is "ip_counter_v1_0";
end design_1_ip_counter_0_0_ip_counter_v1_0;

architecture STRUCTURE of design_1_ip_counter_0_0_ip_counter_v1_0 is
begin
ip_counter_v1_0_S00_AXI_inst: entity work.design_1_ip_counter_0_0_ip_counter_v1_0_S00_AXI
     port map (
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      axi_rvalid_reg_0 => axi_rvalid_reg,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ip_counter_0_0 is
  port (
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_ip_counter_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_ip_counter_0_0 : entity is "design_1_ip_counter_0_0,ip_counter_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_ip_counter_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_ip_counter_0_0 : entity is "ip_counter_v1_0,Vivado 2022.1";
end design_1_ip_counter_0_0;

architecture STRUCTURE of design_1_ip_counter_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.design_1_ip_counter_0_0_ip_counter_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      axi_rvalid_reg => s00_axi_rvalid,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
