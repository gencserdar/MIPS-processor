module mod (
  output wire [31:0] result,
  input wire clk,
  input wire rst,
  input wire start,
  input wire [31:0] a,
  input wire [31:0] b
);

mod_cu mod1 (result, clk, rst, start, a, b);

endmodule
