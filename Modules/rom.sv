module rom #(
    parameter WIDTH = 32,
    parameter ADDR_WIDTH = 8
)(
    input [ADDR_WIDTH-1:0]  addr,
    output [WIDTH-1:0]      instr
);

reg [WIDTH-1:0] ROM_MEM [0:2**ADDR_WIDTH-1];

initial begin
    $readmemh("../rom.hex", ROM_MEM);
end

assign instr = ROM_MEM[addr];

endmodule