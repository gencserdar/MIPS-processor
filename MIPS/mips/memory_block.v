module memory_block(
    output reg [31:0] read_data,
    input byteOperations, 
    input [17:0] address,
    input [31:0] write_data,
    input memRead,
    input memWrite
);
    reg [31:0] memory [31:0];

    always @(*) begin
        $readmemb("memory.mem", memory);
        if (memRead) begin
            if (byteOperations) begin
                case (address[1:0])
                    2'b11: read_data = memory[{address[17:2], 2'b00}][7:0];
                    2'b00: read_data = memory[{address[17:2], 2'b00}][15:8];
                    2'b01: read_data = memory[{address[17:2], 2'b00}][23:16];
                    2'b10: read_data = memory[{address[17:2], 2'b00}][31:24];
                endcase
            end else begin
                read_data = memory[address];
            end
        end

        if (memWrite) begin
            if (byteOperations) begin
                case (address[1:0])
                    2'b11: memory[{address[17:2], 2'b00}][7:0]   = write_data[7:0];
                    2'b00: memory[{address[17:2], 2'b00}][15:8]  = write_data[7:0];
                    2'b01: memory[{address[17:2], 2'b00}][23:16] = write_data[7:0];
                    2'b10: memory[{address[17:2], 2'b00}][31:24] = write_data[7:0];
                endcase
            end else begin
                memory[address] = write_data;
            end
				$writememb("memory.mem", memory);
        end
    end
endmodule