module cla_4bit (output [3:0] sum, output g_out, output p_out, input [3:0] a, input [3:0] b, input c_in);

	wire [3:0] p, g, c;
	
	xor_4bit xor1 (p, a, b);
	and_4bit and11 (g, a, b);

	// c = gi + pi.ci
	
	// c[0]=c_in;
	or or7 (c[0], c_in, c_in);
	
	// c[1]= g[0]|(p[0]&c[0]);
	and and1 (p0_and_c0, p[0], c_in);
	or or1 (c[1], p0_and_c0, g[0]);
	
	// c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
	and and2 (p1_and_p0_and_c0, p0_and_c0, p[1]);
	and and3 (p1_and_g0, p[1], g[0]);
	or or2 (p1_and_p0_and_c0_or_p1_and_g0, p1_and_p0_and_c0, p1_and_g0);
	or or3 (c[2], p1_and_p0_and_c0_or_p1_and_g0, g[1]);
	
	// c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
   and and4 (p1_and_p0_and_c0_and_p2, p1_and_p0_and_c0, p[2]);
	and and5 (p1_and_g0_and_p2, p1_and_g0, p[2]);
	and and6 (g1_and_p2, g[1], p[2]);
	or or4 (p1_and_g0_and_p2_or_p1_and_g0_and_p2, p1_and_p0_and_c0_and_p2, p1_and_g0_and_p2);
	or or5 (g1_and_p2_or_p1_and_g0_and_p2_or_p1_and_g0_and_p2,  g1_and_p2, p1_and_g0_and_p2_or_p1_and_g0_and_p2);
	or or6 (c[3], g1_and_p2_or_p1_and_g0_and_p2_or_p1_and_g0_and_p2, g[2]);
	
	
	// c_out= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];
	and and7 (p1_and_p0_and_c0_and_p2_and_p3, p1_and_p0_and_c0_and_p2, p[3]);
	and and8 (p1_and_g0_and_p2_and_p3, p1_and_g0_and_p2, p[3]);
	and and9 (g1_and_p2_and_p3, g1_and_p2, p[3]);
	and and10 (p3_and_g2, p[3], g[2]);
	or or8 (p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3, p1_and_p0_and_c0_and_p2_and_p3, p1_and_g0_and_p2_and_p3);
	or or9 (g1_and_p2_and_p3_or_p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3, g1_and_p2_and_p3, p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3);
	or or10 (g1_and_p2_and_p3_or_p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3_or_p3_and_g2, p3_and_g2, g1_and_p2_and_p3_or_p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3);
	or or11 (c_out, g1_and_p2_and_p3_or_p1_and_p0_and_c0_and_p2_and_p3_or_p1_and_g0_and_p2_and_p3_or_p3_and_g2, g[3]);
	
	// sum
	xor_4bit xor2 (sum, p, c);
	
	
	// p_out = p3.p2.p1.p0
	and and12 (p1_and_p0, p[1], p[0]);
	and and13 (p3_and_p2, p[3], p[2]);
	and and14 (p_out, p1_and_p0, p3_and_p2);
	
	// g_out = g3 + p3.g2 + p3.p2.g1 + p3.p2.p1.g0
	or or12 (p1_and_g0_and_p2_and_p3_or_g1_and_p2_and_p3, p1_and_g0_and_p2_and_p3, g1_and_p2_and_p3);
	or or13 (p3_and_g2_or_p1_and_g0_and_p2_and_p3_or_g1_and_p2_and_p3, p3_and_g2, p1_and_g0_and_p2_and_p3_or_g1_and_p2_and_p3);
	or or14 (g_out, p3_and_g2_or_p1_and_g0_and_p2_and_p3_or_g1_and_p2_and_p3, g[3]);
	
endmodule



