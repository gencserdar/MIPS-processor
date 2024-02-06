module sign_extend(
	output [31:0] sign_ext_imm,
	input [15:0] imm
);

or_16bit or16bit(sign_ext_imm[15:0], imm, 16'b0);

or or1(sign_ext_imm[16], sign_ext_imm[15], 1'b0);
or or2(sign_ext_imm[17], sign_ext_imm[15], 1'b0);
or or3(sign_ext_imm[18], sign_ext_imm[15], 1'b0);
or or4(sign_ext_imm[19], sign_ext_imm[15], 1'b0);
or or5(sign_ext_imm[20], sign_ext_imm[15], 1'b0);
or or6(sign_ext_imm[21], sign_ext_imm[15], 1'b0);
or or7(sign_ext_imm[22], sign_ext_imm[15], 1'b0);
or or8(sign_ext_imm[23], sign_ext_imm[15], 1'b0);
or or9(sign_ext_imm[24], sign_ext_imm[15], 1'b0);
or or10(sign_ext_imm[25], sign_ext_imm[15], 1'b0);
or or11(sign_ext_imm[26], sign_ext_imm[15], 1'b0);
or or12(sign_ext_imm[27], sign_ext_imm[15], 1'b0);
or or13(sign_ext_imm[28], sign_ext_imm[15], 1'b0);
or or14(sign_ext_imm[29], sign_ext_imm[15], 1'b0);
or or15(sign_ext_imm[30], sign_ext_imm[15], 1'b0);
or or16(sign_ext_imm[31], sign_ext_imm[15], 1'b0);

endmodule
