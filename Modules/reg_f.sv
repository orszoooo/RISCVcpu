module  reg_f #(
    parameter ADDR_WIDTH = 4,
    parameter WIDTH = 8
)(
    input                   clk,
    input [ADDR_WIDTH-1:0]  rs1_addr,
    input [ADDR_WIDTH-1:0]  rs2_addr,
    input                   rwb_we, // write back
    input [ADDR_WIDTH-1:0]  rwb_addr,
    input [WIDTH-1:0]       rwb_data,
    output [WIDTH-1:0]      rs1_out,
    output [WIDTH-1:0]      rs2_out
);

reg [WIDTH-1:0] REG_F [2**ADDR_WIDTH-1:0];

always_ff @(posedge clk) begin
    if(rwb_we) 
        REG_F[rwb_addr] <= rwb_data;
end

assign rs1_out = REG_F[rs1_addr];
assign rs2_out = REG_F[rs2_addr];

endmodule