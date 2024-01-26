`include "../instr_dec.sv"
`timescale 1ns/1ps

module instr_dec_tb;
parameter WIDTH = 32;
parameter INSTR_TYPES = 6;
parameter ALU_OP = 4;

reg CLK;
reg [WIDTH-1:0] OPCODE;
wire [INSTR_TYPES-1:0] INSTR_TYPE;
wire [ALU_OP-1:0] ALU_OPERATION;

instr_dec #(
    .WIDTH(WIDTH),
    .INSTR_TYPES(INSTR_TYPES),
    .ALU_OP(ALU_OP))
instr_dec_dut (
    .opcode(OPCODE),
    .instr_type(INSTR_TYPE), 
    .alu_op(ALU_OPERATION)
);

initial begin
    OPCODE = {WIDTH{1'b0}};
    #20
    OPCODE = 32'b0000100_00000_00100_000_00101_0110111; //LUI
    #20
    OPCODE = 32'b1000100_00100_00000_000_00000_0010111; //AUIPC
    #20
    OPCODE = 32'b0100000_00000_00000_010_00010_1101111; //JAL
    #20
    OPCODE = 32'b0000010_00000_00100_000_01100_1100111; //JALR
    #200
    $stop;
end

//Clock generator
initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
end

endmodule