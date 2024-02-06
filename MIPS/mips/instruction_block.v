module instruction_block (
    output reg [31:0] instruction,
    input [31:0] pc
);

    reg [31:0] mem[31:0]; // Assuming 32 locations in instruction memory

    // Read instruction from memory based on program counter
    always @(pc) begin
	     $readmemb("instructions.mem", mem);
        instruction <= mem[pc[9:2]]; // Extracting least significant 8 bits from pc to use as memory address
    end
endmodule
