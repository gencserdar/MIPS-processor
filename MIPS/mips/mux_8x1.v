module mux_8x1 (
    output [31:0] res,
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    input [31:0] e,
    input [31:0] f,
    input [31:0] g,
    input [31:0] h,
    input [2:0] s
);

wire [31:0] temp1;
wire [31:0] temp2;
wire [31:0] temp3;
wire [31:0] temp4;
wire [31:0] temp5;
wire [31:0] temp6;

mux_2x1 mux1 (temp1, a, b, s[0]);
mux_2x1 mux2 (temp2, c, d, s[0]);
mux_2x1 mux3 (temp3, e, f, s[0]);
mux_2x1 mux4 (temp4, g, h, s[0]);

mux_2x1 mux5 (temp5, temp1, temp2, s[1]);
mux_2x1 mux6 (temp6, temp3, temp4, s[1]);

mux_2x1 mux7 (res, temp5, temp6, s[2]);

endmodule