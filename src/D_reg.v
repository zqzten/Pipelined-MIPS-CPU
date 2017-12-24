`ifndef _D_reg
`define _D_reg

module D_reg(
    output reg [5:0] D_op,
    output reg [5:0] D_func,
    output reg [4:0] D_rs,
    output reg [4:0] D_rt,
    output reg [4:0] D_rd,
    output reg [31:0] D_valC,
    input clk,
    input D_stall,
    input [5:0] f_op,
    input [5:0] f_func,
    input [4:0] f_rs,
    input [4:0] f_rt,
    input [4:0] f_rd,
    input [31:0] f_valC
);

    always @(posedge clk) begin
        if (!D_stall) begin
            D_op <= f_op;
            D_func <= f_func;
            D_rs <= f_rs;
            D_rt <= f_rt;
            D_rd <= f_rd;
            D_valC <= f_valC;
        end
    end

endmodule

`endif
