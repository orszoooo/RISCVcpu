`include "../rom.sv"
`timescale 1ns/1ps

module rom_tb;
parameter WIDTH = 32;
parameter ADDR_WIDTH = 8;
reg CLK;
reg [ADDR_WIDTH-1:0] ADDR;
wire [WIDTH-1:0] INSTR;

rom #(
    .WIDTH(WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH)
)
rom_dut(
    .addr(ADDR),
    .instr(INSTR)
);

initial begin
    ADDR = 8'h00;
    #20
    ADDR = 8'h07;
    #20
    ADDR = 8'h31;
    #20
    ADDR = 8'h32; 
    #100
    $finish;
end

//Clock generator
initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
end

endmodule