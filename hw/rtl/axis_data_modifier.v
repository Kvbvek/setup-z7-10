module axis_data_modifier #
(
    parameter integer C_AXIS_TDATA_WIDTH = 32
)
(
    input  wire                           ACLK,
    input  wire                           ARESETN,

    // AXI-S Slave (input stream)
    input  wire [C_AXIS_TDATA_WIDTH-1:0]  S_AXIS_TDATA,
    input  wire                           S_AXIS_TVALID,
    output wire                           S_AXIS_TREADY,
    input  wire                           S_AXIS_TLAST,

    // AXI-S Master (output stream)
    output reg  [C_AXIS_TDATA_WIDTH-1:0]  M_AXIS_TDATA,
    output reg                            M_AXIS_TVALID,
    input  wire                           M_AXIS_TREADY,
    output reg                            M_AXIS_TLAST
);

assign S_AXIS_TREADY = M_AXIS_TREADY;  // back-pressure

always @(posedge ACLK) begin
    if(!ARESETN) begin
        M_AXIS_TDATA  <= 0;
        M_AXIS_TVALID <= 0;
        M_AXIS_TLAST  <= 0;
    end else begin
        M_AXIS_TVALID <= S_AXIS_TVALID;
        M_AXIS_TLAST  <= S_AXIS_TLAST;

        if(S_AXIS_TVALID && M_AXIS_TREADY) begin
            M_AXIS_TDATA <= S_AXIS_TDATA + 15;
        end
    end
end

endmodule
