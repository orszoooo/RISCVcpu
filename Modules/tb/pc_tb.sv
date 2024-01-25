`include "../pc.sv"
`timescale 1ns/1ps

module pc_tb;
parameter WIDTH = 8;
reg CLK, RST, BRANCH;
reg [WIDTH-1:0] BR_ADDR;
wire [WIDTH-1:0] PC_OUT;

pc #(.WIDTH(WIDTH))
pc_dut (
    .clk(CLK),
    .rst(RST),
    .branch(BRANCH),
    .br_addr(BR_ADDR),
    .pc_out(PC_OUT)
);

initial begin
    RST = 1'b1;
    BRANCH = 1'b0;
    BR_ADDR = {WIDTH{1'b0}};
    #20
    RST = 1'b0;
    #100
    RST = 1'b1;
    #10
    RST = 1'b0;
    #100
    BR_ADDR = 8'h23;
    #20
    BRANCH = 1'b1;
    #10
    BRANCH = 1'b0;
    #100
    $stop;
end

//Clock generator
initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
end

endmodule