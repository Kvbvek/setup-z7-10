`timescale 1 ns / 1 ps

module axis_data_generator #
(
    // Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
    parameter integer C_M_AXIS_TDATA_WIDTH = 32,
    // Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
    parameter integer C_M_START_COUNT = 32
)
(
    // NEW:
    input wire enable,
    input wire [31:0] length,

    input wire  M_AXIS_ACLK,
    input wire  M_AXIS_ARESETN,

    // Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
    output wire  M_AXIS_TVALID,
    // TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
    output wire [C_M_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
    // TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
    output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TSTRB,
    // TLAST indicates the boundary of a packet.
    output wire  M_AXIS_TLAST,
    // TREADY indicates that the slave can accept a transfer in the current cycle.
    input wire  M_AXIS_TREADY
);

    function integer clogb2 (input integer bit_depth);
      begin
        for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
          bit_depth = bit_depth >> 1;
      end
    endfunction

    localparam integer WAIT_COUNT_BITS = clogb2(C_M_START_COUNT-1);

    parameter [1:0] IDLE = 2'b00,
                    INIT_COUNTER = 2'b01,
                    SEND_STREAM  = 2'b10;

    reg [1:0] mst_exec_state;

    reg [31:0] read_pointer;

    // AXI Stream internal signals
    //wait counter. The master waits for the user defined number of clock cycles before initiating a transfer.
    reg [WAIT_COUNT_BITS-1 : 0] 	count;
    //streaming data valid
    wire  	axis_tvalid;
    //streaming data valid delayed by one clock cycle
    reg  	axis_tvalid_delay;
    //Last of the streaming data 
    wire  	axis_tlast;
    //Last of the streaming data delayed by one clock cycle
    reg  	axis_tlast_delay;
    //FIFO implementation signals
    reg [C_M_AXIS_TDATA_WIDTH-1 : 0] 	stream_data_out;
    wire  	tx_en;
    //The master has issued all the streaming data stored in FIFO
    reg  tx_done;


    // OUTPUT ASSIGNMENTS
    assign M_AXIS_TVALID = enable ? axis_tvalid_delay : 1'b0;
    assign M_AXIS_TDATA  = stream_data_out;
    assign M_AXIS_TLAST  = axis_tlast_delay;
    assign M_AXIS_TSTRB  = {(C_M_AXIS_TDATA_WIDTH/8){1'b1}};


    // FSM
    always @(posedge M_AXIS_ACLK)
    begin
        if (!M_AXIS_ARESETN) begin
            mst_exec_state <= IDLE;
            count <= 0;
        end
        else if (!enable) begin
            mst_exec_state <= IDLE;
            count <= 0;
        end
        else begin
            case (mst_exec_state)
                IDLE:
                    mst_exec_state <= INIT_COUNTER;

                INIT_COUNTER:
                    if (count == C_M_START_COUNT - 1)
                        mst_exec_state <= SEND_STREAM;
                    else begin
                        count <= count + 1;
                        mst_exec_state <= INIT_COUNTER;
                    end

                SEND_STREAM:
                    if (tx_done)
                        mst_exec_state <= IDLE;
                    else
                        mst_exec_state <= SEND_STREAM;
            endcase
        end
    end


    // AXIS TVALID + TLAST
    assign axis_tvalid = (mst_exec_state == SEND_STREAM) &&
                         (read_pointer < length);

    assign axis_tlast  = (read_pointer == length - 1);


    // Delay the axis_tvalid and axis_tlast signal by one clock cycle                               
    always @(posedge M_AXIS_ACLK)
    begin
        if (!M_AXIS_ARESETN) begin
            axis_tvalid_delay <= 1'b0;
            axis_tlast_delay  <= 1'b0;
        end
        else begin
            axis_tvalid_delay <= axis_tvalid;
            axis_tlast_delay  <= axis_tlast;
        end
    end


    // READ POINTER + TX_DONE
    always @(posedge M_AXIS_ACLK)
    begin
        if (!M_AXIS_ARESETN) begin
            read_pointer <= 0;
            tx_done <= 1'b0;
        end
        else if (!enable) begin
            read_pointer <= 0;
            tx_done <= 1'b0;
        end
        else begin
            if (read_pointer < length) begin
                if (tx_en) begin
                    read_pointer <= read_pointer + 1;
                    tx_done <= 1'b0;
                end
            end
            else if (read_pointer == length) begin
                tx_done <= 1'b1;
            end
        end
    end


    // TX ENABLE
    assign tx_en = M_AXIS_TREADY && axis_tvalid;


    // OUTPUT DATA GENERATION
    always @(posedge M_AXIS_ACLK)
    begin
        if (!M_AXIS_ARESETN)
            stream_data_out <= 0;
        else if (!enable)
            stream_data_out <= 0;
        else if (tx_en)
            stream_data_out <= read_pointer;
    end

endmodule
