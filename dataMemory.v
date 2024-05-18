module dataMemory(
	output reg [31:0] readData,
	output reg [31:0] writeData_regFile,
	input [31:0] ALUresult_address, writeData,
	input memWrite, memRead, memToReg, clk, rst
    );

	reg [31:0] dataMemory [0:31];
	integer i;
	
	initial 
		begin
			dataMemory[0] = 32'h00000000; 
			dataMemory[1] = 32'h00000001; 
			dataMemory[2] = 32'h00000002;
			dataMemory[3] = 32'h00000003;
			dataMemory[4] = 32'h00000004;
			dataMemory[5] = 32'h00000005;
			dataMemory[6] = 32'h00000006;
			dataMemory[7] = 32'h00000007;
			dataMemory[8] = 32'h00000008;
			dataMemory[9] = 32'h00000009;
			dataMemory[10] = 32'h0000000A;
			dataMemory[11] = 32'h0000000B;
			dataMemory[12] = 32'h0000000C;
			dataMemory[13] = 32'h0000000D;
			dataMemory[14] = 32'h0000000E;
			dataMemory[15] = 32'h0000000F;
			dataMemory[16] = 32'h00000011;
			dataMemory[17] = 32'h00000012;
			dataMemory[18] = 32'h00000013;
			dataMemory[19] = 32'h00000014;
			dataMemory[20] = 32'h00000015;
			dataMemory[21] = 32'h00000001;
			dataMemory[22] = 32'h00000001;
			dataMemory[23] = 32'h00000018;
			dataMemory[24] = 32'h00000019;
			dataMemory[25] = 32'h0000001A;
			dataMemory[26] = 32'h0000001B;
			dataMemory[27] = 32'h0000001C;
			dataMemory[28] = 32'h0000001D;
			dataMemory[29] = 32'h0000001E;
			dataMemory[30] = 32'h0000001F;
			dataMemory[31] = 32'h00000010;
		end
		
	always @(posedge clk or posedge rst) 
		begin
			if (rst) 
				begin
					readData = 0;
				end
			else
				begin
					if (memWrite) 
						begin
							dataMemory[ALUresult_address] = writeData;
						end
				end
		end
		
	always @(*)
    begin
        if (memRead)
        begin
           readData = dataMemory[ALUresult_address];
        end
    end
		
	always @(*)
		begin
			if (memToReg)
				begin
					writeData_regFile = readData;		// writeData basically tells us which value (MEM or ALU) is being stored in regFile
				end
			else
				begin
					writeData_regFile = ALUresult_address;
				end
		end

endmodule
