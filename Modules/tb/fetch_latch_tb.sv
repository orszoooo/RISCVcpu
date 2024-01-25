`include "../fetch_latch.sv"
`timescale 1ns/1ps

module fetch_latch_tb;
parameter WIDTH = 32;

reg CLK, RST;
reg [WIDTH-1:0] INSTR_IN;
wire [WIDTH-1:0] FETCH_OUT;

fetch_latch #(.WIDTH(WIDTH))
fetch_latch_dut (
    .clk(CLK),
    .rst(RST),
    .instr_in(INSTR_IN),
    .fetch_out(FETCH_OUT)
);


initial begin
    RST = 1'b0;
    INSTR_IN = {WIDTH{1'b0}};
    #20
    INSTR_IN = 32'h05002030;
    #10
    INSTR_IN = {WIDTH{1'b0}};
    #10
    INSTR_IN = 32'h11111111;
    #10
    RST = 1'b1;
    #100
    $stop;
end

//Clock generator
initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
end

endmodule