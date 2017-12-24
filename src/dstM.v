`ifndef _dstM
`define _dstM

`include "../src/def.v"

module dstM(
    output [4:0] d_dstM,
    input [5:0] D_op,
    input [4:0] D_rt
);
    assign d_dstM = (D_op==`ILW)?D_rt:`RNONE;

endmodule

`endif
