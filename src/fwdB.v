`ifndef _fwdB
`define _fwdB

module fwdB(
    output [31:0] d_valB,
    input [4:0] d_srcB,
    input [4:0] E_dstE,
    input [4:0] M_dstM,
    input [4:0] M_dstE,
    input [4:0] W_dstM,
    input [4:0] W_dstE,
    input [31:0] d_rvalB,
    input [31:0] e_valE,
    input [31:0] m_valM,
    input [31:0] M_valE,
    input [31:0] W_valM,
    input [31:0] W_valE
);
endmodule

`endif
