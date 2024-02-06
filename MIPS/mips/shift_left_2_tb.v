module shift_left_2_tb;

    reg [31:0] address;
    wire [31:0] shifted_address;

    // Instantiate the shift_left_2 module
    shift_left_2 uut (
        .shifted_address(shifted_address),
        .address(address)
    );

    // Stimulus generation
    initial begin
        // Test case 1
        address = 32'hA5A5A5A5;
        #10; // Allow some time for propagation
        $display("Test Case 1: shifted_address = %h", shifted_address);

        // Test case 2
        address = 32'h00000001;
        #10; // Allow some time for propagation
        $display("Test Case 2: shifted_address = %h", shifted_address);

        // Add more test cases as needed...

        // End simulation
        $finish;
    end

endmodule
