module and_16bit(out,in1,in2);
input [15:0] in1, in2;
output [15:0] out;

and_8bit t1(out[15:8], in1[15:8], in2[15:8]);
and_8bit t2(out[7:0], in1[7:0], in2[7:0]);

endmodule