`ifndef _srcA
`define _srcA

`include "../src/def.v"

module srcA(
    output [4:0] d_srcA,
    input [5:0] D_op,
    input [4:0] D_rt
);
    assign d_srcA=(D_op==`IROP||D_op==`ISW)?D_rt:`RNONE;

endmodule

`endif
