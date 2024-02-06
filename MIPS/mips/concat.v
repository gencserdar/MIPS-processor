module concat(
	output [31:0] res,
	input [27:0] jump_addr,
	input [3:0] incremented_pc
);

or or1(res[31], incremented_pc[3], 0);
or or2(res[30], incremented_pc[2], 0);
or or3(res[29], incremented_pc[1], 0);
or or4(res[28], incremented_pc[0], 0);
or or5(res[27], jump_addr[27], 0);
or or6(res[26], jump_addr[26], 0);
or or7(res[25], jump_addr[25], 0);
or or8(res[24], jump_addr[24], 0);
or or9(res[23], jump_addr[23], 0);
or or10(res[22], jump_addr[22], 0);
or or11(res[21], jump_addr[21], 0);
or or12(res[20], jump_addr[20], 0);
or or13(res[19], jump_addr[19], 0);
or or14(res[18], jump_addr[18], 0);
or or15(res[17], jump_addr[17], 0);
or or16(res[16], jump_addr[16], 0);
or or17(res[15], jump_addr[15], 0);
or or18(res[14], jump_addr[14], 0);
or or19(res[13], jump_addr[13], 0);
or or20(res[12], jump_addr[12], 0);
or or21(res[11], jump_addr[11], 0);
or or22(res[10], jump_addr[10], 0);
or or23(res[9], jump_addr[9], 0);
or or24(res[8], jump_addr[8], 0);
or or25(res[7], jump_addr[7], 0);
or or26(res[6], jump_addr[6], 0);
or or27(res[5], jump_addr[5], 0);
or or28(res[4], jump_addr[4], 0);
or or29(res[3], jump_addr[3], 0);
or or30(res[2], jump_addr[2], 0);
or or31(res[1], jump_addr[1], 0);
or or32(res[0], jump_addr[0], 0);

endmodule