module decoder(
	output reg [25:0] add_jType,
	output reg [15:0] imm_val_iType,
	output reg [5:0] opcode_instr,	
	output reg [5:0] funct_instr,	
	output reg [4:0] rs_add,	
	output reg [4:0] rt_add,	
	output reg [4:0] rd_add,	
	output reg [4:0] shamt,
	input [31:0] instr	// output from instr mem
    );

	always @(*)
		begin
			add_jType = instr[25:0];
			imm_val_iType = instr[15:0];
			opcode_instr = instr[31:26];
			funct_instr = instr[5:0];
			rs_add = instr[25:21];
			rt_add = instr[20:16];
			rd_add = instr[15:11];
			shamt = instr[10:6];
		end

endmodule
