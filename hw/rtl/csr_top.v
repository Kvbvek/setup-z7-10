`timescale 1ns/1ps

module csr_top (
    input  wire        clk,
    input  wire        rst_n,

    // ----------------------
    // AXI-Lite Slave ports
    // ----------------------
    input  wire        s_axil_awvalid,
    output wire        s_axil_awready,
    input  wire [2:0]  s_axil_awaddr,
    input  wire [2:0]  s_axil_awprot,

    input  wire        s_axil_wvalid,
    output wire        s_axil_wready,
    input  wire [31:0] s_axil_wdata,
    input  wire [3:0]  s_axil_wstrb,

    input  wire        s_axil_bready,
    output wire        s_axil_bvalid,
    output wire [1:0]  s_axil_bresp,

    input  wire        s_axil_arvalid,
    output wire        s_axil_arready,
    input  wire [2:0]  s_axil_araddr,
    input  wire [2:0]  s_axil_arprot,

    input  wire        s_axil_rready,
    output wire        s_axil_rvalid,
    output wire [31:0] s_axil_rdata,
    output wire [1:0]  s_axil_rresp,
    
    output wire        DG_ENABLE_value,
    output wire [31:0] DG_LENGTH_value
);

    csr_wrapper u_csr_wrapper (
        .clk        (clk),
        .rst_n        (rst_n),

        .s_axil_awvalid (s_axil_awvalid),
        .s_axil_awready (s_axil_awready),
        .s_axil_awaddr  (s_axil_awaddr),
        .s_axil_awprot  (s_axil_awprot),

        .s_axil_wvalid  (s_axil_wvalid),
        .s_axil_wready  (s_axil_wready),
        .s_axil_wdata   (s_axil_wdata),
        .s_axil_wstrb   (s_axil_wstrb),

        .s_axil_bready  (s_axil_bready),
        .s_axil_bvalid  (s_axil_bvalid),
        .s_axil_bresp   (s_axil_bresp),

        .s_axil_arvalid (s_axil_arvalid),
        .s_axil_arready (s_axil_arready),
        .s_axil_araddr  (s_axil_araddr),
        .s_axil_arprot  (s_axil_arprot),

        .s_axil_rready  (s_axil_rready),
        .s_axil_rvalid  (s_axil_rvalid),
        .s_axil_rdata   (s_axil_rdata),
        .s_axil_rresp   (s_axil_rresp),

        .DG_ENABLE_value  (DG_ENABLE_value),
        .DG_LENGTH_value (DG_LENGTH_value)
    );

endmodule
