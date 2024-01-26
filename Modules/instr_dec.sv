`include "opcodes.vh"

module instr_dec #(
    parameter WIDTH = 32,
    parameter INSTR_TYPES = 6,
    parameter ALU_OP = 4 
    parameter BR_OP
)(
    input [WIDTH-1:0] opcode,
    output reg [INSTR_TYPES-1:0] instr_type, //MSB: J U B S I R :LSB 
    output reg alu_en,
    output reg [ALU_OP-1:0] alu_op,
    output reg [BR_OP-1:0] branch_op,
    output reg branch_en
);

always_comb begin


    // else if(opcode == `BEQ ||
    //         opcode == `BNE ||
    //         opcode == `BLT ||
    //         opcode == `BGE ||
    //         opcode == `BLTU ||
    //         opcode == `BGEU) begin
    //     instr_type = 6'b001000;
    // end

    // else if(opcode == `LB ||
    //         opcode == `LH ||
    //         opcode == `LW ||
    //         opcode == `LBU ||
    //         opcode == `LHU) begin
    //     instr_type = 6'b000010;
    // end
    
    // else if(opcode == `SB ||
    //         opcode == `SH ||
    //         opcode == `SW) begin
    //     instr_type = 6'b000100;
    // end
    

    unique casex(opcode)
        `LUI: begin
            instr_type = 6'b010000;
            alu_en = 1'b1;
            alu_op = {ALU_OP{1'b0}};
            branch_op = {BR_OP{1'b0}};
            branch_en = 1'b0;
        end

        `AUIPC: begin
            instr_type = 6'b010000;
            alu_en = 1'b1;
            alu_op = {ALU_OP{1'b0}};
            branch_op = {BR_OP{1'b0}};
            branch_en = 1'b0;         
        end

        `JAL: begin
            instr_type = 6'b100000;
            alu_en = 1'b1;
            alu_op = {ALU_OP{1'b0}};
            branch_op = {BR_OP{1'b0}};
            branch_en = 1'b0;          
        end

        `JALR: begin
            instr_type = 6'b000010;
            alu_op = {ALU_OP{1'b0}};           
        end

        `BEQ: instr_type = 6'b001000;  
        `BNE:  
        `BLT:  
        `BGE:  
        `BLTU: 
        `BGEU: 
        // `LB: 
        // `LH: 
        // `LW: 
        // `LBU:
        // `LHU:
        // `SB: 
        // `SH: 
        // `SW:         
        // `ADDI:  
        // `SLTI:  
        // `SLTIU: 
        // `XORI:  
        // `ORI:   
        // `ANDI:          
        // `SLLI:
        // `SRLI:
        // `SRAI:
        // `ADD: 
        // `SUB: 
        // `SLL: 
        // `SLT: 
        // `SLTU:
        // `XOR: 
        // `SRL: 
        // `SRA: 
        // `OR:  
        // `AND:
        // `FENCE:
        // `ECALL:
        // `EBREAK:
        default: begin
            instr_type = 6'b010000;
            alu_op = {ALU_OP{1'b0}};
        end

    endcase
end

    
endmodule