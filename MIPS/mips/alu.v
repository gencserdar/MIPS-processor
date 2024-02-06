module alu (
	 output [31:0] alu_result,
	 output zero_bit,
    input [31:0] alu_src1,
    input [31:0] alu_src2,
    input [2:0] alu_ctr
);

wire [31:0] sum;
wire [31:0] difference;
wire [31:0] xor_res;
wire [31:0] nor_res;
wire [31:0] or_res;
wire [31:0] and_res;
wire [31:0] lt_res;
wire [31:0] mod_res;
wire [31:0] _1s_complement;
wire [31:0] _2s_complement;
wire clk;
wire rst;
wire start;
wire [31:0] or_result;
  
wire  lt;

//and
and_32bit and32(and_res, alu_src1, alu_src2);

//or
or_32bit or32(or_res, alu_src1, alu_src2);

//xor
xor_32bit xor32(xor_res, alu_src1, alu_src2);

//nor
nor_32bit nor32(nor_res, alu_src1, alu_src2);

//substract
//1s complement of b
xor_32bit ones_complement(_1s_complement, alu_src2, 32'hFFFFFFFF);
//2s complement of b
cla_level2_32bit twos_complement(_2s_complement, _1s_complement, 32'h00000001, 1'b0);
//b is now -b
cla_level2_32bit substract(difference, alu_src1, _2s_complement, 1'b0);

//lessthan
//takes the most significant bit of a-b operation, if its 1 it means that the result is negative which means b>a
and and1(lt, difference[31], 1'b1);
//result of lessthan is 32'h00000001 or 32'b0 so we need 32bit output, to achieve this we use adder
cla_level2_32bit lessthan(lt_res, 32'b0, 32'b0, lt);

//add
cla_level2_32bit adder32(sum, alu_src1 ,alu_src2 , 1'b0);

//mod
mod mod1 (mod_res, clk, rst, start, alu_src1, alu_src2);

//8x1 mux
mux_8x1 mux (alu_result, and_res, or_res, xor_res, nor_res, lt_res, sum, difference, mod_res, alu_ctr);

//zero_bit
or gate0 (or_result[0], alu_result[0], alu_result[1]);
or gate1 (or_result[1], or_result[0], alu_result[2]);
or gate2 (or_result[2], or_result[1], alu_result[3]);
or gate3 (or_result[3], or_result[2], alu_result[4]);
or gate4 (or_result[4], or_result[3], alu_result[5]);
or gate5 (or_result[5], or_result[4], alu_result[6]);
or gate6 (or_result[6], or_result[5], alu_result[7]);
or gate7 (or_result[7], or_result[6], alu_result[8]);
or gate8 (or_result[8], or_result[7], alu_result[9]);
or gate9 (or_result[9], or_result[8], alu_result[10]);
or gate10 (or_result[10], or_result[9], alu_result[11]);
or gate11 (or_result[11], or_result[10], alu_result[12]);
or gate12 (or_result[12], or_result[11], alu_result[13]);
or gate13 (or_result[13], or_result[12], alu_result[14]);
or gate14 (or_result[14], or_result[13], alu_result[15]);
or gate15 (or_result[15], or_result[14], alu_result[16]);
or gate16 (or_result[16], or_result[15], alu_result[17]);
or gate17 (or_result[17], or_result[16], alu_result[18]);
or gate18 (or_result[18], or_result[17], alu_result[19]);
or gate19 (or_result[19], or_result[18], alu_result[20]);
or gate20 (or_result[20], or_result[19], alu_result[21]);
or gate21 (or_result[21], or_result[20], alu_result[22]);
or gate22 (or_result[22], or_result[21], alu_result[23]);
or gate23 (or_result[23], or_result[22], alu_result[24]);
or gate24 (or_result[24], or_result[23], alu_result[25]);
or gate25 (or_result[25], or_result[24], alu_result[26]);
or gate26 (or_result[26], or_result[25], alu_result[27]);
or gate27 (or_result[27], or_result[26], alu_result[28]);
or gate28 (or_result[28], or_result[27], alu_result[29]);
or gate29 (or_result[29], or_result[28], alu_result[30]);
or gate30 (or_result[30], or_result[29], alu_result[31]);

xor gate31 (zero_bit, or_result[30], 1'b1);
endmodule

