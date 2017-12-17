`ifndef _M_reg
`define _M_reg

module M_reg(
    output [5:0] M_op,
    output [31:0] M_valE,
    output [31:0] M_valA,
    output [4:0] M_dstE,
    output [4:0] M_dstM,
    input clk,
    input [5:0] E_op,
    input [31:0] e_valE,
    input [31:0] E_valA,
    input [4:0] E_dstE,
    input [4:0] E_dstM
);
endmodule

`endif
