`ifndef OPCODES
`define OPCODES

//RV32I
// U type
`define LUI   		32'bxxxxxxx_xxxxx_xxxxx_xxx_xxxxx_0110111 //LUI
`define AUIPC 		32'bxxxxxxx_xxxxx_xxxxx_xxx_xxxxx_0010111 //AUIPC

// J type
`define JAL   		32'bxxxxxxx_xxxxx_xxxxx_xxx_xxxxx_1101111 //JAL

// I type
`define JALR  		32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_1100111 //JALR

// B type
`define BEQ   		32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_1100011 //BEQ
`define BNE   		32'bxxxxxxx_xxxxx_xxxxx_001_xxxxx_1100011 //BNE
`define BLT   		32'bxxxxxxx_xxxxx_xxxxx_100_xxxxx_1100011 //BLT
`define BGE   		32'bxxxxxxx_xxxxx_xxxxx_101_xxxxx_1100011 //BGE
`define BLTU  		32'bxxxxxxx_xxxxx_xxxxx_110_xxxxx_1100011 //BLTU
`define BGEU  		32'bxxxxxxx_xxxxx_xxxxx_111_xxxxx_1100011 //BGEU

// I type
`define LB    		32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_0000011 //LB
`define LH    		32'bxxxxxxx_xxxxx_xxxxx_001_xxxxx_0000011 //LH
`define LW    		32'bxxxxxxx_xxxxx_xxxxx_010_xxxxx_0000011 //LW
`define LBU   		32'bxxxxxxx_xxxxx_xxxxx_100_xxxxx_0000011 //LBU
`define LHU   		32'bxxxxxxx_xxxxx_xxxxx_101_xxxxx_0000011 //LHU

// S type
`define SB    		32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_0100011 //SB
`define SH    		32'bxxxxxxx_xxxxx_xxxxx_001_xxxxx_0100011 //SH
`define SW    		32'bxxxxxxx_xxxxx_xxxxx_010_xxxxx_0100011 //SW

// I type 
`define ADDI  		32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_0010011 //ADDI
`define SLTI  		32'bxxxxxxx_xxxxx_xxxxx_010_xxxxx_0010011 //SLTI
`define SLTIU 		32'bxxxxxxx_xxxxx_xxxxx_011_xxxxx_0010011 //SLTIU
`define XORI  		32'bxxxxxxx_xxxxx_xxxxx_100_xxxxx_0010011 //XORI
`define ORI   		32'bxxxxxxx_xxxxx_xxxxx_110_xxxxx_0010011 //ORI
`define ANDI  		32'bxxxxxxx_xxxxx_xxxxx_111_xxxxx_0010011 //ANDI

// R type without rs2
`define SLLI  		32'b0000000_xxxxx_xxxxx_001_xxxxx_0010011 //SLLI
`define SRLI  		32'b0000000_xxxxx_xxxxx_101_xxxxx_0010011 //SRLI
`define SRAI  		32'b0100000_xxxxx_xxxxx_101_xxxxx_0010011 //SRAI

//R type
`define ADD   		32'b0000000_xxxxx_xxxxx_000_xxxxx_0110011 //ADD
`define SUB   		32'b0100000_xxxxx_xxxxx_000_xxxxx_0110011 //SUB
`define SLL   		32'b0000000_xxxxx_xxxxx_001_xxxxx_0110011 //SLL
`define SLT   		32'b0000000_xxxxx_xxxxx_010_xxxxx_0110011 //SLT
`define SLTU  		32'b0000000_xxxxx_xxxxx_011_xxxxx_0110011 //SLTU
`define XOR   		32'b0000000_xxxxx_xxxxx_100_xxxxx_0110011 //XOR
`define SRL   		32'b0000000_xxxxx_xxxxx_101_xxxxx_0110011 //SRL
`define SRA   		32'b0100000_xxxxx_xxxxx_101_xxxxx_0110011 //SRA
`define OR    		32'b0000000_xxxxx_xxxxx_110_xxxxx_0110011 //OR
`define AND   		32'b0000000_xxxxx_xxxxx_111_xxxxx_0110011 //AND

//
`define FENCE 		32'bxxxxxxx_xxxxx_xxxxx_000_xxxxx_0001111 //FENCE
`define ECALL 		32'b0000000_00000_00000_000_00000_1110011 //ECALL
`define EBREAK		32'b0000000_00001_00000_000_00000_1110011 //BREAK

//pseudo-codes
`define PSEUDO_NOP   	    32'b0000000_00000_00000_000_00000_0010011	//addi x0, x0, 0

//opcode - compacted
//RV32I
`define OP_BEQ   		    3'b000 //BEQ
`define OP_BNE   		    3'b001 //BNE
`define OP_BLT   		    3'b100 //BLT
`define OP_BGE   		    3'b101 //BGE
`define OP_BLTU  		    3'b110 //BLTU
`define OP_BGEU  		    3'b111 //BGEU

`define OP_ADD   		    4'b0_000 //ADD
`define OP_SUB   		    4'b1_000 //SUB
`define OP_SLL   		    4'b0_001 //SLL
`define OP_SLT   		    4'b0_010 //SLT
`define OP_SLTU  		    4'b0_011 //SLTU
`define OP_XOR   		    4'b0_100 //XOR
`define OP_SRL   		    4'b0_101 //SRL
`define OP_SRA   		    4'b1_101 //SRA
`define OP_OR    		    4'b0_110 //OR
`define OP_AND   		    4'b0_111 //AND

`endif
