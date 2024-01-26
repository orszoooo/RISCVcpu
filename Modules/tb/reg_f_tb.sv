`include "../reg_f.sv"
`timescale 1ns/1ps

module reg_f_tb;
parameter ADDR_WIDTH = 4;
parameter WIDTH = 8;

reg CLK;

reg [ADDR_WIDTH-1:0] RS1_ADDR;
reg [ADDR_WIDTH-1:0] RS2_ADDR;
reg RWB_WE;
reg [ADDR_WIDTH-1:0] RWB_ADDR;
reg [WIDTH-1:0] RWB_DATA;

wire [WIDTH-1:0] RS1_OUT;
wire [WIDTH-1:0] RS2_OUT;

reg_f #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .WIDTH(WIDTH))
reg_f_dut (
    .clk(CLK),
    .rs1_addr(RS1_ADDR),
    .rs2_addr(RS2_ADDR),
    .rwb_we(RWB_WE), // write back
    .rwb_addr(RWB_ADDR),
    .rwb_data(RWB_DATA),
    .rs1_out(RS1_OUT),
    .rs2_out(RS2_OUT)
);

integer i = 0;

initial begin
    RS1_ADDR = {WIDTH{1'b0}};
    RS2_ADDR = {WIDTH{1'b0}};
    RWB_ADDR = {WIDTH{1'b0}};
    RWB_DATA = {WIDTH{1'b0}};
    RWB_WE = 1'b0;
    #10
    for(i=0;i<2**ADDR_WIDTH;i++) begin
        #10
        RWB_WE = 1'b0;
        RWB_DATA += 10;
        #10
        RWB_ADDR++;
        RWB_WE = 1'b1;
    end
    
    #50
    RS1_ADDR = {WIDTH{1'b0}};
    RS2_ADDR = 8'h0F;
    i = 0;

    for(i=0;i<2**ADDR_WIDTH;i++) begin
        #20
        RS1_ADDR++;
        RS2_ADDR--;
    end

    #100
    $stop;
end

//Clock generator
initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
end

endmodule 