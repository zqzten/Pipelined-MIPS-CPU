`ifndef _W_reg
`define _W_reg

module W_reg(
    output [31:0] W_valE,
    output [31:0] W_valM,
    output [4:0] W_dstE,
    output [4:0] W_dstM,
    input clk,
    input [31:0] M_valE,
    input [31:0] m_valM,
    input [4:0] M_dstE,
    input [4:0] M_dstM
);
endmodule

`endif
