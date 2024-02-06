module alu_tb;

  reg [31:0] alu_src1, alu_src2;
  reg [2:0] alu_ctr;
  reg clk, rst, start;
  wire [31:0] alu_result;
  wire zero_bit;

  // Instantiate the alu module
  alu uut (
    .alu_result(alu_result),
    .zero_bit(zero_bit),
    .alu_src1(alu_src1),
    .alu_src2(alu_src2),
    .alu_ctr(alu_ctr)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset and test cases
  initial begin
    rst = 1;
    start = 0;
    alu_src1 = 32'h00000001;
    alu_src2 = 32'h00000001;
    alu_ctr = 3'b110; // You can change this value to test different operations

    // Apply reset
    #10 rst = 0;

    // Test case 1
    #10 alu_src1 = 32'h00000002; alu_src2 = 32'h00000002; start = 1;
    #100 start = 0;
	      $display("Test Case 1: zero_bit = %b", zero_bit);
				      $display("Test Case 1: alu_result = %b", alu_result);
												$display("Test Case 1: 1scomp = %b", uut._1s_complement);
												$display("Test Case 1: 2scomp = %b", uut._2s_complement);
												$display("Test Case 1: alu_src1 = %b", uut.alu_src1);
												$display("Test Case 1: difference = %b", uut.difference);



    // Test case 2
    #10 alu_src1 = 32'h00000001; alu_src2 = 32'h00000000; start = 1;
    #100 start = 0;
			$display("Test Case 2: zero_bit = %b", zero_bit);

    // Add more test cases as needed

    // End simulation
    #10 $finish;
  end

endmodule
