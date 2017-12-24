`ifndef _M_reg
`define _M_reg

`include "../src/def.v"

module M_reg(
    output reg [5:0] M_op,
    output reg [31:0] M_valE,
    output reg [31:0] M_valA,
    output reg [4:0] M_dstE,
    output reg [4:0] M_dstM,
    input clk,
    input [5:0] E_op,
    input [31:0] e_valE,
    input [31:0] E_valA,
    input [4:0] E_dstE,
    input [4:0] E_dstM
);
    always @(posedge clk) begin
        M_op <= E_op;
        M_valE <= e_valE;
        M_valA <= E_valA;
        M_dstE <= E_dstE;
        M_dstM <= E_dstM;
    end

endmodule

`endif
