`ifndef _srcB
`define _srcB

`include "../src/def.v"

module srcB(
    output [4:0] d_srcB,
    input [5:0] D_op,
    input [4:0] D_rs
);

    assign d_srcB = (D_op!=`IJ)?D_rs:`RNONE;
    

endmodule

`endif
