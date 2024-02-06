module nor_4bit(out,in1,in2);
input [3:0] in1, in2;
output [3:0] out;

nor t1(out[3], in1[3], in2[3]);
nor t2(out[2], in1[2], in2[2]);
nor t3(out[1], in1[1], in2[1]);
nor t4(out[0], in1[0], in2[0]);
	 
endmodule