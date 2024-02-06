module and_8bit(out,in1,in2);
input [7:0] in1, in2;
output [7:0] out;

and_4bit t1(out[7:4], in1[7:4], in2[7:4]);
and_4bit	t2(out[3:0], in1[3:0], in2[3:0]);
			
endmodule