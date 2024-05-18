module regFile(
	output [31:0] Rs_Data, Rt_Data, 
	output reg [31:0] ext_imm, Rd_data,
	input regWrite, regDst, extOp, clk, rst,
	input [4:0] rs_add, rt_add, rd_add,
	input [31:0] writeData,
	input [15:0] imm_val_iType
    );
	//these inputs are coming from decoder except writeData
	reg [31:0] regFile [0:31];
	reg [4:0] temp;
	
	initial 
		begin
			regFile[0] = 32'h00000000; 
			regFile[1] = 32'h00000001; 
			regFile[2] = 32'h00000002;
			regFile[3] = 32'h00000003;
			regFile[4] = 32'h00000004;
			regFile[5] = 32'h00000005;
			regFile[6] = 32'h00000006;
			regFile[7] = 32'h00000007;
			regFile[8] = 32'h00000008;
			regFile[9] = 32'h00000009;
			regFile[10] = 32'h0000000A;
			regFile[11] = 32'h0000000B;
			regFile[12] = 32'h0000000C;
			regFile[13] = 32'h0000000D;
			regFile[14] = 32'h0000000E;
			regFile[15] = 32'h0000000F;
			regFile[16] = 32'h00000011;
			regFile[17] = 32'h00000012;
			regFile[18] = 32'h00000013;
			regFile[19] = 32'h00000014;
			regFile[20] = 32'h00000015;
			regFile[21] = 32'h00000016;
			regFile[22] = 32'h00000017;
			regFile[23] = 32'h00000018;
			regFile[24] = 32'h00000019;
			regFile[25] = 32'h0000001A;
			regFile[26] = 32'h0000001B;
			regFile[27] = 32'h0000001C;
			regFile[28] = 32'h0000001D;
			regFile[29] = 32'h0000001E;
			regFile[30] = 32'h0000001F;
			regFile[31] = 32'h00000010;
		end

	assign Rs_Data = regFile[rs_add];
	assign Rt_Data = regFile[rt_add];

	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				Rd_data = 32'b0;
				ext_imm = 32'b0;
			end
			
		if (regWrite)
			begin
				temp = regDst ? rd_add : rt_add;
				regFile[temp] = writeData;
				Rd_data = regFile[rd_add];			// just shows what is being stored at rd_add in regFile
			end
	end
	
	always @(*) 		
		begin
			if (extOp) 
				begin		//sign extension
					ext_imm = { {16{imm_val_iType[15]}}, imm_val_iType};
				end
			else 
				begin		//zero extension
					ext_imm = {16'b0, imm_val_iType};
				end
		end
endmodule
