module register_block_tb;

    reg byteOperations;
    reg [31:0] write_data;
    reg [4:0] read_reg1, read_reg2, write_reg;
    reg regWrite;
    wire [31:0] read_data1, read_data2;

    // Instantiate the register_block module
    register_block uut (
        .read_data1(read_data1),
        .read_data2(read_data2),
        .byteOperations(byteOperations),
        .write_data(write_data),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .regWrite(regWrite)
    );

    // Initialize signals
    initial begin
        byteOperations = 0;
        write_data = 32'hA5A5A5A5; // Example write data
        read_reg1 = 2; // Example register number
        read_reg2 = 3; // Another example register number
        write_reg = 3; // Example register number for write
        regWrite = 0; // Initialize to 0 for read operation

        // Add initial values to registers
        // You may modify these values based on your requirements
        $readmemb("registers.mem", uut.registers);

        // Perform read operations
        #10; // Wait for a few simulation cycles
        byteOperations = 1; // Set for read operation
        regWrite = 0; // Set to 0 for read operation
        read_reg1 = 2; // Example register number for read
        read_reg2 = 3; // Another example register number for read

        #10; // Wait for a few simulation cycles
        // Display read data
        $display("Read Data 1: %h, Read Data 2: %h", read_data1, read_data2);

        // Perform write operation
        byteOperations = 0; // Set back to 0 for write operation
        regWrite = 1; // Set to 1 for write operation
        write_data = 32'h12345678; // New data to be written
        write_reg = 3; // Example register number for write

        #10; // Wait for a few simulation cycles
        // Display updated read data after write operation
        $display("Read Data 1: %h, Read Data 2: %h", read_data1, read_data2);

        // End simulation
        $finish;
    end

endmodule
