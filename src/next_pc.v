`ifndef _next_pc
`define _next_pc

`include "../src/def.v"

module next_pc(
    output reg [31:0] f_valP,
    input [31:0] F_valP,
    input [5:0] f_op,
    input [31:0] f_valC
);
    always @(*) begin
        if (f_op==`IJ) begin
            f_valP = {F_valP[31:28], f_valC[25:0], 2'b00};
        end else begin
            f_valP = F_valP + 4;
        end
    end

endmodule
    
`endif
