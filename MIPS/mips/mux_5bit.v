module mux_5bit(
	output [4:0] res,
	input [4:0] a,
	input [4:0] b,
	input s0
);

wire [4:0] temp1;
wire [4:0] temp2;
wire [4:0] select;
wire [4:0] select_not;

or or1  (select[0],  s0, s0);
or or2  (select[1],  s0, s0);
or or3  (select[2],  s0, s0);
or or4  (select[3],  s0, s0);
or or5  (select[4],  s0, s0);


not not1 (s0_, s0);
or or6 (select_not[0], s0_, s0_);
or or7 (select_not[1], s0_, s0_);
or or8 (select_not[2], s0_, s0_);
or or9 (select_not[3], s0_, s0_);
or or10 (select_not[4], s0_, s0_);


and_5bit and1 (temp1, a, select_not);
and_5bit and2 (temp2, b, select);

or_5bit or65 (res,temp1,temp2);

endmodule