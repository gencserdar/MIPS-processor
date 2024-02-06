module and_32bit(out,in1,in2);
input [31:0] in1, in2;
output [31:0] out;

and_16bit t1(out[31:16], in1[31:16], in2[31:16]);
and_16bit t2(out[15:0], in1[15:0], in2[15:0]);

endmodule