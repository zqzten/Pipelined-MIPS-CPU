`ifndef _E_reg
`define _E_reg

module E_reg(
    output [5:0] E_op,
    output [5:0] E_func,
    output [31:0] E_valC,
    output [31:0] E_valA,
    output [31:0] E_valB,
    output [4:0] E_dstE,
    output [4:0] E_dstM,
    output [4:0] E_srcA,
    output [4:0] E_srcB,
    input clk,
    input E_bubble,
    input [5:0] D_op,
    input [5:0] D_func,
    input [31:0] D_valC,
    input [31:0] d_valA,
    input [31:0] d_valB,
    input [4:0] d_dstE,
    input [4:0] d_dstM,
    input [4:0] d_srcA,
    input [4:0] d_srcB
);
endmodule

`endif
