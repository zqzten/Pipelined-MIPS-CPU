`ifndef _D_reg
`define _D_reg

module D_reg(
    output [5:0] D_op,
    output [5:0] D_func,
    output [4:0] D_rs,
    output [4:0] D_rt,
    output [4:0] D_rd,
    output [31:0] D_valC,
    input clk,
    input D_stall,
    input [5:0] f_op,
    input [5:0] f_func,
    input [4:0] f_rs,
    input [4:0] f_rt,
    input [4:0] f_rd,
    input [31:0] f_valC
);
endmodule

`endif
