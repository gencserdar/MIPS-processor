module concat_tb();

  reg [27:0] jump_addr;
  reg [3:0] incremented_pc;
  wire [31:0] result;

  // Instantiate the concat module
  concat uut (
    .res(result),
    .jump_addr(jump_addr),
    .incremented_pc(incremented_pc)
  );

  initial begin
    // Initialize inputs
    jump_addr = 28'b1101101010101010101010101010;
    incremented_pc = 4'b1011;

    // Display inputs
    $display("Initial Values:");
    $display("jump_addr: %b", jump_addr);
    $display("incremented_pc: %b", incremented_pc);

    // Trigger the concat module
    #10; // Delay to allow time for computation
    $display("Result: %b", result);

    // Finish simulation
    $stop;
  end

endmodule
