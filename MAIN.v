module MAIN(
    output [31:0] RegOut,
	 output [31:0] instr_add_out,
	 output [25:0] jump_add,
    output [31:0] branch_add,
	 output PCSrc,
	 output [31:0] instr_out,
	 output [15:0] imm_val_iType,
	 output [5:0] opcode_instr,
	 output [5:0] funct_instr,
	 output [4:0] rs_add,
	 output [4:0] rt_add,	
	 output [4:0] rd_add,	
	 output [4:0] shamt,
	 output RegDst,
	 output ExtOp,
	 output ALUsrc,
	 output Branch,
	 output Jump,
	 output MemWrite,
	 output MemRead,
	 output MemToReg,
	 output RegWrite,
	 output [1:0]ALUop,
	 output [31:0] Rs_Data, Rt_Data, Rd_Data,
	 output [31:0] ext_imm,
	 output [3:0] ALUoperation,
	 output [31:0] ALUresult,
	 output zero,
	 output [31:0] readData,
	 output [31:0] writeData_regFile, 
	 output temp,
    input clk,
    input rst
);
	
	assign PCSrc = Branch & zero;
	assign branch_add = ext_imm;
	
	PC a_PC (.instr_add_out(instr_add_out), 
				.jump_add(jump_add), 
				.branch_add(branch_add), 
				.jump(Jump), 
				.PCSrc(PCSrc), 
				.clk(clk), 
				.rst(rst)
				);
	
	Instr_mem b_IM (.instr_out(instr_out),
						 .instr_add_PC(instr_add_out),
						 .clk(clk),
						 .rst(rst)
						 );
						 
	decoder c_Deco (.add_jType(jump_add),
						 .imm_val_iType(imm_val_iType),
						 .opcode_instr(opcode_instr),	
						 .funct_instr(funct_instr),	
						 .rs_add(rs_add),	
						 .rt_add(rt_add),	
						 .rd_add(rd_add),	
						 .shamt(shamt),
						 .instr(instr_out)
						 );
						 
	controlSignals d_CS(.RegDst(RegDst),
							  .ExtOp(ExtOp),
							  .ALUsrc(ALUsrc),
							  .Branch(Branch),
							  .Jump(Jump),
							  .MemWrite(MemWrite),
							  .MemRead(MemRead),
							  .MemToReg(MemToReg),
							  .RegWrite(RegWrite),
							  .ALUop(ALUop),
							  .opcode_instr(opcode_instr)
							  );
	
	assign temp = RegWrite;
	
	regFile e_RF(.Rs_Data(Rs_Data), 
					 .Rt_Data(Rt_Data), 
					 .Rd_data(Rd_Data),
					 .ext_imm(ext_imm),
					 .regWrite(RegWrite), 
					 .regDst(RegDst), 
					 .extOp(ExtOp), 
					 .clk(clk), 
					 .rst(rst),
					 .rs_add(rs_add), 
					 .rt_add(rt_add), 
					 .rd_add(rd_add),
					 .writeData(writeData_regFile),
					 .imm_val_iType(imm_val_iType)
					 );
							  
	ALUcontrol f_aluC(.ALUoperation(ALUoperation),
							.opcode_instr(opcode_instr),
							.ALUop_controlSignals(ALUop),
							.funct(funct_instr)
							);
							
	ALU g_ALU(.ALUresult(ALUresult),
				 .zero(zero),
				 .Rs_Data(Rs_Data), 
				 .Rt_Data(Rt_Data),
				 .ext_imm(ext_imm),
				 .ALUoperation(ALUoperation), 
				 .ALUsrc(ALUsrc)
				 );
				 
	dataMemory h_DM(.readData(readData),
						 .writeData_regFile(writeData_regFile),
						 .ALUresult_address(ALUresult), 
						 .writeData(Rt_Data),
						 .memWrite(MemWrite), 
						 .memRead(MemRead), 
						 .memToReg(MemToReg), 
						 .clk(clk), 
						 .rst(rst)
						 );
						 
	assign RegOut = ALUresult;
	
	 
endmodule 