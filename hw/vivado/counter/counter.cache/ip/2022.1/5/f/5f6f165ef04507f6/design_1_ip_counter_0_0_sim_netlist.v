// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Mon Aug 11 14:49:03 2025
// Host        : jakub-B365-HD3 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ip_counter_0_0_sim_netlist.v
// Design      : design_1_ip_counter_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_ip_counter_0_0,ip_counter_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "ip_counter_v1_0,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire s00_axi_wready;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ip_counter_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .axi_rvalid_reg(s00_axi_rvalid),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ip_counter_v1_0
   (s00_axi_wready,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    axi_rvalid_reg,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output s00_axi_wready;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output axi_rvalid_reg;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire axi_rvalid_reg;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_wready;
  wire s00_axi_wvalid;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ip_counter_v1_0_S00_AXI ip_counter_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .axi_rvalid_reg_0(axi_rvalid_reg),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ip_counter_v1_0_S00_AXI
   (s00_axi_wready,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    axi_rvalid_reg_0,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output s00_axi_wready;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output axi_rvalid_reg_0;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire axi_awready0__0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[31]_i_1_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_rvalid_reg_0;
  wire axi_wready0__0;
  wire clear;
  wire counter;
  wire \counter[0]_i_3_n_0 ;
  wire [31:0]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_1 ;
  wire \counter_reg[0]_i_2_n_2 ;
  wire \counter_reg[0]_i_2_n_3 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_0 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[24]_i_1_n_0 ;
  wire \counter_reg[24]_i_1_n_1 ;
  wire \counter_reg[24]_i_1_n_2 ;
  wire \counter_reg[24]_i_1_n_3 ;
  wire \counter_reg[24]_i_1_n_4 ;
  wire \counter_reg[24]_i_1_n_5 ;
  wire \counter_reg[24]_i_1_n_6 ;
  wire \counter_reg[24]_i_1_n_7 ;
  wire \counter_reg[28]_i_1_n_1 ;
  wire \counter_reg[28]_i_1_n_2 ;
  wire \counter_reg[28]_i_1_n_3 ;
  wire \counter_reg[28]_i_1_n_4 ;
  wire \counter_reg[28]_i_1_n_5 ;
  wire \counter_reg[28]_i_1_n_6 ;
  wire \counter_reg[28]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire [31:1]data0;
  wire [1:0]p_0_in;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire [31:0]slow_down_counter;
  wire slow_down_counter0_carry__0_n_0;
  wire slow_down_counter0_carry__0_n_1;
  wire slow_down_counter0_carry__0_n_2;
  wire slow_down_counter0_carry__0_n_3;
  wire slow_down_counter0_carry__1_n_0;
  wire slow_down_counter0_carry__1_n_1;
  wire slow_down_counter0_carry__1_n_2;
  wire slow_down_counter0_carry__1_n_3;
  wire slow_down_counter0_carry__2_n_0;
  wire slow_down_counter0_carry__2_n_1;
  wire slow_down_counter0_carry__2_n_2;
  wire slow_down_counter0_carry__2_n_3;
  wire slow_down_counter0_carry__3_n_0;
  wire slow_down_counter0_carry__3_n_1;
  wire slow_down_counter0_carry__3_n_2;
  wire slow_down_counter0_carry__3_n_3;
  wire slow_down_counter0_carry__4_n_0;
  wire slow_down_counter0_carry__4_n_1;
  wire slow_down_counter0_carry__4_n_2;
  wire slow_down_counter0_carry__4_n_3;
  wire slow_down_counter0_carry__5_n_0;
  wire slow_down_counter0_carry__5_n_1;
  wire slow_down_counter0_carry__5_n_2;
  wire slow_down_counter0_carry__5_n_3;
  wire slow_down_counter0_carry__6_n_2;
  wire slow_down_counter0_carry__6_n_3;
  wire slow_down_counter0_carry_n_0;
  wire slow_down_counter0_carry_n_1;
  wire slow_down_counter0_carry_n_2;
  wire slow_down_counter0_carry_n_3;
  wire \slow_down_counter[31]_i_2_n_0 ;
  wire \slow_down_counter[31]_i_3_n_0 ;
  wire \slow_down_counter[31]_i_4_n_0 ;
  wire \slow_down_counter[31]_i_5_n_0 ;
  wire \slow_down_counter[31]_i_6_n_0 ;
  wire \slow_down_counter[31]_i_7_n_0 ;
  wire \slow_down_counter[31]_i_8_n_0 ;
  wire \slow_down_counter[31]_i_9_n_0 ;
  wire [31:0]slow_down_counter_0;
  wire slv_reg_rden;
  wire [3:3]\NLW_counter_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:2]NLW_slow_down_counter0_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_slow_down_counter0_carry__6_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hF7FFF700F700F700)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(clear));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(p_0_in[0]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(p_0_in[1]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(clear));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready0
       (.I0(aw_en_reg_n_0),
        .I1(S_AXI_AWREADY),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .O(axi_awready0__0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(clear));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0__0),
        .Q(S_AXI_AWREADY),
        .R(clear));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(S_AXI_AWREADY),
        .I1(s00_axi_wready),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(clear));
  LUT6 #(
    .INIT(64'h0000E000FFFFFFFF)) 
    \axi_rdata[31]_i_1 
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(S_AXI_ARREADY),
        .I3(s00_axi_arvalid),
        .I4(axi_rvalid_reg_0),
        .I5(s00_axi_aresetn),
        .O(\axi_rdata[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \axi_rdata[31]_i_2 
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(axi_rvalid_reg_0),
        .O(slv_reg_rden));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[0]),
        .Q(s00_axi_rdata[0]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[10]),
        .Q(s00_axi_rdata[10]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[11]),
        .Q(s00_axi_rdata[11]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[12]),
        .Q(s00_axi_rdata[12]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[13]),
        .Q(s00_axi_rdata[13]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[14]),
        .Q(s00_axi_rdata[14]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[15]),
        .Q(s00_axi_rdata[15]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[16]),
        .Q(s00_axi_rdata[16]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[17]),
        .Q(s00_axi_rdata[17]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[18]),
        .Q(s00_axi_rdata[18]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[19]),
        .Q(s00_axi_rdata[19]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[1]),
        .Q(s00_axi_rdata[1]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[20]),
        .Q(s00_axi_rdata[20]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[21]),
        .Q(s00_axi_rdata[21]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[22]),
        .Q(s00_axi_rdata[22]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[23]),
        .Q(s00_axi_rdata[23]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[24]),
        .Q(s00_axi_rdata[24]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[25]),
        .Q(s00_axi_rdata[25]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[26]),
        .Q(s00_axi_rdata[26]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[27]),
        .Q(s00_axi_rdata[27]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[28]),
        .Q(s00_axi_rdata[28]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[29]),
        .Q(s00_axi_rdata[29]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[2]),
        .Q(s00_axi_rdata[2]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[30]),
        .Q(s00_axi_rdata[30]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[31]),
        .Q(s00_axi_rdata[31]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[3]),
        .Q(s00_axi_rdata[3]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[4]),
        .Q(s00_axi_rdata[4]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[5]),
        .Q(s00_axi_rdata[5]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[6]),
        .Q(s00_axi_rdata[6]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[7]),
        .Q(s00_axi_rdata[7]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[8]),
        .Q(s00_axi_rdata[8]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden),
        .D(counter_reg[9]),
        .Q(s00_axi_rdata[9]),
        .R(\axi_rdata[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7444)) 
    axi_rvalid_i_1
       (.I0(s00_axi_rready),
        .I1(axi_rvalid_reg_0),
        .I2(s00_axi_arvalid),
        .I3(S_AXI_ARREADY),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(axi_rvalid_reg_0),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    axi_wready0
       (.I0(aw_en_reg_n_0),
        .I1(s00_axi_wready),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .O(axi_wready0__0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0__0),
        .Q(s00_axi_wready),
        .R(clear));
  LUT4 #(
    .INIT(16'h0001)) 
    \counter[0]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .O(counter));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_3 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_3_n_0 ));
  FDRE \counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(counter_reg[0]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_2_n_0 ,\counter_reg[0]_i_2_n_1 ,\counter_reg[0]_i_2_n_2 ,\counter_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({counter_reg[3:1],\counter[0]_i_3_n_0 }));
  FDRE \counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(clear));
  FDRE \counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(clear));
  FDRE \counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(counter_reg[15:12]));
  FDRE \counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]),
        .R(clear));
  FDRE \counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(counter_reg[14]),
        .R(clear));
  FDRE \counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(counter_reg[15]),
        .R(clear));
  FDRE \counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(counter_reg[16]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S(counter_reg[19:16]));
  FDRE \counter_reg[17] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(counter_reg[17]),
        .R(clear));
  FDRE \counter_reg[18] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(clear));
  FDRE \counter_reg[19] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(clear));
  FDRE \counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(counter_reg[1]),
        .R(clear));
  FDRE \counter_reg[20] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_0 ,\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE \counter_reg[21] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(clear));
  FDRE \counter_reg[22] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(clear));
  FDRE \counter_reg[23] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(clear));
  FDRE \counter_reg[24] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[24]_i_1_n_7 ),
        .Q(counter_reg[24]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[24]_i_1 
       (.CI(\counter_reg[20]_i_1_n_0 ),
        .CO({\counter_reg[24]_i_1_n_0 ,\counter_reg[24]_i_1_n_1 ,\counter_reg[24]_i_1_n_2 ,\counter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[24]_i_1_n_4 ,\counter_reg[24]_i_1_n_5 ,\counter_reg[24]_i_1_n_6 ,\counter_reg[24]_i_1_n_7 }),
        .S(counter_reg[27:24]));
  FDRE \counter_reg[25] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[24]_i_1_n_6 ),
        .Q(counter_reg[25]),
        .R(clear));
  FDRE \counter_reg[26] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[24]_i_1_n_5 ),
        .Q(counter_reg[26]),
        .R(clear));
  FDRE \counter_reg[27] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[24]_i_1_n_4 ),
        .Q(counter_reg[27]),
        .R(clear));
  FDRE \counter_reg[28] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[28]_i_1_n_7 ),
        .Q(counter_reg[28]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[28]_i_1 
       (.CI(\counter_reg[24]_i_1_n_0 ),
        .CO({\NLW_counter_reg[28]_i_1_CO_UNCONNECTED [3],\counter_reg[28]_i_1_n_1 ,\counter_reg[28]_i_1_n_2 ,\counter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[28]_i_1_n_4 ,\counter_reg[28]_i_1_n_5 ,\counter_reg[28]_i_1_n_6 ,\counter_reg[28]_i_1_n_7 }),
        .S(counter_reg[31:28]));
  FDRE \counter_reg[29] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[28]_i_1_n_6 ),
        .Q(counter_reg[29]),
        .R(clear));
  FDRE \counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(counter_reg[2]),
        .R(clear));
  FDRE \counter_reg[30] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[28]_i_1_n_5 ),
        .Q(counter_reg[30]),
        .R(clear));
  FDRE \counter_reg[31] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[28]_i_1_n_4 ),
        .Q(counter_reg[31]),
        .R(clear));
  FDRE \counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(counter_reg[3]),
        .R(clear));
  FDRE \counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(counter_reg[4]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(counter_reg[7:4]));
  FDRE \counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(counter_reg[5]),
        .R(clear));
  FDRE \counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(counter_reg[6]),
        .R(clear));
  FDRE \counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]),
        .R(clear));
  FDRE \counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]),
        .R(clear));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDRE \counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(counter),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(clear));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 slow_down_counter0_carry
       (.CI(1'b0),
        .CO({slow_down_counter0_carry_n_0,slow_down_counter0_carry_n_1,slow_down_counter0_carry_n_2,slow_down_counter0_carry_n_3}),
        .CYINIT(slow_down_counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(slow_down_counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 slow_down_counter0_carry__0
       (.CI(slow_down_counter0_carry_n_0),
        .CO({slow_down_counter0_carry__0_n_0,slow_down_counter0_carry__0_n_1,slow_down_counter0_carry__0_n_2,slow_down_counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(slow_down_counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 slow_down_counter0_carry__1
       (.CI(slow_down_counter0_carry__0_n_0),
        .CO({slow_down_counter0_carry__1_n_0,slow_down_counter0_carry__1_n_1,slow_down_counter0_carry__1_n_2,slow_down_counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(slow_down_counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 slow_down_counter0_carry__2
       (.CI(slow_down_counter0_carry__1_n_0),
        .CO({slow_down_counter0_carry__2_n_0,slow_down_counter0_carry__2_n_1,slow_down_counter0_carry__2_n_2,slow_down_counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(slow_down_counter[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 slow_down_counter0_carry__3
       (.CI(slow_down_counter0_carry__2_n_0),
        .CO({slow_down_counter0_carry__3_n_0,slow_down_counter0_carry__3_n_1,slow_down_counter0_carry__3_n_2,slow_down_counter0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(slow_down_counter[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 slow_down_counter0_carry__4
       (.CI(slow_down_counter0_carry__3_n_0),
        .CO({slow_down_counter0_carry__4_n_0,slow_down_counter0_carry__4_n_1,slow_down_counter0_carry__4_n_2,slow_down_counter0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(slow_down_counter[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 slow_down_counter0_carry__5
       (.CI(slow_down_counter0_carry__4_n_0),
        .CO({slow_down_counter0_carry__5_n_0,slow_down_counter0_carry__5_n_1,slow_down_counter0_carry__5_n_2,slow_down_counter0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S(slow_down_counter[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 slow_down_counter0_carry__6
       (.CI(slow_down_counter0_carry__5_n_0),
        .CO({NLW_slow_down_counter0_carry__6_CO_UNCONNECTED[3:2],slow_down_counter0_carry__6_n_2,slow_down_counter0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_slow_down_counter0_carry__6_O_UNCONNECTED[3],data0[31:29]}),
        .S({1'b0,slow_down_counter[31:29]}));
  LUT1 #(
    .INIT(2'h1)) 
    \slow_down_counter[0]_i_1 
       (.I0(slow_down_counter[0]),
        .O(slow_down_counter_0[0]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[10]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[10]),
        .O(slow_down_counter_0[10]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[11]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[11]),
        .O(slow_down_counter_0[11]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[12]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[12]),
        .O(slow_down_counter_0[12]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[13]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[13]),
        .O(slow_down_counter_0[13]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[14]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[14]),
        .O(slow_down_counter_0[14]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[15]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[15]),
        .O(slow_down_counter_0[15]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[16]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[16]),
        .O(slow_down_counter_0[16]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[17]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[17]),
        .O(slow_down_counter_0[17]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[18]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[18]),
        .O(slow_down_counter_0[18]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[19]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[19]),
        .O(slow_down_counter_0[19]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[1]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[1]),
        .O(slow_down_counter_0[1]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[20]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[20]),
        .O(slow_down_counter_0[20]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[21]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[21]),
        .O(slow_down_counter_0[21]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[22]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[22]),
        .O(slow_down_counter_0[22]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[23]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[23]),
        .O(slow_down_counter_0[23]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[24]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[24]),
        .O(slow_down_counter_0[24]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[25]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[25]),
        .O(slow_down_counter_0[25]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[26]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[26]),
        .O(slow_down_counter_0[26]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[27]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[27]),
        .O(slow_down_counter_0[27]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[28]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[28]),
        .O(slow_down_counter_0[28]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[29]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[29]),
        .O(slow_down_counter_0[29]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[2]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[2]),
        .O(slow_down_counter_0[2]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[30]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[30]),
        .O(slow_down_counter_0[30]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[31]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[31]),
        .O(slow_down_counter_0[31]));
  LUT5 #(
    .INIT(32'hFFFFF7FF)) 
    \slow_down_counter[31]_i_2 
       (.I0(slow_down_counter[18]),
        .I1(slow_down_counter[19]),
        .I2(slow_down_counter[17]),
        .I3(slow_down_counter[16]),
        .I4(\slow_down_counter[31]_i_6_n_0 ),
        .O(\slow_down_counter[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    \slow_down_counter[31]_i_3 
       (.I0(slow_down_counter[26]),
        .I1(slow_down_counter[27]),
        .I2(slow_down_counter[25]),
        .I3(slow_down_counter[24]),
        .I4(\slow_down_counter[31]_i_7_n_0 ),
        .O(\slow_down_counter[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \slow_down_counter[31]_i_4 
       (.I0(slow_down_counter[2]),
        .I1(slow_down_counter[3]),
        .I2(slow_down_counter[0]),
        .I3(slow_down_counter[1]),
        .I4(\slow_down_counter[31]_i_8_n_0 ),
        .O(\slow_down_counter[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFB)) 
    \slow_down_counter[31]_i_5 
       (.I0(slow_down_counter[10]),
        .I1(slow_down_counter[11]),
        .I2(slow_down_counter[8]),
        .I3(slow_down_counter[9]),
        .I4(\slow_down_counter[31]_i_9_n_0 ),
        .O(\slow_down_counter[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \slow_down_counter[31]_i_6 
       (.I0(slow_down_counter[21]),
        .I1(slow_down_counter[20]),
        .I2(slow_down_counter[22]),
        .I3(slow_down_counter[23]),
        .O(\slow_down_counter[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \slow_down_counter[31]_i_7 
       (.I0(slow_down_counter[29]),
        .I1(slow_down_counter[28]),
        .I2(slow_down_counter[31]),
        .I3(slow_down_counter[30]),
        .O(\slow_down_counter[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \slow_down_counter[31]_i_8 
       (.I0(slow_down_counter[5]),
        .I1(slow_down_counter[4]),
        .I2(slow_down_counter[7]),
        .I3(slow_down_counter[6]),
        .O(\slow_down_counter[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \slow_down_counter[31]_i_9 
       (.I0(slow_down_counter[13]),
        .I1(slow_down_counter[12]),
        .I2(slow_down_counter[14]),
        .I3(slow_down_counter[15]),
        .O(\slow_down_counter[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[3]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[3]),
        .O(slow_down_counter_0[3]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[4]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[4]),
        .O(slow_down_counter_0[4]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[5]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[5]),
        .O(slow_down_counter_0[5]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[6]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[6]),
        .O(slow_down_counter_0[6]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[7]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[7]),
        .O(slow_down_counter_0[7]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[8]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[8]),
        .O(slow_down_counter_0[8]));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \slow_down_counter[9]_i_1 
       (.I0(\slow_down_counter[31]_i_2_n_0 ),
        .I1(\slow_down_counter[31]_i_3_n_0 ),
        .I2(\slow_down_counter[31]_i_4_n_0 ),
        .I3(\slow_down_counter[31]_i_5_n_0 ),
        .I4(data0[9]),
        .O(slow_down_counter_0[9]));
  FDRE \slow_down_counter_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[0]),
        .Q(slow_down_counter[0]),
        .R(clear));
  FDRE \slow_down_counter_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[10]),
        .Q(slow_down_counter[10]),
        .R(clear));
  FDRE \slow_down_counter_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[11]),
        .Q(slow_down_counter[11]),
        .R(clear));
  FDRE \slow_down_counter_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[12]),
        .Q(slow_down_counter[12]),
        .R(clear));
  FDRE \slow_down_counter_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[13]),
        .Q(slow_down_counter[13]),
        .R(clear));
  FDRE \slow_down_counter_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[14]),
        .Q(slow_down_counter[14]),
        .R(clear));
  FDRE \slow_down_counter_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[15]),
        .Q(slow_down_counter[15]),
        .R(clear));
  FDRE \slow_down_counter_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[16]),
        .Q(slow_down_counter[16]),
        .R(clear));
  FDRE \slow_down_counter_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[17]),
        .Q(slow_down_counter[17]),
        .R(clear));
  FDRE \slow_down_counter_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[18]),
        .Q(slow_down_counter[18]),
        .R(clear));
  FDRE \slow_down_counter_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[19]),
        .Q(slow_down_counter[19]),
        .R(clear));
  FDRE \slow_down_counter_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[1]),
        .Q(slow_down_counter[1]),
        .R(clear));
  FDRE \slow_down_counter_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[20]),
        .Q(slow_down_counter[20]),
        .R(clear));
  FDRE \slow_down_counter_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[21]),
        .Q(slow_down_counter[21]),
        .R(clear));
  FDRE \slow_down_counter_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[22]),
        .Q(slow_down_counter[22]),
        .R(clear));
  FDRE \slow_down_counter_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[23]),
        .Q(slow_down_counter[23]),
        .R(clear));
  FDRE \slow_down_counter_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[24]),
        .Q(slow_down_counter[24]),
        .R(clear));
  FDRE \slow_down_counter_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[25]),
        .Q(slow_down_counter[25]),
        .R(clear));
  FDRE \slow_down_counter_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[26]),
        .Q(slow_down_counter[26]),
        .R(clear));
  FDRE \slow_down_counter_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[27]),
        .Q(slow_down_counter[27]),
        .R(clear));
  FDRE \slow_down_counter_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[28]),
        .Q(slow_down_counter[28]),
        .R(clear));
  FDRE \slow_down_counter_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[29]),
        .Q(slow_down_counter[29]),
        .R(clear));
  FDRE \slow_down_counter_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[2]),
        .Q(slow_down_counter[2]),
        .R(clear));
  FDRE \slow_down_counter_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[30]),
        .Q(slow_down_counter[30]),
        .R(clear));
  FDRE \slow_down_counter_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[31]),
        .Q(slow_down_counter[31]),
        .R(clear));
  FDRE \slow_down_counter_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[3]),
        .Q(slow_down_counter[3]),
        .R(clear));
  FDRE \slow_down_counter_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[4]),
        .Q(slow_down_counter[4]),
        .R(clear));
  FDRE \slow_down_counter_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[5]),
        .Q(slow_down_counter[5]),
        .R(clear));
  FDRE \slow_down_counter_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[6]),
        .Q(slow_down_counter[6]),
        .R(clear));
  FDRE \slow_down_counter_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[7]),
        .Q(slow_down_counter[7]),
        .R(clear));
  FDRE \slow_down_counter_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[8]),
        .Q(slow_down_counter[8]),
        .R(clear));
  FDRE \slow_down_counter_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(slow_down_counter_0[9]),
        .Q(slow_down_counter[9]),
        .R(clear));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
