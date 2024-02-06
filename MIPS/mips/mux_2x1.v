module mux_2x1(
	output [31:0] res,
	input [31:0] a,
	input [31:0] b,
	input s0
);

wire [31:0] temp1;
wire [31:0] temp2;
wire [31:0] select;
wire [31:0] select_not;

or or1  (select[0],  s0, s0);
or or2  (select[1],  s0, s0);
or or3  (select[2],  s0, s0);
or or4  (select[3],  s0, s0);
or or5  (select[4],  s0, s0);
or or6  (select[5],  s0, s0);
or or7  (select[6],  s0, s0);
or or8  (select[7],  s0, s0);
or or9  (select[8],  s0, s0);
or or10 (select[9],  s0, s0);
or or11 (select[10], s0, s0);
or or12 (select[11], s0, s0);
or or13 (select[12], s0, s0);
or or14 (select[13], s0, s0);
or or15 (select[14], s0, s0);
or or16 (select[15], s0, s0);
or or17 (select[16], s0, s0);
or or18 (select[17], s0, s0);
or or19 (select[18], s0, s0);
or or20 (select[19], s0, s0);
or or21 (select[20], s0, s0);
or or22 (select[21], s0, s0);
or or23 (select[22], s0, s0);
or or24 (select[23], s0, s0);
or or25 (select[24], s0, s0);
or or26 (select[25], s0, s0);
or or27 (select[26], s0, s0);
or or28 (select[27], s0, s0);
or or29 (select[28], s0, s0);
or or30 (select[29], s0, s0);
or or31 (select[30], s0, s0);
or or32 (select[31], s0, s0);

not not1 (s0_, s0);
or or33 (select_not[0], s0_, s0_);
or or34 (select_not[1], s0_, s0_);
or or35 (select_not[2], s0_, s0_);
or or36 (select_not[3], s0_, s0_);
or or37 (select_not[4], s0_, s0_);
or or38 (select_not[5], s0_, s0_);
or or39 (select_not[6], s0_, s0_);
or or40 (select_not[7], s0_, s0_);
or or41 (select_not[8], s0_, s0_);
or or42 (select_not[9], s0_, s0_);
or or43 (select_not[10], s0_, s0_);
or or44 (select_not[11], s0_, s0_);
or or45 (select_not[12], s0_, s0_);
or or46 (select_not[13], s0_, s0_);
or or47 (select_not[14], s0_, s0_);
or or48 (select_not[15], s0_, s0_);
or or49 (select_not[16], s0_, s0_);
or or50 (select_not[17], s0_, s0_);
or or51 (select_not[18], s0_, s0_);
or or52 (select_not[19], s0_, s0_);
or or53 (select_not[20], s0_, s0_);
or or54 (select_not[21], s0_, s0_);
or or55 (select_not[22], s0_, s0_);
or or56 (select_not[23], s0_, s0_);
or or57 (select_not[24], s0_, s0_);
or or58 (select_not[25], s0_, s0_);
or or59 (select_not[26], s0_, s0_);
or or60 (select_not[27], s0_, s0_);
or or61 (select_not[28], s0_, s0_);
or or62 (select_not[29], s0_, s0_);
or or63 (select_not[30], s0_, s0_);
or or64 (select_not[31], s0_, s0_);

and_32bit and1 (temp1, a, select_not);
and_32bit and2 (temp2, b, select);

or_32bit or65 (res,temp1,temp2);

endmodule