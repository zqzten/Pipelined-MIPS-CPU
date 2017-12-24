`ifndef _W_reg
`define _W_reg

`include "../src/def.v"

module W_reg(
    output reg [31:0] W_valE,
    output reg [31:0] W_valM,
    output reg [4:0] W_dstE,
    output reg [4:0] W_dstM,
    input clk,
    input [31:0] M_valE,
    input [31:0] m_valM,
    input [4:0] M_dstE,
    input [4:0] M_dstM
);
    always @(posedge clk) begin
        W_valE = M_valE;
        W_valM = m_valM;
        W_dstE = M_dstE;
        W_dstM = M_dstM;
    end

endmodule

`endif
