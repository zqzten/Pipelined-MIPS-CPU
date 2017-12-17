`ifndef _reg_file
`define _reg_file

module reg_file(
    output [31:0] d_rvalA,
    output [31:0] d_rvalB,
    input clk,
    input [4:0] d_srcA,
    input [4:0] d_srcB,
    input [4:0] W_dstM,
    input [4:0] W_dstE,
    input [31:0] W_valM,
    input [31:0] W_valE
);
endmodule

`endif
