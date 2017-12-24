`ifndef _alu
`define _alu

module alu(
    output reg [31:0] e_valE,
    input [31:0] e_aluA,
    input [31:0] e_aluB,
    input [5:0] e_alufunc
);

    always @(e_aluA, e_aluB, e_alufunc) begin
        case(e_alufunc)
            6'b100000: begin
                e_valE <= e_aluA + e_aluB;
            end
            6'b100010: begin
                e_valE <= e_aluB - e_aluA;
            end
            6'b100100: begin
                e_valE <= e_aluA & e_aluB;
            end
            6'b100101: begin
                e_valE <= e_aluA | e_aluB;
            end
            6'b101010: begin
                e_valE <= (e_aluA>e_aluB)?1:0;
            end
        endcase


    end

endmodule

`endif
