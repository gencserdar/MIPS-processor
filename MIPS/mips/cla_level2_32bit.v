module cla_level2_32bit (output [31:0] sum, input [31:0] a, input [31:0] b, input c_in);

	wire cla1_cout;
	wire out;
	
	cla_16bit cla1 (sum[15:0], cla1_cout, a[15:0], b[15:0], c_in);
	cla_16bit cla2 (sum[31:16], out, a[31:16], b[31:16], cla1_cout);

endmodule