`include "../cpu.sv"
`timescale 1ns/1ps

module cpu_tb;
parameter PC_WIDTH = 8;
parameter INSTR_WIDTH = 32;

reg CLK, RST;
wire [PC_WIDTH-1:0] PC;
wire [INSTR_WIDTH-1:0] INSTR;

cpu #(
    .PC_WIDTH(PC_WIDTH),
    .INSTR_WIDTH(INSTR_WIDTH))
cpu_dut (
    .clk(CLK),
    .rst(RST),
    .pc(PC),
    .instr(INSTR)
);

initial begin
    RST = 1'b1;
    #20
    RST = 1'b0;
    #200
    $stop;
end

//Clock generator
initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
end

endmodule