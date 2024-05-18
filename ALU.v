module ALU(
	output reg [31:0] ALUresult,
	output reg zero,
	input [31:0] Rs_Data, Rt_Data,
	input [31:0] ext_imm,
	input [3:0] ALUoperation, 
	input ALUsrc
    );

	always @(*)
		begin
			case (ALUoperation)
				4'b0010:
					begin 
						if (ALUsrc)
							begin
								ALUresult = Rs_Data + ext_imm;
							end
						else
							begin
								ALUresult = Rs_Data + Rt_Data;
							end
					end
				4'b0110:
					begin 
						if (ALUsrc)
							begin
								ALUresult = Rs_Data - ext_imm;
							end
						else
							begin
								ALUresult = Rs_Data - Rt_Data;
							end
					end
				4'b0000: ALUresult = Rs_Data & Rt_Data;
				4'b0001: ALUresult = Rs_Data | Rt_Data;
				4'b0111: ALUresult = (Rs_Data < Rt_Data) ? 1 : 0;
			endcase
			
			if (ALUresult == 0)
				begin
					zero = 1;
				end
			else
				begin
					zero = 0;
				end
		end
endmodule 