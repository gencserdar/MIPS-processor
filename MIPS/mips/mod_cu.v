module mod_cu (
  output wire [31:0] result,
  input wire clk,
  input wire rst,
  input wire start,
  input wire [31:0] a,
  input wire [31:0] b
);

//states
parameter IDLE = 2'b00;
parameter SUBTRACT = 2'b01;
parameter OUTPUT_RESULT = 2'b10;

reg [1:0] state;
reg [1:0] next_state;
reg [31:0] mod1_a; 
reg [31:0] mod1_b;
reg [31:0] temp;
wire [31:0] temp_wire;
wire lt;

mod_dp mod1 (lt, temp_wire, mod1_a, mod1_b); //output:lt, temp_wire ; input: mod1_a, mod1_b

always @(posedge clk) begin 
    if (rst) state <= IDLE;
    else state <= next_state;
end
	 
always @(negedge clk) begin
    if (start) begin
        case (state)
            IDLE: begin
					temp <= a;
					next_state <= SUBTRACT;
				end
            SUBTRACT: begin
                mod1_a <= temp;
                mod1_b <= b;
					 temp <= temp_wire;
                if (lt) next_state <= OUTPUT_RESULT;
                else next_state <= SUBTRACT;
            end
            OUTPUT_RESULT: next_state <= OUTPUT_RESULT;
				default : next_state <= IDLE;
        endcase
    end
end

assign result = temp;

endmodule
