module register_block (
 output reg [31:0] read_data1, 
 output reg [31:0] read_data2, 
 input byteOperations,
 input [31:0] write_data, 
 input [4:0] read_reg1,
 input [4:0] read_reg2,
 input [4:0] write_reg, 
 input regWrite
 );
 
		reg [31:0] registers [31:0];

		always @(*) begin
			// read data
			$readmemb("registers.mem", registers);
			if (byteOperations) begin
            read_data1 = {24'b00000000, registers[read_reg1][7:0]};
			end else begin
				read_data1 = registers[read_reg1];
				read_data2 = registers[read_reg2];	
			end
			// write data
			if (regWrite) begin
				if (byteOperations) begin
                 registers[write_reg] = {24'b00000000, write_data[7:0]};
				end else begin
						registers[write_reg] = write_data;
				end
				$writememb("registers.mem", registers);
			end
		end
 endmodule