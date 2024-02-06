module alu_control_tb;

    reg [5:0] function_code;
    reg [2:0] ALUop;
    wire [2:0] alu_ctr;

    // Instantiate the alu_control module
    alu_control uut (
        .alu_ctr(alu_ctr),
        .function_code(function_code),
        .ALUop(ALUop)
    );

    // Stimulus generation
    initial begin
        // Test case 1: R-Type instruction (ADD)
        function_code = 5'b00010;
        ALUop = 3'b111;
        #10;
        $display("Test Case 1:R-Type instruction (ADD): alu_ctr = %b", alu_ctr);

        // Test case 2: I-Type instruction (addi,lb,sb,lw,sw)
        function_code = 5'b00000;
        ALUop = 3'b101;
        #10;
        $display("Test Case 2:I-Type instruction (addi,lb,sb,lw,sw): alu_ctr = %b", alu_ctr);

        // Test case 3: R-Type instruction (slt)
        function_code = 5'b00111;
        ALUop = 3'b111;
        #10;
        $display("Test Case 3:R-Type instruction (slt): alu_ctr = %b", alu_ctr);

        // Test case 4: I-Type instruction (andi)
        function_code = 5'b000000;
        ALUop = 3'b000;
        #10;
        $display("Test Case 4:I-Type instruction (andi): alu_ctr = %b", alu_ctr);

        // Test case 5: I-Type instruction (subi, beq, bne)
        function_code = 5'b000000;
        ALUop = 3'b110;
        #10;
        $display("Test Case 5:I-Type instruction (subi, beq, bne): alu_ctr = %b", alu_ctr);

        // End simulation
        $finish;
    end

endmodule
