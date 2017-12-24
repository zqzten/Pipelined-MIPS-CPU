`ifndef _aluA
`define _aluA

`include "../src/def.v"

module aluA(
    output reg [31:0] e_aluA,
    input [5:0] E_op,
    input [31:0] E_valC,
    input [31:0] E_valA
);

    always @(*) begin
        if (E_op==`IROP) begin
            e_aluA <= E_valA;
        end else if (E_op!=`IJ) begin
            e_aluA <= E_valC;
        end else  begin
            e_aluA <= 0;
        end
    end

endmodule

`endif
