module shift_left_2(
    output [31:0] shifted_address,
    input [31:0] address
);

or or1(shifted_address[0], 1'b0, 1'b0);
or or2(shifted_address[1], 1'b0, 1'b0);
or or3(shifted_address[2], 1'b0, address[0]);
or or4(shifted_address[3], 1'b0, address[1]);
or or5(shifted_address[4], 1'b0, address[2]);
or or6(shifted_address[5], 1'b0, address[3]);
or or7(shifted_address[6], 1'b0, address[4]);
or or8(shifted_address[7], 1'b0, address[5]);
or or9(shifted_address[8], 1'b0, address[6]);
or or10(shifted_address[9], 1'b0, address[7]);
or or11(shifted_address[10], 1'b0, address[8]);
or or12(shifted_address[11], 1'b0, address[9]);
or or13(shifted_address[12], 1'b0, address[10]);
or or14(shifted_address[13], 1'b0, address[11]);
or or15(shifted_address[14], 1'b0, address[12]);
or or16(shifted_address[15], 1'b0, address[13]);
or or17(shifted_address[16], 1'b0, address[14]);
or or18(shifted_address[17], 1'b0, address[15]);
or or19(shifted_address[18], 1'b0, address[16]);
or or20(shifted_address[19], 1'b0, address[17]);
or or21(shifted_address[20], 1'b0, address[18]);
or or22(shifted_address[21], 1'b0, address[19]);
or or23(shifted_address[22], 1'b0, address[20]);
or or24(shifted_address[23], 1'b0, address[21]);
or or25(shifted_address[24], 1'b0, address[22]);
or or26(shifted_address[25], 1'b0, address[23]);
or or27(shifted_address[26], 1'b0, address[24]);
or or28(shifted_address[27], 1'b0, address[25]);
or or29(shifted_address[28], 1'b0, address[26]);
or or30(shifted_address[29], 1'b0, address[27]);
or or31(shifted_address[30], 1'b0, address[28]);
or or32(shifted_address[31], 1'b0, address[29]);

endmodule
