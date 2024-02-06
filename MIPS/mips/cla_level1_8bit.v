module cla_16bit (output [15:0] sum, output c_out, input [15:0] a, input [15:0] b, input c_in);
	
	wire [3:0] p, g, c;
	
	cla_4bit cla1 (sum[3:0], g[0], p[0], a[3:0], b[3:0], c_in);
	// c[1]= g[0]|(p[0]&c[0]);
	and and1 (p0_and_c0, p[0], c_in);
	or or1 (c[1], p0_and_c0, g[0]);
	
	cla_4bit cla2 (sum[7:4], g[1], p[1], a[7:4], b[7:4], c[1]);
	// c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
	and and2 (p1_and_p0_and_c0, p0_and_c0, p[1]);
	and and3 (p1_and_g0, p[1], g[0]);
	or or2 (p1_and_p0_and_c0_or_p1_and_g0, p1_and_p0_and_c0, p1_and_g0);
	or or3 (c[2], p1_and_p0_and_c0_or_p1_and_g0, g[1]);
	
	
	cla_4bit cla3 (sum[11:8], g[2], p[2], a[11:8], b[11:8], c[2]);
	// c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
   and and4 (p1_and_p0_and_c0_and_p2, p1_and_p0_and_c0, p[2]);
	and and5 (p1_and_g0_and_p2, p1_and_g0, p[2]);
	and and6 (g1_and_p2, g[1], p[2]);
	or or4 (p1_and_g0_and_p2_or_p1_and_g0_and_p2, p1_and_p0_and_c0_and_p2, p1_and_g0_and_p2);
	or or5 (g1_and_p2_or_p1_and_g0_and_p2_or_p1_and_g0_and_p2,  g1_and_p2, p1_and_g0_and_p2_or_p1_and_g0_and_p2);
	or or6 (c[3], g1_and_p2_or_p1_and_g0_and_p2_or_p1_and_g0_and_p2, g[2]);
	
	
	cla_4bit cla4 (sum[15:12], g[3], p[3], a[15:12], b[15:12], c[3]);
	// c_out= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];
	and and7 (p1_and_p0_and_c0_and_p2_and_p3, p1_and_p0_and_c0_and_p2, p[3]);
	and and8 (p1_and_g0_and_p2_and_p3, p1_and_g0_and_p2, p[3]);
	and and9 (g1_and_p2_and_p3, g1_and_p2, p[3]);
	and and10 (p3_and_g2, p[3], g[2]);
	or or8 (p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3, p1_and_p0_and_c0_and_p2_and_p3, p1_and_g0_and_p2_and_p3);
	or or9 (g1_and_p2_and_p3_or_p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3, g1_and_p2_and_p3, p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3);
	or or10 (g1_and_p2_and_p3_or_p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3_or_p3_and_g2, p3_and_g2, g1_and_p2_and_p3_or_p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3);
	or or11 (c_out, g1_and_p2_and_p3_or_p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3_or_p3_and_g2, g[3]);

endmodule