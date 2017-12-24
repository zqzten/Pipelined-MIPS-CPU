`ifndef _dstE
`define _dstE

`include "../src/def.v"

module dstE(
    output reg [4:0] d_dstE,
    input [5:0] D_op,
    input [4:0] D_rt,
    input [4:0] D_rd
);
    
    always @(*) begin
        if (D_op==`IROP) begin
            d_dstE = D_rd; 
        end else if (D_op==`IADDI || D_op==`IANDI || D_op==`IORI || D_op==`ISLTI) begin
            d_dstE = D_rt;
        end else begin
            d_dstE = `RNONE;
        end
        $display("D_op: %d, D_rt=%d, dstE: %d",D_op, D_rt, d_dstE);
    end

endmodule

`endif
