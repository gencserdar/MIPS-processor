module or_5bit(out,in1,in2);
input [4:0] in1, in2;
output [4:0] out;

or t0(out[4], in1[4], in2[4]);
or t1(out[3], in1[3], in2[3]);
or t2(out[2], in1[2], in2[2]);
or t3(out[1], in1[1], in2[1]);
or t4(out[0], in1[0], in2[0]);
	 
endmodule