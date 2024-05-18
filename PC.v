module PC(
    output reg [31:0] instr_add_out,
    input [25:0] jump_add,
    input [31:0] branch_add,
	 input jump,
	 input PCSrc,
    input clk,
    input rst
    );

	reg [31:0] temp_jump, temp_branch;
	reg [27:0] temp;
	
	always @(posedge clk or posedge rst)
		begin
			if (rst)
				begin
					instr_add_out = 0;
					temp = instr_add_out;
				end
			else
				begin
					if (jump)
						begin
							temp = {jump_add, 2'b00};
							temp_jump = {instr_add_out[31:28], temp};
							instr_add_out = temp_jump;
						end
					else if (PCSrc)
						begin
							temp_branch = branch_add << 2;
							instr_add_out = temp_branch + instr_add_out;
						end
					else
						begin
							instr_add_out = instr_add_out + 1;
						end
				end			
		end

endmodule
