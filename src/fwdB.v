`ifndef _fwdB
`define _fwdB

`include "../src/def.v"

module fwdB(
    output reg [31:0] d_valB,
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
    always @(*) begin
        if (d_srcB!=`RNONE) begin
            case (d_srcB)
                E_dstE: d_valB <= e_valE;
                M_dstE: d_valB <= M_valE;
                M_dstM: d_valB <= m_valM;
                W_dstE: d_valB <= W_valE;
                W_dstM: d_valB <= W_valM;
                default: d_valB <= d_rvalB;
            endcase
        end else begin
            d_valB = d_rvalB;
        end
    end

endmodule

`endif
