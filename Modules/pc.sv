module pc #(
    parameter WIDTH = 8
)(
    input                       clk,
    input                       rst,
    input                       branch,
    input      [WIDTH-1:0]      br_addr,
    output reg [WIDTH-1:0]      pc_out 
);

always_ff @(posedge clk) begin
    if(rst)
        pc_out <= {WIDTH{1'b0}};
    else if(branch)
        pc_out <= br_addr;
    else
        pc_out++;
end

endmodule