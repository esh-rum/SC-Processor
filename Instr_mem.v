module Instr_mem(
    output reg [31:0] instr_out,
    input [31:0] instr_add_PC,
    input clk,
    input rst
    );

	reg [31:0] instructions [0:31];
	initial
		begin
			 instructions[0] = 32'b000000_00000_00000_00000_00000_000000; // rst
			 instructions[1] = 32'b000000_00011_00001_01000_00000_100000; // add $t0, $s0, $s1
			 instructions[2] = 32'b000000_10000_10001_01000_00000_100010; // subtract $t0, $s0, $s1
			 instructions[3] = 32'b000000_10000_10001_01000_00000_100100; // and $t0, $s0, $s1
			 instructions[4] = 32'b000000_10000_10001_01000_00000_100101; // or $t0, $s0, $s1
			 instructions[5] = 32'b000000_10000_10001_01000_00000_101010; // slt $t0, $s0, $s1
			 instructions[6] = 32'b100011_10001_01000_0000000000000100; // lw $t0, 4($s1)
			 instructions[7] = 32'b101011_10001_01000_0000000000000100; // sw $t0, 4($s1)
			 instructions[8] = 32'b000010_00000000000000000000000001; // jump to 1 
			 instructions[9] = 32'b000100_00010_00010_0000000000000010; // beq $s0, $s1, 4
			 instructions[10] = 32'b000000_00000_00000_00000_00000_000000; // rst
			 instructions[11] = 32'b000000_10000_10001_01000_00000_100000; // add $t0, $s0, $s1
			 instructions[12] = 32'b000000_10000_10001_01000_00000_100010; // subtract $t0, $s0, $s1
			 instructions[13] = 32'b000000_10000_10001_01000_00000_100100; // and $t0, $s0, $s1
			 instructions[14] = 32'b000000_10000_10001_01000_00000_100101; // or $t0, $s0, $s1
			 instructions[15] = 32'b000000_10000_10001_01000_00000_101010; // slt $t0, $s0, $s1
			 instructions[16] = 32'b100011_10001_01000_0000000000000100; // lw $t0, 4($s1)
			 instructions[17] = 32'b101011_10001_01000_0000000000000100; // sw $t0, 4($s1)
			 instructions[18] = 32'b000100_10000_10001_0000000000000100; // beq $s0, $s1, 4
			 instructions[19] = 32'b000010_00000000000000000000001100; // jump to address 12
			 instructions[20] = 32'b000000_00000_00000_00000_00000_000000; // rst
			 instructions[21] = 32'b000000_10000_10001_01000_00000_100000; // add $t0, $s0, $s1
			 instructions[22] = 32'b000000_10000_10001_01000_00000_100010; // subtract $t0, $s0, $s1
			 instructions[23] = 32'b000000_10000_10001_01000_00000_100100; // and $t0, $s0, $s1
			 instructions[24] = 32'b000000_10000_10001_01000_00000_100101; // or $t0, $s0, $s1
			 instructions[25] = 32'b000000_10000_10001_01000_00000_101010; // slt $t0, $s0, $s1
			 instructions[26] = 32'b100011_10001_01000_0000000000000100; // lw $t0, 4($s1)
			 instructions[27] = 32'b101011_10001_01000_0000000000000100; // sw $t0, 4($s1)
			 instructions[28] = 32'b000100_10000_10001_0000000000000100; // beq $s0, $s1, 4
			 instructions[29] = 32'b000010_00000000000000000000001100; // jump to address 12
			 instructions[30] = 32'b000000_10000_10001_01000_00000_100000; // add $t0, $s0, $s1
			 instructions[31] = 32'b000000_10000_10001_01000_00000_100010; // subtract $t0, $s0, $s1
		end
	
	always @(*)
		begin
			if (rst)
				begin
					instr_out = instructions[0];
				end
			else
				begin
					instr_out = instructions[instr_add_PC];
				end
		end

endmodule
