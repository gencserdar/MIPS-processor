module mips(
	input clock
);

reg [31:0] pc = 32'b0;
reg [31:0] jal_address = 32'b0;
assign canWrite = clock;
wire [31:0] incremented_pc, instruction, extended_imm, extended_shifted_imm, branch_address, write_data, read_data1, read_data2, alu_result, alu_src2;
wire [31:0] branch_or_not_res, jump_address, next_pc, read_data, write_data_no_jal, next_pc_no_jr;
wire [27:0] shifted_jump_address;
wire [4:0] write_reg, write_reg_no_jal;
wire [2:0] ALUop, alu_ctr;
wire  regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move, can_branch, zero_bit, jal, jr, not_jr, no_jr_regWrite;
wire beq, bne, zero_bit_not, opcode_2_not, can_regWrite, can_memWrite;

cla_level2_32bit pc_adder(incremented_pc, 32'h00000004, pc, 1'b0);

instruction_block instruction_memory(instruction, pc);

and and_jal(jal, instruction[31], instruction[30], instruction[26]);

control_unit cu(regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move, instruction[31:26]); 

and and_jr(jr, instruction[3], ALUop[2], ALUop[1], ALUop[0]);

mux_5bit regDst_mux1(write_reg_no_jal, instruction[20:16], instruction[15:11], regDst); 
mux_5bit regDst_mux2(write_reg, write_reg_no_jal, 5'b11111, jal);

not not0(not_jr, jr);
and andd(no_jr_regWrite, not_jr, regWrite);
and anddd(can_regWrite, no_jr_regWrite, canWrite);

register_block registers(read_data1, read_data2, byteOperations, write_data, instruction[25:21], instruction[20:16], write_reg, can_regWrite);

alu_control alu_control_unit(alu_ctr, instruction[5:0], ALUop);
sign_extend sign_ext(extended_imm, instruction[15:0]);
mux_2x1 read_data2_or_extended_imm(alu_src2, read_data2, extended_imm, ALUsrc);
alu aluu(alu_result, zero_bit, read_data1, alu_src2, alu_ctr);

shift_left_2 sl2_for_imm(extended_shifted_imm, extended_imm);
cla_level2_32bit branch_adder(branch_address, extended_shifted_imm, incremented_pc, 1'b0);

not not1(opcode_2_not,instruction[28]);
not not2(zero_bit_not, zero_bit);

and and1(beq, branch, zero_bit, opcode_2_not);
and and2(bne, branch, zero_bit_not, instruction[28]);
or or0(can_branch, bne, beq);

mux_2x1 branch_or_not_mux(branch_or_not_res, incremented_pc, branch_address, can_branch);

shift_left_2_jump sl2_for_jump(shifted_jump_address, instruction[25:0]);
concat concat_for_jump_address(jump_address, shifted_jump_address, incremented_pc[31:28]);
mux_2x1 jump_or_not_mux(next_pc_no_jr, branch_or_not_res, jump_address, jump);
mux_2x1 next_pc_mux(next_pc, next_pc_no_jr, read_data1, jr);

and and3(can_memWrite, memWrite, canWrite);
memory_block data_Memory(read_data, byteOperations, alu_result[17:0], read_data2, memRead, can_memWrite);
mux_2x1 write_data_mux1(write_data_no_jal, alu_result, read_data, memRead);
mux_2x1 write_data_mux2(write_data, write_data_no_jal, jal_address, jal);


always @(posedge clock) begin
	 jal_address <= incremented_pc;
    pc <= next_pc;
end


endmodule