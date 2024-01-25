module cpu #(
    parameter PC_WIDTH = 8,
    parameter INSTR_WIDTH = 32
)(
    input                       clk,
    input                       rst,
    output [PC_WIDTH-1:0]       pc,
    output [INSTR_WIDTH-1:0]    instr
);

// FETCH STAGE 

wire [PC_WIDTH-1:0]     pc_addr;
wire [INSTR_WIDTH-1:0]  rom_instr;
wire [INSTR_WIDTH-1:0]  fetch_instr;

pc #(.WIDTH(PC_WIDTH))
pc_module (
    .clk(clk),
    .rst(rst),
    .branch(1'b0),
    .br_addr(8'h00),
    .pc_out(pc_addr)
);

rom #(
    .WIDTH(INSTR_WIDTH),
    .ADDR_WIDTH(PC_WIDTH)
)
rom_module (
    .addr(pc_addr),
    .instr(rom_instr)
);

fetch_latch #(.WIDTH(INSTR_WIDTH))
fetch_latch_module (
    .clk(clk),
    .rst(rst),
    .instr_in(rom_instr),
    .fetch_out(fetch_instr)
);

assign pc = pc_addr;
assign instr = rom_instr;

// DECODE STAGE

// EXECUTE STAGE

// MEMORY STAGE

// WRITE BACK STAGE

endmodule