module axis_mux_2to1 #
(
    parameter integer DATA_WIDTH = 32
)
(
    input  wire                     aclk,
    input  wire                     aresetn,

    // Select: 0 = input0, 1 = input1
    input  wire                     sel,

    // Input 0
    input  wire [DATA_WIDTH-1:0]    s0_tdata,
    input  wire                     s0_tvalid,
    output wire                     s0_tready,
    input  wire                     s0_tlast,

    // Input 1
    input  wire [DATA_WIDTH-1:0]    s1_tdata,
    input  wire                     s1_tvalid,
    output wire                     s1_tready,
    input  wire                     s1_tlast,

    // Output
    output wire [DATA_WIDTH-1:0]    m_tdata,
    output wire                     m_tvalid,
    input  wire                     m_tready,
    output wire                     m_tlast
);

    assign m_tdata  = sel ? s1_tdata  : s0_tdata;
    assign m_tvalid = sel ? s1_tvalid : s0_tvalid;
    assign m_tlast  = sel ? s1_tlast  : s0_tlast;

    // Ready backpressure only to selected input
    assign s0_tready = (!sel) & m_tready;
    assign s1_tready = ( sel) & m_tready;

endmodule
