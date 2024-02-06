module and_5bit(out,in1,in2);
input [4:0] in1, in2;
output [4:0] out;

and t0(out[4], in1[4], in2[4]);
and t1(out[3], in1[3], in2[3]);
and t2(out[2], in1[2], in2[2]);
and t3(out[1], in1[1], in2[1]);
and t4(out[0], in1[0], in2[0]);
	 
endmodule