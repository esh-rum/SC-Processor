module ALUcontrol(
	output reg [3:0] ALUoperation,
	input [5:0] opcode_instr,
	input [1:0] ALUop_controlSignals,
	input [5:0] funct
    );

	always @(*)
		begin
			case (ALUop_controlSignals)
				2'b00:
					begin
						ALUoperation = 4'b0010;
					end
				2'b01: ALUoperation = 4'b0110;
				2'b10:
					begin
						case (funct)
							6'b100000: ALUoperation = 4'b0010;
							6'b100010: ALUoperation = 4'b0110;
							6'b100100: ALUoperation = 4'b0000;
							6'b100101: ALUoperation = 4'b0001;
							6'b101010: ALUoperation = 4'b0111;
							default: ALUoperation = 4'b0010;
						endcase
					end
				default: ALUoperation = 4'b0010;
			endcase
		end

endmodule
