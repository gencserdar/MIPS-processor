module mips_tb();

  reg clock;
  integer instruction_num = 70; // change this according to the number of instructions you want to execute

  mips uut (
    .clock(clock)
  );

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end
  
  integer counter = 0;

   initial begin
		 counter=counter+1;
		 if (uut.pc !== 'bX) begin
			#2;
			$display("INSTRUCTION INDEX: %0d, ITERATION: 1", uut.pc/4);
			$display("PC: %0d", uut.pc);
			$display("NEXT PC: %0d", uut.next_pc);
			$display("INSTRUCTION: %b %b %b %b %b %b", uut.instruction[31:26], uut.instruction[25:21], uut.instruction[20:16], uut.instruction[15:11], uut.instruction[10:6], uut.instruction[5:0]);
			 case(uut.instruction[31:26])
				6'b000000: // R-type instruction
				  case(uut.instruction[5:0])
					 6'b000010: $display("TYPE: ADD");
					 6'b000011: $display("TYPE: SUBTRACT");
					 6'b000100: $display("TYPE: AND");
					 6'b000101: $display("TYPE: OR");
					 6'b000111: $display("TYPE: SLT");
					 6'b001000: $display("TYPE: JR");
				  endcase
				6'b000010: $display("TYPE: ADDI");
				6'b000011: $display("TYPE: SUBI");
				6'b000100: $display("TYPE: ANDI");
				6'b000101: $display("TYPE: ORI");
				6'b001000: $display("TYPE: LW");
				6'b010000: $display("TYPE: SW");
				6'b001001: $display("TYPE: LB");
				6'b010001: $display("TYPE: SB");
				6'b000111: $display("TYPE: SLTI");
				6'b100011: $display("TYPE: BEQ");
				6'b100111: $display("TYPE: BNE");
				6'b111000: $display("TYPE: JUMP");
				6'b111001: $display("TYPE: JAL");
				6'b100000: $display("TYPE: MOVE");
			 endcase
			$display("alu source 1: %b", uut.read_data1);
			$display("alu source 2: %b", uut.alu_src2);
			$display("alu result:  %b", uut.alu_result);
			$display("ALUop:  %b, ALUctr: %b", uut.ALUop, uut.alu_ctr);
			$display("ALUsrc:  %b", uut.ALUsrc);
			$display("branch:  %b, zero:     %b", uut.branch, uut.zero_bit);
			$display("is branch possible: %b", uut.can_branch);
			$display("beq: %b, bne: %b", uut.beq, uut.bne);
			$display("jump: %b, jal: %b, jr: %b", uut.jump, uut.jal, uut.jr);
			$display("move: %b", uut.move);
			$display("memRead: %b, memWrite: %b", uut.memRead, uut.memWrite);
			if(uut.memWrite == 1'b1) begin
				$display("memory write index: %b", uut.alu_result[4:0]);
				$display("memory write data: %b", uut.read_data2);
			end
			$display("regDst:  %b, regWrite: %b", uut.regDst, uut.no_jr_regWrite);
			if(uut.no_jr_regWrite == 1'b1) begin
			   $display("register write index: %b", uut.write_reg);
				$display("register write data: %b", uut.write_data);
			end
			$display("---------------------------------------------");
			$display(" ");
		end
  end
  
  initial begin
    repeat (instruction_num - 1) begin
		 if (uut.pc !== 'bX) begin
		   counter=counter+1;
			#10;
			$display("INSTRUCTION INDEX: %0d, ITERATION: %0d", uut.pc/4, counter);
			$display("PC: %0d", uut.pc);
			$display("NEXT PC: %0d", uut.next_pc);
			$display("INSTRUCTION: %b %b %b %b %b %b", uut.instruction[31:26], uut.instruction[25:21], uut.instruction[20:16], uut.instruction[15:11], uut.instruction[10:6], uut.instruction[5:0]);
			 case(uut.instruction[31:26])
				6'b000000: // R-type instruction
				  case(uut.instruction[5:0])
					 6'b000010: $display("TYPE: ADD");
					 6'b000011: $display("TYPE: SUBTRACT");
					 6'b000100: $display("TYPE: AND");
					 6'b000101: $display("TYPE: OR");
					 6'b000111: $display("TYPE: SLT");
					 6'b001000: $display("TYPE: JR");
				  endcase
				6'b000010: $display("TYPE: ADDI");
				6'b000011: $display("TYPE: SUBI");
				6'b000100: $display("TYPE: ANDI");
				6'b000101: $display("TYPE: ORI");
				6'b001000: $display("TYPE: LW");
				6'b010000: $display("TYPE: SW");
				6'b001001: $display("TYPE: LB");
				6'b010001: $display("TYPE: SB");
				6'b000111: $display("TYPE: SLTI");
				6'b100011: $display("TYPE: BEQ");
				6'b100111: $display("TYPE: BNE");
				6'b111000: $display("TYPE: JUMP");
				6'b111001: $display("TYPE: JAL");
				6'b100000: $display("TYPE: MOVE");
			 endcase
			$display("alu source 1: %b", uut.read_data1);
			$display("alu source 2: %b", uut.alu_src2);
			$display("alu result:  %b", uut.alu_result);
			$display("ALUop:  %b, ALUctr: %b", uut.ALUop, uut.alu_ctr);
			$display("ALUsrc:  %b", uut.ALUsrc);
			$display("branch:  %b, zero:     %b", uut.branch, uut.zero_bit);
			$display("is branch possible: %b", uut.can_branch);
			$display("beq: %b, bne: %b", uut.beq, uut.bne);
			$display("jump: %b, jal: %b, jr: %b", uut.jump, uut.jal, uut.jr);
			$display("move: %b", uut.move);
			$display("memRead: %b, memWrite: %b", uut.memRead, uut.memWrite);
			if(uut.memWrite == 1'b1) begin
				$display("memory write index: %b", uut.alu_result[4:0]);
				$display("memory write data: %b", uut.read_data2);
			end
			$display("regDst:  %b, regWrite: %b", uut.regDst, uut.no_jr_regWrite);
			if(uut.no_jr_regWrite == 1'b1) begin
			   $display("register write index: %b", uut.write_reg);
				$display("register write data: %b", uut.write_data);
			end
			$display("---------------------------------------------");
			$display(" ");
			
			end
		 end
    $stop;
  end

endmodule