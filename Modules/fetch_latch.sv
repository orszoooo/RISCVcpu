module fetch_latch #(
    parameter WIDTH = 32
)(
    input                       clk,
    input                       rst,
    input       [WIDTH-1:0]     instr_in, // add PC
    output reg  [WIDTH-1:0]     fetch_out
);

always_ff @(posedge clk) begin
    if(rst) 
        fetch_out <= {WIDTH{1'b0}};
    else
        fetch_out <= instr_in;
end

endmodule