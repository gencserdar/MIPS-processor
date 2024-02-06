module program_counter(
    output reg [31:0] pc,
    input [31:0] pc_in
);

    reg [31:0] increment_value;
    wire [31:0] new_pc;
	 wire cout;
	 
    cla_level2_32bit adder_inst (pc, cout, pc_in, 32'h00000004, 1'b0);  // Constant 4

endmodule
