typedef enum [3:0] {
	ADD,
	SUB,
	AND,
	OR,
	XOR,
	
	SLL, // Shift Left Logical
	SRL, // Shift Right Logical
	SRA, // Shift Right Arithmatic
	
	EQ,
	NE,
	
	LT,  // Less-than 
	LTU, // Less-than 
	
	GE,  // Greater-than Equal-To
	GEU  // Greater-than Equal-To unsigned
	
} command_t;

module alu(
	input command_t command,
	
	input [31:0] lhs,
	input [31:0] rhs,
	
	output [31:0] res);
	
	always_comb	begin
		case (command)
			ADD: res = lhs + rhs;
			SUB: res = lhs - rhs;
			AND: res = lhs & rhs;
			OR: res = lhs | rhs;
			XOR: res = lhs ^ rhs;
			
			SLL: res = lhs << rhs; // {lhs[30:0], 1'b0}; // Concat
			SRL: res = lhs >> rhs; // {1'b0, lhs[31:1]};
			SRA: res = lhs >>> rhs;
			
			EQ: res = lhs == rhs ? 32'h1 : 32'h0;
			NE: res = lhs != rhs ? 32'h1 : 32'h0;
			
			LT: res = $signed(lhs) < $signed(rhs) ? 32'h1 : 32'h0;
			LTU: res = lhs < rhs ? 32'h1 : 32'h0;
			
			GE: res = $signed(lhs) >= $signed(rhs) ? 32'h1 : 32'h0;
			GEU: res = lhs >= rhs ? 32'h1 : 32'h0;
			
			default: res = 32'h0;
		endcase
	end
	
endmodule