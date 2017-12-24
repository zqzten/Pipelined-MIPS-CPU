`ifndef _E_reg
`define _E_reg

`include "../src/def.v"

module E_reg(
    output reg [5:0] E_op,
    output reg [5:0] E_func,
    output reg [31:0] E_valC,
    output reg [31:0] E_valA,
    output reg [31:0] E_valB,
    output reg [4:0] E_dstE,
    output reg [4:0] E_dstM,
    output reg [4:0] E_srcA,
    output reg [4:0] E_srcB,
    input clk,
    input E_bubble,
    input [5:0] D_op,
    input [5:0] D_func,
    input [31:0] D_valC,
    input [31:0] d_valA,
    input [31:0] d_valB,
    input [4:0] d_dstE,
    input [4:0] d_dstM,
    input [4:0] d_srcA,
    input [4:0] d_srcB
);
    always @(posedge clk) begin
        if (!E_bubble) begin
            E_op <= D_op;
            E_func <= D_func;
            E_valC <= D_valC;
            E_valA <= d_valA;
            E_valB <= d_valB;
            E_dstE <= d_dstE;
            E_dstM <= d_dstM;
            E_srcA <= d_srcA;
            E_srcB <= d_srcB;
        end else begin
            E_op <= 0;
            E_func <= 0;
            E_valC <= 0;
            E_valA <= 0;
            E_valB <= 0;
            E_dstE <= `RNONE;
            E_dstM <= `RNONE;
            E_srcA <= `RNONE;
            E_srcB <= `RNONE;
        end
    end

endmodule

`endif
