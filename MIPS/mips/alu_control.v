module alu_control(
	output [2:0] alu_ctr, 
	input [5:0] function_code, 
	input [2:0] ALUop
);

wire r_type, _r_type;
wire _fun2;

//if ALUop = 111 then r_type = 1
and and1 (and1_result, ALUop[2], ALUop[1]);
and and2 (r_type, ALUop[0], and1_result);
not not1 (_r_type, r_type);

// ALUctr[2]
and and3 (and3_result, ALUop[2], _r_type);
and and4 (and4_result, function_code[1], r_type);
or or1 (alu_ctr[2], and3_result, and4_result);

// ALUctr[1]
not not2 (_fun2, function_code[2]);
and and9 (and9_result, function_code[0], _fun2);
and and5 (and5_result, ALUop[1], _r_type);
and and6 (and6_result, and9_result, r_type);
or or2 (alu_ctr[1], and5_result, and6_result);

// ALUctr[0]
xor xor1 (xor_result, function_code[1], function_code[0]);
and and7 (and7_result, ALUop[0], _r_type);
and and8 (and8_result, xor_result, r_type);
or or3 (alu_ctr[0], and7_result, and8_result);
	

endmodule