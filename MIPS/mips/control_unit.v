module control_unit(
	output regDst,
	output branch,
	output memRead,
	output memWrite,
	output [2:0] ALUop,
	output ALUsrc,
	output regWrite,
	output jump,
	output byteOperations,
	output move,
	input [5:0] opcode
);
wire [5:0] opcode_not;
wire addi, subi, andi, ori, lw, sw, lb, sb, slti, beq, bne;
wire j, jal;
wire r_type, i_type, r_type_or_branch; 

not opcode_not0(opcode_not[0], opcode[0]);
not opcode_not1(opcode_not[1], opcode[1]);
not opcode_not2(opcode_not[2], opcode[2]);
not opcode_not3(opcode_not[3], opcode[3]);
not opcode_not4(opcode_not[4], opcode[4]);
not opcode_not5(opcode_not[5], opcode[5]);

and is_addi(addi, opcode_not[5], opcode_not[4], opcode_not[3] , opcode_not[2], opcode[1], opcode_not[0]); //000010
and is_subi(subi, opcode_not[5], opcode_not[4], opcode_not[3] , opcode_not[2], opcode[1], opcode[0]); 	 //000011
and is_andi(andi, opcode_not[5], opcode_not[4], opcode_not[3] , opcode[2], opcode_not[1], opcode_not[0]); //000100
and is_ori(ori, opcode_not[5], opcode_not[4], opcode_not[3] , opcode[2], opcode_not[1], opcode[0]);		 //000101
and is_lw(lw, opcode_not[5], opcode_not[4], opcode[3] , opcode_not[2], opcode_not[1], opcode_not[0]); 	 //001000
and is_sw(sw, opcode_not[5], opcode[4], opcode_not[3] , opcode_not[2], opcode_not[1], opcode_not[0]);		 //010000
and is_lb(lb, opcode_not[5], opcode_not[4], opcode[3] , opcode_not[2], opcode_not[1], opcode[0]);			 //001001
and is_sb(sb, opcode_not[5], opcode[4], opcode_not[3] , opcode_not[2], opcode_not[1], opcode[0]);			 //010001
and is_slti(slti, opcode_not[5], opcode_not[4], opcode_not[3] , opcode[2], opcode[1], opcode[0]);			 //000111
and is_beq(beq, opcode[5], opcode_not[4], opcode_not[3] , opcode_not[2], opcode[1], opcode[0]);				 //100011
and is_bne(bne, opcode[5], opcode_not[4], opcode_not[3] , opcode[2], opcode[1], opcode[0]);					 //100111
and is_j(j, opcode[5], opcode[4], opcode[3] , opcode_not[2], opcode_not[1], opcode_not[0]);					 //111000
and is_jal(jal, opcode[5], opcode[4], opcode[3] , opcode_not[2], opcode_not[1], opcode[0]);				    //111001
and is_move(move, opcode[5], opcode_not[4], opcode_not[3] , opcode_not[2], opcode_not[1], opcode_not[0]); //100000


and is_r_type(r_type,  opcode_not[5],  opcode_not[4],  opcode_not[3],  opcode_not[2],  opcode_not[1],  opcode_not[0]);
or is_i_type(i_type,  addi, subi, andi, ori, lw, sw, lb, sb, slti, beq, bne);

or or1 (ALUop[0], ori, addi, lb, sb, lw, sw, r_type, move);
or or2 (ALUop[1], subi, beq, bne, r_type);
or or3 (ALUop[2], slti, addi, lb, sb, lw, sw, subi, beq, bne, r_type, move);

and is_regDst(regDst, r_type, 1'b1);
or is_branch(branch, bne, beq);
or is_memRead(memRead, lw, lb);
or is_memWrite(memWrite, sw, sb);
or or4(r_type_or_branch, r_type, branch);
not is_ALUsrc(ALUsrc, r_type_or_branch);
or is_regWrite(regWrite, r_type, addi, subi, andi, ori, slti, lw, lb, move, jal);
or is_jump(jump, j, jal);
or is_byteOperation(byteOperations, sb, lb);

endmodule