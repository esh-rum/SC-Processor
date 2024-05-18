module controlSignals(
	output reg RegDst,
	output reg ExtOp,
	output reg ALUsrc,
	output reg Branch,
	output reg Jump,
	output reg MemWrite,
	output reg MemRead,
	output reg MemToReg,
	output reg RegWrite,
	output reg [1:0]ALUop,
	input[5:0] opcode_instr
    );

	always @(opcode_instr)
		begin
			case(opcode_instr)
				6'b100011:		// lw
					begin
						ALUop = 2'b00;
						RegDst = 0;
						ExtOp = 1;	// confirm
						ALUsrc = 1;
						Branch = 0;
						Jump = 0;
						MemWrite = 0;
						MemRead = 1;
						MemToReg = 1;
						RegWrite = 1; 
					end
				6'b101011:		//sw
					begin
						ALUop = 2'b00;
						RegDst = 0;
						ExtOp = 1;	// confirm
						ALUsrc = 1;
						Branch = 0;
						Jump = 0;
						MemWrite = 1;
						MemRead = 0;
						MemToReg = 0;
						RegWrite = 0; 
					end
				6'b000100:		// beq
					begin
						ALUop = 2'b01;
						RegDst = 0;
						ExtOp = 1;	// confirm
						ALUsrc = 0;
						Branch = 1;
						Jump = 0;
						MemWrite = 0;	// confirm
						MemRead = 0;
						MemToReg = 0;
						RegWrite = 0;
					end
				6'b000000:		// R-type
					begin
						ALUop = 2'b10;
						RegDst = 1;
						ExtOp = 0;	// confirm
						ALUsrc = 0;
						Branch = 0;
						Jump = 0;
						MemWrite = 0;
						MemRead = 0;
						MemToReg = 0;
						RegWrite = 1; 
					end
				6'b000010:
					begin
						ALUop = 2'b00;
						RegDst = 0;
						ExtOp = 0;	// confirm
						ALUsrc = 0;
						Branch = 0;
						Jump = 1;
						MemWrite = 0;
						MemRead = 0;
						MemToReg = 0;
						RegWrite = 0; 
					end
				default:
					begin
						ALUop = 2'b01;
						RegDst = 0;
						ExtOp = 1;	// confirm
						ALUsrc = 0;
						Branch = 1;
						Jump = 0;
						MemWrite = 0;	// confirm
						MemRead = 0;
						MemToReg = 0;
						RegWrite = 0;
					end
			endcase
		end
endmodule