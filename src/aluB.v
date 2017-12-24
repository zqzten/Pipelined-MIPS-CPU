`ifndef _aluB
`define _aluB

`include "../src/def.v"

module aluB(
    output reg [31:0] e_aluB,
    input [5:0] E_op,
    input [31:0] E_valB
);
    always @(*) begin
        if (E_op!=`IJ) begin
            e_aluB <= E_valB;
        end
    end
endmodule

`endif
