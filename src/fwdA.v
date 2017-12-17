`ifndef _fwdA
`define _fwdA

module fwdA(
    output [31:0] d_valA,
    input [4:0] d_srcA,
    input [4:0] E_dstE,
    input [4:0] M_dstM,
    input [4:0] M_dstE,
    input [4:0] W_dstM,
    input [4:0] W_dstE,
    input [31:0] d_rvalA,
    input [31:0] e_valE,
    input [31:0] m_valM,
    input [31:0] M_valE,
    input [31:0] W_valM,
    input [31:0] W_valE
);
endmodule

`endif
